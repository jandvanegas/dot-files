build-base:
	packer init ./manjaro.pkr.hcl
	packer fmt ./manjaro.pkr.hcl
	packer build -force ./manjaro.pkr.hcl
build:
	packer init ./manjaro-vagrant.pkr.hcl
	packer fmt ./manjaro-vagrant.pkr.hcl
	packer build -force ./manjaro-vagrant.pkr.hcl

