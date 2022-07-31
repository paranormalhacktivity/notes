# Creating a volume
You can add a volume(s) to the docker file
```
VOLUME vol1 vo2
```

you can then map it by doing the following 
```
docker run --rm -it -v $(pwd):/app $image $command
```
