# gitcron

### TL;DR 
Used to keep your repo synced using HTTPS login

```
version: '3.7'
services:
    gitcron:
        image: verajm/gitcron
        environment:
            - CRON_ENTRY=* * * * * cd /git && git pull
            - GIT_USER=dummy_user
            - GIT_PASSWORD=dummy_pass
        volumes:
            - $(pwd)/repo:/git
            - $(HOME)./ssh:/root/.ssh
```
