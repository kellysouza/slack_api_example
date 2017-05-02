require 'httparty'


class SlackApiWrapper
  BASE_URL = "https://api.slack.com/api/"
  TOKEN = ENV["SLACK_TOKEN"]

  def self.listChannels(token = nil)
   token ||= TOKEN
   url = BASE_URL + "channels.list?" + "token=#{ token }"
   response = HTTParty.get(url)

   channels = []
  #  raise
  if response["channels"]
   response["channels"].each do |channel|
     id = channel["id"]
     name = channel["name"]
     channels << Channel.new(name, id)
    end
  end
  #  raise
   return channels
  end

  def self.sendMessage(channel_id, text, token = nil)

    token ||= TOKEN
    # url = BASE_URL + "chat.postMessage?" + "token=#{ token }&" + "channel=#{channel_id}&" + "text=#{text}"
    # # raise
    # response = HTTParty.get(url)
    #
    # return response["ok"]

    url = BASE_URL + "chat.postMessage?" + "token=#{token}"
    response = HTTParty.post(url,
      body: {
        "text" => "#{text}",
        "channel" => "#{channel_id}",
        "username" => "MonkeyBot",
        "icon_emoji" => ":monkey:",
        "as_user" => "false"
      },
      headers: {'Content-Type' => 'application/x-www-form-urlencoded'}
      )
    return response["ok"]
  end

  def self.getChannel(channel_id)
    url = BASE_URL + "channels.info?" + "token=#{TOKEN}&" + "channel=#{channel_id}"
    response = HTTParty.get(url)

    return Channel.new(response["channel"]["name"], response["channel"]["id"])
  end


end
