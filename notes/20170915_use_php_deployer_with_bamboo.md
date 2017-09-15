## 2017-09-15: Use PHP Deployer with Bamboo

Use PHP Deployer to simplify Bamboo deployments to a bunch of servers.

- [Bamboo](https://www.atlassian.com/software/bamboo)
- [PHP Deployer](https://deployer.org/)

**PHP Deployer placement:** Place the scripts in the home directory of the bamboo application user in a subfolder named "deployer" and create an own subfolder for every deployment project.

```bash
~/deployer/$project/deploy.php
~/deployer/$project/composer.json
```

Hint: "composer update" is needed in every project directory.

**Bamboo task** to execute PHP Deployer scripts during the deployment process.

```bash
# Desc: Config
project=<projectname>
stage=<stage>

# Desc: Deployment
logfile="/tmp/$project-$stage.log"

# Desc: Change into the directroy of your deployer scripts and start the deployment with the build directory as parameter
cd ~/deployer/$project
php vendor/bin/dep deploy $stage --artifact_directory="${bamboo.build.working.directory}" -vv 2>&1 | tee $logfile

# Desc: Check Result
errors=`grep "\[FatalException\]\|RuntimeException\|\[Error\]\|Fatal error\|Exception trace\|General error" $logfile | wc -l`
if [ $errors -ne 0 ]; then
    echo "==> Deployer failed... Check the output above.";
    exit 1;
else
    echo "==> Deployer finished.";
fi
```

**PHP Deployer** modifications to use a Bamboo build directory for the deployment.

```php
// Include Symfony component for input options
use Symfony\Component\Console\Input\InputOption;

// Get artifact directory from start parameters
option('artifact_directory', null, InputOption::VALUE_REQUIRED, 'Artifact directory');

// Set rsync source to artifact directory
set('rsync_src', function () {
    return input()->getOption('artifact_directory');
});
```
