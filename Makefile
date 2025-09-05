.PHONY: all install configure

all: install configure

install:
	brew bundle

configure:
	stow . --target="${HOME}"
	@if [ ! -e "${HOME}/.zshrc" ]; then \
		cp ".zshrc" "${HOME}/.zshrc"; \
	fi

