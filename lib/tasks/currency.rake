namespace :currency do

  desc "Fetch currency"
  task fetch: :environment do
    require 'nokogiri'
    require 'open-uri'

    url = "http://minfin.com.ua/currency/banks/usd/"
    doc = Nokogiri::HTML(open(url))

    title = doc.title
    banks_html = doc.css('#smTable .list tr')

    banks = banks_html.map do |bank|
      {
        name: bank.css('.mfcur-table-bankname').text.squish,
        buy:  bank.css('.mfm-pr0').first.text.squish,
        sale: bank.css('.mfm-pl0').first.text.squish
      }
    end

    Currency.create(title: title, banks_data: banks)
  end
end
