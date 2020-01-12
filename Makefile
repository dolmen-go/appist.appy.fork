bootstrap:
	asdf plugin-add golang || true
	asdf plugin-add nodejs || true
	asdf plugin-update --all
	asdf install
	asdf reshim golang
	asdf reshim nodejs

codecheck:
	go vet ./...
	golint -set_exit_status ./...

down:
	docker-compose -p appy -f .docker/docker-compose.yml down --remove-orphans

install:
	go get -u golang.org/x/lint/golint
	go mod tidy

restart:
	docker-compose -p appy -f .docker/docker-compose.yml restart

test:
	mkdir -p tmp
	go test -covermode=atomic -coverprofile=tmp/coverage.out -tags=test -race -failfast ./...

testcov:
	go tool cover -html=tmp/coverage.out

up:
	docker-compose -p appy -f .docker/docker-compose.yml up -d

.PHONY: bootstrap codecheck down install restart test testcov up
