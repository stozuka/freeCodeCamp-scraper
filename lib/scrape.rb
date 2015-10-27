require_relative './freeCodeCamp'

class SiteScraper
  include FreeCodeCamp

  def freecodecamp_print
    get_data.each do |course, date|
      puts "#{course}, #{date}"
    end
  end
end
