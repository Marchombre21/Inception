## Prerequisites

Hello, fellow developer!

If you want to run my application you have to do some things before:

- Install make command, docker and docker compose plugin

    ```BASH
    # Add Docker\'s official GPG key:

    sudo apt update

    sudo apt install ca-certificates curl

    sudo install -m 0755 -d /etc/apt/keyrings

    sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc

    sudo chmod a+r /etc/apt/keyrings/docker.asc
    ```

    ```BASH
    # Add the repository to Apt sources:

    sudo tee /etc/apt/sources.list.d/docker.sources <<EOF

    Types: deb

    URIs: https://download.docker.com/linux/debian

    Suites: $(. /etc/os-release && echo "$VERSION_CODENAME")

    Components: stable

    Architectures: $(dpkg --print-architecture)

    Signed-By: /etc/apt/keyrings/docker.asc

    EOF
    ```

    ```BASH
    sudo apt update
    sudo apt install make docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    ```

- Modify the hosts file of your host system to add your host IP adress connected to your chosen DNS. 

```BASH

```