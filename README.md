# openstack_identity

This repo contains the necessary ansible roles to create a Openstack
deployment configured with a Shibboleth-IDP and SP that authenticates
to a OpenLDAP Server

The builds here are currently based on private vagrant boxes built by 
packer, the code to build the boxes be found in the following repo
https://github.com/p5ntangle/image-builders.git

Usage
-----

Simply run **vagrant up**

ToDo
----

Tasks to complete
- investigate idempotency of playbooks
- verify the that the nodes folder can be removed
- complete configuration and shibboleth, ldap, and devstack
- Create tests

Completed tasks
- moved vagrant box build to seperate repo
- 
