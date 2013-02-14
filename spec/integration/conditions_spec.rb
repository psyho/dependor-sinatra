require 'spec_helper'

class ChecksIfAdmin
  takes :session

  def admin?
    !!session[:admin]
  end
end

class AppWithConditions < Sinatra::Base
  set(:admin_user) do |is_admin|
    condition do |checks_if_admin|
      checks_if_admin.admin? == is_admin
    end
  end

  set :environment, :test
  enable :sessions

  post "/login" do
    session[:admin] = true
    "Hello!"
  end

  get "/admin", admin_user: true do
    "Hello admin"
  end

  get "/admin", admin_user: false do
    "Bye intruder"
  end
end

describe "conditions" do
  let(:app) { AppWithConditions }

  it "injects objects into the conditions" do
    post "/login"
    get "/admin"

    last_response.body.should == "Hello admin"
  end
end
