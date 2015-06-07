require 'sinatra'
require 'sinatra/reloader' if development?

require_relative 'sns'

get '/' do
  doki("/")
end
