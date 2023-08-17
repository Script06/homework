def index(file)
  if File.exist?(file)
    File.foreach(file) do |line|
      puts line
    end
  else
    puts "File not found: #{file}"
  end
end

def find(file, id)
  File.foreach(file).with_index do |text, index|
    puts ("#{text}, id строки: #{index}") if index == id
  end    
end

def where(file, pattern)
  File.foreach(file).with_index do |text, index|
    puts ("#{text}, id строки: #{index}") if text.downcase.include?(pattern.downcase)
  end 
end

def update(file, id, new_text)
  buffer = File.readlines(file)
  buffer[id] = new_text
  File.open(file, 'w') do |f|
    f.puts(buffer)
    f.close
  end
end

def delete(file, id) 
  buffer = File.readlines(file)
  buffer.delete_at(id)
  File.open(file, 'w') do |f|
    f.puts(buffer)
    f.close
  end
end

def create(file, line)
  File.open(file, 'a') do |f|
    f.puts(line)
    f.close
  end
  
end