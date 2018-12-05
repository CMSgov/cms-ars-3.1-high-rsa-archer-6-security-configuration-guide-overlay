# cms-ars3.1-rsa-archer-security-configuration-guide-baseline
CMS ARS 3.1 Moderate Overlay InSpec Validation Profile for RSA Archer Security Configuration Guide Baseline

The Baseline RSA Archer Security Configuration Guide InSpec Profile is based on the RSA Archer 6.x Platform Security Configuration Guide.

For more information about the baseline, please see the following resources. 

- [MITRE RSA Archer 6.x Platform Security Configuration Guide Baseline] (https://github.com/mitre/rsa-archer-security-configuration-guide-baseline)
- [RSA Archer 6.x Platform Security Configuration Guide](https://community.rsa.com/docs/DOC-32567) 
- [API Guide](https://community.rsa.com/docs/DOC-41939)

## Requirements

- [InSpec](http://inspec.io/) at least version 2.x

## Get started

### Installing InSpec 

### Install InSpec on Unix/Linux/Mac

#### Option 1 Install InSpec (Package installer)
First things first: We need InSpec on our workstation. For production and standalone environments, I recommend the ChefDK package, since it gives you Chef + Test-Kitchen + InSpec. You can download the package from [https://downloads.chef.io/chefdk](https://downloads.chef.io/chefdk).

#### Option 2 Install InSpec (Terminal install)
Another option is to install InSpec via a command line script:

```
$ curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -channel stable -P chefdk
```

#### After Install
Once InSpec is installed, run `inspec version` to verify that the installation was successful.


### Install InSpec on Windows

#### Option 1 (package installer)
First things first: We need InSpec on our workstation. For production and standalone environments, I recommend the ChefDK package, since it gives you Chef + Test-Kitchen + InSpec. You can download the package from [https://downloads.chef.io/chefdk](https://downloads.chef.io/chefdk).

#### Option 2 (command line)
Another option is to install InSpec via a Powershell script:

```
$ . { iwr -useb https://omnitruck.chef.io/install.ps1 } | iex; install -channel stable -project chefdk
```

#### After Install
Once InSpec is installed, run `inspec version` to verify that the installation was successful.
  
### Get the RSA Archer Security Configuration Guide Baseline

You will need to download the InSpec Profile to your `runner` system. You can do this via `git` or the GitHub Web interface, etc.

  a. `git clone https://github.com/mitre/rsa-archer-security-configuration-guide-baseline`, or 
  
  b. Save a Zip or tar.gz copy of the master branch from the `Clone or Download` button of this project

### Setting up dependencies in your Ruby and InSpec Environments

The profile uses Bundler to manage needed dependencies - so you will need to installed the needed gems via bundler before you run the profile. Change directories to your your cloned inspec profile then do a `bundle install`. 

  a. `cd rsa-archer-security-configuration-guide-baseline` 
  
  b. `bundle install`

## Credentials

The profile uses RSA Archer REST API connection parameters as `attributes` specified below

- url: Base url of the RSA Archer application, (REQUIRED) <br>
`url: 'https://urltoarcherapp.org/'`

- instancename: Name of the RSA Archer instance (REQUIRED)<br>
`instancename: archerapp`

- user_domain: RSA Archer User Domain (OPTIONAL)<br>
`user_domain: ''`

- username: REST API User with at least `Read-Only` access to `Access Control` attributes on archer (REQUIRED)<br>
`username: restapiuser`

- password: Password of the users is pulled from the ENV <br> Export the password to `ARCHER_API_PASSWORD` (REQUIRED)<br>
`password: <%=ENV['ARCHER_API_PASSWORD']%>`

- ssl_verify: Set this to `false` if Archer App uses self-signed certs<br>
`ssl_verify: true`


## Usage

InSpec makes it easy to run your tests wherever you need. More options listed here: [InSpec cli](http://inspec.io/docs/reference/cli/)

```
# Clone Inspec Profile
$ git clone https://github.com/mitre/rsa-archer-security-configuration-guide-baseline

# Install Gems
$ bundle install

# Update the attributes specified in `inspec.yml` as required

# Set required ENV variables
$ export ARCHER_API_PASSWORD=s3cr3tpassw0rd

# To run profile locally and directly from Github with cli & json output 
$ inspec exec /path/to/profile --reporter cli json:archer-results.json
```

### Run individual controls

In order to verify individual controls, just provide the control ids to InSpec:

```
$ inspec exec /path/to/profile --controls rsa-archer-1.1
```

## Contributors + Kudos

- Rony Xavier [rx294](https://github.com/rx294)
- Eugene Aronne [ejaronne](https://github.com/ejaronne)
- Aaron Lippold [aaronlippold](https://github.com/aaronlippold)

## License and Author

### Authors

- Author: Rony Xavier [rx294](https://github.com/rx294)

### NOTICE
