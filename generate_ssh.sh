ssh-keygen -t rsa -b 4096 -C "$1"
# add to ssh agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
