extends Button

@onready var filedialog = %saveload
@onready var code = %editor
@onready var alert = %alert

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	var folder_path = "user://scripts"
	if !DirAccess.dir_exists_absolute(folder_path):
		var error = DirAccess.make_dir_recursive_absolute(folder_path)
		match error:
			OK: print("Success")
			_: alert.visible = true
	filedialog.hide()
	filedialog.get_line_edit().clear()
	filedialog.file_mode = 4
	filedialog.title = "Save your script"
	filedialog.current_dir = folder_path
	filedialog.image_var = false
	filedialog.popup_centered()
