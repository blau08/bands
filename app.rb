require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
require "pry"

get("/") do
  erb(:index)
end

get('/bands') do
  @bands = Band.all()
  erb(:bands)
end

post('/band') do
  band = Band.create({name: params.fetch('name')})
  @bands = Band.all()
  erb(:bands)
end

get("/band/:id") do
  band_id = params.fetch("id").to_i
  @band = Band.find(band_id)
  @concert = Concert.all()
  @venues = Venue.all()
  erb(:band)
end

patch("/bands/new") do
  update_name = params.fetch('update_name')
  update_band = Band.find(params.fetch('band_edit').to_i())
  update_band.update({:name => update_name})
  @bands = Band.all()
  erb(:bands)
end

patch("/band/:id") do
  venue_ids = params.fetch("venue_ids")
  # concert_ids = params.fetch("venue_ids")
  @band = Band.find(params.fetch("id").to_i())

  venue_ids.each() do |venue_id|
    venue = Venue.find(venue_id.to_i())
    @band.venues.push(venue)
  end

  # concert_ids.each() do |concert_id|
  #   concert = Concert.find(concert_id.to_i())
  #   @band.concerts.push(concert)
  # end

  @concerts = Concert.all()
  @venues = Venue.all()
  erb(:band)
end

delete('/band/:id') do
  band_id = params.fetch("id").to_i
  band = Band.find(band_id)
  band.delete
  @bands = Band.all()
  erb(:bands)
end

get("/venues") do
  @venues = Venue.all()
  erb(:venues)
end

post("/venue") do
  band = Venue.create({name: params.fetch("name")})
  @venues = Venue.all()
  erb(:venues)
end

delete('/venue/:id') do
  venue_id = params.fetch("id").to_i
  venue = Venue.find(venue_id)
  venue.delete
  @venues = Venue.all()
  erb(:venues)
end

get("/venue/:id") do
  venue_id = params.fetch("id").to_i
  @venue = Venue.find(venue_id)
  erb(:venue)
end

get("/concerts") do
  @concerts = Concert.all()
  erb(:concerts)
end

get("/concert/:id") do
  concert_id = params.fetch("id").to_i
  @concert = Concert.find(concert_id)
  @bands = Band.all()
  erb(:concert)
end

post("/concert") do
  @concert = Concert.create({name: params.fetch("name")})
  @categories = Concert.all()
  @bands = Band.all()
  erb(:concert)
end

patch("/concert/:id") do
  band_ids = params.fetch("band_ids")
  @concert = Concert.find(params.fetch("id").to_i())
  band_ids.each() do |band_id|
    band = Band.find(band_id.to_i())
    @concert.bands.push(band)
  end
  @bands = Band.all()
  erb(:concert)
end

delete('/concert/:id') do
  concert_id = params.fetch("id").to_i
  concert = Concert.find(concert_id)
  concert.delete
  @concerts = Concert.all()
  erb(:concerts)
end
