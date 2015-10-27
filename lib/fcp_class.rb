require_relative 'fcp_modules/fcp_module'

class SiteScraper
  include FreeCodeCamp

  def initialize(name)
    @data = get_data(name)
  end

  def freecodecamp_print
    @data.each do |course, date|
      puts "#{course}, #{date}"
    end
  end
end
