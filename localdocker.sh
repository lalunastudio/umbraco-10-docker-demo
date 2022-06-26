docker build --no-cache --progress=plain -t umbraco10test_docker --build-arg PROJECT=Umbraco10Test2 .
docker run --rm -d -p 80:80 -p 443:443 --name umbraco10 umbraco10test_docker