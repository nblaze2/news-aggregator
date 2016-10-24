require 'sinatra'
require 'pry'

set :bind, '0.0.0.0'  # bind to all interfaces

get '/articles' do
  @articles = File.readlines('.csv')
  erb :index
end

get '/articles/new' do
  erb :new
end

post '/articles/new' do
  article = params['article']

  File.open('articles.csv', 'a') do |file|
    file.puts(article)
  end

  redirect '/articles'
end
