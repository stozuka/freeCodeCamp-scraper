require 'open-uri'
require 'nokogiri'

module FCPCompleted
  @course_date = []
  URL ||= "http://freecodecamp.com/"
  COURSE_XPATH ||= "//td[@class='col-xs-4']/text()"
  DATE_XPATH ||= "//td[@class='col-xs-2']/text()"

  # crawl the site, and get the name of completed courses and its date
  def get_data(name)
    doc = Nokogiri::HTML(open(URL + name))

    course_completed = doc.xpath(COURSE_XPATH).to_a
    date_completed = doc.xpath(DATE_XPATH).to_a

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
