# emulator-play-compile
Compile the Play! PS2 emulator within docker, uses a ubuntu base image

### Build image
``` docker build -t emulator-play-compile .```

### Run
``` docker run -d --rm -v <host path>:/home/emudev emulator-play-compile:latest ```

### Output
Play! will be compiled to <host path>
