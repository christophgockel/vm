.PHONY: vm prerequisites

all: vm

vm: prerequisites
	@echo "building vm"
	packer build packer/packer_template.json
	@echo "adding vagrant box"
	vagrant box add vm vm-virtualbox.box
	@echo "vagrant box added"
	@echo "start it by running: vagrant up"

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

