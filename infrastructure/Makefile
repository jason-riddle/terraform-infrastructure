login:
	devenv shell -- terraform login

init:
	devenv shell -- terraform init >/dev/null

upgrade:
	devenv shell -- terraform init -upgrade

plan: init
	devenv shell -- terraform plan

apply: init
	devenv shell -- terraform apply

fmt: init
	devenv shell -- terraform fmt -recursive

validate: init
	devenv shell -- terraform fmt -check -recursive -diff
	devenv shell -- terraform validate .

output: init
	devenv shell -- terraform output -json

console: init
	devenv shell -- terraform console

ls:
	devenv shell -- terraform state list
