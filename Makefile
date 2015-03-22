SSH_PUBLIC_KEY=$(shell cat packer/keys/vm.pub)

.PHONY: all vm prerequisites clean

all: vm

vm: prerequisites
	@echo "building vm"
	packer build --force=true --only=virtualbox-iso -var 'ssh_public_key=$(SSH_PUBLIC_KEY)' packer/packer_template.json
	@echo "adding vagrant box"
	vagrant box add --force vm vm-virtualbox.box
	@echo "vagrant box added"
	vagrant provision
	@echo "vagrant box provisioned"
	@echo "start it by running: vagrant up"
	@echo "log in to it by running: vagrant ssh"

prerequisites:
	@echo "checking prerequisites"

	@if command -v packer >/dev/null 2>&1; then \
	  echo "  packer is available"; \
	else \
		echo "  installing packer..."; \
		brew tap homebrew/binary; \
		brew install packer; \
	fi

	@if command -v vagrant >/dev/null 2>&1; then \
	  echo "  vagrant is available"; \
	else \
		echo "  installing vagrant..."; \
		brew cask install vagrant; \
	fi

	@if command -v VBoxManage >/dev/null 2>&1; then \
	  echo "  virtual-box is available"; \
	else \
		echo "  installing virtual-box..."; \
		brew cask install virtualbox; \
	fi

clean:
	rm -rf output-*
	rm -rf *.box
