.DEFAULT_GOAL=help

REGION=eu-central-1

.PHONY: help
help:
	@echo 'Usage: make <target>'
	@echo 'targets:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'



.PHONY: createwebsite
createwebsite:  ## creates website infra
	./scripts/deploy.sh heron-website cloudformation/website.yml ${REGION} parameters/website.json


.PHONY: buildsite
buildsite:
	hugo

.PHONY: uploadsite
uploadsite:  ## upload site
	./scripts/uploadsite.sh ${REGION}

.PHONY: buildandupload
buildandupload: |  buildsite uploadsite ## build and upload site


