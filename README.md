# sonbake

Utility for fast rebuilding and installing sonic targets (swss, sairedis, ...).

## Install
```
# Global
make install-sonbake

# Current user (note that /home/$USER/bin should be in $PATH variable)
DESTDIR=/home/$USER/ bindir=bin sysconfdir=.config make install-sonbake
```

## Usage
```
# Build binaries and install them into target
sonbake swss -t orchagent -r admin@localhost

# Clean
sonbake swss -c
```