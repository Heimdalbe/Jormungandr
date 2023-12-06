from django.db import IntegrityError
from Backend.models import GraphNode, PhotoAlbum, Picture
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

def save_images(album, image_links):
    for image_link in image_links:
        new_image_link = image_link.replace("https://imgur.com/", "https://i.imgur.com/")
        if new_image_link != image_link:
            new_image_link += ".jpg"
        split_link = new_image_link.rsplit('.', maxsplit=1)
        # imgur thumbnail quality :
        # s = Small Square (90×90)
        # b = Big Square (160×160)
        # t = Small Thumbnail (160×160)
        # m = Medium Thumbnail (320×320)
        # l = Large Thumbnail (640×640)
        # h = Huge Thumbnail (1024×1024)
        thumbnail_quality = 'l'
        thumbnail_link = split_link[0] + thumbnail_quality + "." + split_link[1]
        try:
            img = Picture()
            img.album = PhotoAlbum.objects.get(name=album)
            img.link = new_image_link
            img.name = "image :)"
            img.thumbnail = thumbnail_link
            print(f"img thumbnail: {img.thumbnail}")
            img.save()
        except IntegrityError:
            # TODO: do something with this
            pass
