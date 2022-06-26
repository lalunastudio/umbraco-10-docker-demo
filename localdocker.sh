docker build --no-cache --progress=plain -t umbraco10test_docker --build-arg PROJECT=Umbraco10Test2 .
docker run --rm -d -p 4000:4000 --name umbraco10 umbraco10test_docker