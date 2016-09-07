# dvo_docker

docker container to run [tum-vision/dvo](https://github.com/tum-vision/dvo) on [TUM RGB-D SLAM datasets](http://vision.in.tum.de/data/datasets/rgbd-dataset).

## build
```shell
docker build -t dvo_docker:latest .
```

## usage

```shell
docker run -ti -v /path/to/rgbd_dataset_freiburg1_desk:/dataset dvo_docker:latest
```

modify ```/path/to/rgbd_dataset_freiburg1_desk``` to point to the TUM RGB-D SLAM dataset you want to test. this folder has to contain a file ```assoc.txt``` created with ```associate.py rgb.txt depth.txt > assoc.txt```.
the estimated trajectory is stored in ```trajectory.txt``` in the dataset folder.
