
# Create and configure the AWS instance(s)
Vagrant.configure('2') do |config|

  # Use dummy AWS box
  config.vm.box = 'aws-dummy'

  # Provision
  # config.vm.provision "shell", path "bootstrap.sh" 


  # Network settings
  config.vm.network "public_network", ip: "192.168.0.17"

  
  # Folder settings
  config.vm.synced_folder "./share_host", "/vagrant", disabled: true


  # Specify AWS provider configuration
  config.vm.provider 'aws' do |aws, override|
    # Read AWS authentication information from environment variables
    aws.access_key_id = ''
    aws.secret_access_key = ''

    # Specify SSH keypair to use
    aws.keypair_name = 'vagrant'

    # Specify region, AMI ID, and security group(s)
    aws.instance_type = "t2.micro"
    aws.region = 'us-west-1'
    aws.ami = 'ami-0782017a917e973e7'
    aws.security_groups = ['vagrant']
    aws.tags = { 'Name' => 'vagrant' }
    # Specify username and private key path
    override.ssh.username = 'ec2-user'
    override.ssh.private_key_path = '~/.ssh/vagrant.pem'
  end
end
