extends Control
## Main Menu Button... handler... root node.. thing

@onready var button: Button = $MainMenuButton
@onready var main_control: CanvasLayer = $"../../../../.."


func _ready() -> void:
	print("Connecting " + str(button) + " with " + str(main_control))
	button.pressed.connect(main_control._on_main_menu_button_pressed)


func _process(_delta: float) -> void:
	pass
