requirements:
	@ansible-galaxy install -r requirements.yml -f

# Tools
password:
	sudo pip install passlib
	python -c "from passlib.hash import sha512_crypt; import getpass; print sha512_crypt.using(rounds=5000).hash(getpass.getpass())"