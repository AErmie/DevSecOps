# RUN THIS COMMAND TO APPEND CONTENT TO THE FILE
cat >> ubuntu/controls/example.rb <<EOL
CONTNET
EOL

# This code basically checks whether shadow file is owned by root or not.
describe file('/etc/shadow') do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
  end


# PCI/DSS checks
describe file('/etc/pam.d/system-auth') do
    its('content') { 
        should match(/^\s*password\s+requisite\s+pam_pwquality\.so\s+(\S+\s+)*try_first_pass/)
    }
    its('content') {
        should match(/^\s*password\s+requisite\s+pam_pwquality\.so\s+(\S+\s+)*retry=[3210]/)
    }
end

# PCI/DSS checks
describe file('/etc/pam.d/password-auth') do
    its('content') { 
        should match(/^\s*password\s+requisite\s+pam_pwquality\.so\s+(\S+\s+)*try_first_pass/)
    }
    its('content') {
        should match(/^\s*password\s+requisite\s+pam_pwquality\.so\s+(\S+\s+)*retry=[3210]/)
    }
end

# PCI/DSS checks
describe file('/etc/default/useradd') do
    its('content') {
        should match(/&\s*INACTIVE\s*=\s*(30|[1-2][0-9]|[1-9])\s*(\s+#.*)?$/)
    }
end

# PCI/DSS checks
describe file('/etc/ssh/sshd_config') do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
    its('content') { should match 'PasswordAuthentication no' }
end


# check if pty is being used
control 'ubuntu-1.3.2' do
   title 'Ensure sudo commands use pty'
   desc 'Attackers can run a malicious program using sudo, which would again fork a background process that remains even when the main program has finished executing.'
   describe command('grep -Ei "^\s*Defaults\s+([^#]+,\s*)?use_pty(,\s+\S+\s*)*(\s+#.*)?$" /etc/sudoers /etc/sudoers.d/*') do
      its('stdout') { should match /Defaults(\s*)use_pty/ }
   end
end


control 'ubuntu-5.2.1' do
   title 'Ensure permissions on /etc/ssh/sshd_config are configured'
   desc 'The /etc/ssh/sshd_configfile contains configuration specifications for sshd. The command below checks whether the owner and group of the file is root.'
   describe file('/etc/ssh/sshd_config') do
     its('owner') { should eq 'root'}
     its('group') { should eq 'root'}
     its('mode') { should cmp '0600' }
   end
end



control 'ubuntu-1.3.2' do
   title 'Ensure sudo commands use pty'
   desc 'Attackers can run a malicious program using sudo, which would again fork a background process that remains even when the main program has finished executing.'
   describe file('/etc/sudoers') do
      its('content') { should match /Defaults(\s*)use_pty/ }
   end
end



control 'ASVS-14.4.1' do
    impact 0.7
    title 'Safe character set'
    desc 'HTTP response contains content type header with safe character set'
    describe http('https://prod-zo23ckjx.lab.practical-devsecops.training') do
        its ('headers.Content-type') { should cmp 'text/html; charset=utf-8'}
    end
end

control 'ASVS-14.4.2' do
    impact 0.7
    title 'Contain Content Disposition header attachment'
    desc "Add Content-Disposition header to the server's configuration.","Add 'attachment' directive to the header."
    describe http('https://prod-zo23ckjx.lab.practical-devsecops.training') do
        its ('headers.content-disposition') { should cmp 'attachment' }
    end
end

control 'ASVS-14.4.3' do
    impact 0.7
    title 'Content Security Policy Options != none / contain unsafe-inline;unsafe-eval;\* '
    desc "Ensure that CSP is not configured with the directives: 'unsafe-inline', 'unsafe-eval' and wildcards."
    describe http('https://prod-zo23ckjx.lab.practical-devsecops.training') do
        its ('headers.content-security-policy') { should_not cmp 'none' }
        its ('headers.content-security-policy') { should_not include 'unsafe-inline;unsafe-eval;\*'}
    end
end

control 'ASVS-14.4.4' do
    impact 0.7
    title 'Content type Options = no sniff'
    desc 'All responses should contain X-Content-Type-Options=nosniff'
    describe http('https://prod-zo23ckjx.lab.practical-devsecops.training') do
        its ('headers.x-content-type-options') { should cmp 'nosniff'}
    end
end

control 'ASVS-14.4.5' do
    impact 0.7
    title 'HSTS is using directives max-age=15724800'
    desc 'Verify that HTTP Strict Transport Security headers are included on all responses and for all subdomains, such as Strict-Transport-Security: max-age=15724800; includeSubDomains.'
    describe http('https://prod-zo23ckjx.lab.practical-devsecops.training') do
        its ('headers.Strict-Transport-Security') { should match /\d/ }
    end
end

control 'ASVS-14.4.6' do
    impact 0.7
    title "'Referrer-Policy' header is included"
    desc "HTTP requests may include Referrer header, which may expose sensitive information. Referrer-Policy restiricts how much information is sent in the Referer header."
    describe http('https://prod-zo23ckjx.lab.practical-devsecops.training') do
        its ('headers.referrer-policy') { should cmp 'no-referrer; same-origin' }
    end
end
