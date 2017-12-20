### 2017-09-18: Deploy archives with Bamboo and PHP Deployer

Bamboo task to create the archive during the deployment process.

```bash
# Desc: Create tarball and remove archived files
tar cfz artifact.tar.gz * --remove-files
```

PHP Deployer task to extract the archive on a remote server.

```php
// Extract archive on a remote server
desc('Extract archive');
task('archive:extract', function () {
    run('cd {{ release_path }} && tar xf artifact.tar.gz && rm artifact.tar.gz');
});

// Deploy process
desc('Deploy');
task('deploy', [
    'deploy:prepare',
    'deploy:lock',
    'deploy:release',
    'rsync',
    'archive:extract',
    'deploy:symlink',
    'deploy:unlock',
    'cleanup',
    'success'
]);
```
