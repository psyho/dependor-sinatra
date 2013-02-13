require 'rack/test'
require 'dependor-sinatra'
require 'dependor/shorty'

RSpec.configure do |c|
  c.color_enabled = true
  c.include Rack::Test::Methods
end
