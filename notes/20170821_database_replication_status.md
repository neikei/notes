## 2017-08-21: Database replication status

Bash snippets to check the database replication.

```bash
# Desc: MySQL slave status
mysql -e "SHOW SLAVE STATUS \G"

# Desc: MySQL slave status as watch to refresh every 2 seconds
watch -n 2 'mysql -e "SHOW SLAVE STATUS \G"'

# Desc: MySQL replication lag only
mysql -e 'SHOW SLAVE STATUS \G' | grep Seconds_Behind_Master

# Desc: PostgreSQL replication lag only
cd /tmp && sudo -u postgres psql -d postgres -c "SELECT CASE WHEN pg_last_xlog_receive_location() = pg_last_xlog_replay_location()
    THEN 0
    ELSE EXTRACT (EPOCH FROM now() - pg_last_xact_replay_timestamp())
END AS replication_lag_in_seconds;"
```
