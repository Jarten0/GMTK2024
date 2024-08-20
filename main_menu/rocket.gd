extends Sprite2D



var mini_stage: int = 0
var initial_y: float = position.y
var anim_timer: float = 0

func _process(delta: float) -> void:
	if get_parent().stage == 2 and mini_stage == 0:
		mini_stage = 1
	match mini_stage:
		1: 
			position.y -= 20 * delta
			if initial_y - position.y >= 20:
				mini_stage += 1	
			$Jet.visible = true
		2: 
			position.y -= 50 * delta
			if initial_y - position.y >= 50:
				mini_stage += 1
			$Jet.frame = 1
		3: 
			position.y -= 200 * delta
			if initial_y - position.y >= 200:
				mini_stage += 1
			$Jet.frame = 2
		4:
			position.y -= 800 * delta
			anim_timer += delta
			if anim_timer > 0.05:
				anim_timer = 0
				if $Jet.frame == 3: 
					$Jet.frame = 4
				else:
					$Jet.frame = 3
			if position.y < -1000:
				$"..".end()
