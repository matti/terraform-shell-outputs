require "json"
require "open3"
params = JSON.parse(STDIN.read)

envs = JSON.parse(params["envs"])

spawn_opts = {
  stdin_data: params["stdin"]
}
spawn_opts[:chdir] = params["chdir"] unless params["chdir"] == ""

stdout, stderr, status = Open3.capture3 envs, params["command"], spawn_opts
stdout.chomp!
stderr.chomp!

result = {
  stdin: params["stdin"],
  stdout: stdout,
  stderr: stderr,
  pid: status.pid.to_s,
  exit_status: status.exitstatus.to_s
}

puts result.to_json
