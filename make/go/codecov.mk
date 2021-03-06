# Managed by makego. DO NOT EDIT.

# Must be set
$(call _assert_var,MAKEGO)
$(call _conditional_include,$(MAKEGO)/base.mk)
$(call _conditional_include,$(MAKEGO)/go.mk)
$(call _assert_var,COVER_TXT)

.PHONY: codecov
codecov:
	bash <(curl -s https://codecov.io/bash) -f $(COVER_TXT)

.PHONY: __updatecodecovyml
__updatecodecovyml:
	@rm -f .codecov.yml
	@echo '# Autogenerated by makego. DO NOT EDIT.' >> .codecov.yml
	@echo 'coverage:' >> .codecov.yml
	@echo '  range: 50...90' >> .codecov.yml
	@echo '  status:' >> .codecov.yml
	@echo '    project: no' >> .codecov.yml
	@echo '    patch: no' >> .codecov.yml
	@echo '    changes: no' >> .codecov.yml
	@echo 'ignore:' >> .codecov.yml
	@echo '  - "**/gen/"' >>.codecov.yml

pregenerate:: __updatecodecovyml
