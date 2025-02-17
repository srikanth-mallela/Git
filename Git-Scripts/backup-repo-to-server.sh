#!/bin/bash
repo-dir="path-to-repo"
backup-dir="path-to-backup"
remote-server="ec2-user@<ip>:/path/"

echo "creating a zip file"

tar -czf $backup-dir/repo_bakcup_$(date +%f).tar.gz -C $repo-dir .

echo "going to send the backup file to remote server"

scp $backup-dir/repo_bakcup_$(date +%f).tar.gz $remote-server

echo "backup completed"

