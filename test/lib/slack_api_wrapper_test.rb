require 'test_helper'

describe SlackApiWrapper do

  describe "Testing self.listChannels()" do
    it "Can get a list of channels" do
      VCR.use_cassette("slack") do
      channels = SlackApiWrapper.listChannels
        channels.each do |channel|
          channel.must_be_instance_of Channel
        end
      end
    end

    it "will return empty array with bad token" do

    end
  end

  describe "Get a channel" do
    it "Can get a channel given a valid channel id" do
      VCR.use_cassette("slack") do
      channel = SlackApiWrapper.getChannel("C396CPYBG")
      channel.class.must_equal Channel
      end
    end

    it "Returns false for an invalid channel id" do
      VCR.use_cassette("slack") do
        channel = SlackApiWrapper.getChannel("NoChannel")
        
      end
    end
  end


  describe "Send message" do
    it "Can send a message to a valid channel" do
    end

    it "Returns false when sending message fails" do
    end

    it "Requires a channel and a message" do
    end
  end
end
