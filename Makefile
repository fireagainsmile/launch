default: build

########################################
### CI

ci: build

########################################
### Installation

install-swagger-markdown:
	@echo "--> Installing swagger-markdown"
	yarn global add swagger-markdown

########################################
### Build

build: build-markdown-http-docs
	@echo "--> Building docs site"
	mkdocs build

#serve: build-markdown-http-docs
#	@echo "--> Serving docs site"
#	mkdocs serve

########################################
### Build other docs

build-markdown-http-docs:
	@echo "--> Generating markdown from swagger.yml"
	npx songliling/swagger-markdown -i swagger.yaml -o docs/api-reference/paths.md
