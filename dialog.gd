class_name Dialog

extends Node

static var lines = []

static func _static_init() -> void:
	# intro text
	lines.append("This is the head engineer for rocket launch 8-1620a, we have an emergency here!") #[0] = 
	lines.append("You were supposed to deliver the fuel for the rocket an hour ago!") #[1] = 
	lines.append("...") #[2] = 
	lines.append("Traffic?! How were we supposed to know?!") #[3] = 
	lines.append("Regardless, now there's only 10 minutes until launch!") #[4] = 
	lines.append("We need you to get here as fast as you can!") #[5] = 
	lines.append("There's one small problem however..") #[6] = 
	lines.append("As you know, the road to the launch platform spans a series of seaside cliffs,") #[7] = 
	lines.append("and they're littered with dangerous traps to keep out trespassers!") #[8] = 
	lines.append("We would normally have disabled these defenses when you arrived, but it takes us an") #[9] = 
	lines.append("estimated 15 minutes to turn everything off! See the problem?") #[10] = 
	lines.append("Luckily, your delivery truck has been outfitted by our science division") #[11] = 
	lines.append("with growing and shrinking devices which you can hopefully use to bypass the dangers.") #[12] = 
	lines.append("It may take some creativity however! So use your head! We're counting on you.") #[13] = 
	lines.append("And hurry! We're on a tight schedule here!") #[14] = 
	lines.append("")
	lines.append("")
	# post-intro text
	lines.append("Drag a token onto an object to change its size.") #[17] = 
	lines.append("You can use WASD to change course. Be warned, you have limited uses.") #[18] = 
	lines.append("You can use WASD to change course. Be warned, you have limited uses.") #[19] = 
	lines.append("Now, get a move on! We don't have much time.") #[20] = 
	lines.append("Watch for those springs. They'll push you off the path.") #[21] = 
	lines.append("Spikes are dangerous, and will destroy the truck.") #[22] = 
	lines.append("Those purple arrow things'll spin stuff round. Be careful.") #[23] = 
	lines.append("Oh, right. Make sure the key you put in is the same size as the gate itself.") #[24] = 
	lines.append("God these security measures are stupid. Who thought to put a truck-harnessed-key gate here anyways?!") #[25] = 
	lines.append("And this! Seriously. It's almost like we're in some poorly thought out game jam game.") #[26] = 
	lines.append("Now this one is just a mess. Have some extra turns, because apparently it's necessary.") #[27] = 
	lines.append("Okay, heres the road again. We're almost there.") #[28] = 
	# ending cutscene
	lines.append("Go! Go!!! You're going to make it!") #[29]
	lines.append("Yes! Now connect the fuel line and get out of there!") #[30]
	lines.append("Oh no! It's too late! Brace yourself!") #[31]
	
