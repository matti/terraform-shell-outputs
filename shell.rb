require "json"
args = JSON.parse(STDIN.read)

output = `#{args["command"]}`.chomp
status = $?.exitstatus

result = {
  stdout: output,
  stderr: "",
  code: status.to_s
}

puts result.to_json