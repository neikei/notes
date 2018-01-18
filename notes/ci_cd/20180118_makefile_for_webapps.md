### 2018-01-18: Makefile for WebApps

Makefile example for a PHP web application developed on Debian 9.

```bash
#: Required packages: sudo apt install git unzip php-cli python ruby composer

#: Configuration
SHELL := /bin/bash
BRANCH := $(shell git rev-parse --abbrev-ref HEAD)

#: Target groups
.PHONY: build
build: precheck composer syntaxcheck test

.PHONY: artifact
artifact: cleanup archive

#: Targets
.PHONY: precheck
precheck:
	@echo "==> Precheck started."
	which git
	which unzip
	which php
	which python
	which ruby
	which composer
	@echo -e "==> Precheck finished.\n"

.PHONY: composer
composer:
	@echo "==> Composer started."
	composer install --no-interaction
	@echo -e "==> Composer finished.\n"

.PHONY: syntaxcheck
syntaxcheck:
	@echo "==> Syntaxcheck started."
	wget https://github.com/neikei/syntaxchecks/archive/master.zip
	unzip master.zip && rm master.zip
	syntaxchecks-master/syntaxchecks.sh -p "`pwd`" -a -s
	rm -rf syntaxchecks-master
	@echo -e "==> Syntaxcheck finished.\n"

.PHONY: test
test:
	@echo "==> Syntaxcheck started."
	# Add tests here
	@echo -e "==> Syntaxcheck finished.\n"

.PHONY: cleanup
cleanup:
	@echo "==> Cleanup started."
	# Add cleanup tasks here
	@echo -e "==> Cleanup finished.\n"

.PHONY: archive
archive:
	@echo "==> Archive started."
	tar cfz `date +%Y%m%d%H%M%S`_${BRANCH}.tar.gz * --exclude=test-reports
	@echo -e "==> Archive finished.\n"
```
