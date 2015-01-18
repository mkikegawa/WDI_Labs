$dragon = {"name" => "Dragon", "health"  => 500, "attack" => 150, "defense" => 75, "speed" => 1}
$hero = {"health" => 200, "attack" => 100, "defense" => 50, "speed" => 2}

scene0 = {"text" => "Before you turn around you notice, the warm breath start to singe the hairs on the back of your neck.", "options" => ["Dive to left", "Dive to right", "Dive Forward"]}
scene1 = {"text" => "The Dragon stands on his hind legs and breathes fire at you", "options" => [ "Throw sword", "Block with Shield"]}
scene2 = {"text" => "The Dragon lunges at you with his daggerlike teeth", "options" => ["Kiss dragon", "Roll over on back"]}
scene3 = {"text" => "The Dragon lashes his tail at you", "options" => ["Jump over tail", "Smash tail with sword"]}


scenarios = [scene1, scene2, scene3]



def roll(die)
	srand
	rand(die) + 1
end 

def event(scene)
	puts scene["text"]
	choice(scene["options"])
end

def battle(att, defend)
    case roll(3)
    when 1
    	bonus = 1
    	puts "#{att["name"]} does not gain an advantage."
    when 2
    	bonus = 0
    	puts "Attack is blocked by #{defend["name"]}."
    when 3
    	bonus = 2
    	puts "#{att["name"]} gains an advantage."
    end
    damage = (att["attack"] * att["speed"] - defend["defense"] * defend["speed"]) * bonus    
end


def choice(options)
	puts "Do you :"
	counter = 1
	options.each do |option|
		puts "#{counter}    - #{option}"
		counter += 1
	end
    puts "#{counter}    - Run Away"
    puts "#{counter + 1}    - Taunt Dragon"
	choices = gets.chomp.to_i
	dungeon_master = roll(counter)
	if choices == dungeon_master
		puts "The dragon chomps down on you. You are dead. Try again."
		exit
	else 
		if choices == counter
			puts "You Ran Away!!!"
			exit
		elsif choices == counter + 1
			puts "You taunt the Dragon"
			case roll(2)
    		when 1
    			puts "Dragon gains health"
    			$dragon["health"] += 50
    			puts "Dragon's health is now #{$dragon['health']}."
    		when 2
    			puts "Dragon Loses health"
    			$dragon["health"] -= 50
    			puts "Dragon's health is now #{$dragon['health']}."
    		end
		else
			puts "You attack the Dragon"
			$dragon["health"] -= battle($hero, $dragon)
			puts "Dragon's health is now #{$dragon['health']}."

 			puts "The dragon attacks you."
   			$hero["health"] -= battle($dragon, $hero)
			puts "#{$hero['name']}\'s health is now #{$hero['health']}."
			
    	end
	end
end

puts "What is your name?"
$hero["name"] = gets.chomp.capitalize
#$hero["name"] = "Bob"

puts "I must apologize it is very difficult to tell under all that armor."
puts "Are you male or female? [m/f]"
gender = gets.chomp.downcase
#gender = "m"

salutation = gender == "m" ? "Sir" : "Lady"

puts "Thank you for helping us fight the dragon, #{salutation} #{$hero['name']}."
puts "Oh by the way, the dragon is behind you. See you later. Maybe. All the best to you, kind #{salutation}."
puts


event(scene0)

while $dragon["health"] >= 0
	if $hero["health"] <= 0
		puts "Sadly you have failied in your quest and you are now dead."
		puts "The Dragon had #{$dragon["health"]} remaining."
		exit
	end 
	#event(scenarios[1])
	cnt = scenarios.count
	dm = roll(cnt) - 1
	event(scenarios[dm])
	puts
end
puts 'Congratulations #{$hero["name"]}-- You have killed the dragon!!!  You have #{$hero["health"]} remaining.'

