from Backend.models import GraphNode
from typing import List


def graph_nodes_to_json(nodes: List[GraphNode]):
    result = {"nodes": [], "edges": []}

    for node in nodes:
        result["nodes"].append({
            "id": node.name,
            "height": 50,
            "display": node.display_name(),

            "fill": {
                "src": node.photo
            },
        })
        result["edges"].append(
            {"from": node.parent.name,
             "to": node.name,
             "from_display": node.parent.display_name(),
             "to_display": node.display_name()}) if node.parent else ()

    return result
