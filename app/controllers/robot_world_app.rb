require_relative '../models/robot.rb'

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get "/" do
    erb :layout
  end

  get '/robots' do
    @robots = Robot.all
    erb :index
  end

  post '/robots' do
    @robot = Robot.new(params)
    Robot.save
    erb :new
  end

  get '/robots/:id' do
    @robot = Robot.find_by_id(params[:id])
    erb :show
  end

  get '/robots/:id/edit' do
    @robot = Robot.find_by_id(params[:id])
    erb :edit
    redirect '/robots'
  end

  delete '/robots/:id' do
    erb :remove
    if params[:del] == "yes"
      Robot.delete(params[:id])
    end
    redirect '/robots'
  end

end
