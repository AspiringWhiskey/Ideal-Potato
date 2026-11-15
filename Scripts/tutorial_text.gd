extends Label

var steps: Array[Dictionary] = [
	{"text": "Press UP to jump!", "action": "ui_up"},
	{"text": "Press LEFT and RIGHT to move!\nBut only when you're in the air.", "action": "move"},
	{"text": "Collect all the coins!", "action": "collect_coin"}
]

var current_step: int = 0

func _ready() -> void:
	text = steps[current_step]["text"]
	GameManager.coins_updated.connect(_on_coins_updated)

func _input(event: InputEvent) -> void:
	if current_step >= steps.size():
		return
		
	var required_action: String = steps[current_step]["action"]
	
	if required_action == "move":
		if event.is_action_pressed("ui_left") or event.is_action_pressed("ui_right"):
			advance_step()
	elif required_action != "collect_coin" and event.is_action_pressed(required_action):
		advance_step()

func _on_coins_updated(_new_total: int) -> void:
	if current_step < steps.size() and steps[current_step]["action"] == "collect_coin":
		advance_step()

func advance_step() -> void:
	current_step += 1
	if current_step < steps.size():
		text = steps[current_step]["text"]
	else:
		visible = false
