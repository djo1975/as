require_relative 'app'

def main
  app = App.new
  loop do
    app.run
    option = gets.chomp.to_i
    app.option(option)
  end
end

main
