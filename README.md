y# docker-heif-convert
Docker image to execute heif-convert([libheif](https://github.com/strukturag/libheif))

## build

```
make build
```

or

```
docker build -t docker-heif-convert .
```

## run

```
docker run --entrypoint '' --rm -it -v $(pwd):/home/node/work -w /home/node/work docker-heif-convert bash
docker run --rm -it -v $(pwd):/home/node/work -w /home/node/work wurly/docker-heif-convert input.heic output.jpg
```

or

```
docker run --entrypoint '' --rm -it -v $(pwd):/home/node/work -w /home/node/work wurly/docker-heif-convert bash
docker run --rm -it -v $(pwd):/home/node/work -w /home/node/work wurly/docker-heif-convert input.heic output.jpg
```

check

```
heif-convert --version
heif-convert --list-decoders
```
