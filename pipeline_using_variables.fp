pipeline "using_vars" {
    param "my_number" {
        type = number
        default = var.var_number
    }

    param "my_list_of_string" {
        type = list(string)
        default = var.var_list_of_string
    }

    param "my_map_of_string" {
        type = map(string)
        default = var.var_map_of_string
    }

    output "my_number" {
        value = param.my_number
    }

    output "my_list_of_string" {
        value = param.my_list_of_string
    }

    output "my_map_of_string" {
        value = param.my_map_of_string
    }
}