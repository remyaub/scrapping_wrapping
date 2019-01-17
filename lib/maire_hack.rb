require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'
   
page = "http://annuaire-des-mairies.com/val-d-oise.html"   
page2 = "http://annuaire-des-mairies.com/95/livilliers.html"

def get_townhall_urls(page)
    towns_urls_array = [] #initie une tableau vide
    urls = page.xpath('//a[@class="lientxt"]/@href') #path pour aller chercher chaque url
    urls.each do |url|
    towns_urls_array << "http://annuaire-des-mairies.com#{url}" #pour chaque url mais les dans le tableau puis ajoute le string en amont
    end
    return towns_urls_array
end

def get_email_from(town_url_string)#methode pour chercher chaque email
    town_page = Nokogiri::HTML(open(town_url_string)) #initie une demande Nokogiri.
    town_email = town_page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]') # path pour aller chercher l'email depuis l'url
    return town_email.text
end

def townhall_name(page) #chercher le nom de la ville
    town_page = Nokogiri::HTML(open(page))
    name = town_page.xpath('//a[@class="lientxt"]/text()') 
    return name.to_a
end


def all_mails(page_url_string) #boucle qui permet d'aller chercher l'email sur chaque URL et les retourné dans un hash
    nokogiri_page =  Nokogiri::HTML(open(page_url_string))

    town_names_array = townhall_name(page_url_string)
    email_from_city_name_hash = {}

    get_townhall_urls(nokogiri_page).zip(town_names_array).each do |town_url, town_name| 
        email_from_city_name_hash[town_name.to_s.to_sym] = town_email
    end

    return email_from_city_name_hash
end

puts all_mails(page)
