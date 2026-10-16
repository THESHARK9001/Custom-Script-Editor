extends Button

@onready var filedialog = %saveload
@onready var code = %editor
@onready var alert = %alert
@onready var quit = %reallyquit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	quit.popup()
