all: nodes zones

requirements:
	@ansible-galaxy install -r requirements.yml -f

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

# Tools
password:
	sudo pip install passlib
	python -c "from passlib.hash import sha512_crypt; import getpass; print sha512_crypt.using(rounds=5000).hash(getpass.getpass())"