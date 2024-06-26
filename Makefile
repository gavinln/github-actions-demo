SCRIPT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

.PHONY: help
.DEFAULT_GOAL=help
help:  ## help for this Makefile
	@grep -E '^[a-zA-Z0-9_\-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: tmux
tmux:  ## start tmux
	tmuxp load .tmux.yaml

.PHONY: black
black:  ## reformat Python code with black
	poetry run black -l 79 .

.PHONY: pre-commit
pre-commit:  ## run pre-commit on all files
	pre-commit run --all-files --color=never

.PHONY: gha-watch
gha-watch:  ## watch github action
	gh run watch

.PHONY: gha-list
gha-list:  ## list github action
	gh run list

.PHONY: gha-view
gha-view:  ## view github action
	@test -n "$(run)" || { echo "run= not specified"; exit 1; }
	gh run view -v "$(run)"

.PHONY: pre-commit-file
pre-commit-file:  ## for a single file: pre-commit-file fl=<file>
	@test -n "$(fl)" || { echo "fl= not specified"; exit 1; }
	@test -f "$(fl)" || { echo "$(fl) does not exist"; exit 1; }
	pre-commit run --files $(fl)
