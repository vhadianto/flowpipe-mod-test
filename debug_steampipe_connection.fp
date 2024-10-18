pipeline "debug_steampipe_connection" {

    step "transform" "echo" {
        value = connection.steampipe.default
    }

    output "val" {
        value = step.transform.echo
    }

    output "conn" {
        value = connection.steampipe.default
    }
}