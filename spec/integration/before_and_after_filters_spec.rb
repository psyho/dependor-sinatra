require 'spec_helper'

class SetsCurrentUser
  takes :params

  def set(name)
    params[:current_user] = name
  end
end

class AppWithFilters < Sinatra::Base
  set :environment, :test

  before "/hello" do |sets_current_user|
    sets_current_user.set("John")
  end

  after "/bye" do |sets_current_user|
    sets_current_user.set("Betty")
    body "After bye, #{params[:current_user]}"
  end

  get "/hello" do
    body "Hello, #{params[:current_user]}"
  end

  get "/bye" do
    body "Bye"
  end
end

describe "Before and after filters" do
  let(:app) { AppWithFilters }

  it "injects dependencies into before filters" do

    get "/hello"

    last_response.body.should == "Hello, John"
  end

  it "injects dependencies into after filters" do
    get "/bye"

    last_response.body.should == "After bye, Betty"
  end
end
