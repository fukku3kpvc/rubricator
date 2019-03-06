module NodesHelper
  def nested_nodes(nodes)
    nodes.map do |node, sub_nodes|
      puts "GO FOR NODE #{node.title}"
      puts sub_nodes
      if !sub_nodes.empty?
        render(node) + render(partial: 'nodes/sub_nodes', locals: { sub_nodes: sub_nodes })
        # render(node) + content_tag(:div, nested_nodes(sub_nodes), class: 'nested-nodes')
      else
        render(node)
      end
    end.join.html_safe
  end
end
