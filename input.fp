trigger "schedule" "my_step" {
    enabled = false
    schedule = "daily"
    pipeline = pipeline.my_step
}

pipeline "my_step" {

    step "input" "my_step" {
        type   = "button"
        prompt = "Do you want to approve?"

        option "Approve" {}
        option "Deny" {}

        notifier = notifier.default
    }

    step "transform" "do_the_thing" {
        depends_on = [step.input.my_step]
        value = step.input.my_step.value
    }

    output "val" {
        value = step.transform.do_the_thing
    }
}
