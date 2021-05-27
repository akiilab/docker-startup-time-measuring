# Docker Startup Time Measuring

## Install Docker

- [Install Using the Convenience Script](https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script)
- [Manage Docker as a non-root user](https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user)

```shell
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh test-docker.sh

sudo usermod -aG docker $USER
newgrp docker
```

## Usage

```shell
./run.sh 2     # execute 2 times
```

Output

```shell
# Diff(ns)
1296137049
1338686532
```

## Measuring

```shell
sudo apt update
sudo apt install -y gawk datamash
```

```shell
./run.sh 100 | datamash --header-out mean 1 median 1 perc:90 1 perc:95 1 perc:99 1
```

Output

```shell
mean(field-1)	median(field-1)	perc:90(field-1)	perc:95(field-1)	perc:99(field-1)
2241857103.36	1935321856	2960865100.8	2999558656	3046800279.04
```
