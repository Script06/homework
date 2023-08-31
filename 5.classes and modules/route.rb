require 'pry'
module Resource

  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end

    loop do

      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
      verb = gets.chomp
      break if verb == 'q'

      action = nil

      if verb == 'GET'
        print 'Choose action (index/show) / q to exit: '
        action = gets.chomp
        break if action == 'q'
      end

      action.nil? ? routes[verb].call : routes[verb][action].call
    end
  end
end

class PostsController
  extend Resource

  attr_accessor :posts

  def initialize
    @posts = [{:id=>1, :text=>"Текст поста 1"},
      {:id=>2, :text=>"Текст поста 2"},
      {:id=>3, :text=>"Текст поста 3"},
      {:id=>4, :text=>"Текст поста 4"},
      {:id=>5, :text=>"Текст поста 5"}]
  end

  def index
    self.posts.each_with_index do |post, index|
      puts puts "пост id: #{post[:id]}. текст поста:\n#{post[:text]}"
    end 
  end

  def show
    puts 'введите id поста, который хотите отобразить:'
    id = gets.chomp.to_i
    
    result = posts.find {|post| post[:id] == id}
    
    if result
      puts "Ваш пост id: #{result[:id]}.\n текст поста:#{result[:text]}"
    else
      puts 'пост с данным id не найден'
    end
  end

  def create
    puts 'введите текст поста'
    post_text = gets.chomp
    post_id = self.posts.size + 1
    self.posts.push({id: post_id,  text: post_text})
    puts "Ваш пост опубликован, id: #{post_id}. текст поста:\n#{post_text}"
  end

  def update  

    puts 'введите id поста, который нужно изменить:'
    id = gets.chomp.to_i
    puts 'введите новый текст поста:'
    new_text = gets.chomp
    result = posts.find {|post| post[:id] == id}&.merge!(:text => new_text) 

    if result
      puts 'пост успешно изменен'
    else
      puts 'пост с данным id не найден'
    end
  end

  def destroy

    puts 'введите id поста, который хотите удалить:'
    id = gets.chomp.to_i

    result = posts.reject! {|post| post[:id] == id}
    binding.pry
    if result
      puts 'пост успешно удалён'
    else
      puts 'пост с данным id не найден'
    end
  end
end

class Router
  attr_accessor :routes
  def initialize
    @routes = {}
  end

  def init
    resources(PostsController, 'posts')
    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choise = gets.chomp

      PostsController.connection(@routes['posts']) if choise == '1'
      break if choise == 'q'
    end

    puts 'Good bye!'
  end

  def resources(klass, keyword)
    controller = klass.new
    @routes[keyword] = {
      'GET' => {
        'index' => controller.method(:index),
        'show' => controller.method(:show)
      },
      'POST' => controller.method(:create),
      'PUT' => controller.method(:update),
      'DELETE' => controller.method(:destroy)
    }
  end
end

router = Router.new

router.init