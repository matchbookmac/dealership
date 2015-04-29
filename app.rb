require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/vehicle')
require('./lib/dealership')

get ('/') do
  erb(:index)
end


get ('/dealerships') do
  @dealerships = Dealership.all()
  erb(:dealerships)
end

get ('/dealerships/new') do
  erb(:dealership_form)
end

post ('/dealerships') do
  @dealership =params.fetch('dealership')
  @new_dealership = Dealership.new(@dealership)
  @new_dealership.save()
  erb(:dealership_success)
end

get ('/dealerships/:id') do
  @dealership = Dealership.find(params.fetch('id').to_i())
  erb(:dealership)
end

get ('/dealerships/:id/vehicles/new') do
  @dealership = Dealership.find(params.fetch('id').to_i())
  erb(:dealership_vehicles_form)
end

get ('/vehicles') do
  @vehicles = Vehicle.all()
  erb(:vehicles)
end

post ('/vehicles') do
  @make = params.fetch('make')
  @model = params.fetch('model')
  @year = params.fetch('year')
  @new_car = Vehicle.new(@make, @model, @year)
  @new_car.save()
  @dealership = Dealership.find(params.fetch('dealership_id'))
  @dealership.add_car(@new_car)
  erb(:success)
end

get ('/vehicles/:id') do
  @vehicle = Vehicle.find(params.fetch('id'))
  erb(:vehicle)
end
