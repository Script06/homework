def start(file)
  if !File.exist?(file)
    f = File.open(file, 'w')
    f.puts(STARTER_BALANCE) 
    f.close  
  end
end

def enter_to_continue
  puts 'Нажмите enter для продолжения...'
  gets.chomp
end

def deposit
  puts 'Введите сумму для внесения:'
  amount = gets.chomp.to_f
  if amount < 1.0
    puts 'Введена некорретная сумма. Пополнение доступно от 1.0
    Попробуйте ещё раз'
    enter_to_continue
  end 
  current_balance = File.read(DB_ATM).to_f
  f = File.open(DB_ATM, 'w')
  f.puts(current_balance + amount)
  f.close
  puts "Ваш текущий баланс:#{File.read(DB_ATM).to_f}"
end

def withdraw
  puts "Доступно для снятия #{File.read(DB_ATM).to_f}"
  puts 'Введите сумму для снятия:'
  amount = gets.chomp.to_f
  current_balance = File.read(DB_ATM).to_f
  if current_balance < amount
    puts 'На вашем балансе недостаточно средств'
    enter_to_continue
    return
  end
  if  amount < 1.0
    puts 'вы ввели некорректную сумму. Попробуйте ещё раз'
    enter_to_continue
    return
  end
    f = File.open(DB_ATM, 'w')
    f.puts(current_balance - amount)
    f.close
    enter_to_continue
end

def balance
current_balance = File.read(DB_ATM)
puts "Ваш баланс составляет:#{current_balance}"
enter_to_continue
end

def select_menu
  loop do
    puts 'введите: 
    D - для внесения средств
    W - для снятия средств
    B - отобразить баланс
    Q - для выхода '

    choise = gets.chomp

    case choise.upcase
    when 'D'
      deposit
    when 'W'
      withdraw
    when 'B'
      balance
    when 'Q'
      puts 'До свидания!'
      break
    else
      puts 'Неверный ввод. Попробуйте снова.'
    end
  end
end