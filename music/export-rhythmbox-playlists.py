#! /usr/bin/env python

# Author: Kyle Dickerson
# email: kyle.dickerson@gmail.com
# date: June 14, 2012
# Modified by: me, Austin (Apri 2021)

import dbus
import os
import glob
import re
import urllib
import time
from xml.etree.ElementTree import Element, ElementTree
import telnetlib
import logging
logging.basicConfig(level=logging.DEBUG) # filename='example.log',
import argparse
# Assumes base paths of local and remote media do not have special characters
#  Rhythmbox uses some form of URI encoding that doesn't match what urllib.quote() gives you
#  So until I can figure out how to reliably replicate their quoting scheme, this won't support special characters in the base paths

PLAYLIST_FORMAT = 'M3U' # only M3U currently supported, See note about Rhythmbox URI encoding above which also pertains to PLS support
parser = argparse.ArgumentParser()
parser.add_argument(
    "--music-dir",
    type=str,
    default="",
    help="Base directory for music (don't include in export dirs).",
)
parser.add_argument(
    "--tmp-export-dir",
    type=str,
    default="/tmp/rhythmbox-playlists",
)
parser.add_argument(
    "--export-dir",
    type=str,
    required=True
)
parser.add_argument(
    "--skip",
    type=str,
    nargs="+",
    default=['Recently Added', 'Recently Played', 'My Top Rated']
)
parser.add_argument(
    "--rhythmbox_wait",
    type=float,
    default=15.0,
)


def export_playlists(args):
  logging.info("Exporting playlists...")
  clean_names_regex = re.compile(r'[^\w\s]')
  sessionBus = dbus.SessionBus()
  playlistManager = sessionBus.get_object('org.gnome.Rhythmbox3', '/org/gnome/Rhythmbox3/PlaylistManager')
  asM3U = (PLAYLIST_FORMAT == 'M3U')
  logging.debug("asM3U: %s" % (asM3U))
  for playlistName in playlistManager.GetPlaylists(dbus_interface='org.gnome.Rhythmbox3.PlaylistManager'):
    if playlistName in args.skip:
        continue
    filename = "%s.%s" % (re.sub(clean_names_regex, '_', playlistName), PLAYLIST_FORMAT.lower())
    logging.info("Exporting '%s' to '%s'" % (playlistName, filename))
    try:
      fileURI = 'file://%s/%s' % (args.tmp_export_dir, filename)
      logging.debug("URI: %s" % (fileURI))
      playlistManager.ExportPlaylist(playlistName, fileURI, asM3U, dbus_interface='org.gnome.Rhythmbox3.PlaylistManager')
    except dbus.exceptions.DBusException as ex:
      logging.error("Failed to export playlist: %s" % (playlistName))
      break
      # if ex.get_dbus_name().find('Error.NoReply') > -1:
        # logging.error("Perhaps it was empty?  Attempting to restart Rhythmbox...")
        # os.system('rhythmbox-client --no-present')
        # logging.info('Pausing %d seconds for Rhythmbox initialization' % (rhythmbox_startup_wait))
        # time.sleep(rhythmbox_startup_wait) # rhythmbox isn't ready until shortly after rhythmbox-client returns
        # playlistManager = sessionBus.get_object('org.gnome.Rhythmbox3', '/org/gnome/Rhythmbox3/PlaylistManager')
      # else:
        # logging.error("%s:%s" % (ex.get_dbus_name(), ex.get_dbus_message()))
        # break


if __name__ == "__main__":
    args = parser.parse_args()

    # Make export dir
    if not os.path.exists(args.tmp_export_dir):
        logging.info("Creating directory for local export")
        os.makedirs(args.tmp_export_dir)

    # Do the actual exporting
    os.system('rhythmbox-client --no-present')
    logging.info('Pausing %d seconds for Rhythmbox initialization' % (args.rhythmbox_wait))
    time.sleep(args.rhythmbox_wait) # rhythmbox isn't ready until shortly after rhythmbox-client returns
    export_playlists(args)

    # Remove abs paths for final export dir
    if not os.path.exists(args.export_dir):
        logging.info("Creating directory for local export")
        os.makedirs(args.export_dir)

    # Open up all files
    for fname in os.listdir(args.tmp_export_dir):

        # Read source
        with open(os.path.join(args.tmp_export_dir, fname)) as f:
            lines = f.readlines()

        # Write to destination
        with open(os.path.join(args.export_dir, fname), "w") as f:
            for line in lines:
                if line.startswith(args.music_dir):
                    line = line[len(args.music_dir):]
                    while line.startswith("/"):  # remove accidental slashes
                        line = line[1:]
                f.write(line)
    print("PLAYLIST EXPORT SCRIPT COMPLETE")

