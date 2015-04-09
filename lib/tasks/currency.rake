desc "Fetch currency"
task :fetch_currency => :environment do

  require 'nokogiri'
  require 'open-uri'

  url = "http://minfin.com.ua/currency/banks/usd/"
  doc = Nokogiri::HTML(open(url))


  title = doc.xpath("/html/body/div[2]/div[1]/div[2]/div[3]/a").text
  bank = doc.xpath("//*[@id='smTable']/tbody/tr/td[1]/a").text.scan(/[а-яА-ЯёЁ]+/)
  cost_buy = doc.xpath("//*[@id='smTable']/tbody/tr/td[2]").text.scan(/(\d+[,.]\d+)/)
  cost_sale = doc.xpath("//*[@id='smTable']/tbody/tr/td[4]").text.scan(/(\d+[,.]\d+)/)

  Currency.create(title: title, bank: bank, cost_buy: cost_buy, cost_sale: cost_sale)
end
