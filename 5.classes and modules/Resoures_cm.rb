module Resources_cm
  
  def enter_to_continue
    puts 'Нажмите enter для продолжения...'
    gets.chomp
  end

  def display_money_format(money)  
     rubles = money / 100
     kopeck = money % 100
     return "#{rubles}.#{kopeck}"
  end
end