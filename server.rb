# Movies Catalogs Deluxe Challenge
# Patrick Kennedy
# 11/25/14

require 'sinatra'
require 'pg'
require 'pry'
require 'sinatra/reloader'

def db_connection 
	begin
		connection = PG.connect(dbname: 'movies')
		yield(connection)	
	ensure
		connection.close
	end
end

get '/actors' do
	db_connection do |conn|
		@actors = conn.exec_params('SELECT actors.name FROM actors ORDER BY actors.name')
	end

	erb :'actors/index' 
	
end

get '/movies' do

	erb :'/movies/index'
end

get '/movies/:id' do

	erb :'movies/show'
end
