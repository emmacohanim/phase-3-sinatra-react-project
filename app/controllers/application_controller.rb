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

  get "/users/:id" do
    user = User.find(params[:id])
    user.to_json
  end

  get "/playlists" do
    playlist = Playlist.all
    playlist.to_json
  end

  get "/playlists/:id" do
    playlist = Playlist.find(params[:id])
    playlist.to_json include: [:songs]
  end
  
  #Create
  post '/users' do
    user = User.create(user_params)
    status 201
    user.to_json
  end

 # {username: username, title: title, songs: arrayOfSongs}

  post '/playlists' do
    user = User.find_by(username: params[:username])
    playlist = user.playlists.create(playlist_params)
    params[:songs].each do |song|
      song = Song.find_or_create_by(song)
      playlist.song_playlists.create(song: song)
    end
    status 201
    playlist.to_json include: [:songs]
  end

  #Update
  patch '/playlists/:id' do
    playlist = Playlist.find(params[:id])
    playlist.update(playlist_params)
    status 200
    playlist.to_json include: [:songs]
  end

   #Destroy
   delete '/playlists/:id' do
    playlist = Playlist.find(params[:id])
    status 204
    playlist.destroy
  end

  def user_params
    {username:params[:username]}
  end

  def playlist_params
    {title:params[:title]}
  end

  def song_params
    {title:params[:title],artist:params[:artist],album:params[:album],duration:params[:duration]}
  end

end
