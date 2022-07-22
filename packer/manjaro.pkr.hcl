packer {
  required_plugins {
    virtualbox = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/virtualbox"
    }
  }
}

source "virtualbox-iso" "manjaro" {
  guest_os_type             = "ArchLinux_64"
  iso_url                   = "https://download.manjaro.org/kde/21.3.5/manjaro-kde-21.3.5-220721-linux515.iso"
  iso_checksum              = "sha1:891eae5ec5a0037cbce604ffb8ac66915b477a81"
  ssh_clear_authorized_keys = true
  ssh_username              = "vagrant"
  ssh_password              = "vagrant"
  ssh_timeout               = "10m"
  shutdown_command          = "echo 'vagrant' | sudo -S shutdown -P now"
  boot_wait                 = "3s"
  boot_command = [
    "<enter>",
    "<wait40s>",
    "<f12><wait>sudo calamares &<enter>",
    "<wait5s>",
    "a<wait500ms>a<wait500ms>a<wait500ms>a<enter><tab><tab><spacebar><wait>",                                                           # choose language
    "<tab><tab><tab><tab><tab><tab><spacebar><wait>",                                                                                   # defautl timezone
    "<tab><tab><tab><tab><tab><tab><tab><tab><tab><spacebar><wait>",                                                                    # Keyboard 
    "<tab><tab><tab><tab><tab><tab><tab><tab><tab><tab><tab><tab><tab><tab><spacebar><wait>",                                           # Partition
    "vagrant<tab><tab><tab>vagrant<tab>vagrant<tab><tab><spacebar><tab><tab><tab><spacebar><wait500ms><spacebar><wait500ms><spacebar>", # credentials and install
    "<wait4m30s>",                                                                                                                      # wait to install
    "<tab><tab><spacebar><wait500ms><tab><tab><wait500ms><spacebar>",                                                                   # restart
    "<wait60s>",
    "<leftCtrlOn><leftAltOn><f3><leftCtrlOff><leftAltOff>", # enter cml
    "<wait>vagrant<enter><wait>vagrant<enter><wait>",       # credentials
    "sudo pacman --noconfirm -S openssh<enter><wait1s>vagrant<enter><wait>",
    "sudo systemctl enable sshd.service<enter><wait>",
    "sudo systemctl start sshd.service<enter>"
  ]
  # iso_interface = "sata"
  hard_drive_interface = "sata"
  vboxmanage = [
    ["modifyvm", "{{.Name}}", "--firmware", "EFI"],
    ["modifyvm", "{{.Name}}", "--boot1", "floppy"],
    ["modifyvm", "{{.Name}}", "--boot2", "dvd"],
    ["modifyvm", "{{.Name}}", "--boot3", "disk"],
    ["modifyvm", "{{.Name}}", "--memory", "8192"],
    ["modifyvm", "{{.Name}}", "--vram", "16"]
  ]
}

build {
  sources = ["source.virtualbox-iso.manjaro"]
}
