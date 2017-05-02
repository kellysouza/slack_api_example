#require "slack_api_wrapper"
#require "channel"



class HomepagesController < ApplicationController
  def index
    @channels = SlackApiWrapper.listChannels
    # raise
  end

  def create
    it_worked = SlackApiWrapper.sendMessage(params[:channel], params[:message])
    if it_worked
      redirect_to root_path
    end
  end

  def new
    #from url
    @channel_id = params[:channel]
    @channel = SlackApiWrapper.getChannel(params[:channel])

    @channel_id = params[:channel]
    # @channel_name = SlackApiWrapper.getChannel(params[:channel][:name])
  end

  def find_name

  end

  
end
