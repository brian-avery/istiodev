.PHONY: site

gen-content:
	hack/gen-content.sh
gen-release-notes:
	hack/gen-release-notes.sh
.PHONY: gen-content gen-release-notes
serve: clean gen-content gen-release-notes
	hugo serve
.PHONY: build
build: clean gen-content gen-release-notes
	HUGO_ENV="production" hugo --gc || exit 1
clean:
	rm -rf _tmp
