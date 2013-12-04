run:
	mrt run --settings settings.json

deploy:
	bash deploy.sh

deploy-no-tag:
	mrt deploy summit2014.reversim.com  --settings settings.json

setup:
	bash setup.sh
