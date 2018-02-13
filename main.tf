data "external" "shell" {
  program = ["ruby", "${path.module}/shell.rb"]

  query = {
    command = "${var.command}"
  }
}
