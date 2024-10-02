pipeline "fail_1" {
    title = "Fail 1"
    step "transform" "one" {
        value = "foo"
    }

    step "transform" "bar" {
        value = step.transform.one.value + 23
    }
    
}