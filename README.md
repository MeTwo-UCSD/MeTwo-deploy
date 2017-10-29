## build external library for metwo

### Use method

#### 1. local install
1. This method assumes a aarch64-linux-gnu-gcc install.
    * You can download such toolchain at [linaro website][http://www.linaro.org/downloads/].
    * I suggeset you put the toolchain in `\usr\local`ecause \usr\local\bin
2. Then run `deploy/build.sh` and build the libraries
3. The result will be under deploy/build/output

#### 2. docker install
Not fully implemented

### useful docker command
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)