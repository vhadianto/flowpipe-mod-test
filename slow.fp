pipeline "slow" {
    title = "Slow"
    
    step "sleep" "sleep" {
        duration = "1s"

        loop {
            until = loop.index > 10
        }
    }

    output "val" {
        value = step.sleep.sleep
    }
}

