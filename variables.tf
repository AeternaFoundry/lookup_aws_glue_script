variable "glue_script_lookup" {
  description = <<EOT
Map of glue_script_lookup, attributes below
Required:
    - dag_edge (block):
        - source (required)
        - target (required)
        - target_parameter (optional)
    - dag_node (block):
        - args (required, block):
            - name (required)
            - param (optional)
            - value (required)
        - id (required)
        - line_number (optional)
        - node_type (required)
Optional:
    - language
    - region
EOT

  type = map(object({
    language = optional(string)
    region   = optional(string)
    dag_edge = list(object({
      source           = string
      target           = string
      target_parameter = optional(string)
    }))
    dag_node = list(object({
      args = list(object({
        name  = string
        param = optional(bool)
        value = string
      }))
      id          = string
      line_number = optional(number)
      node_type   = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.glue_script_lookup : (
        length(v.dag_edge) >= 1
      )
    ])
    error_message = "Each dag_edge list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_script_lookup : (
        length(v.dag_node) >= 1
      )
    ])
    error_message = "Each dag_node list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_script_lookup : (
        alltrue([for item in v.dag_node : (length(item.args) >= 1)])
      )
    ])
    error_message = "Each args list must contain at least 1 items"
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

