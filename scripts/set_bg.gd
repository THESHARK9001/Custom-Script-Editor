extends Button

@onready var filedialog = %saveload
@onready var alert = %alert


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pressed() -> void:
	var folder_path = "user://images"
	if !DirAccess.dir_exists_absolute(folder_path):
		var error = DirAccess.make_dir_recursive_absolute(folder_path)
		match error:
			OK: print("Success")
			_: alert.visible = true
	filedialog.get_line_edit().clear()
	filedialog.file_mode = 0
	filedialog.title = "Load your image"
	filedialog.root_subfolder = "images"
	filedialog.image_var = true
	filedialog.visible = true
