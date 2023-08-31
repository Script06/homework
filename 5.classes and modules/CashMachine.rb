require './Resoures_cm'
require 'pry'

class CashMachine

  class << self
    def init

      atm = CashMachine.new

      loop do
        puts 'введите: 
        D - для внесения средств
        W - для снятия средств
        B - отобразить баланс
        Q - для выхода '
    
        choise = gets.chomp
    
        case choise.upcase
        when 'D'
          atm.deposit
        when 'W'
          atm.withdraw
        when 'B'
          atm.balance
        when 'Q'
          atm.save
          puts 'До свидания!'
          break
        else
          puts 'Неверный ввод. Попробуйте снова.'
        end
      end
    end
  end

  attr_reader :current_balance
  STARTER_BALANCE = 10000
  DB_ATM = ('balance.txt')

  def initialize(file = DB_ATM)
    if !File.exist?(file)
      f = File.open(file, 'w')
      f.puts(STARTER_BALANCE) 
      f.close
      @current_balance = STARTER_BALANCE
    else
      @current_balance = File.read(DB_ATM).to_i
    end
  end

  include Resources_cm

  def deposit
    puts 'Введите сумму для внесения. Копейки не принимаются:'
    amount = (gets.chomp.to_i)*100
    #тут бы ещё сделать обработчик при вводе дробной суммы, но это не по ТЗ

    if amount < 100
      puts 'Введена некорретная сумма. Пополнение доступно от 1 рубля.
      Попробуйте ещё раз'
      enter_to_continue
      return
    end
    
    self.current_balance = current_balance + amount
    balance 
  end
  
  def withdraw
    balance
    puts 'Введите сумму для снятия:'
    amount = (gets.chomp.to_i)*100
    if self.current_balance < amount
      puts 'На вашем балансе недостаточно средств'
      enter_to_continue
      return
    end
    if  amount < 1
      puts 'вы ввели некорректную сумму. Попробуйте ещё раз'
      enter_to_continue
      return
    end
    self.current_balance = current_balance - amount
    balance
  end
  
  def balance
    puts "Ваш баланс составляет:#{display_money_format(current_balance)}"
    enter_to_continue
  end

  def save
    f = File.open(DB_ATM, 'w')
    f.puts(self.current_balance) 
    f.close
  end

  private
  attr_writer :current_balance

end