# Managing Multiple SSH keys

This script is an ssh key management script for multi-account users. If the SSH key file already exists, only the git host address is modified.

## Download

If you are using Windows x64, download the wget binary file located in the lib directory before running the command.

```sh
$ wget https://raw.githubusercontent.com/w3labkr/sh-sshkeys/master/sshkeys.sh
```

You can download it from the official site.

- <https://eternallybored.org/misc/wget/>

## Usage

Set the execute permission for the file.

```sh
$ chmod u+x ./sshkeys.sh
```

Run from the directory where Git is installed.

```sh
$ ./sshkeys.sh --username=<username> --usermail=<mail@example.com>
```

The default hostname value is "github.com". To change the hostname, run the following command:

```sh
$ ./sshkeys.sh --username=<username> --usermail=<mail@example.com> --hostname=<hostname>
```

To remove all ssh keys registered in the ~/.ssh directory, run the following command:

```sh
$ ./sshkeys.sh --remove-all
```

## License

This software is licensed under the [MIT LICENSE](LICENSE).
