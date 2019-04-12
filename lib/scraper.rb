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
    doc.css(".post").each do |post|
      title = post.css("h2").text
      schedule = doc.css(".date").text
      description = doc.css("p").text

      Course.new(title, schedule, description)
    end
  end

  def make_courses
    
  end

end
