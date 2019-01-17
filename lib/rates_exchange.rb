require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'
   
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   

def currency_name(page)
    name = page.xpath('//td[@class="text-left col-symbol"]/text()').to_a
    return name
end

def rate_values(page)
    values = page.xpath('//td[@class="no-wrap market-cap text-right"]/@data-usd').to_a
    return values
end


def array(city_name,email)
    array = [name.map! {|k| k.text}, values.map!{|k| k.text}].transpose.map! {|k| [k].to_h}
    return array
end



def perform(page)
   name = currency_name(page)
   values = rate_values(page)
   array = array(name,values)

end

print perform(page)