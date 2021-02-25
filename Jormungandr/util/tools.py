
def graph_nodes_to_json(nodes):
    result = {"nodes": [], "edges": []}
    grouped = {"nodes": []}
    index = 0
    for node in nodes:
        result["nodes"].append({
            "id": node.name,
            "height": 50,
            "display": node.display_name(),
            "x": index*50,
            "y": 0,
            "fill": {
                "src": "https://upload.wikimedia.org/wikipedia/en/9/9a/Trollface_non-free.png"
            },

        })
        result["edges"].append({"from": node.parent.name, "to": node.name}) if node.parent else ()

        index += 1

    return result
