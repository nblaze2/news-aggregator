require 'sinatra'
require 'pry'
require 'csv'
set :bind, '0.0.0.0'  # bind to all interfaces

get '/articles' do
  @articles = CSV.readlines('articles.csv')
  erb :index
end

get '/articles/new' do
  erb :new
end

post '/articles' do
  @error = {}
  @title = params['title']
  if @title.empty?
    @error[:title] = "You must include a Title"
  end
  @url = params['url']
  if @url.empty?
    @error[:url] = "You must include a URL"
  end
  @description = params['description']
  if @description.empty?
    @error[:description] = "You must include a Description"
  end

  if @error.keys.empty?
    CSV.open('articles.csv', 'a') do |csv|
      csv << [@title, @url, @description]
    end
    redirect '/articles'
  else
    erb :new
  end
end
