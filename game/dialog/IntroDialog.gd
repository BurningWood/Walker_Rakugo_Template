extends GDScriptDialog

func intro(node_name,dialog_name):
	if not check_dialog(node_name,dialog_name,"intro"):
		return
	
	
	match get_story_state():
		0: 
			say({
				"What":"Story begins here....YYYYYY"
				})