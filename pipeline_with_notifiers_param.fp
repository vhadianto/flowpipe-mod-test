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

    output "notifier_from_var" {
        value = param.notifier_from_var
    }

    output "notifier_in_pipeline" {
        value = param.notifier_in_pipeline
    }

    output "approvers_from_var" {
        value = param.approvers_from_var
    }

    output "approvers_in_pipeline" {
        value = param.approvers_in_pipeline
    }

    output "default_connection_list_from_var" {
        value = param.default_connection_list_from_var
    }

    output "default_connection_list_in_pipeline" {
        value = param.default_connection_list_in_pipeline
    }
}