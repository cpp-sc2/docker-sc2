# docker-sc2
Dockerized StarCraft 2 Linux application.

## Usage
1. Pull the latest image:
```bash
$ docker pull alkurbatov/sc2
```

2. Run the image:
```
$ docker run -p 8167:8167 alkurbatov/sc2
```

3. Connect to the game.  
Example code for the C++ API can be found [here](https://github.com/cpp-sc2/scrubber).

## License
Copyright (c) 2021-2022 Alexander Kurbatov

Licensed under the [MIT license](LICENSE).
