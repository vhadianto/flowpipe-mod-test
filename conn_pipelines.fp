pipeline "investigate_connection" {

    param "steampipe_conn" {
        type = connection.steampipe
        default = connection.steampipe.default
    }

    param "steampipe_conn_from_var" {
        type = connection.steampipe
        default = var.my_conn
    }

    param "aws_conn_from_var" {
        type = connection.aws
        default = var.aws_conn
    }

    param "aws_conn_1" {
        type = connection.aws
        default = connection.aws.default
    }

    param "aws_conn_2" {
        type = connection.aws
        default = connection.aws.default
    }

    step "sleep" "sleep" {
        duration = "10m"
    }

    output "steampipe_conn_from_var" {
        value = param.steampipe_conn_from_var
    }

    output "aws_conn_from_var" {
        value = param.aws_conn_from_var
    }
    
    output "steampipe_conn" {
        value = param.steampipe_conn
    }

    output "aws_conn_1" {
        value = param.aws_conn_1
    }

    output "aws_conn_2" {
        value = param.aws_conn_2
    }
}