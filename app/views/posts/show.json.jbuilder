json.title @post.title
json.description @post.description
json.image_url @post.picture.url(:medium)
json.location @post.location