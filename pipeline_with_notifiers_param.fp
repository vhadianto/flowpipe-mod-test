pipeline "with_notifiers_in_param" {

    param "notifier_from_var" {
        type        = notifier
        default     = var.default_notifier
    }

    param "notifier_in_pipeline" {
        type        = notifier
        default = notifier.default
    }

  param "approvers_from_var" {
    type        = list(notifier)
    default     = var.approvers
  }

    param "approvers_in_pipeline" {
        type        = list(notifier)
        default = [notifier.default]
    }

    param "default_connection_list_from_var" {
        type = list(connection)
        default = var.default_connection_list
    }

    param "default_connection_list_in_pipeline" {
        type = list(connection)
        default = [connection.steampipe.default]
    }

    param "default_connection_from_var" {
        type = connection
        default = var.default_connection
    }

    step "transform" "params" {
        for_each = param

        value = each.value
    }

    output "val" {
        value = step.transform
    }
}