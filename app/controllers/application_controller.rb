require 'rest-client'
require 'json'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/token" do
    #response = RestClient.post "https://accounts.spotify.com/api/token", grant_type:'client_credentials', :headers => { accept: "json", content_type: "json", "Authorization" => "Basic #{Base64.encode64(ENV["CLIENT_ID"] + ":" + ENV["CLIENT_SECRET"])}".delete("\n")}
    grant = Base64.encode64("#{ENV["CLIENT_ID"]}:#{ENV["CLIENT_SECRET"]}").delete("\n")

    response = RestClient.post('https://accounts.spotify.com/api/token',
                       {'grant_type' => 'client_credentials'},
                       {"Authorization" => "Basic #{grant}"})
    response.body

  end

  get "/users" do
    user = User.all 
    user.to_json
  end

  get "/playlists" do
  end

end
