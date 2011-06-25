all:
	cat css/* > css/tmp.css
	yuicompressor -o css/main-min.css css/tmp.css
	rm css/tmp.css

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
