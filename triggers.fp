trigger "schedule" "my_hourly_trigger" {

    title = "Hourly Trigger - echo pipeline"
    schedule = "hourly"

    pipeline = pipeline.echo
}

trigger "schedule" "my_daily_trigger" {
    title = "Daily Trigger - echo pipeline"

    schedule = "daily"

    pipeline = pipeline.echo
}

pipeline "echo" {
    title = "Echo"
    
    step "transform" "echo" {
        value = "Hello World"
    }
}

trigger "query" "steampipe_query" {
    title = "Steampipe Query Trigger"

    schedule = "hourly"

    database = connection.steampipe.default

    param "sql" {
        type = string
        default = "select * from aws_s3_bucket"
    }

    sql = param.sql

    param "primary_key" {
        type = string
        default = "arn"
    }
    
    primary_key = param.primary_key
    

    capture "insert" {
        pipeline = pipeline.query_trigger_display
        args = {
            inserted_rows = self.inserted_rows
        }
    }

    capture "update" {
        pipeline = pipeline.query_trigger_display
        args = {
            updated_rows = self.updated_rows
        }
    }

    capture "delete" {
        pipeline = pipeline.query_trigger_display
        args = {
            deleted_rows = self.deleted_rows
        }
    }
}

trigger "query" "steampipe_query_in_param" {
    schedule = "hourly"

    param "db" {
        type = connection.steampipe
        default = connection.steampipe.default
    }
    
    database = param.db

    param "sql" {
        type = string
        default = "select * from aws_s3_bucket"
    }

    sql = param.sql

    param "primary_key" {
        type = string
        default = "arn"
    }
    
    primary_key = param.primary_key
    

    capture "insert" {
        pipeline = pipeline.query_trigger_display
        args = {
            inserted_rows = self.inserted_rows
        }
    }

    capture "update" {
        pipeline = pipeline.query_trigger_display
        args = {
            updated_rows = self.updated_rows
        }
    }

    capture "delete" {
        pipeline = pipeline.query_trigger_display
        args = {
            deleted_rows = self.deleted_rows
        }
    }
}