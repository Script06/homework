require "rack"
require "./CashMachine"

class App
	def call(env)
		req = Rack::Request.new(env)
    params = req.query_string.split("&").map{ |pair| pair.split("=") }.to_h		
		case req.path
		when '/deposit'
      result = choise_controller(req.path, params["value"])
			[200, {'Content-Type' => 'text/html; charset=UTF-8'}, 
			[result, '<p><a href="javascript:history.back()">Вернуться на предыдущую страницу</a></p>']]
		when '/withdraw'
      result = choise_controller(req.path, params["value"])
			[200, {'Content-Type' => 'text/html; charset=UTF-8'}, 
			[result, '<p><a href="javascript:history.back()">Вернуться на предыдущую страницу</a></p>']]
    when '/balance'
      result = choise_controller(req.path)
      [200, {'Content-Type' => 'text/html; charset=UTF-8'}, 
			[result, '<p><a href="javascript:history.back()">Вернуться на предыдущую страницу</a></p>']]
		else
			[404, {'Content-Type' => 'text/html'}, File.readlines('./404.html')]
		end
	end

  def choise_controller(path, value = nil)
    atm = CashMachine.new
		
		case path
		when "/deposit"
			atm.deposit(value)
		when "/withdraw"
			atm.withdraw(value)
		when "/balance"
			atm.balance
		else
			puts 'takogo routa net, bro'
		end
  end
end

