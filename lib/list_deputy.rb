require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'
   
page = Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=578&lang=fr"))   

def deputy_name(page)
    name = page.xpath('//*[@id="content"]/div[1]/ul[38]/li[1]/h2').to_a
    return name
end

=begindef rate_values(page)
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

=end

print deputy_name(page)