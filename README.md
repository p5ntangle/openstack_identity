# openstack_identity

This repo contains the necessary ansible roles to create a Openstack
deployment configured with a Shibboleth-IDP and SP that authenticates
to a OpenLDAP Server

The builds for the packer box can be found in the https://github.com/p5ntangle/image-builders.git

Suggesting the following changes:
- rename vagrant directory to packer_builds
- create multi-machine vagrant file
- create single site ansible playbook
- investigate idempotency of playbooks
- convert playbooks to roles
