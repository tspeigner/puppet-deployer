#!/usr/bin/env ruby

require 'open3'
require 'fileutils'

deployer_link = 'https://releases.hashicorp.com/terraform/0.11.3/terraform_0.11.3_linux_amd64.zip'

def mkdir_p(dir)
  FileUtils::mkdir_p "#{dir}"
end

def deployer_exec(command)
  stdout, stderr, status = Open3.capture3(command)
  {
    stdout: stdout.strip,
    stderr: stderr.strip,
    exit_code: status.exitstatus
  }
end

mkdir_p('/opt/deployer')
deployer_exec("sudo curl -o /tmp/deployer.zip #{deployer_link}")
deployer_exec('sudo unzip /tmp/deployer.zip -d /opt/deployer/')
deployer_exec('sudo mv /opt/deployer/terraform /opt/deployer/deployer')