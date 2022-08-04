project_id ?= gcp-project
region ?= europe-west2
dataset ?= pipeline-dataset
bucket ?= pipeline-bucket-${project_id}
dist-folder ?= dist-pipeline

install-reqs:
    pip3 install -r requirements.txt

install-package:
    pip3 install -e .

install-precommit:
    pre-commit install

init:
    install-reqs
    install-package
    install-precommit

setup-gcp:
    @echo "Project = ${project_id}"
    @gsutil mb -c standard -l ${region} -p ${project_id} gs://${bucket}
    @bq mk --location=${region} -d --project_id=${project_id} --quiet ${dataset}

build-gcp:
    @echo "packaging code for gcp"
    @mkdir -p ./${dist-folder}
