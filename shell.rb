require "json"
require "open3"
params = JSON.parse(STDIN.read)


env_keys = params["env_keys"].split(",")
env_values = params["env_values"].split(",")
envs = {}
env_keys.each_with_index do |key, i|
  envs[key] = env_values.at(i)
end

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
