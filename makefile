build:
	@docker-compose -p jenkins build 
run:
	@docker-compose -p jenkins up -d nginx data master slave1 slave2
stop:
	@docker-compose -p jenkins stop
clean:	stop
	@docker-compose  -p jenkins rm -f  master nginx
clean-data: clean
	@docker-compose -p jenkins rm -v data
clean-images:
	@docker rmi `docker images -q -f "dangling=true"`

