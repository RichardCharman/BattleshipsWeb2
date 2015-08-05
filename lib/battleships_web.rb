require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base
  # force port 3000 for Nitrous
  configure :development do
    set :bind, '0.0.0.0'
    set :port, 3000
  end

  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    erb :index
  end

  get '/name_set' do
    @name= params[:name]
    erb :enter_name
  end

  get '/play' do   
    $game = Game.new Player, Board
    $game.player_2.place_ship Ship.cruiser, :A1
    erb :game
  end

  post "/play" do
    @coordinates = params[:coordinates]
    erb :game
  end
 
  # start the server if ruby file executed directly
  run! if app_file == $0

end