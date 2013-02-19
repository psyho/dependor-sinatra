require 'spec_helper'

class SomeDependency
  def foo(str)
    "foo - #{str}"
  end
end

class AppWithDependencyInjectionDisabled < Sinatra::Base
  set :environment, :test

  without_dependor do
    get %r{/bye/(\w+)} do |name|
      "bye - #{name}"
    end
  end

  get %r{/hello/(\w+)} do |some_dependency|
    name = params[:captures].first
    some_dependency.foo(name)
  end
end

describe "Disabling dependency injection using without_dependor" do
  let(:app) { AppWithDependencyInjectionDisabled }

  it "injects the actions that are outside of without_dependor block" do
    get "/hello/adam"

    last_response.body.should == "foo - adam"
  end

  it "does not try to inject dependencies within actions defined in without_dependor block" do
    get "/bye/adam"

    last_response.body.should == "bye - adam"
  end
end
