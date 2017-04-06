.SILENT :
.PHONY : docker-oauth2_proxy

docker-oauth2_proxy:
	docker build -t tokyohomesoc/docker-oauth2_proxy:test .
	docker images
    docker history tokyohomesoc/docker-oauth2_proxy:test