locals {
  query = <<-EOQ
select
  name,
  arn,
  region,
  account_id
from
  aws_s3_bucket
where
  tags is null;
  EOQ
}

pipeline "query_steampipe"{

    step "query" "s3" {
        database = connection.steampipe.default
        sql = "select * from aws_s3_bucket"
    }

    output "s3" {
        value = step.query.s3
    }
}

trigger "query" "s3_buckets" {
  title = "Simple"

  enabled  = true
  database = var.database
  sql = local.query

  capture "insert" {
    pipeline = pipeline.send_list
    args = {
      items = self.inserted_rows
    }
  }
}


pipeline "send_list" {
     param "items" {
    type = list(object({
      name        = string
      arn         = string
      region      = string
      account_id  = string
    }))
  }

  step "transform" "echo" {
    value = param.items
  }

  output "val" {
    value = step.transform.echo
  }
}