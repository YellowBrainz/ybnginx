NAME=nginx
DNAME=ybnginx
PORT=8080
DPORT=80
VERSION=latest
FULLDOCKERNAME=$(NAME):$(VERSION)

build:
	docker build -t ybnginx --build-arg STATIC_WEB=$(STATIC_WEB) .

nginx:
	docker run -d --name $(DNAME) -v $(STATIC_WEB):/usr/share/nginx/html:ro -p $(PORT):$(DPORT) $(NAME):$(VERSION)

stop:
	docker stop $(DNAME)

start:
	docker start $(DNAME)

clean:
	docker rm $(DNAME)