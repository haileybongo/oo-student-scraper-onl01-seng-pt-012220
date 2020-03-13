require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
  
     students = []
    index = Nokogiri::HTML(open("https://learn-co-curriculum.github.io/student-scraper-test-page/"))
    
    
    #binding.pry
    
    student_cards = index.css("div.student-card")
    
    
    student_cards.each do |student|
      #student = {}
      name = index.css("h4.student-name").text
      location = index.css("p.student-location").text
      profile = index.css("div.student-card a").attribute("href").value
      student = {
        :name => name,
        :location => location,
        :profile_url => profile
         }
      students << student
      #student = {}
    end
    students 
    
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

# name = index.css("h4.student-name").first.text
# location = name = index.css("p.student-location").first.text
# profile_url = index.css("a").attribute("value").text

#index.css("div.student-card a").attribute("href").value