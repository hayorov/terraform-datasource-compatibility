terraform {
  required_version = "~>0.11"
}

data "terraform_remote_state" "tf_1_0" {
  backend = "local"

  config = {
    path = "../tf1.0/terraform_1_0.tfstate"
  }
}

output "read_example_string" {
  value = "${data.terraform_remote_state.tf_1_0.example_string}"
}

output "read_example_list_of_strings" {
  value = "${data.terraform_remote_state.tf_1_0.example_list_of_string}"
}

output "read_example_map_of_strings" {
  value = "${data.terraform_remote_state.tf_1_0.example_map_of_strings}"
}

output "read_example_number" {
  value = "${data.terraform_remote_state.tf_1_0.example_number}"
}

output "read_example_bool" {
  value = "${data.terraform_remote_state.tf_1_0.example_bool}"
}