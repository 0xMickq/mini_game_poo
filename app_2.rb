require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "__________________________________________________________________________"
puts "| BIENVENUE SUR LA FAILLE DE L'INVOCATEUR(le mec se croit sur LoL ptdr) |"
puts "| BONNE CHANCE POUR ÊTRE LE DERNIER SURVIVANT !! |"
puts "__________________________________________________________________________"

puts "Quel est votre nom ?"
player_name = gets.chomp

player1 = HumanPlayer.new("#{player_name}")
player2 = Player.new("Josiane")
player3 = Player.new("José")

ennemies = []
ennemies << player2
ennemies << player3

while player1.life_points > 0 && (player2.life_points > 0 || player3.life_points >0)
  puts "-------------------------------"
  puts player1.show_state
  
  puts "-------------------------------"
  puts "Quel actions veux-tu effectuer ?"
  puts "a - Chercher une nouvelle arme"
  puts "s - Chercher à se soigner"
  puts "attaquer un joueur en vue :"
  puts "0 - #{player2.show_state}"
  puts "1 - #{player3.show_state}"
  player1_choice = gets.chomp
  if player1_choice == "a"
    player1.search_weapon
  elsif player1_choice == "s"
    player1.search_health_pack
  elsif player1_choice == "0"
    player1.attacks(player2)
  else player1_choice == "1"
    player1.attacks(player3)
  end
  
  puts "-------------------------------"
  puts "Les autres joueurs t'attaquent !"
  ennemies.each do |ennemies|
    if ennemies.life_points > 0
      ennemies.attacks(player1)
    end
  end

  puts "-------------------------------"
  puts "Voici l'état de chaque joueur :"
  puts player2.show_state
  puts player3.show_state



end

puts "La partie est terminée !"
if player1.life_points <= 0
  puts "LOOSER TU AS PERDU"
else puts "FELICITATION, TU AS SURVECU, JUNGLE GAP(le mec veut pas lacher LoL)"
end

