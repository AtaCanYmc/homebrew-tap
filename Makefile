.PHONY: help syntax audit test

help:
	@echo "Targets: syntax, audit, test"

syntax:
	@for f in Formula/*.rb; do ruby -c "$$f"; done

audit:
	@for f in Formula/*.rb; do brew audit --strict "$$f"; done

test: syntax
	@python3 -c 'import glob; r=open("README.md").read(); fr=open("Formula/README.md").read(); h=open("docs/index.html").read(); fs=[p.split("/")[-1][:-3] for p in sorted(glob.glob("Formula/*.rb"))]; bad=[n for n in fs if not (n in r and n in fr and n in h)]; assert not bad, f"Missing in docs: {bad}"; print(f"All {len(fs)} formulae syntax and doc-sync checks passed.")'
