# docker-openjdk-dojo
This is a fork of [Dojo](https://github.com/kudulab/dojo) docker image with Java build tools. 
Repurposed for the NHSD needs to use LTS version of Java. 

This docker image is based on `openjdk:21-jdk-buster`.
Images are published to dockerhub as `nhsdev/openjdk-dojo`.

## Specification
This image has installed:
 * OpenJDK Version 21
 * OpenJDK Runtime Environment
 * Gradle 8.5
 * Apache Maven 3.9.6

## Usage
1. Install [Dojo](https://github.com/kudulab/dojo)
On OSX, you can install with homebrew:

```
brew install kudulab/homebrew-dojo-osx/dojo
```

A manual install is another option:

```sh
version="0.9.0"
# on Linux:
wget -O /tmp/dojo https://github.com/kudulab/dojo/releases/download/${version}/dojo_linux_amd64
# or on Darwin:
# wget -O /tmp/dojo https://github.com/kudulab/dojo/releases/download/${version}/dojo_darwin_amd64
chmod +x /tmp/dojo
mv /tmp/dojo /usr/bin/dojo
```

2. Provide a Dojofile:

```
DOJO_DOCKER_IMAGE="nhsdev/openjdk-dojo:<commit>"
```

3. Create and enter the container by running dojo at the root of project.
   
Run, example commands:

```bash
dojo java -version
dojo gradle --version
dojo mvn --version
```

By default, current directory in docker container is `/dojo/work`.

For a real-world usage see these projects:
 * [gocd-yaml-config-plugin](https://github.com/tomzo/gocd-yaml-config-plugin)
 * [gocd-json-config-plugin](https://github.com/tomzo/gocd-json-config-plugin)

### Configuration

These files are used inside the docker image:

1. `~/.ssh/` -- is copied from host to the dojo's home `~/.ssh`
1. `~/.ssh/config` -- will be generated on docker container start. SSH client is configured to ignore known ssh hosts.
2. `~/.gitconfig` -- if exists locally, will be copied
3. `~/.profile` -- will be generated on docker container start, in
  order to ensure the current directory is `/dojo/work`.

## License

Copyright 2020 Ewa Czechowska, Tomasz Sętkowski

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
