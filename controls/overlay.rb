# encoding: utf-8

include_controls 'archer-baseline' do
   
  control '' do
    title ''
    desc ''
    tag 'check': ''
    tag 'fix': ''
    impact 0.0
	end 
  
  control 'rsa-archer-1.1' do
    desc 'Passwords must be a minimum of 15 characters in length.'
    tag 'check': 'In security parameters, check if MinPasswordLength = 15'
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
  
  control 'rsa-archer-1.2' do
    desc 'When passwords are changed or new passwords are established, the new password must contain at least one alpha characters.'
    tag 'check': 'In security parameters, check if AlphaCharsRequired = 1'
    tag 'fix': 'In security parameters, set AlphaCharsRequired = 1'
	    
    archer_api_helper = archer(url: attribute('url'),
                        instancename: attribute('instancename'),
                        user_domain: attribute('user_domain'),
                        username: attribute('username'),
                        password: attribute('password'),
                        ssl_verify: attribute('ssl_verify'))
    describe archer_api_helper do
    	its('default_administrative_user.AlphaCharsRequired') { should cmp >= 1 }
    	its('general_user_parameter.AlphaCharsRequired') { should cmp >= 1 }
    	its('archer_services_parameter.AlphaCharsRequired') { should cmp >= 1 }
    end
  end
  
  control 'rsa-archer-1.7' do
    desc 'Existing passwords must be restricted to a 60-day maximum lifetime.'
    tag 'check': 'In security parameters, check if PasswordChangeInterval = 60'
    tag 'fix': 'In security parameters, set PasswordChangeInterval = 60'
	    
    archer_api_helper = archer(url: attribute('url'),
                               instancename: attribute('instancename'),
                               user_domain: attribute('user_domain'),
                               username: attribute('username'),
                               password: attribute('password'),
                               ssl_verify: attribute('ssl_verify'))

    describe archer_api_helper do
    	its('default_administrative_user.PasswordChangeInterval') { should cmp <= 60 }
    	its('general_user_parameter.PasswordChangeInterval') { should cmp <= 60 }
    	its('archer_services_parameter.PasswordChangeInterval') { should cmp <= 60 }
  end
  end
  
