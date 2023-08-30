require 'socket'
require './app'

server = TCPServer.open('0.0.0.0', 3000)

#обработчик, для освобождения порта при ctrl+z
trap('TSTP') do
  puts "Программа приостановлена с помощью Ctrl+Z..."
  server.close
  exit
end

app = App.new

while connection = server.accept
  request = connection.gets #
  
  method, full_path = request.split(' ')
  path, params = full_path.split('?')
  status, headers, body = app.call({
    'REQUEST_METHOD' => method,
    'PATH_INFO' => path,
    'QUERY_STRING' => params
  })

  connection.puts "HTTP/1.1 #{status}\r\n"
  headers.each { |key, value|  connection.puts("#{key}: #{value}\r\n") }
  connection.puts "\r\n"

  body.each { |part| connection.print(part) }

  connection.close
end
