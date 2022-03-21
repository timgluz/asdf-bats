#!/usr/bin/env bats

setup() {
  export bin_path
  bin_path=$(python -c "import os,sys; print(os.path.realpath(os.path.expanduser(sys.argv[1])))" "$BATS_TEST_DIRNAME/../bin")
  export cmd="download"
  export test_version="v1.2.0"

  export temp_download_path="/tmp/bats_$RANDOM"
  mkdir -p "$temp_download_path"
  echo "Created temporary Download Folder: $temp_download_path"
}

teardown() {
  echo "deleting temporary test folder"
  rm -rf "$temp_download_path"

  unset bin_path
  unset cmd
  unset test_version
  # clean up ASDF vars
  unset ASDF_DOWNLOAD_PATH
  unset ASDF_INSTALL_VERSION
}

@test 'success if installing using cli params' {
  bash "$bin_path/$cmd" "$test_version" "$temp_download_path"
  echo "$output"
  # check if temp download path exists
  [[ -d "$temp_download_path" ]]

  local files
  files=$(ls -A "$temp_download_path")

  # temp download path should include install script
  [[ "$files" =~ "install.sh" ]]
}

@test 'success if ASDF params are set' {
  export ASDF_INSTALL_VERSION="$test_version"
  export ASDF_DOWNLOAD_PATH="$temp_download_path"

  bash "$bin_path/$cmd"
  echo "$output"

  # check if temp download path exists
  [[ -d "$temp_download_path" ]]

  local files
  files=$(ls -A "$temp_download_path")

  # temp download path should include install script
  [[ "$files" =~ "install.sh" ]]

  unset ASDF_DOWNLOAD_PATH
  unset ASDF_INSTALL_VERSION
}

@test 'failure if no version specified' {
  unset ASDF_INSTALL_VERSION

  run bash "$bin_path/$cmd"
  [ "$status" -eq 1 ]
}
