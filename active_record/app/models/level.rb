class Level
  # level 1 --> 0 - 500 exp
  # level 2 --> 501 - 1100 exp
  # level 3 --> 1101 - 1800 exp

  def level_up(char)
    if char.exp > 500
      char.level = 2
      puts "You leveled up"
    elsif char.exp > 1100
      char.level = 3
      puts "Congrats, you are now at level 3"
    end
    char.save
  end
end
