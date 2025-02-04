#!/usr/bin/env bash

# Copyright 2022 The Tekton Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This script runs the presubmit tests; it is started by prow for each PR.
# For convenience, it can also be executed manually.
# Running the script without parameters, or with the --all-tests
# flag, causes all tests to be executed, in the right order.
# Use the flags --build-tests, --unit-tests and --integration-tests
# to run a specific set of tests.

export TEST_FOLDER=$(pwd)

source $(dirname $0)/../../../vendor/github.com/tektoncd/plumbing/scripts/presubmit-tests.sh

function pre_build_tests() {
    pushd ${TEST_FOLDER}
}

function pre_unit_tests() {
    pushd ${TEST_FOLDER}
}

function pre_integration_tests() {
    pushd ${TEST_FOLDER}
}

function post_build_tests() {
    popd
}

function post_unit_tests() {
    popd
}

function post_integration_tests() {
    popd
}

# June 28th 2019: work around https://github.com/tektoncd/plumbing/issues/44
function unit_tests() {
  local failed=0
  echo "Using overridden unit_tests"
  go test -v -race ./... || failed=1
  echo "unit_tests returning $@"
  return ${failed}
}

# We use the default build, unit and integration test runners.
main $@
