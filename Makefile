.PHONY: help syntax style audit livecheck js-check diagram test

help:
	@echo "Targets: syntax, style, audit, livecheck, js-check, diagram, test"

syntax:
	@for f in Formula/*.rb; do ruby -c "$$f"; done

style:
	@brew style Formula/*.rb

audit:
	@for f in Formula/*.rb; do brew audit --strict Formula/*.rb; done

livecheck:
	@brew livecheck --tap=AtaCanYmc/tap

js-check:
	@command -v node >/dev/null 2>&1 && node --check docs/app.js || true

diagram:
	@"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --headless --disable-gpu --screenshot=docs/architecture.png --window-size=1040,560 "file://$(CURDIR)/docs/architecture.html"

test: syntax js-check
	@python3 -c 'import glob; r=open("README.md").read(); fr=open("Formula/README.md").read(); h=open("docs/index.html").read(); fs=[p.split("/")[-1][:-3] for p in sorted(glob.glob("Formula/*.rb"))]; bad=[n for n in fs if not (n in r and n in fr and n in h)]; assert not bad, f"Missing in docs: {bad}"; print(f"All {len(fs)} formulae syntax and doc-sync checks passed.")'
