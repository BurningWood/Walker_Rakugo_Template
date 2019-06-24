extends Spatial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	if Rakugo.current_root_node != self: 
		Rakugo.current_root_node = self
	Rakugo.begin("Hello", name, "hello_world") 
	Rakugo.add_dialog(self, "hello_world")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
