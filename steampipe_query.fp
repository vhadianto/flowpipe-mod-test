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


trigger "query" "with_delay" {
  title = "With Delay"

  enabled  = true
  database = connection.steampipe.default
  sql      = local.query

  capture "insert" {
    pipeline = pipeline.get_input
    args = {
      items = self.inserted_rows
    }
  }
}


trigger "query" "with_delay_and_sleep" {
  title = "With Delay and Sleep"

  enabled  = true
  database = connection.steampipe.default
  sql      = local.query

  capture "insert" {
    pipeline = pipeline.get_input_with_sleep
    args = {
      items = self.inserted_rows
    }
  }
}


pipeline "get_input_with_sleep" {
  title = "Get Input"

  param "items" {
    type = list(object({
      name        = string
      arn         = string
      region      = string
      account_id  = string
    }))
  }

  param "notifier" {
    type = notifier
    default = var.notifier
  }

  step "transform" "build_string" {
    value = "${length(param.items)} items: ${join(", ", [for item in param.items : item.name])}"
  }

  step "sleep" "sleep" {
    duration = "5m"
  }
  
  step "input" "delay" {
    type   = "button"
    prompt = "This is a delay for purposes of pausing pipeline; respond after it's paused to attempt to resume."

    notifier = param.notifier

    option "Continue" {}
    option "Yes" {}
  }

  step "transform" "do_nothing" {
    value = "${step.input.delay.value}"
  }
}


pipeline "get_input" {
  title = "Get Input"

  param "items" {
    type = list(object({
      name        = string
      arn         = string
      region      = string
      account_id  = string
    }))
  }

  param "notifier" {
    type = notifier
    default = var.notifier
  }

  step "transform" "build_string" {
    value = "${length(param.items)} items: ${join(", ", [for item in param.items : item.name])}"
  }

  step "input" "delay" {
    type   = "button"
    prompt = "This is a delay for purposes of pausing pipeline; respond after it's paused to attempt to resume."

    notifier = param.notifier

    option "Continue" {}
    option "Yes" {}
  }

  step "transform" "do_nothing" {
    value = "${step.input.delay.value}"
  }
}
