#!/usr/bin/env bash
# Shell script to sync music to SD card

export_dir="$1"  # Directory to write playlists to. E.g. ~/Music/playlists
music_dir="$2"  # Directory where songs are located. E.g. ~/Music/songs
sdcard_dir="$3"  # Directory of sd card to write to E.g. /media/usb-path/Music

# Export the playlists
python export-rhythmbox-playlists.py --export-dir="$export_dir" --music-dir="$music_dir" --rhythmbox_wait=10

# Sync songs
rsync -a --del "$music_dir"/* "$sdcard_dir"

# Sync playlists
rsync -a --del "$export_dir"/* "$sdcard_dir"

