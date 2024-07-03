pipeline "simple_with_param" {

    param "notifier" {
        default = "default"
    }


    step "transform" "echo" {
        value = "Hello World: ${param.notifier}"

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
