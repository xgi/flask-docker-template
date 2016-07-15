help:
	@echo "build - Build container"
	@echo "run - Run container"

build:
	docker build -t "proj" .

run: build
	docker run -P -t -i "proj"
