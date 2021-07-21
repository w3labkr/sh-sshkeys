#!/usr/bin/env sh
#
# Usage
# chmod u+x ./sshkeys.sh
# ./sshkeys.sh --username=<username> --usermail=<usermail@example.com>

# abort on errors
set -e

username=""
usermail=""
hostname="github.com"

for arg in "${@}"; do
  case "$arg" in
  --username=*)
    username="$(echo "$arg" | sed -E 's/(--username=)//')"
    ;;
  --usermail=*)
    usermail="$(echo "$arg" | sed -E 's/(--usermail=)//')"
    ;;
  --hostname=*)
    hostname="$(echo "$arg" | sed -E 's/(--hostname=)//')"
    ;;
  --remove-all)
    rm -rf ~/.ssh/*
    exit 0
    ;;
  esac
done

if [ -z "$username" ]; then
  echo "--username= is not defined."
  exit 0
fi

if [ -z "$usermail" ]; then
  echo "--usermail= is not defined."
  exit 0
fi

# Generate a ssh key.
ssh-keygen -t rsa -b 4096 -f ~/.ssh/${username}_id_rsa -C "$usermail" -N ''

# Ensure the ssh-agent is running.
eval "$(ssh-agent -s)"

# Add your SSH private key to the ssh-agent.
ssh-add ~/.ssh/${username}_id_rsa

# If the file does not exist, it creates a new file.
if [ ! -f ~/.ssh/config ]; then
    echo > ~/.ssh/config
fi

# Delete any duplicate host information.
sed -i.bak "/^Host $username.$hostname/,/^Host/{ \
  /^Host/!d; \
  /$username.$hostname/d; \
}" ~/.ssh/config

# Append host information to the end of the file.
cat >> ~/.ssh/config <<EOF
Host $username.$hostname
     HostName $hostname
     User git
     IdentityFile ~/.ssh/${username}_id_rsa
     IdentitiesOnly yes
EOF

# Modify the remote origin URL of git.
sed -i.bak -E "s/(@|\/\/)($hostname)/\1$username.\2/p" .git/config

echo
cat ~/.ssh/${username}_id_rsa.pub
