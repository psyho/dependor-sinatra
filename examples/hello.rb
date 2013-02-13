#!/usr/bin/env ruby

require "sinatra"
require "dependor-sinatra"
require "dependor/shorty"

class Greeter
  takes :params

  def greet
    "Hello, #{params[:name]}!"
  end
end

class MyInjector
  include Dependor::AutoInject
  include Dependor::Sinatra::Objects

  def initialize(objects)
    sinatra_objects(objects)
  end
end

injector { |objects| MyInjector.new(objects) }

get "/hello/:name" do |greeter|
  greeter.greet
end
