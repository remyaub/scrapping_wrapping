def email (page2)
    email = page2.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').to_a
    return email
end


def iteration (page2)
    name.each do |name|
        puts "http://annuaire-des-mairies.com/95/#{name}.html"
=end

def get_townhall_email(page2)
    email = page2.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
    return email
end