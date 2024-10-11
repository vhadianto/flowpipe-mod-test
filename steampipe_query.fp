pipeline "query_steampipe"{

    step "query" "s3" {
        database = connection.steampipe.default
        sql = "select * from aws_s3_bucket"
    }

    output "s3" {
        value = step.query.s3
    }
}