FROM verajm/gitclient

COPY cron-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/cron-entrypoint.sh"]