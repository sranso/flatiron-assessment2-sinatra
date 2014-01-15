require 'bundler'
Bundler.require

require './lib/spacecat.rb'

class App < Sinatra::Application
  set :database, "sqlite3:///spacecats.db"

  # show all spacecats
  get '/spacecats' do
    @spacecats = Spacecat.all
    haml :index
  end

  # form for a new spacecat
  get '/spacecats/new' do
    @spacecat = Spacecat.new
    haml :new
  end

  # show one spacecat
  get '/spacecats/:id' do
    @spacecat = Spacecat.find(params[:id])
    haml :show
  end

  # create a new spacecat
  post '/spacecats' do
    @spacecat = Spacecat.new(params[:spacecat])
    if @spacecat.save
      redirect '/spacecats'
    else
      haml :new
    end
  end
end