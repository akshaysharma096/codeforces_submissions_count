require 'mechanize'


options = ["google", "form"]
begin
  login_option = ARGV[0]
  puts 'Invalid option' unless login_option
  until options.include? login_option
    puts 'Enter option: '
    login_option = eval gets.chomp.downcase
    break if options.include? login_option
  end
  agent = Mechanize.new
  page = agent.get 'http://codeforces.com/enter'
  if login_option.eql? options[0]
    google_page = page.link_with(:class => 'useGmailLink').click
    puts google_page
  end
rescue SocketError
  puts 'Please connect to internet.'
end
