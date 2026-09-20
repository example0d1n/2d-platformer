extends Node2D
@onready var levelroot: Node2D = $"."
@onready var score_label: Label = $"../HUD/ScorePanel/ScoreLabel"

var score: int = 0

func _setup_level() -> void:
	var pineapples = $".".get_node_or_null("Pineapples")
	if pineapples:
		# FIX 1: Fixed the typo from 'get_childred' to 'get_children'
		# FIX 2: Changed 'pineapple.collected' to match your signal name 'pineapple.Collected'
		for pineapple in pineapples.get_children():
			pineapple.Collected.connect(increase_score)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# FIX 3: You must explicitly call the setup function when the game starts
	_setup_level()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
# ------------
# SCORE
# ------------
func increase_score() -> void:
	score += 1
	score_label.text = "Point: %s" % score
