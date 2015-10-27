require_relative 'fcp_modules/fcp_module'

class FcpCompleted
  include FCPCompleted

  def initialize(name)
    @data = get_data(name)
  end

  def fcp_print
    @data.each do |course, date|
      puts "#{course}, #{date}"
    end
  end
end
