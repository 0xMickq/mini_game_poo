require 'pry'

1

  def show_state
    "#{name} à #{life_points} points de vies"
  end

  def gets_damage(damage_received)
    @life_points = @life_points - damage_received
      if @life_points <= 0
        puts "Les points de vies de #{name} sont à 0, il est mort..."
      end
  end

  def attacks(player)
    puts "Le joueur #{name} attaque #{player.name} !"

    damage_given = compute_damage
    player.gets_damage(damage_given)

    puts "Il lui inflige #{damage_given} points de dommages !"
  end

  def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name_to_save)
    super(name_to_save)
    @life_points = 100
    @weapon_level = 1

  end

  def show_state
    puts "#{name} à #{life_points} points de vies et une arme level #{weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    dice_result = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{dice_result}"
    if dice_result > weapon_level
      weapon_level = dice_result
      puts "Vous ramassez cette nouvelle arme et vous avez hâte de la tester sur le terrain !"
    else puts "Vous gardez votre arme... Vous venez d'en ramasser une moins bien"
    end
  end

  def search_health_pack
    dice_result = rand(1..6)
    if dice_result == 1
      puts "Tu n'as rien trouvé..."
    elsif dice_result.between?(2, 5) 
      puts "Bravo ! Tu as trouvé un pack de +50 points de vie !"
      @life_points = [@life_points + 50, 100].min
    else dice_result == 6
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      @life_points = [@life_points + 80, 100].min
    end
  end
end
