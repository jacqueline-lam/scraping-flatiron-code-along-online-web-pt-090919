require 'nokogiri'
require 'open-uri'
require 'pry'

# require Course class so that our Scraper can make new courses
# and give them attr scraped from web page
require_relative './course.rb'

class Scraper
  
  # Using Nokogiri and open-uri to grab the entire 
    # HTML document from the web page
  def get_page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    
    #doc.css(."post").each do |post|
    #   course = Course.new
    #   course.title = post.css("h2").text #e.g. Web Development Immersive
    #   course.schedule = post.css(".date").text #Full-Time
    #   course.description = post.css("p").text
    # end
  end


  # using CSS selector to grab all HTML elements that contain a course 
  def get_courses
      self.get_page.css(".post")
  end
  
  # instantiating Course objects and 
  # giving each course object the correct attributes scraped from page
  def make_courses
    self.get_courses.each do |post|
      course = Course.new
      course.title = post.css("h2").text
      course.schedule= post.css(".date")/text
      descriptoin = post.css("p").text
    end
  end
  
  It calls on .make_courses and then iterates over all of the courses that get created to puts out a list of course offerings. We gave you this freebie so that we can easily see how cool it is to scrape data and make real live Ruby objects with it.


  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
  
end


