all:
	$(info CHECK MODE ENABLED! Execute 'make commit' to commit changes to hosts)
	@ansible-playbook -i hosts --check playbook.yml

commit:
	@ansible-playbook -i hosts playbook.yml

ping:
	@ansible all -i hosts -m ping
