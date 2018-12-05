# encoding: utf-8

include_controls 'archer-baseline' do
   
  control '' do
    title ''
    desc ''
    tag "check": ''
    tag 'fix': ''
    impact 0.0
	end 
  
  control 'rsa-archer-1.1' do
    desc 'Passwords must be a minimum of 15 characters in length.'
    tag "check": 'In security parameters, check if MinPasswordLength = 15'
    tag 'fix': 'n security parameters, set MinPasswordLength = 15'
    
    archer_api_helper = archer(url: attribute('url'),
                               instancename: attribute('instancename'),
                               user_domain: attribute('user_domain'),
                               username: attribute('username'),
                               password: attribute('password'),
                               ssl_verify: attribute('ssl_verify'))

    describe archer_api_helper do
      its('default_administrative_user.MinPasswordLength') { should cmp >= 15 }
      its('general_user_parameter.MinPasswordLength') { should cmp >= 15 }
      its('archer_services_parameter.MinPasswordLength') { should cmp >= 15 }
    end
  end
  
