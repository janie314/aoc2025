.PHONY: fmt

fmt:
	perltidy -b *.pl
	rm *.bak

fix:
	make fmt
	perlcritic .