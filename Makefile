.PHONY = generate

DOCKERFILE_PATH = ./docker/Dockerfile.proto-builder
DOCKER_IMAGE = proto-builder
VOLUME_MOUNT = -v $(PWD):/build
WORKDIR = -w /build

generate: build lint #breaking
		docker run --rm $(VOLUME_MOUNT) $(WORKDIR) $(DOCKER_IMAGE) generate

build:
		docker build -f $(DOCKERFILE_PATH) -t $(DOCKER_IMAGE) . 

lint: 
		docker run --rm $(VOLUME_MOUNT) $(WORKDIR) $(DOCKER_IMAGE) lint

# Should work after first commit
# breaking: 
# 		docker run --rm $(VOLUME_MOUNT) $(WORKDIR) $(DOCKER_IMAGE) breaking --against ".git#subdir=api"

all: generate
