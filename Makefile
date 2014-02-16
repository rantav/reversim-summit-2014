run:
	meteor run --settings settings.json

deploy:
	bash deploy.sh

deploy-no-tag:
	meteor deploy summit2014.reversim.com  --settings settings.json

setup:
	bash setup.sh
