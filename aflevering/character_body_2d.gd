extends CharacterBody2D

@export var speed: float = 1000

func _process(delta):
	var direction = Vector2.ZERO  # Ingen bevægelse som standard

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_up"):
		direction.y -= 1

	# Normaliserer retningen, så diagonale bevægelser ikke er hurtigere
	if direction.length() > 0:
		direction = direction.normalized()

	velocity = direction * speed
	move_and_slide()
