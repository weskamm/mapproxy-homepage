
RSYNC_OPTS = -a -v -P --delete-after

all:
	@echo "main command:"
	@echo " update_all - make everything: build_all, sync"
	@echo "subcommands:"
	@echo " build_all  - rebuild static homepage (frozen-flask)"
	@echo " sync       - sync static homepage with rsync"

update_all: build_all sync

build_all:
	python manage.py freeze_all
	cp htaccess build/de/.htaccess
	cp htaccess build/en/.htaccess

sync:
	rsync -av _site/ ssh-226270-os@omniscale.de:domains/mapproxy.org/www/
	rsync -av _site/ ssh-226270-os@omniscale.de:domains/mapproxy.de/
