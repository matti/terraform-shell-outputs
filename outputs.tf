output "id" {
  value = "${data.external.shell.id}"
}

output "exit_status" {
  value = "${data.external.shell.result["exit_status"]}"
}

output "pid" {
  value = "${data.external.shell.result["pid"]}"
}

output "stdout" {
  value = "${data.external.shell.result["stdout"]}"
}

output "stderr" {
  value = "${data.external.shell.result["stderr"]}"
}
