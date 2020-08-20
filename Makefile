.PHONY: site
site:
	./syncSite.sh
.PHONY: site
serve: site
	hugo serve
