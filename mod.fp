mod "flowpipe_mod_test" {

    require {
        mod "github.com/vhadianto/flowpipe-mod-fire" {
            version = "*"
        }
    }

    title = "Flowpipe Mod Test"

    description = "Flowpipe mod for testing purposes."

    categories = [
        "Flowpipe"
    ]
}

param "bad_mod" {
    type = string
    default = "github.com/vhadianto/flowpipe-mod-fire"
}
