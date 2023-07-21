# Terraform Infrastructure

This is my terraform infrastructure. This is a monorepo that contains code for provisioning and configuring various web services.

I manage the following in `infrastructure/`

- AWS Resources
- Cloudflare Zones and DNS Records
- GitHub Repos
- Kubernetes Resources
- Tailscale Resources

`main.tf` - The entry-point for everything. Web services are alphabeticalized.

`aws_users/` - Code for managing AWS users.

`cloudflare/` - Code for managing Cloudflare records.

`github/` - Code for managing GitHub repos.

`k8s/` - Code for managing Kubernetes things.
