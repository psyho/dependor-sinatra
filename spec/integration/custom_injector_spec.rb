require 'spec_helper'

class AppWithCustomInjector < Sinatra::Base
  injector{ |o| MyCustomInjector.new(o) }

  get "/hello" do |current_user|
    "Hello, #{current_user}!"
  end
end

class MyCustomInjector < Dependor::Sinatra::DefaultInjector
  def current_user
    "John"
  end
end

describe "providing a custom injector" do
  let(:app) { AppWithCustomInjector }

  it "injects objects from the injector" do
    get "/hello"

    last_response.body.should == "Hello, John!"
  end
end
