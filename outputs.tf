output "glue_script_lookup_id" {
  description = "Map of id values across all glue_script_lookup, keyed the same as var.glue_script_lookup"
  value       = { for k, v in data.aws_glue_script.glue_script_lookup : k => v.id if v.id != null && length(v.id) > 0 }
}
output "glue_script_lookup_dag_edge" {
  description = "Map of dag_edge values across all glue_script_lookup, keyed the same as var.glue_script_lookup"
  value       = { for k, v in data.aws_glue_script.glue_script_lookup : k => v.dag_edge if v.dag_edge != null && length(v.dag_edge) > 0 }
}
output "glue_script_lookup_dag_node" {
  description = "Map of dag_node values across all glue_script_lookup, keyed the same as var.glue_script_lookup"
  value       = { for k, v in data.aws_glue_script.glue_script_lookup : k => v.dag_node if v.dag_node != null && length(v.dag_node) > 0 }
}
output "glue_script_lookup_language" {
  description = "Map of language values across all glue_script_lookup, keyed the same as var.glue_script_lookup"
  value       = { for k, v in data.aws_glue_script.glue_script_lookup : k => v.language if v.language != null && length(v.language) > 0 }
}
output "glue_script_lookup_python_script" {
  description = "Map of python_script values across all glue_script_lookup, keyed the same as var.glue_script_lookup"
  value       = { for k, v in data.aws_glue_script.glue_script_lookup : k => v.python_script if v.python_script != null && length(v.python_script) > 0 }
}
output "glue_script_lookup_region" {
  description = "Map of region values across all glue_script_lookup, keyed the same as var.glue_script_lookup"
  value       = { for k, v in data.aws_glue_script.glue_script_lookup : k => v.region if v.region != null && length(v.region) > 0 }
}
output "glue_script_lookup_scala_code" {
  description = "Map of scala_code values across all glue_script_lookup, keyed the same as var.glue_script_lookup"
  value       = { for k, v in data.aws_glue_script.glue_script_lookup : k => v.scala_code if v.scala_code != null && length(v.scala_code) > 0 }
}

