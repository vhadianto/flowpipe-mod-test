pipeline "simple_with_param" {

    title = "Simple with Param"
    
    param "notifier" {
        default = "default"
    }

    param "name" {
        default = "kenny"
    }

    param "list_of_names" {
        default = ["kenny", "kyle", "stan", "cartman"]
    }

    param "map_of_names" {
        default = {
            kenny = "kenny"
            kyle = "kyle"
            stan = "stan"
            cartman = "cartman"
        }
    }

    param "map_of_complex_stuff" {
        default = {
            kenny = {
                name = "kenny"
                age = 10
            }
            kyle = {
                name = "kyle"
                age = 10
            }
            stan = {
                name = "stan"
                age = 10
            }
            cartman = {
                name = "cartman"
                age = 10
            }
            simple = "simple text"
        }
    }

    step "transform" "echo" {
        value = "Hello World: ${param.notifier} & ${param.name}"

        output "echo_2" {
            value = "echo 2"
        }
    }

    step "transform" "echo_2" {
        value = param.list_of_names
    }

    step "transform" "echo_3" {
        depends_on = [step.transform.echo, step.transform.echo_2]
        value = param.map_of_names
    }

    step "transform" "echo_4" {
        depends_on = [step.transform.echo, step.transform.echo_2]
        value = param.map_of_complex_stuff
    }

    output "val" {
        value = step.transform.echo.value
    }

    output "val_2" {
        value = step.transform.echo_2.value
    }

    output "val_3" {
        value = step.transform.echo_3.value
    }

    output "val_4" {
        value = step.transform.echo_4.value
    }
}
