data "aws_glue_script" "glue_script_lookup" {
  for_each = var.glue_script_lookup

  language = each.value.language
  region   = each.value.region

  dynamic "dag_edge" {
    for_each = each.value.dag_edge
    content {
      source           = dag_edge.value.source
      target           = dag_edge.value.target
      target_parameter = dag_edge.value.target_parameter
    }
  }

  dynamic "dag_node" {
    for_each = each.value.dag_node
    content {
      dynamic "args" {
        for_each = dag_node.value.args
        content {
          name  = args.value.name
          param = args.value.param
          value = args.value.value
        }
      }
      id          = dag_node.value.id
      line_number = dag_node.value.line_number
      node_type   = dag_node.value.node_type
    }
  }
}

