# gitcron

```
version: '3.7'
services:
    gitcron:
        image: verajm/gitcron
        environment:
            - CRON_ENTRY=* * * * * cd /git && git pull
        volumes:
            - $(pwd)/repo:/git
            - $(HOME)./ssh:/root/.ssh
```
