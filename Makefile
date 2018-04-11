all:
	echo Nothing to compile

install:
	mkdir -p $(DESTDIR)/etc/coretalk/
	mkdir -p $(DESTDIR)/etc/uwsgi/apps-enabled/
	mkdir -p $(DESTDIR)/etc/nginx/sites-enabled/
	cp -r config/* $(DESTDIR)/etc/coretalk/
	ln -s /etc/coretalk/uwsgi/coretalk.ini $(DESTDIR)/etc/uwsgi/apps-enabled/coretalk.ini
	ln -s /etc/coretalk/nginx/coretalk $(DESTDIR)/etc/nginx/sites-enabled/coretalk
	python3 setup.py install --root=$(DESTDIR)

egg:
	python setup.py sdist bdist_egg

egg_install:
	python setup.py install

egg_upload:
	python setup.py sdist upload

egg_clean:
	rm -rf build/ dist/ coretalk.egg-info/
