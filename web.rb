require 'sinatra'
require 'httparty'

use Rack::Auth::Basic, "Restricted Area" do |username, password|
  username == ENV["USERNAME"] and password == ENV["PASSWORD"]
end

get '/' do
  erb :index
end

post '/remote' do
  # puts params
  data = {
    message: params["command"],
    room_id: ENV['ROOM_ID'],
    from:    'SintaraApp'
  }

  url      = "https://api.hipchat.com/v1/rooms/message?format=json&auth_token=#{ENV['API_TOKEN']}"
  p response = HTTParty.post(url, body: data)
  'ok'
end