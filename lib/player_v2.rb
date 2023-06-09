class Player
  attr_accessor :name, :life_points

  def initialize(player_name)
    @name = player_name
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie."
  end

  def gets_damage(damage)
    @life_points -= damage
    if @life_points <= 0
      puts "Le joueur #{@name} a été tué comme une merde !"
    end
  end

  # Pour attaquer les autres joueurs en se servant du lancer de dé (compute damage) et de la perte de points de vie (gets_damage)
  def attacks(player)
    attacks_power = compute_damage
    puts "#{@name} tente de briser le genou de #{player.name} et lui inflige #{attacks_power} dégats!"
    player.gets_damage(attacks_power)
  end

  def compute_damage
    return rand(1..6)
  end

end

# ===================
# ===================
# ===================

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(player_name)
    @name = player_name
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts
    puts "-----------------------------------"
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{weapon_level}."
  end

  def compute_damage
    return rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon}!!"
    if @weapon_level < new_weapon
      puts "Mais c'est génial ! Elle est meilleure que ton arme actuelle, tu la prends et jette l'autre."
      puts "-----------------------------------"
      puts
      @weapon_level = new_weapon
    else
      puts "Mais c'est quoi cette daube... tu la jettes d'un air dégouté..."
      puts "-----------------------------------"
      puts
    end
  end

  def search_health_pack
    search = rand(1..6)

    if search == 1
      puts "Déception, après des heures de recherche... Rien... Ta mort se rapproche..."
      puts "-----------------------------------"
      puts

    elsif search == 2 || search == 3 || search == 4 || search == 5
      if @life_points < 50
        @life_points += 50
      else
        @life_points = 100
      puts "Bravo, tu as trouvé un pack de +50 points de vie."
      puts "-----------------------------------"
      puts
      end

    else
      if @life_points < 20
        @life_points += 80
      else
        @life_points = 100
      puts "Wahou, tu as trouvé un pack de +80 points de vie."
      puts "-----------------------------------"
      puts
      end
    end

  end

end