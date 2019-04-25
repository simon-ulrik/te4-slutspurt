# frozen_string_literal: true

require 'sinatra/base'
require 'slim'
require 'sass'
require 'sequel'

class App < Sinatra::Base
  enable :sessions, :method_override

  before do
    @titles_lang = JSON.parse(File.read('./titles_lang.json'))
  end

  get '/' do
    redirect '/eng/'
  end

  get '/:lang/' do
    session[:lang] = params[:lang]
    @title = @titles_lang['home'][params[:lang]].capitalize
    slim :"#{params[:lang]}_home"
  end

  get '/:lang/about' do
    session[:lang] = params[:lang]
    @title = @titles_lang['about'][params[:lang]].capitalize
    slim :"#{params[:lang]}_about"
  end

  get '/:lang/fruits' do
    session[:lang] = params[:lang]
    @fruits = Fruit.get_all
    @title = @titles_lang['fruits'][params[:lang]].capitalize
    slim :"#{params[:lang]}_fruits"
  end

  get '/:lang/fruits/:id' do
    session[:lang] = params[:lang]
    @fruit = Fruit.get(id: params[:id])
    @title = "#{@titles_lang['fruit'][params[:lang]].capitalize} ##{params[:id]}"
    slim :"#{@fruit.nil? ? "#{params[:lang]}_not_found" : "#{params[:lang]}_fruit"}"
  end

  delete '/fruits/:id' do
    Fruit.delete(id: params[:id])
    redirect "/#{session[:lang]}/fruits"
  end

  put '/fruits/:id' do
    Fruit.update(id: params[:id], "#{params[:feild]}": params[:new_value])
  end

  not_found { slim :"#{session[:lang]}_not_found" }
end
