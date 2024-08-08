pipeline "simple_with_param" {

    param "notifier" {
        default = "default"
    }

    param "name" {
        default = "kenny"
    }    


    step "transform" "echo" {
        value = "Hello World: ${param.notifier} & ${param.name}"

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
