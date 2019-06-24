extends GDScriptDialog

func hello_world(node_name, dialog_name):
    if node_name != name:
        return

    if dialog_name != "hello_world":
        return

    match get_story_state():
        0:
            say({
                "what": "Hello World"
                })

        1:
            say({
                "what": "How are you?"
            })