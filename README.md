# Ansible Role: PHP

Installs PHP, composer and other tools on Debian/Ubuntu systems.

## Role Variables

Available variables are listed below, along with default values (`defaults/main.yml`):

        php_ppa: []

A list of ppa we want to add to our systems. By default, this role will add `ondrej/php5` ppa.

        php_packages: []

A list of packages to install. By default, this role will install php5, php5-cli and php5-fpm.

        php_composer: true

When this variable is true, the role will install composer and will make it available system wide.

        php_modules: []

A list of php5 modules. They will be installed using the standard Ubuntu/Debian apt repositories.
_Note: will change this to install modules using composer providing a `composer.json` template._

        php_drush: false

When this variable is true, the role will install a specific version of drush (pinned with `php_drush_version`).

        php_composer_binaries: []

A list of binaries downloaded by composer. By default, the role will copy to /usr/local/bin the drush one only.

        php_drush_rr: false

When this variable is true, the role will install the Registry Rebuild module. Of course, to do this, `php_drush` must be true!

        php_conf: false

When this variable is true, the role will read some data from `php_conf_vars` and add/remove/modify lines from a given configuration file.

_e.g:_

    php_conf_vars:
      - dest: /etc/php5/fpm/pool.d/www.conf
      regexp: ^listen\ =
      line: 'listen = 127.0.0.1:9000'

*TODO*: Create PHP configuration's templates such as `www.conf`, `php.ini`, etc.

##Test Kitchen
A very simple test kitchen file is provided which will create a VM with this informations:

* Hosts: _test-kitchen_

* Group: _default_

###Test Playbook
A test playbook, called `default.yml`, is provided and it contains a set of variables slightly different from the default ones:

          vars:
            - php_drush: true
            - php_packages:
              - apache2
              - curl
              - php5
              - php5-fpm
            - php_drush_rr: true
            - php_drush_version: 8
            - php_conf: true

###Server Spec
The role comes with three different unit test files which are:

* php_packages_spec - Checks `which php5` and `which php5-fpm`;

* php_modules_spec - Checks if `imagick`, `mysql` and `memcache` php modules are installed;

* php_config_spec - Checks if the line we defined in `defaults/main.yml` has been added to www.conf

_Note_: Ruby, rspec, test kitchen and test kitchen for ansible need to be installed!

##Dependencies
none

##Example Playbook
    - hosts: webservers
      vars_files:
        - vars/main.yml
      roles:
        - { role: ansible-role-php }

##License
MIT / BSD

##Author Information
This role was created in 2016 by *Davide Di Mauro*.
