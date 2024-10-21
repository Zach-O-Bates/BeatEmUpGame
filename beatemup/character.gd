extends CharacterBody2D
@export var speed = 200
@onready var anim_tree = $AnimationTree

var facing = 1

func _ready():
	pass
	
func _process(delta):
	var dir = Input.get_vector("Left", "Right", "Up", "Down")
	self.velocity = dir * speed
	
	if dir.x < 0 and facing ==1:
		self.scale.x *= -1
		facing  = -1
		
	if dir.x > 0 and facing == -1:
		self.scale.x *= -1
		facing = 1
		
	
	if velocity.length() > 0.01:
		anim_tree['parameters/conditions/walk'] = true
		anim_tree['parameters/conditions/idle'] = false
	else:
		anim_tree['parameters/conditions/walk'] = false
		anim_tree['parameters/conditions/idle'] = true
	
	if Input.is_action_just_pressed("attack"):
		anim_tree['parameters/conditions/attack'] = true
	else:
		anim_tree['parameters/conditions/attack'] = false
		
		
	move_and_slide()


func _on_attack_region_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	print("Hit target")
	pass # Replace with function body.
