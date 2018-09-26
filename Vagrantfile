require 'vagrant-aws'

Vagrant.configure("2") do |config|
  config.vm.define :testbox do |testbox|
    testbox.vm.box = 'dummy'
    testbox.ssh.username = 'ubuntu'

    testbox.vm.provider :aws do |aws, override|
      aws.access_key_id = ""
      aws.secret_access_key = ""
      aws.keypair_name = 'vagrant'
      aws.security_groups = [ 'vagrant' ]       

      override.ssh.private_key_path = '~/.ssh/vagrant.pem'
      override.ssh.username = 'ubuntu'
      override.ssh.password = 'test'
      aws.region = 'us-west-1'
      aws.ami = 'ami-0bdb828fd58c52235'
      aws.instance_type = 't1.micro'
      
      aws.tags = {
        Name: 'Vagrant AWS Precise'
      }
    end
  end
  config.ssh.username = 'root'
  config.ssh.password = 'vagrant'
  config.ssh.insert_key = 'true'
end
