module "shell_stderr" {
  source = ".."

  command = "echo hello stderr >&2"
}

module "shell_status" {
  source = ".."

  command = "exit 5"
}

module "shell_stdout" {
  source = ".."

  command = "echo hello stdout"
}

module "shell_stdin" {
  source = ".."

  command = "read input; echo $input"
  stdin   = "hello stdin"
}

module "shell_envs" {
  source = ".."

  command = "env | grep TERRAFORM_SHELL_ENV"

  envs = {
    TERRAFORM_SHELL_ENV1 = 1
    TERRAFORM_SHELL_ENV2 = "string"
  }
}

module "shell_chdir" {
  source = ".."

  command = "pwd"
  chdir   = "/tmp"
}

output "values_stderr" {
  value = {
    stdout      = "${module.shell_stderr.stdout}"
    stderr      = "${module.shell_stderr.stderr}"
    exit_status = "${module.shell_stderr.exit_status}"
    pid         = "${module.shell_stderr.pid}"
  }
}

output "values_status" {
  value = {
    exit_status = "${module.shell_status.exit_status}"
  }
}

output "values_stdout" {
  value = {
    stdout      = "${module.shell_stdout.stdout}"
    stderr      = "${module.shell_stdout.stderr}"
    exit_status = "${module.shell_stdout.exit_status}"
    pid         = "${module.shell_stdout.pid}"
  }
}

output "values_stdin" {
  value = {
    stdout      = "${module.shell_stdin.stdout}"
    stderr      = "${module.shell_stdin.stderr}"
    exit_status = "${module.shell_stdin.exit_status}"
    pid         = "${module.shell_stdin.pid}"
  }
}

output "values_envs" {
  value = {
    stdout      = "${module.shell_envs.stdout}"
    stderr      = "${module.shell_envs.stderr}"
    exit_status = "${module.shell_envs.exit_status}"
    pid         = "${module.shell_envs.pid}"
  }
}

output "values_chdir" {
  value = {
    stdout = "${module.shell_chdir.stdout}"
  }
}
