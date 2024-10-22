variable "my_name" {
  type = string
  default = "flowpipe"
}

variable "string_var" {
  type = string
  default = "flowpipe_string"
}

variable "mandatory_tag_keys" {
  type        = list(string)
  description = "A list of mandatory tag keys to check for (case sensitive)."
  default     = ["Environment", "Owner"]
}


variable "var_number" {
  type        = number
  default = 42
}

variable "var_map" {
    type = map(string)
    default = {
        key1 = "value1"
        key2 = "value2"
    }
}

variable "var_map_number" {
    type = map(number)
    default = {
        key1 = 1
        key2 = 2
    }
}
 

 variable "database" {
  type = connection.steampipe
  description = "The database connection to use."
  default = connection.steampipe.default
}

variable "notifier" {
  type = notifier
  description = "The notifier to use."
  default = notifier.default
}


variable "my_conn" {
  type = connection.steampipe
  default = connection.steampipe.default
}