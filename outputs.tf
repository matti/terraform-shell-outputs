output "code" {
  value = "${data.external.shell.result["code"]}"
}

output "stdout" {
  value = "${data.external.shell.result["stdout"]}"
}

output "stderr" {
  value = "${data.external.shell.result["stderr"]}"
}
