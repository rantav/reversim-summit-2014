run:
	mrt run --settings settings.local.json

deploy:
	bash deploy.sh

deploy-no-tag:
	mrt deploy summit2014.reversim.com  --settings settings.prod.json

setup:
	bash setup.sh
