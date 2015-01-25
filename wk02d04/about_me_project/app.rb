require 'sinatra'
require "./lib/author"

me = Author.new

get '/' do
  @title = "About Me"
  @person = me
  erb :home
end

get '/contact' do
  @title = "Contact Me"
  @person = me
  erb :contact
end

