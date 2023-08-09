login:
	devenv shell -- terraform login

init:
	devenv shell -- terraform init

init_null:
	devenv shell -- terraform init >/dev/null

upgrade:
	devenv shell -- terraform init -upgrade

plan: init_null
	devenv shell -- terraform plan

apply: init_null
	devenv shell -- terraform apply

fmt: init_null
	devenv shell -- terraform fmt -recursive

validate: init_null
	devenv shell -- terraform fmt -check -recursive -diff
	devenv shell -- terraform validate .

output: init_null
	devenv shell -- terraform output -json

console: init_null
	devenv shell -- terraform console

ls:
	devenv shell -- terraform state list

rm:
	devenv shell -- \
		terraform state rm \
			module.aws_tfc_role.aws_iam_role_policy_attachment.tfc_policy_attachment[0] \
			module.aws_tfc_role.data.tls_certificate.tfc_certificate \
			module.aws_tfc_role.aws_iam_policy.tfc_policy[0] \
			module.aws_tfc_role.aws_iam_role.tfc_role[0]
