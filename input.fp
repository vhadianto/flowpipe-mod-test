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


pipeline "parent_with_no_input_step" {

    step "pipeline" "nested" {
        pipeline = pipeline.input_step_child_with_no_sleep
    }

    step "pipeline" "nested_two" {
        pipeline = pipeline.input_step_child_with_no_sleep
    }

    output "val" {
        value = step.pipeline.nested.output.val
    }

    output "val_two" {
        value = step.pipeline.nested_two.output.val
    }    
}

pipeline "input_step_child_with_no_sleep" {

    step "input" "my_step" {
        type   = "button"
        prompt = "input_step_child_with_no_sleep: Do you want to approve?"

        option "Approve" {}
        option "Deny" {}

        notifier = notifier.default
    }

    output "val" {
        value = step.input.my_step.value
    }
}