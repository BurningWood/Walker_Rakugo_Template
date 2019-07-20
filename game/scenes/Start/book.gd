extends GDScriptDialog

var s
var m

func book(node_name, dialog_name):
	var cd = check_dialog(node_name, dialog_name, "book")

	if not cd:
		return

	if not s:
		s = get_var("s")

	if not m:
		m = get_var("m")

	match get_story_state():
		0:
			define("book", true)

			m.say({"what": "It's like an interactive book that you can read on a computer or a console."})

		1:
			show("sylvie green surprised")
			s.say({"what": "Interactive?"})

		2:
			m.say({"what": "You can make choices that lead to different events and endings in the story."})

		3:
			s.say({"what": "So where does the \"visual\" part come in?"})

		4:
			m.say({"what":
				"Visual novels have pictures and even music, "
				+"sound effects, and sometimes voice acting to go along with the text."
				})

		5:
			show("sylvie green smile")
			s.say({"what":
				"I see! That certainly sounds like fun."
				+ " I actually used to make webcomics way back when,"
				+ " so I've got lots of story ideas."
				})

		6:
			m.say({"what":
				"That's great!"
				+ " So...would you be interested in working with me as an artist?"
				})

		7:
			s.say({"what":  "I'd love to!"})

		# 8:
		# 	jump("Start", "marry", "marry")