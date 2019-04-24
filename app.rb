# frozen_string_literal: true

require 'sinatra/base'
require 'slim'
require 'sass'
require 'sequel'

class App < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    @title = 'Home'
    slim :home
  end

  get '/about' do
    @title = 'About'
    slim :about
  end

  get '/fruits' do
    @title = 'Fruits'
    @fruits = Fruit.get_all
    slim :fruits
  end

  get '/fruits/:id' do
    @fruit = Fruit.get(id: params[:id])
    if !@fruit.nil?
      @title = "Fruit ##{@fruit[:id]}"
      slim :fruit
    else
      slim :not_found
    end
  end

  delete '/fruits/:id' do
    Fruit.delete(id: params[:id])
    redirect '/fruits'
  end

  put '/fruits/:id' do
    p params
    Fruit.update(id: params[:id], feild: params[:feild], new_value: params[:new_value])
    redirect "/fruits/#{params[:id]}"
  end

  not_found { slim :not_found }
end
