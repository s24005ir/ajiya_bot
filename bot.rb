require 'http'
require 'json'
require 'slack'

Slack.configure do |config|
    config.token = ''
    # xoxb-233137244498-532173993376-IN6zzq9F3pTMYueOGIp2STBV
end
  
text = "あじやテスト"
Slack.chat_postMessage(text: text, channel: 'DFNSTFKNE')