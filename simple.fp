pipeline "simple" {
    step "transform" "echo" {
        value = "Hello World"

        output "echo_1" {
            value = "echo 1"
        }

        output "echo_2" {
            value = "echo 2"
        }
    }

    step "transform" "echo3" {
        value = "Hello World 3"
    }    

    output "val" {
        value = step.transform.echo.value
    }
}

