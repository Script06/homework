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
  
  def deposit(amount)
    amount = amount.to_f
    if amount < 1.0
      return 'введенная сумма меньше 1.0. Попробуйте заново'
    end 
    f = File.open(DB_ATM, 'w')
    f.puts(self.current_balance + amount) 
    f.close
    balance 
  end
  
  def withdraw(amount)
    amount = amount.to_f
    if self.current_balance < amount
      return 'На вашем балансе недостаточно средств'
    end
    if  amount < 1.0
      return 'Снять сумму меньше 1.0 нельзя. Попробуйте ещё раз'
    end 
    f = File.open(DB_ATM, 'w')
    f.puts(self.current_balance - amount)
    f.close
    balance
  end
  
  def balance
    self.current_balance = File.read(DB_ATM).to_f
    self.current_balance
  end

  private
  attr_writer :current_balance

end