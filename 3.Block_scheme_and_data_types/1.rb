def ends_with_cs?(word)
    word[-2..-1] == "cs"
end
  
  puts "Введите слово: "
  user_input = gets.chomp
  multiplier = user_input.length

  if ends_with_cs?(user_input.downcase)
    puts 2**multiplier  
  else
   puts user_input.reverse
  end