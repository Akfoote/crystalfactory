extends Button
## Tweens the button to flicker when pressed

## how quickly button tweens
var toggle_speed: float = 0.05

## size of button jump for tweens (0.0-1.0)
var delta: float = 0.02

func _ready() -> void:
	#set pivot_offset to be center of button so any motion is symmetric
	self.pivot_offset.x = self.size.x/2
	self.pivot_offset.y = self.size.y/2
	button_down.connect(_on_button_down)
	button_up.connect(_on_button_up)
	

func _shrink() -> void:
	var tween:Tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1-delta, 1-delta), toggle_speed)

func _expand() -> void:
	var tween:Tween = create_tween()
	await tween.tween_property(self, "scale", Vector2(1+delta, 1+delta), toggle_speed).finished
	_normalize()

func _normalize() -> void:
	var tween:Tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1,1), toggle_speed)

	
func _on_button_down() -> void:
	_shrink()
	($ButtonClick as AudioStreamPlayer).play()

func _on_button_up() -> void:
	_expand()
	($ButtonRelease as AudioStreamPlayer).play()
