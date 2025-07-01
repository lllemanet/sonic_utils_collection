# sonbake

Utility for fast rebuilding and installing sonic targets (swss, sairedis, ...).

## Install
```
# Global
make install-sonbake

# Current User (note that /home/$USER/bin should be in $PATH variable)
DESTDIR=/home/$USER/ bindir=bin sysconfdir=.config make install-sonbake
```

## Usage
```
# Build binaries and install them into target
sonbake swss -t orchagent -r admin@localhost

# Clean
sonbake swss -c
```

# songdbserver

Utility to start gdbserver on remote and recommend vscode config for debug launch.

## Install
```
# Global
make install-songdbserver

# Current User
DESTDIR=/home/$USER/ bindir=bin sysconfdir=.config make install-songdbserver
```

## Usage
```
~/work/sonic-buildimage$ songdbserver qemu src/sonic-swss/orchagent/orchagent -g orchagent
No screen session found.
Debian GNU/Linux 12 \n \l

Creating screen session songdbserver-1234 for ssh port forwarding to remote
Attach gdbserver to orchagent 2377

launch.json:

{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "orchagent",
            "type": "cppdbg",
            "request": "launch",
            "program": "/home/rushem/work/sonic-buildimage/src/sonic-swss/orchagent/orchagent",
            "miDebuggerServerAddress": "localhost:1234",
            "miDebuggerPath": "gdb",
            "cwd": "/home/rushem/work/sonic-buildimage/src/sonic-swss",
            "preLaunchTask": "start_gdbserver",
            "postDebugTask": "clean_gdbserver"
        }
    ]
}

tasks.json:

{
    "version": "2.0.0",
    "tasks": [
        {
                "label": "start_gdbserver",
                "type": "shell",
                "command": "/home/rushem/bin/songdbserver qemu src/sonic-swss/orchagent/orchagent -g orchagent"
        },
        {
                "label": "clean_gdbserver",
                "type": "shell",
                "command": "/home/rushem/bin/songdbserver qemu /home/rushem/work/sonic-buildimage/src/sonic-swss/orchagent/orchagent -c"
        }
    ]
}
```