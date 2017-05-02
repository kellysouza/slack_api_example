
require 'test_helper'

describe HomepagesController do

  it "should get index" do
    VCR.use_cassette("slack") do
      get root_path
      must_respond_with :success
    end
  end

  it "should get new"  do
    VCR.use_cassette("slack") do
      get message_path("C557BP9QE")
      must_respond_with :success
    end
  end

  it "should post to create" do
    VCR.use_cassette("slack") do
      post create_message_path("C557BP9QE")
      params: {"message" => "Hello Jellybean!"}
      must_respond_with :success
      must_redirect_to root_path
    end
  end



end
