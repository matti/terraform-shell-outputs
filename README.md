# no longer maintained

- https://github.com/Invicton-Labs/terraform-external-shell-data
- https://registry.terraform.io/modules/Invicton-Labs/shell-data/external/latest

and

- https://github.com/Invicton-Labs/terraform-external-shell-resource
- https://registry.terraform.io/modules/Invicton-Labs/shell-resource/external/latest


# - 
# - 
# - 
# -

# terraform-shell-outputs

Runs a command with optional environment variables, stdin and chdir. Outputs stdout, stderr, exit status and the pid. Requires ruby. This is run in every apply, see a `null_resource` version (without all these features) at https://github.com/matti/terraform-shell-resource

## Usage
See [test/main](test/main.tf}

```
module "mycmd" {
  source = "matti/outputs/shell"

  command = "read input; echo $input"
  stdin   = "hello stdin"
  env     = {
    SOME  = "value"
    OTHER = 123
  }
  chdir   = "/tmp"
}

output "mycmd" {
  value = {
    stdout      = "${module.mycmd.stdout}"
    stderr      = "${module.mycmd.stderr}"
    exit_status = "${module.mycmd.exit_status}"
    pid         = "${module.mycmd.pid}"
  }
}
```
