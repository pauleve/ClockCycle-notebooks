IMAGE=pauleve/clockcycle
TAG=v1
build:
	docker build -t $(IMAGE):$(TAG) .
push:
	docker push $(IMAGE):$(TAG)
update:
	colomoto-docker --image $(IMAGE) -V $(TAG) -e COLOMOTO_SKIP_JUPYTER_JS=1 --bind . jupyter nbconvert --execute --ExecutePreprocessor.timeout=3600 --inplace *.ipynb
run:
	colomoto-docker --image $(IMAGE) -V $(TAG)
inrun:
	colomoto-docker --image $(IMAGE) -V $(TAG) --bind .
