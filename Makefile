all: nodes zones

commit: nodes_commit zones_commit

ping:
	@ansible all -i inventory -m ping

nodes:
	@ansible-playbook -i inventory --check playbook.nodes.yml

nodes_commit:
	@ansible-playbook -i inventory playbook.nodes.yml

zones:
	@ansible-playbook -i inventory --check playbook.zones.yml

zones_commit:
	@ansible-playbook -i inventory playbook.zones.yml
