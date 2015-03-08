require "test_helper"
require "models/user"

describe "User" do
  include Rack::Test::Methods

  def app
    API::App
  end

  describe "signing up" do
    before do
      post "/users", user:  {
        handler: "dnmacon",
        name: "Dan Macon",
        password: "pass-000"
      }
    end

    it "creates a user" do
      last_response.status.must_equal 201
    end

    it "shows the handler" do
      last_response.body.must_include "dnmacon"
    end

    it "shows the name" do
      last_response.body.must_include "Dan Macon"
    end
  end
end
