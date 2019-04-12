ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
TAG=mozilla/taskboot
VERSION=$(shell cat $(ROOT_DIR)/VERSION)

build:
	img build -t $(TAG):latest -t $(TAG):$(VERSION) $(ROOT_DIR)

publish:
	# Using a test repo for now
	img tag $(TAG):latest babadie/taskboot:latest
	img push babadie/taskboot:latest
