require 'open-uri'
require 'nokogiri'

class RatesController < ActionController::Base

  def index
  doc = Nokogiri::HTML(open("http://kurs.com.ua/"))

  @rate = []
  doc.css("tr.regular").each do |item|
    @rate << item.text
  end
  end
end