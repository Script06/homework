require 'pry'

def add_pokemon(amount)
  pokemons = []

  while true
    puts 'Сколько покемонов добавляем?'
    amount = gets.chomp.to_f
    if amount.is_a?(Float) && !amount.zero? && amount % 1 != 0
      puts 'покемон должен быть целым :)'
    else
      amount = amount.to_i
      amount.is_a?(Integer) && !amount.zero? ? break : (puts "Вы ввели не число")
    end
  end
  puts "вы решили добавить #{amount} покемона(-ов)"

  buff_count = 1;
  
  while buff_count <= amount
    puts "введите имя покемона №#{buff_count}"
    name = gets.chomp
    puts "введите цвет покемона №#{buff_count}"
    color = gets.chomp
    pokemons.push({ name: "#{name}", color: "#{color}"})
    buff_count+=1
  end
  return pokemons
end

def pretty_output(pokemons)
  puts "Таблица добавленных покемонов:"
  pokemons.each_with_index do |pokemon, index|
    
    puts "покемон №#{index + 1}: имя:#{pokemon[:name]} цвет:#{pokemon[:color]}"
  end
end

pokemons = add_pokemon(pokemons)
pretty_output(pokemons)


