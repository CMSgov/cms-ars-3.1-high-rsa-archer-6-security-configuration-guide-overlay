# encoding: utf-8

include_controls 'archer-baseline' do

  control 'rsa-archer-1.1' do
    desc 'Passwords must be a minimum of 15 characters in length.'
    tag 'check': 'In security parameters, check if MinPasswordLength = 15'
    tag 'fix': 'n security parameters, set MinPasswordLength = 15'
  end
  
  control 'rsa-archer-1.2' do
    desc 'When passwords are changed or new passwords are established, the new password must contain at least one alpha characters.'
    tag 'check': 'In security parameters, check if AlphaCharsRequired = 1'
    tag 'fix': 'In security parameters, set AlphaCharsRequired = 1'
  end
  
  control 'rsa-archer-1.7' do
    desc 'Existing passwords must be restricted to a 60-day maximum lifetime.'
    tag 'check': 'In security parameters, check if PasswordChangeInterval = 60'
    tag 'fix': 'In security parameters, set PasswordChangeInterval = 60'
  end
    
  control 'rsa-archer-1.8' do
    desc 'Passwords must be prohibited from reuse for a minimum of 12 generations.'
    tag 'check': 'In security parameters, check if PreviousPasswordsDisallowed = 12'
    tag 'fix': 'In security parameters, set PreviousPasswordsDisallowed = 12'
  end
  
  control 'rsa-archer-1.11' do
    desc 'The operating system must initiate a session time-out after a 15 minute period of inactivity.'
    tag 'check': 'In security parameters, check if SessionTimeout = 15.'
    tag 'fix': 'In security parameters, set SessionTimeout = 15.'
  end
end
  
