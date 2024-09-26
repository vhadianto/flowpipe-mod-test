pipeline "fail_1" {
    step "transform" "one" {
        value = "foo"
    }

    step "transform" "bar" {
        value = step.transform.one.value + 23
    }
    
}