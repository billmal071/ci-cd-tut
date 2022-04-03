start: index.js package.json
	node index.js

build: Dockerfile docker-compose.yml .dockerignore
	docker-compose up -d --build

run: Dockerfile docker-compose.yml .dockerignore
	docker-compose up -d

destroy:
	docker-compose down

push: Dockerfile docker-compose.yml .dockerignore
	read -p "Enter the name of the image to push: " DOCKER_IMAGE_NAME
	echo "Pushing image ${DOCKER_IMAGE_NAME}"
	docker push ${DOCKER_IMAGE_NAME}

init:
	terraform init

plan:
	terraform plan \
  -var "do_token=${DO_PAT}" \
  -var "pvt_key=${HOME}/.ssh/id_rsa"

apply:
	terraform apply \
  -var "do_token=${DO_PAT}" \
  -var "pvt_key=${HOME}/.ssh/id_rsa"

refresh: 
	terraform refresh \
  -var "do_token=${DO_PAT}" \
  -var "pvt_key=${HOME}/.ssh/id_rsa"

show:
	terraform show terraform.tfstate