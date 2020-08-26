.PHONY: site

gen-content:
	hack/gen-content.sh
gen-release-notes:
	hack/gen-release-notes.sh
.PHONY: gen-content gen-release-notes
serve: gen-content gen-release-notes
	hugo serve
clean:
	rm -rf _tmp
