#!/usr/bin/env bats

setup() {
  export bin_path=$(readlink -e "$BATS_TEST_DIRNAME/../bin")
  export cmd="list-all"
}

main() {
  local param=${1:-""}

  bash "$bin_path/$cmd" "$param"
}

@test 'success if called without params' {
  run main
  [ "$status" -eq 0 ]

  # check versions
  echo "$output"
  [[ "$output" =~ "0.1.0" ]]
  [[ "$output" =~ "0.2.0" ]]

  # check that versions are on same line
  [[ "$output" =~ "0.1.0 0.2.0" ]]
}

@test 'success if called with param' {
  run main "v1"
  [ "$status" -eq 0 ]
}
