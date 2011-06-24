all:
	cat css/* > css/tmp.css
	yuicompressor -o css/main-min.css css/tmp.css
	rm css/tmp.css

thumbs:
	mkdir -p img/th
	for img in img/*; do \
		convert -thumbnail 320 img/$$img img/th/$$img; \
	done

.PHONY: all thumbs
