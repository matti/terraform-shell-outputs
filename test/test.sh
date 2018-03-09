#!/usr/bin/env bash
set -e

[ -e assert.sh ] || wget https://raw.github.com/lehmannro/assert.sh/v1.1/assert.sh
. assert.sh

terraform init
terraform destroy -force
terraform apply -auto-approve

assert "terraform output -json | jq -r '.values_chdir.value.stdout'" "/private/tmp"
assert "terraform output -json | jq -r '.values_depends.value.stdout'" "test"
assert "terraform output -json | jq -r '.values_envs.value.stdout'" "TERRAFORM_SHELL_ENV1=1
TERRAFORM_SHELL_ENV2=string"
assert "terraform output -json | jq -r '.values_status.value.exit_status'" "5"
assert "terraform output -json | jq -r '.values_stderr.value.stderr'" "hello stderr"
assert "terraform output -json | jq -r '.values_stdin.value.stdout'" "hello stdin"
assert "terraform output -json | jq -r '.values_stdout.value.stdout'" "hello stdout"

assert_end examples
