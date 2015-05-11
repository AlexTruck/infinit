namespace :currency do

  desc "Fetch currency"
  task fetch: :environment do
    require 'nokogiri'
    require 'open-uri'

    %w[
      http://minfin.com.ua/currency/banks/usd/
      http://minfin.com.ua/currency/banks/eur/
      http://minfin.com.ua/currency/banks/rub/
      http://minfin.com.ua/currency/banks/gbp/
      http://minfin.com.ua/currency/banks/sek/
      http://minfin.com.ua/currency/banks/pln/
      http://minfin.com.ua/currency/banks/nok/
      http://minfin.com.ua/currency/banks/jpy/
      http://minfin.com.ua/currency/banks/dkk/
      http://minfin.com.ua/currency/banks/cny/
      http://minfin.com.ua/currency/banks/cad/
      http://minfin.com.ua/currency/banks/aud/
      http://minfin.com.ua/currency/banks/byr/
      http://minfin.com.ua/currency/banks/huf/
      http://minfin.com.ua/currency/banks/czk/
      http://minfin.com.ua/currency/banks/ils/
    ].each do |url|

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
  end