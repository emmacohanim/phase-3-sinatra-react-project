require 'rest-client'
require 'json'

puts "🌱 Seeding spices..."

# Seed your database here
auth = {"Authorization": "Bearer BQDtXVo1T0N4iHwTEc7Roi_bnIyjvDD7__0-saJogSyaGpy9bextDNXzUM4vLff58ePhdKlJSLXETzKRy7sns5w4dJTz1qUVKUEC6AFojDPYZNCsBBQKpUxWwEIb-o-7s18GLPiR-iMFqnEpimVhR1ezitNq6gaesi0VUwm6u8HpJVrun1Etr71oa6XlWw"}

endpoint1 = RestClient.get(
    'https://api.spotify.com/v1/browse/categories/mood/playlists?offset=0&limit=50',
    headers=auth
)

data1 = JSON.parse(endpoint1)
puts "✅ Done seeding!"
