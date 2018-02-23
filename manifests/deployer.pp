$dirname = 'deployer'
$filename = "${dirname}.zip"
$install_path = "/opt/${dirname}"

  file { $install_path:
    ensure       => 'directory',
  }

  archive { $filename:
    path         => "/tmp/${filename}",
    source       => 'https://releases.hashicorp.com/terraform/0.11.3/terraform_0.11.3_linux_amd64.zip',
    extract      => true,
    extract_path => "${install_path}",
    creates      => "${install_path}/${dirname}",
    cleanup      => true,
    require      => File[$install_path],
  }
}
include deployer
