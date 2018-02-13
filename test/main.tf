module "shell" {
  source = ".."

  command = "ls -la"
}

output "values" {
  value = {
    stdout = "${module.shell.stdout}"
    stderr = "${module.shell.stderr}"
    code   = "${module.shell.code}"
  }
}
