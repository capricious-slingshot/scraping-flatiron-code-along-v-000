require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

  def get_page
    html = open('http://learn-co-curriculum.github.io/site-for-scraping/courses')
    Nokogiri::HTML(html)
  end

  def get_courses
    doc = get_page
    binding.pry
    title = doc.css(".post h2").text #h2
    # schedule = doc.css(".date.text") #.date
    # description = doc.css(".post") #p
    #atricle.post.h2 - title
    #atricle.post.date - schedule
    #atricle.post.p - description
  end

end
