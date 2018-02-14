data "external" "shell" {
  program = ["ruby", "${path.module}/shell.rb"]

  query = {
    command    = "${var.command}"
    stdin      = "${var.stdin}"
    env_keys   = "${join(",", keys(var.envs))}"
    env_values = "${join(",", values(var.envs))}"
    chdir      = "${var.chdir}"
  }
}
