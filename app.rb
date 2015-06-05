require 'sinatra'

require_relative 'sns'

get '/' do
  doki("/")
end
