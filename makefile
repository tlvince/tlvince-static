all:
	cat css/* > css/tmp.css
	yuicompressor -o css/main-min.css css/tmp.css
	rm css/tmp.css
