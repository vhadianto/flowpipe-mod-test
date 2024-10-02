trigger "schedule" "my_hourly_trigger" {
    schedule = "hourly"

    pipeline = pipeline.echo
}

trigger "schedule" "my_daily_trigger" {
    schedule = "daily"

    pipeline = pipeline.echo
}

pipeline "echo" {
    title = "Echo"
    
    step "transform" "echo" {
        value = "Hello World"
    }
}