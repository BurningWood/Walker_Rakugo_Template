extends GDScriptDialog


func later(node_name, dialog_name):
	var cd = check_dialog(node_name, dialog_name, "later")

	if not cd:
		return

	match get_story_state():
		0:
			say({"what":
					"I can't get up the nerve to ask right now."
					+"{nl}With a gulp, I decide to ask her later."
				})

		1:
			# scene black
	 	 	# with dissolve
			say({"what": "But I'm an indecisive person."})

		2:
			say({"what": "I couldn't ask her that day and I end up never being able to ask her."})

		3:
			say({"what": "I guess I'll never know the answer to my question now..."})

		4:
			say({
				"what": "{center}{b}Bad Ending{/b}{/center}.",
				"kind":"fullscreen"
			})
