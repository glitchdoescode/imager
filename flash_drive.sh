#/bin/bash

check_yq(){
  if ! command -v yq &> /dev/null; then
    echo "yq not found, install it first."
    exit 1
  fi
}

read_config(){
  config_file="$1"
  if [[ ! -f "$config_file" ]]; then
    echo "Configuration file not found!"
    exit 1
  fi

  image_location=$(yq e '.image_location' "$config_file")
  drive_name=$(yq e '.drive_name' "$config_file")

  if [[ -z "$image_location" || -z "$drive_name" ]]; then
    echo "Invalid configuration file! Ensure both image_location and drive_name are specified."
    exit 1
  fi
}

validate_inputs(){
  if [[ ! -f "$image_location" ]]; then
    echo "Image file not found at $image_location!"
    exit 1
  fi 

  if [[ ! -b "$drive_name" ]]; then
    echo "Drive $drive_name not found!"
    exit 1
  fi 
}

flash_drive(){
  echo "Flashing $drive_name with $image_location..."
  sudo dd if="$image_location" of="$drive_name" bs=4M status=progress conv=fsync

  if [[ $? -eq 0 ]]; then
    echo "Flashing completed successfully!"
  else 
    echo "An error occurred while flashing the drive."
    exit 1
  fi
}

main(){
  check_yq
  read_config "config.yml"
  validate_inputs
  flash_drive
}

main
