def age_result(file, age)
  results = File.open('Results.txt', 'w')
  File.foreach(file).with_index do |text, index|
    buff = text.split(' ')
    results.puts(text) if buff[-1].to_i == age.to_i 
  end
  results.close
end

def intro
  puts  'для выхода введите -1'
  puts 'введите возраст студента:'
end


people = File.open("People.txt", 'r')
age = 0 
while true
  intro
  age = gets.chomp.to_i
  break if age == -1
  age_result(people, age)
end
