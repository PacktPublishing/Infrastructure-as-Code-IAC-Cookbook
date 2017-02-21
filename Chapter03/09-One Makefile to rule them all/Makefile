.DEFAULT_GOAL := help
TERRAFORM_VERSION = 0.7.3
TERRAFORM_BIN = docker run -it --rm -v "$(PWD)":/data sjourdan/terraform:$(TERRAFORM_VERSION)

ifndef env
getenv=$(error var:"env=" is not set)
else
getenv=$(env)
endif

validate: terraform-fmt terraform-validate	## Validate syntax and format

plan:	terraform-validate terraform-plan ## Plan changes

apply: terraform-validate terraform-apply ## Apply Changes

destroy: terraform-destroy	## Destroy (careful!)

terraform-fmt:
	$(TERRAFORM_BIN) fmt -list
terraform-validate:
	$(TERRAFORM_BIN) validate -var environment=$(call getenv)
terraform-plan:
	$(TERRAFORM_BIN) plan -state=$(call getenv).tfstate -var environment=$(call getenv)
terraform-apply:
	$(TERRAFORM_BIN) apply -state=$(call getenv).tfstate -var environment=$(call getenv)
terraform-destroy:
	$(TERRAFORM_BIN) destroy -state=$(call getenv).tfstate -var environment=$(call getenv)
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
