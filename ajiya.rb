require 'http'
require 'json'
require 'nokogiri'
require 'open-uri'

ajiya_uri = 'http://ajiya1.com/'
ajiya_page = URI::parse(ajiya_uri).read()
ajiya_doc = Nokogiri::HTML::parse(ajiya_page)

dairy_uri = ajiya_doc.css('.rpwe-block').css('.rpwe-title').css('a')[0][:href]
# puts dairy_uri

dairy_page = URI::parse(dairy_uri).read()
dairy_doc = Nokogiri::HTML::parse(dairy_page)

bento = dairy_doc.css('.entry-content')
bento_str = bento.to_html.gsub(%r{</?[^>]+?>},'').strip.gsub('●','').chomp

puts bento_str

    # if(tmp.size===0)then
    #     puts("今日はお休みです")
    # else
    #     tmp.each do |item|
    #         s="#{item.content}"
    #         puts s
    #         token='xoxb-233137244498-532173993376-IN6zzq9F3pTMYueOGIp2STBV'
    #         response=HTTP.post("https://slack.com/api/chat.postMessage",params:{
    #         token:token,
    #         channel:"DFNSTFKNE",
    #         text:s,
    #         as_user: true
    #     })
    #     puts JSON.pretty_generate(JSON.parse(response.body))
    #     end
    # end
    # puts(" ")