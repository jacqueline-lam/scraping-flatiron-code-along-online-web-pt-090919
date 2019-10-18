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
      course.schedule = post.css(".date").text
      course.description = post.css("p").text
    end
  end


  def print_courses
    #calls on .make_courses
    self.make_courses
    # iterate over all courses that get created to 
    # put out a list of course offerings
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
  
end

Scraper.new.print_courses
- OUTPUT- 
Title: Web Development Immersive
  Schedule: Full-Time
  Description: An intensive, Ruby and Javascript course that teaches the skillsnecessary to start a career as a full-stack software developer.
Title: iOS Development Immersive
  Schedule: Full-Time
  Description: An in-depth course on the iOS ecosystem that begins with Objective-C and Swift, explores popular iOS frameworks, and culminates in a client project with a local tech company.
Title: NYC Web Development Fellowship
  Schedule: Full-Time
  Description: In partnership with New York City, this free program trains NYC residents without college degrees for careers in web development.
Title: Introduction to Front-End Development
  Schedule: Part-Time
  Description: An introductory course designed to teach students to launch fully responsive websites from scratch using HTML, CSS, JavaScript, and jQuery.
Title: Android for Developers
  Schedule: Part-Time
  Description: An advanced course that trains people with at least one year of software development experience in the skills and tools necessary to work as Android Developers.
Title: Introduction to Data Science
  Schedule: Part-Time
  Description: A part-time course that provides students with the skills they need to make data meaningful.
Title: DIY Electronics - Build Your Own Sound Generating Circuit
  Schedule: WORKSHOP
  Description: This Beginners workshop teaches students the fundamentals of electricty, reading circuit diagrams, soldering, and how to build an Atari Punk Console (sound generating circuit) from scratch.
