extends GDScriptDialog

var s
var m

func marry(node_name, dialog_name):
	var cd = check_dialog(node_name, dialog_name, "marry")

	if not cd:
		return

	if not s:
		s = get_var("s")

	if not m:
		m = get_var("m")

	match get_story_state():
		0:
			say({
			"what": "{center}And so, we become a visual novel creating duo.{/center}",
			"kind": "fullscreen"
				})

		1:
			show("bg club")
			say({
			"what": "Over the years, we make lots of games and have a lot of fun making them."
			})

		2:
			if get_value("book"):
				say({"what":
					"Our first game is based on one of Sylvie's ideas,"
				+ " but afterwards I get to come up with stories of my own, too."
				})

			else:
				# this will skip this state
				Rakugo.story_state += 1

		3:
			say({"what":
				"We take turns coming up with stories and"
				+" characters and support each other to make some great games!"
				})

		4:
			say({"what": "And one day..."})

		5:
			show("sylvie blue normal")
			s.say({"what": "Hey..."})

		6:
			m.say({"what": "Yes?"})

		7:
			show("show sylvie blue giggle")
			s.say({"what": "Will you marry me?"})

		8:
			m.say({"what": "What? Where did this come from?"})

		9:
			show("sylvie blue surprised")
			s.say({"what": "Come on, how long have we been dating?"})

		10:
			m.say("what": "A while...")
