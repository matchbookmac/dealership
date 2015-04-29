require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/vehicle')

get ('/') do
  erb(:index)
end

get ('/vehicles') do
  @vehicles = Vehicle.all()
  erb(:vehicles)
end

get ('/vehicles/new') do
  erb(:vehicle_form)
end

post ('/vehicles') do
  @make = params.fetch('make')
  @model = params.fetch('model')
  @year = params.fetch('year')
  @new_car = Vehicle.new(@make, @model, @year)
  @new_car.save()
  erb(:success)
end

get ('/vehicles/:id') do
  @vehicle = Vehicle.find(params.fetch('id'))
  erb(:vehicle)
end
