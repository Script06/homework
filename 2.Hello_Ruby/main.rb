def greeting
    puts 'Привет, введи фамилию:'
    last_name = gets.chomp
    puts 'Привет, теперь имя:'
    first_name = gets.chomp
    puts 'И возраст:'
    age = gets.chomp.to_i

    puts age > 18 ? "Привет, #{first_name} #{last_name}. Самое время заняться делом!" : "Привет, #{first_name} #{last_name}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано."

end

def foobar

    puts 'введи первое число'
    first = gets.chomp.to_i
    puts 'введи второе число'
    second = gets.chomp.to_i

    if first == 20
        puts second
    elsif second == 20
        puts first
    else
        puts first+second
    end
    
end

greeting
foobar
