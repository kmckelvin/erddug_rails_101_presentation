require 'open-uri'
require 'nokogiri'

class Link < ActiveRecord::Base
  validates_presence_of :url
  paginates_per 4

  before_create :get_title
  
  def get_title
    doc = Nokogiri::HTML(open(self.url))
    self.title = doc.css('title').first.content
  end
end
