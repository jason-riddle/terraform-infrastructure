login:
	terraform login

init:
	terraform init

init_null:
	terraform init >/dev/null

upgrade:
	terraform init -upgrade

plan: init_null
	terraform plan

apply: init_null
	terraform apply

fmt: init_null
	terraform fmt -recursive

validate: init_null
	terraform fmt -check -recursive -diff
	terraform validate .

output: init_null
	terraform output -json

console: init_null
	terraform console

ls:
	terraform state list
