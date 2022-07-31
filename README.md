# Docs-infra
A util-repo used to convert markdown (md) files from Obsidian to a web page hosted on nginx.

Got inspiration for mkdocs.yml from [jobindj](from https://github.com/jobindj/obsidian-publish-mkdocs)

Terraform together with Ansible is used to deploy the infrastructure and setup this repo on a server
and handle automatic rebuild of the website on every commit to the submodule docs. Every 5 minutes
a check is performed to see if there are new commits to the recipes repo, and if so, the webpage is rebuilt
using the latest recipes.
