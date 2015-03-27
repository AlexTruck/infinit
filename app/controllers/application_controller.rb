require 'open-uri'
require 'nokogiri'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  doc = Nokogiri::HTML(open("http://kurs.com.ua/"))

  def show_rate
    @rate = []
      doc.css("#main_table").each do |item|
        @rate << item.css("#main_table")
        puts @rate
    end
  end
end