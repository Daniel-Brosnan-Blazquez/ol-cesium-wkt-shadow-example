EXAMPLES_JS_FILES := $(shell find examples -type f -name '*.js')
EXAMPLES_FILES := $(shell find examples -type f)
WEBPACK_CONFIG_FILES := $(shell ls buildtools/webpack.*.js) webpack.config.js

.PHONY: all
all: help

.PHONY: help
help:
	@echo "Usage: make <target>"
	@echo
	@echo "Main targets:"
	@echo
	@echo "- dist                    Create a "distribution" for the library (dist/olcesium.js and dist/olcesium.umd.js)"
	@echo "- lint                    Check the code with the linter"
	@echo "- serve                   Run a development web server for running the examples"
	@echo "- clean                   Remove generated files"
	@echo "- cleanall                Remove all the build artefacts"
	@echo "- help                    Display this help message"
	@echo

.PHONY: serve
serve: .build/node_modules.timestamp
	npm start

.build/node_modules.timestamp: package.json
	npm install
	mkdir -p $(dir $@)
	touch $@
