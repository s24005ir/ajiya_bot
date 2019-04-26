require 'http'
require 'json'
require 'nokogiri'
require 'open-uri'

url=URI::parse('http://ajiya1.com/')
page=url.read()
doc=Nokogiri::HTML::parse(page)

ajiya={タイトル:'.rpwe-title'}
ajiya.each do |key,value|
    puts("[#{key}]")
    tmp=doc.css('.rpwe-block').css(value)
    el=doc.css('.rpwe-block').css('h3')
    if(tmp.size===0)then
        puts("今日はお休みです")
    else
        tmp.each do |item|
            s="#{item.content}"
            puts s
            token='xoxb-233137244498-532173993376-IN6zzq9F3pTMYueOGIp2STBV'
            response=HTTP.post("https://slack.com/api/chat.postMessage",params:{
            token:token,
            channel:"DFNSTFKNE",
            text:s,
            as_user: true
        })
        puts JSON.pretty_generate(JSON.parse(response.body))
        end
    end
    puts(" ")
end