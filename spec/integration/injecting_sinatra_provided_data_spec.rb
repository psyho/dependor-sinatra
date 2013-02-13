require 'spec_helper'

describe "Injecting Sinatra provided data" do
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

  class SinatraAppWithDependor < Sinatra::Base
    injector { |objects| MyInjector.new(objects) }

    set :environment, :test

    get "/hello/:name" do |greeter|
      greeter.greet
    end
  end

  let(:app) { SinatraAppWithDependor }

  it "uses the injected objects to generate a response" do
    get "/hello/foo"

    last_response.body.should == "Hello, foo!"
  end
end
