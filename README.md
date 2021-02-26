# cms-ars-3.1-high-rsa-archer-6-security-configuration-guide-overlay
InSpec profile overlay to validate the secure configuration of RSA Archer 6, against the [RSA Archer 6 Platform Security Configuration Guide](https://community.rsa.com/docs/DOC-32567) tailored for [CMS ARS 3.1](https://www.cms.gov/Research-Statistics-Data-and-Systems/CMS-Information-Technology/InformationSecurity/Info-Security-Library-Items/ARS-31-Publication.html) for CMS systems categorized as High.

## Getting Started

It is intended and recommended that InSpec run this profile from a __"runner"__ host (such as a DevOps orchestration server, an administrative management system, or a developer's workstation/laptop) against the target remotely over __the RSA Archer API__.

__For the best security of the runner, always install on the runner the _latest version_ of InSpec and supporting Ruby language components.__ 

The latest versions and installation options are available at the [InSpec](http://inspec.io/) site.

## Tailoring to Your Environment
The following inputs must be configured in an inputs ".yml" file for the profile to run correctly for your specific environment. More information about InSpec inputs can be found in the [InSpec Profile Documentation](https://www.inspec.io/docs/reference/profiles/).

```
# Base URL of the RSA Archer application (e.g., 'https://urltoarcherapp.org/')
url: ''

# Name of the RSA Archer instance (e.g., 'archerapp')
instancename: ''

# RSA Archer user domain
user_domain: ''

# REST API user with at least 'read-only' access ot 'access control' attributes on RSA Archer (e.g., 'restapiuser')
username: ''

# Password of the user is pulled from the environment variable
password: <%=ENV['ARCHER_API_PASSWORD']%>

# Set to 'false' if the RSA Archer application uses self-signed certificates
ssl_verify: true`
```

The ```ARCHER_API_PASSWORD``` environment variable must also be set using the following command so InSpec can access the RSA Archer application through the API.

```
export ARCHER_API_PASSWORD=s3cr3tpassw0rd
```

## Running This Overlay Directly from Github

```
# How to run
inspec exec https://github.com/CMSgov/cms-ars-3.1-high-rsa-archer-6-security-configuration-guide-overlay/archive/master.tar.gz --input-file=<path_to_your_inputs_file/name_of_your_inputs_file.yml> --reporter=cli json:<path_to_your_output_file/name_of_your_output_file.json>
```

### Different Run Options

  [Full exec options](https://docs.chef.io/inspec/cli/#options-3)

## Running This Overlay from a local Archive copy 

If your runner is not always expected to have direct access to GitHub, use the following steps to create an archive bundle of this overlay and all of its dependent tests:

(Git is required to clone the InSpec profile using the instructions below. Git can be downloaded from the [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) site.)

When the __"runner"__ host uses this profile overlay for the first time, follow these steps: 

```
mkdir profiles
cd profiles
git clone https://github.com/CMSgov/cms-ars-3.1-high-rsa-archer-6-security-configuration-guide-overlay.git
inspec archive cms-ars-3.1-high-rsa-archer-6-security-configuration-guide-overlay
inspec exec <name of generated archive> --input-file=<path_to_your_inputs_file/name_of_your_inputs_file.yml> --reporter=cli json:<path_to_your_output_file/name_of_your_output_file.json>
```

For every successive run, follow these steps to always have the latest version of this overlay and dependent profiles:

```
cd cms-ars-3.1-high-rsa-archer-6-security-configuration-guide-overlay
git pull
cd ..
inspec archive cms-ars-3.1-high-rsa-archer-6-security-configuration-guide-overlay --overwrite
inspec exec <name of generated archive> --input-file=<path_to_your_inputs_file/name_of_your_inputs_file.yml> --reporter=cli json:<path_to_your_output_file/name_of_your_output_file.json>
```

## Using Heimdall for Viewing the JSON Results

The JSON results output file can be loaded into __[heimdall-lite](https://heimdall-lite.mitre.org/)__ for a user-interactive, graphical view of the InSpec results. 

The JSON InSpec results file may also be loaded into a __[full heimdall server](https://github.com/mitre/heimdall)__, allowing for additional functionality such as to store and compare multiple profile runs.

## Contributing and Getting Help
To report a bug or feature request, please open an [issue](https://github.com/CMSgov/cms-ars-3.1-high-rsa-archer-6-security-configuration-guide-overlay/issues/new).

## Authors
* Eugene Aronne - [ejaronne](https://github.com/ejaronne)
* Danny Haynes - [djhaynes](https://github.com/djhaynes)

## Special Thanks
* Rony Xavier [rx294](https://github.com/rx294)
* Shivani Karikar - [karikarshivani](https://github.com/karikarshivani)

## Additional References
- [RSA Archer 6 API Guide](https://community.rsa.com/docs/DOC-41939).

### NOTICE

© 2018-2020 The MITRE Corporation.

Approved for Public Release; Distribution Unlimited. Case Number 18-3678.

### NOTICE 

MITRE hereby grants express written permission to use, reproduce, distribute, modify, and otherwise leverage this software to the extent permitted by the licensed terms provided in the LICENSE.md file included with this project.

### NOTICE  

This software was produced for the U. S. Government under Contract Number HHSM-500-2012-00008I, and is subject to Federal Acquisition Regulation Clause 52.227-14, Rights in Data-General.  

No other use other than that granted to the U. S. Government, or to those acting on behalf of the U. S. Government under that Clause is authorized without the express written permission of The MITRE Corporation.

For further information, please contact The MITRE Corporation, Contracts Management Office, 7515 Colshire Drive, McLean, VA  22102-7539, (703) 983-6000.
