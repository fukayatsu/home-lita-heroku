require 'sinatra'
require 'httparty'

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