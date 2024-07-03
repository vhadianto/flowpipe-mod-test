pipeline "simple" {
    step "transform" "echo" {
        value = "Hello World ${var.my_name}"

        output "echo_1" {
            value = "echo 1"
        }

        output "echo_2" {
            value = "echo 2"
        }
    }

    output "val" {
        value = step.transform.echo.value
    }
}
