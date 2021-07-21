# Managing Multiple SSH keys

This script creates an ssh file and updates ssh settings and git remote source url.

## Download

```sh
$ wget https://raw.githubusercontent.com/w3labkr/sh-sshkeys/master/sshkeys.sh
```

If you are using Windows x64, download lib/wget.exe before running the command.
or download wget from the official site.

- <https://eternallybored.org/misc/wget/>

## Usage

Run from the directory where Git is installed.

```sh
$ chmod u+x ./sshkeys.sh
$ ./sshkeys.sh --username=<username> --usermail=<mail@example.com> --hostname=<hostname>
```

## License
This software is licensed under the [MIT LICENSE](LICENSE).
