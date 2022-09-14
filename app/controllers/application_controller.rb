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
    # "Authorization" => "Basic #{Base64.encode64(ENV["CLIENT_ID"] + ":" + ENV["CLIENT_SECRET"])}"
    # auth = {"Authorization": "Bearer BQDtXVo1T0N4iHwTEc7Roi_bnIyjvDD7__0-saJogSyaGpy9bextDNXzUM4vLff58ePhdKlJSLXETzKRy7sns5w4dJTz1qUVKUEC6AFojDPYZNCsBBQKpUxWwEIb-o-7s18GLPiR-iMFqnEpimVhR1ezitNq6gaesi0VUwm6u8HpJVrun1Etr71oa6XlWw"}

    # endpoint1 = RestClient.get(
    #     'https://api.spotify.com/v1/browse/categories/mood/playlists?offset=0&limit=50',
    #     headers=auth
    # )
    
    # data1 = JSON.parse(endpoint1)  

  end

end
