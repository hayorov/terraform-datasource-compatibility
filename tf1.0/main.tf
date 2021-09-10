terraform {
  required_version = "~>1.0"
  backend "local" {
    path = "terraform_1_0.tfstate"
  }
}

resource "random_string" "random" {
  length           = 16
  special          = true
  override_special = "/@£$"
}

output "example_string" {
  value = random_string.random.id
}

output "example_list_of_string" {
  value = [random_string.random.id]
}

output "example_map_of_strings" {
  value = { "${random_string.random.id}" : random_string.random.id }
}

output "example_bool" {
  value = false
}

output "example_number" {
  value = 1234
}

output "example_null" {
  value = null
}

// produces terraform 0.11.5 crash 
// output "example_list_of_numbers" {
//   value = [1, 2, 3]
// }

// produces terraform 0.11.5 crash 
// output "example_map_of_map_strings" {
//   value = {
//     test = {
//       test = 1
//     }
//   }
// }