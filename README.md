# cms-ars-3.1-high-rsa-archer-security-configuration-guide-overlay
InSpec profile overlay to validate the secure configuration of RSA Archer 6, against the [RSA Archer 6 Platform Security Configuration Guide](https://community.rsa.com/docs/DOC-32567) tailored for [CMS ARS 3.1](https://www.cms.gov/Research-Statistics-Data-and-Systems/CMS-Information-Technology/InformationSecurity/Info-Security-Library-Items/ARS-31-Publication.html).

## Getting Started

It is intended and recommended that InSpec run this profile from a __"runner"__ host (such as a DevOps orchestration server, an administrative management system, or a developer's workstation/laptop) against the target remotely over __the RSA Archer API__.

__For the best security of the runner, always install on the runner the _latest version_ of InSpec and supporting Ruby language components.__ 

Latest versions and installation options are available at the [InSpec](http://inspec.io/) site.

## Required Configurations

The following attributes must be configured in order for the profile to run correctly. These attributes can be configured in inspec.yml file or in an attributes file. More information about InSpec attributes can be found [here](https://www.inspec.io/docs/reference/profiles/).
    
| Attribute                     | Required | Default     | Description                                                           |
| :---                          | :---     | :---        | :---                                                               |
| url           | yes | `url: 'https://urltoarcherapp.org/'`        | Base URL of the RSA Archer application. |
| instancenamne | yes | `instancename: archerapp`                   | Name of the RSA Archer instance.        |
| user_domain   | no  | `user_domain: ''`                           | RSA Archer User Domain.                 |
| username      | yes | `username: restapiuser`                     | REST API User with at least `Read-Only` access to `Access Control` attributes on Archer.|
| password      | yes | `password: <%=ENV['ARCHER_API_PASSWORD']%>` | Password of the users is pulled from the ENV. Export the password to "ARCHER_API_PASSWORD". |
| ssl_verify    | no  | `ssl_verify: true`                          | Set this to 'false' if the Archer application uses self-signed certificates. |

Lastly, set the password for the Archer API using the following command.
```
$ export ARCHER_API_PASSWORD=s3cr3tpassw0rd
```

## Running This Overlay
When the __"runner"__ host uses this profile overlay for the first time, follow these instructions: 

```
mkdir profiles
cd profiles
git clone https://github.cms.gov/ispg-dev/cms-ars-3.1-high-rsa-archer-security-configuration-guide-overlay.git
git clone https://github.com/mitre/rsa-archer-6-security-configuration-guide-baseline.git
cd cms-ars-3.1-high-rsa-archer-security-configuration-guide-overlay
bundle install
inspec exec ../cms-ars-3.1-high-rsa-archer-security-configuration-guide-overlay --reporter cli json:archer-overlay-results.json
```

For every successive run, follow these instructions to always have the latest version:

```
cd profiles/cms-ars-3.1-high-rsa-archer-security-configuration-guide-overlay
git pull
cd ../rsa-archer-6-security-configuration-guide-baseline
git pull
cd ../cms-ars-3.1-high-rsa-archer-security-configuration-guide-overlay
bundle install
inspec exec ../cms-ars-3.1-high-rsa-archer-security-configuration-guide-overlay --reporter cli json:archer-overlay-results.json
```

## Viewing the JSON Results

The JSON results output file can be loaded into __[heimdall-lite](https://mitre.github.io/heimdall-lite/)__ for a user-interactive, graphical view of the InSpec results. 

The JSON InSpec results file may also be loaded into a __full heimdall server__, allowing for additional functionality such as to store and compare multiple profile runs.  

## Getting Help
To report a bug or feature request, please open an [issue](https://github.cms.gov/ispg-dev/cms-ars-3.1-high-rsa-archer-security-configuration-guide-overlay/issues/new).

## Authors
* Eugene Aronne
* Danny Haynes

## Special Thanks
* Rony Xavier

## Additional References
- [RSA Archer 6.x API Guide](https://community.rsa.com/docs/DOC-41939).

## License
* This project is licensed under the terms of the [Apache 2.0 license](https://www.apache.org/licenses/LICENSE-2.0).

### NOTICE  

This software was produced for the U. S. Government under Contract Number HHSM-500-2012-00008I, and is subject to Federal Acquisition Regulation Clause 52.227-14, Rights in Data-General.  

No other use other than that granted to the U. S. Government, or to those acting on behalf of the U. S. Government under that Clause is authorized without the express written permission of The MITRE Corporation.

For further information, please contact The MITRE Corporation, Contracts Management Office, 7515 Colshire Drive, McLean, VA  22102-7539, (703) 983-6000.
