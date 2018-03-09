resource "null_resource" "start" {
  triggers = {
    depends_id = "${var.depends_id}"
  }
}

data "external" "shell" {
  depends_on = ["null_resource.start"]

  program = ["ruby", "${path.module}/shell.rb"]

  query = {
    command = "${var.command}"
    stdin   = "${var.stdin}"
    envs    = "${jsonencode(var.envs)}"

    #    env_keys   = "${join(",", keys(var.envs))}"
    #    env_values = "${join(",", values(var.envs))}"
    chdir = "${var.chdir}"
  }
}
