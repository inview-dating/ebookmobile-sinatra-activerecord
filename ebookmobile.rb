require "sinatra"
require "sinatra/activerecord"

Dir["./models/**/*.rb"].each {|file| require file }

get "/authors" do
  [ 200, Author.all.to_json ]
end

post "/authors" do
  params = JSON.parse request.body.read, symbolize_names: true

  @author = Author.create!(params.fetch(:author))

  [ 200, @author.to_json ]
end