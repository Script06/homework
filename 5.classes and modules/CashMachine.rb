class CashMachine
  attr_reader :current_balance
  STARTER_BALANCE = 100.0
  DB_ATM = ('balance.txt')

  def initialize(file = DB_ATM)
    if !File.exist?(file)
      f = File.open(file, 'w')
      f.puts(STARTER_BALANCE) 
      f.close
    else
      @current_balance = File.read(DB_ATM).to_f
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
      return
    end 
    f = File.open(DB_ATM, 'w')
    f.puts(self.current_balance + amount) 
    f.close
    balance 
  end
  
  def withdraw
    balance
    puts 'Введите сумму для снятия:'
    amount = gets.chomp.to_f
    if self.current_balance < amount
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
    f.puts(self.current_balance - amount)
    f.close
    balance
  end
  
  def balance
    self.current_balance = File.read(DB_ATM).to_f
    puts "Ваш баланс составляет:#{self.current_balance}"
    enter_to_continue
  end
  
  def init
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

  private
  attr_writer :current_balance

end