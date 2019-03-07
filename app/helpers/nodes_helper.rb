module NodesHelper
  def nested_nodes(nodes, sub = false)
    sub ? color = 'list-group-item list-group-item-secondary' : color = 'list-group-item list-group-item-primary'
    nodes.map do |node, sub_nodes|
      if !sub_nodes.empty?
        content_tag(:div,
                    render(partial: 'nodes/node', locals: { node: node, color: color }) +
                        render(partial: 'nodes/sub_nodes',
                               locals: { sub_nodes: sub_nodes, collapse_id: node.id }),
                    class: 'node')
      else
        content_tag(:div, render(partial: 'nodes/node',
                                 locals: { node: node, color: color }),
                    class: 'node')
      end
    end.join.html_safe
  end
end
