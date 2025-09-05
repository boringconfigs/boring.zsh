.PHONY: all install configure

all: install configure

install:
	brew bundle

configure:
	stow . --target="${HOME}"
	@if [ ! -e "${HOME}/.zshrc.local" ]; then \
		cp ".zshrc.local" "${HOME}/.zshrc.local"; \
	fi

