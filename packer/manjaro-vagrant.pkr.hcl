packer {
  required_plugins {
    virtualbox = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/virtualbox"
    }
    sshkey = {
      version = ">= 1.0.1"
      source  = "github.com/ivoronin/sshkey"
    }
  }
}
data "sshkey" "install" {
}

source "virtualbox-ovf" "manjaro-vagrant" {
  source_path = "./output-manjaro/packer-manjaro-1658489013.ovf"
  checksum = "none"
  ssh_private_key_file      = data.sshkey.install.private_key_path
  ssh_clear_authorized_keys = true
  ssh_username              = "vagrant"
  ssh_password              = "vagrant"
  ssh_timeout               = "10m"
  shutdown_command          = "echo 'vagrant' | sudo -S shutdown -P now"
}

build {
  sources = ["source.virtualbox-ovf.manjaro-vagrant"]
  provisioner "shell" {
    inline = [
      "mkdir ~/.ssh",
      "chmod 700 ~/.ssh",
      "wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O ~/.ssh/authorized_keys",
      "chmod 600 ~/.ssh/authorized_keys",
      "chown -R vagrant ~/.ssh",
      "echo vagrant | sudo -S sh -c 'echo \"vagrant ALL=(ALL) NOPASSWD: ALL\" >> /etc/sudoers'"
    ]
  }
  post-processor "vagrant" {
    keep_input_artifact = true
    provider_override   = "virtualbox"
  }
}
