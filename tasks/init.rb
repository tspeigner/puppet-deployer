#!/opt/puppetlabs/puppet/bin/ruby

# Puppet Task to deploy an AWS cloud instance: 
# Currently this can only be run on the Puppet Master

require 'puppet'
require 'open3'

def create_instance(params)
  cmd = ['/opt/deployer/terraform', 'apply', '-auto-approve']
  params.each do |key, value|
    cmd << '-var' << "#{key}=#{value}"
  end
  puts "#{cmd}"
  stdout, stderr, status = Open3.capture3( *cmd )
  {
    stdout: stdout.strip,
    stderr: stderr.strip,
    exit_code: status.exitstatus
  }
end

#def show_status()
#  stdout, stderr, status = Open3.capture3( *show_cmd )
#  {
#    stdout: stdout.strip,
#    stderr: stderr.strip,
#    exit_code: status.exitstatus
#  }
#end
#
#def destroy_cmd()
#  cmd = ['/opt/deployer/terraform', '-force']
#  stdout, stderr, status = Open3.capture3( *destroy_cmd )
#  {
#    stdout: stdout.strip,
#    stderr: stderr.strip,
#    exit_code: status.exitstatus
#  }
#end

Puppet.initialize_settings
unless Puppet[:server] == Puppet[:certname]
  puts 'This task can only be run against the Master (of Masters)'
  exit 1
end

params = JSON.parse(STDIN.read)

create_instance(params)