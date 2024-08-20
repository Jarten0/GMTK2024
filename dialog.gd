extends Node


var lines = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# intro text
	lines[0] = "This is the head engineer for rocket launch 8-1620a, we have an emergency here!"
	lines[1] = "You were supposed to deliver the fuel for the rocket an hour ago!"
	lines[2] = "..."
	lines[3] = "Traffic?! How were we supposed to know?!"
	lines[4] = "Regardless, now there's only 10 minutes until launch!"
	lines[5] = "We need you to get here as fast as you can!"
	lines[6] = "There's one small problem however.."
	lines[7] = "As you know, the road to the launch platform spans a series of seaside cliffs,"
	lines[8] = "and they're littered with dangerous traps to keep out trespassers!"
	lines[9] = "We would normally have disabled these defenses when you arrived, but it takes us an"
	lines[10] = "estimated 15 minutes to turn everything off! See the problem?"
	lines[11] = "Luckily, your delivery truck has been outfitted by our science division"
	lines[12] = "with growing and shrinking devices which you can hopefully use to bypass the dangers."
	lines[13] = "It may take some creativity however! So use your head! We're counting on you."
	lines[14] = "And hurry! We're on a tight schedule here!"
	# post-intro text
	lines[15] = "The bar in the top right of the screen shows your growing and shrinking tokens."
	lines[16] = "Each token displays how it will affect an object once applied."
	lines[17] = "To use a token, drag it onto the object you want to change."
	lines[18] = "In the bottom left, you can see the number of turns you have left once you start the level."
	lines[19] = "This is how many times you can steer the direction of the truck."
	lines[20] = "Your objective in each level is to reach the opposite road."
	lines[21] = "Springs bounce away objects which pass in front of them."
	lines[22] = "Spikes are dangerous, and will destroy the truck."
	lines[23] = "Turn tiles will turn the trejectory of anything which passes over it."
	lines[24] = "Gates are pillars which block your path, and require a key, however,"
	lines[25] = "the key must match the size of the gate in ordrer for it to work."
	
