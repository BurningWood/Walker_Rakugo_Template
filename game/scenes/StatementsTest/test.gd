extends GDScriptDialog

export (String, "adv", "center", "fullscreen", "hide", "left", "right",  "top") var kind := "adv"
var scene_ready := false
var s

func test(node_name, dialog_name):
	var cd = check_dialog(node_name, dialog_name, "test")

	if not cd:
		return
	
	if not scene_ready:
		show("bg uni")
		show("sylvie green smile")
		scene_ready = true
	
	if not s:
		s = get_var("s")

	match get_story_state():
		0:
			s.say({
			"what":
				"Hi there! How was class?",
			"kind":
				kind
			})