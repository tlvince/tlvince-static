# Makefile for building tlvince.com assets.
# Copyright 2012 Tom Vincent <http://tlvince.com/contact/>

all:
	mkdir -p css
	stylus --out css --compress stylus/style.styl

deploy:
	appcfg.py update .

minify:
	for png in img/*.png; do \
		optipng -o7 $$png; \
	done; \
	for jpg in img/*.jpg; do \
		jpegtran -optimize -outfile $$jpg $$jpg; \
	done

thumbs:
	mkdir -p img/th
	for img in `find img ! -path "img/th/*" -type f | sed "s_img/__"`; do \
		if [ ! -f img/th/$$img ]; then \
			convert -thumbnail 320 img/$$img img/th/$$img; \
		fi; \
	done

clean:
	rm -rf img/th

.PHONY: all thumbs clean minify deploy
