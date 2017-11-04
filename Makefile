all: hosts zones

foo:
	$(info CHECK MODE ENABLED! Execute 'make commit' to commit changes to hosts)
	@ansible-playbook -i hosts --check playbook.yml

commit:
	@ansible-playbook -i hosts playbook.yml

pinghosts:
	@ansible all -i hosts.inventory -m ping

hosts:
	@ansible-playbook -i hosts.inventory hosts.yml

pingzones:
	@ansible all -i zones.inventory -m ping

zones:
	@ansible-playbook -i zones.inventory zones.yml
