require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/vehicle')

get ('/') do
  erb(:index)
end

get ('/vehicles') do
  # new_car = Vehicle.new("1", "3", "b")
  # new_car.save()
  @vehicles = Vehicle.all()
  erb(:vehicles)
end

get ('/vehicles/new') do
  erb(:vehicle_form)
end

post ('/vehicles') do
  erb(:success)
end

get ('/vehicles/:id') do
  erb(:vehicle)
end
