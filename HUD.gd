extends CanvasLayer

# Se le informa al nodo "Main" que se presionó el botón.
signal start_game

# Mostramos el mensaje temporal de "Get Ready".
func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func show_game_over():
	show_message("Game Over")
	# Esperamos hasta que el MessageTimer llegue a 0.
	await $MessageTimer.timeout

	$Message.text = "Dodge the\nCreeps!"
	$Message.show()
	# Se crea un timer y esperamos a que llegue a 0 y volvemos al menú.
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()

func update_score(score):
	$ScoreLabel.text = str(score)

func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()

func _on_message_timer_timeout():
	$Message.hide()
