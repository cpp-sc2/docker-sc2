# docker-sc2

[![Build Status](https://github.com/cpp-sc2/docker-sc2/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/cpp-sc2/docker-sc2/actions/workflows/ci.yml)

Dockerized StarCraft 2 Linux application.

## Basic usage
1. Pull the latest image:
   ```bash
   docker pull alkurbatov/sc2
   ```

2. Run the image:
   ```bash
   docker run -p 8167:8167 alkurbatov/sc2
   ```
   Full list of supported command line options described [here](https://github.com/Blizzard/s2client-proto/blob/master/docs/linux.md).

3. Connect to the game.  
Example code for the C++ API can be found [here](https://github.com/cpp-sc2/scrubber).

## Advanced usage
To change the listening port, e.g. to 8888:
```bash
docker run -it --rm -p 8888:8888 sc2 -port 8888
```

To run with enabled software rendering:
```bash
docker run -it --rm -p 8167:8167 sc2 -port 8167 -osmesapath libOSMesa.so
```

To run with enabled hardware rendering:
```bash
docker run -it --rm -p 8167:8167 sc2 -port 8167 -eglpath libEGL.so
```

## License
Copyright (c) 2021-2024 Alexander Kurbatov

Licensed under the [MIT license](LICENSE).
