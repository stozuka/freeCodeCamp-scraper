require 'open-uri'
require 'nokogiri'

module FreeCodeCamp
  @course_date = []

  # crawl the site, and get the name of completed courses and its date
  def get_data
    url = "http://freecodecamp.com/#{ARGV[0]}"

    doc = Nokogiri::HTML(open(url))

    course_completed = doc.xpath("//td[@class='col-xs-4']/text()").to_a
    date_completed = doc.xpath("//td[@class='col-xs-2']/text()").to_a

    @course_date = course_completed.zip(date_completed)
  end

  # output the result into a file
  def file_output
    File.open('output_spec.txt', 'w') do |file|
      @course_date.each do |course, date|
        file.write("#{course}, #{date}\n")
      end
    end
  end
end
