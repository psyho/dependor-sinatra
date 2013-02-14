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

get "/hello/:name" do |greeter|
  greeter.greet
end
