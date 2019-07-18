# Et c'est parti ! Appel des gems
require 'nokogiri'
require 'open-uri'

def get_symbols #crée un tableau de symboles de crypto
    symbols = []
  doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    doc.xpath('//td[3]').each do |node|
      symbols << node.text
    end
    return symbols
end

def get_currency
    currency = []
    doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
        doc.xpath('//td[5]/a').each do |node|
          currency << node.text
          
        end
    return currency
end

def create_hash
symbol = get_symbols
currency = get_currency
my_ash = Hash[symbol.zip currency]
puts my_ash
end

create_hash