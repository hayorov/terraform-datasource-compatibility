# Terraform 0.11.5 and 1.0.x remote data source compatibility check

## Procedure

- Terraform 1.0.x creates a local state with different output structures
- Terraform 0.11.5 read the remote (local file) data source

[All terraform types](https://www.terraform.io/docs/language/expressions/types.html)

| TF1.0.x type                    | TF0.11.5 read reaction | Memo              |
| ------------------------------- | ---------------------- | ----------------- |
| string                          | +                      |                   |
| list of strings                 | +                      |                   |
| map of strings                  | +                      |                   |
| bool                            | +                      |                   |
| list of numbers                 | -                      | terraform crashes |
| object (map of maps of strings) | -                      | terraform crashes |

### List of number

```json
    "example_list_of_numbers": {
      "value": [
        1,
        2,
        3
      ],
      "type": [
        "tuple",
        [
          "number",
          "number",
          "number"
        ]
      ]
    }
```

### Object

```json
    "example_list_of_numbers": {
      "value": [
        1,
        2,
        3
      ],
      "type": [
        "tuple",
        [
          "number",
          "number",
          "number"
        ]
      ]
    }
```

## Conclusion

- Terraform 0.11.5 read simple data types (string, number, bool) as well as a list of strings and a map of strings.
- Terraform crashes during state read if any (one or more) object type is present in the state or list of number/bool/etc combinations are present

## Examples

- Tf 1.0.x outputs

```sh
 ❯ terraform output
# 1.0.6
example_bool = false
example_list_of_string = [
  "8beVDTGs6lVaX2Pq",
]
example_map_of_strings = {
  "8beVDTGs6lVaX2Pq" = "8beVDTGs6lVaX2Pq"
}
example_number = 1234
example_string = "8beVDTGs6lVaX2Pq"
```

- Tf 0.11.5 outputs (read from datasource)

```sh
# 0.11.5
 ❯ terraform output
read_example_bool = false
read_example_list_of_strings = [
    8beVDTGs6lVaX2Pq
]
read_example_map_of_strings = {
  8beVDTGs6lVaX2Pq = 8beVDTGs6lVaX2Pq
}
read_example_number = 1234
read_example_string = 8beVDTGs6lVaX2Pq
```
