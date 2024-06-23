# Imager

`imager` is a simple script for flashing disk images to USB drives.

## Prerequisites

Ensure you have `yq` installed on your system. `yq` is a lightweight and portable command-line YAML processor.

### Installing yq

#### MacOS
Install using Homebrew:
```bash
brew install yq
```

#### Linux
##### Ubuntu and other distributions supporting `snap`:
```bash
snap install yq
```

##### Ubuntu 16.04 or higher from Debian package:
```bash
sudo add-apt-repository ppa:rmescandon/yq
sudo apt update
sudo apt install yq -y
```

##### Other Linux distributions (via wget):
```bash
# Replace VERSION and BINARY with the latest version and appropriate binary for your system
VERSION=v4.2.0
BINARY=yq_linux_amd64
wget https://github.com/mikefarah/yq/releases/download/${VERSION}/${BINARY}.tar.gz -O - | tar xz && mv ${BINARY} /usr/bin/yq
```

#### Windows
Using Chocolatey:
```bash
choco install yq
```

Using Scoop:
```bash
scoop install main/yq
```

Using winget:
```bash
winget install --id MikeFarah.yq
```

#### Docker
Oneshot use:
```bash
docker run --rm -v "${PWD}":/workdir mikefarah/yq yq [flags] <command> FILE...
```

Run commands interactively:
```bash
docker run --rm -it -v "${PWD}":/workdir mikefarah/yq sh
```

#### GitHub Actions
```yaml
- name: Set foobar to cool
  uses: mikefarah/yq@master
  with:
    cmd: yq -i '.foo.bar = "cool"' 'config.yml'
```

For more installation options, including Arch Linux, Nix, Webi, MacPorts, and Alpine Linux, refer to the official [yq installation documentation](https://github.com/mikefarah/yq#install).

## Usage

1. Clone the `imager` repository:
    ```bash
    git clone https://github.com/yourusername/imager.git
    cd img_flasher
    ```

2. Create a `config.yaml` file in the same directory with the following structure:
    ```yaml
    image_location: /path/to/your/image.img
    drive_name: /dev/sdX
    ```

    Replace `/path/to/your/image.img` with the path to your image file and `/dev/sdX` with your target drive.

3. Make the `flash_drive.sh` script executable:
    ```bash
    chmod +x flash_drive.sh
    ```

4. Run the script with sudo:
    ```bash
    sudo ./flash_drive.sh
    ```

## Example `config.yaml`
```yaml
image_location: /home/user/downloads/myimage.img
drive_name: /dev/sdb
```

## Troubleshooting

- Ensure that `yq` is correctly installed and accessible in your PATH.
- Double-check the paths in your `config.yaml` file to make sure they are correct.
- Run the script with `sudo` to ensure you have the necessary permissions.

For more information on using `yq`, refer to the [yq documentation](https://mikefarah.gitbook.io/yq/).
```
