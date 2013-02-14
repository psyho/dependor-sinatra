require 'spec_helper'

describe "Injecting Sinatra provided data" do
  class Greeter
    takes :params

    def greet
      "Hello, #{params[:name]}!"
    end
  end

  class SinatraAppWithDependor < Sinatra::Base
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
