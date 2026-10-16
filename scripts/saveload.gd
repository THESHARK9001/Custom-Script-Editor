extends FileDialog

@onready var sprite = %background
@onready var code = %editor
@onready var alert = %alert
var image_var = false
var count = 0
var fullscreen = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var folder_path = "user://scripts"
	var folder_path2 = "user://images"
	if !DirAccess.dir_exists_absolute(folder_path):
		var error = DirAccess.make_dir_recursive_absolute(folder_path)
		match error:
			OK: print("Success")
			_: alert.visible = true
	if !DirAccess.dir_exists_absolute(folder_path2):
		var error = DirAccess.make_dir_recursive_absolute(folder_path2)
		match error:
			OK: print("Success")
			_: alert.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("fullscreen"):
		if !fullscreen:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			fullscreen = true
		elif fullscreen:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			fullscreen = false
	sprite.size = Vector2(ProjectSettings.get_setting("display/window/size/viewport_width"), ProjectSettings.get_setting("display/window/size/viewport_height"))


func _on_file_selected(path: String) -> void:
	if file_mode == 4 and !image_var:
		root_subfolder = "scripts"
		var file = FileAccess.open(path, FileAccess.WRITE)
		file.store_string(code.text)
		file.close()
	elif file_mode == 0 and !image_var:
		var file = FileAccess.open(path, FileAccess.READ)
		var file_as_text = file.get_as_text()
		code.clear()
		code.insert_text(file_as_text, 0, 0, true, true)
		file.close()
	elif file_mode == 0 and image_var:
		root_subfolder = "images"
		var split = path.split(".")
		if split[1] != "png":
			visible = false
			return
		var image = Image.new()
		image.load(path)
		var texture = ImageTexture.create_from_image(image)
		sprite.texture = texture
