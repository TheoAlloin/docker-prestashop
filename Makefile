#---* Makefile *---#
.SILENT :

# Extract version infos
VERSION:=`git describe --tags --always`
GIT_COMMIT:=`git rev-list -1 HEAD --abbrev-commit`
BUILT:=`date`

## docker-compose			:	build
build:
	@mkdir -p $(PWD)/shared/www
	@docker-compose build
.PHONY: build

## docker-compose			:	up
up:
	@mkdir -p $(PWD)/shared/www
	@docker-compose up --remove-orphans -d 
	@docker-compose logs -f
.PHONY: up

## docker-compose			:	reset all
reset:
	@docker-compose stop
	@yes | docker-compose rm
	@rm -fR $(PWD)/shared/www/config
	@rm -fR $(PWD)/shared/www/modules
	@rm -fR $(PWD)/shared/www/ovverride
	@rm -fR $(PWD)/shared/www/themes
	@rm -fR $(PWD)/shared/www/var/*
.PHONY: reset

## help				:	Print commands help.
help: Makefile
	@echo ""
	@echo "Env Vars:"
	@echo " BUILT: $(BUILT)"
	@echo " VERSION: $(VERSION)"
	@echo " GIT_COMMIT: $(GIT_COMMIT)"
	@echo ""
	@echo "Targets:"
	@sed -n 's/^##//p' $<
	@echo ""
.PHONY: help

# https://stackoverflow.com/a/6273809/1826109
%:
	@: 
