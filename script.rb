require 'mechanize'

def exit_prog
  puts 'No handle'
  exit
end

begin
  handle = ARGV[0]
  puts 'Please specify a handle' unless handle
  until handle
    puts 'Enter a handle'
    handle = gets.chomp.downcase
    break if handle
  end
  handle_link = "http://codeforces.com/submissions/#{handle}/"
  agent = Mechanize.new
  agent.redirect_ok = !1
  page = agent.get handle_link
  exit_prog if page.code == "302"
  problem_count ||= page.css('span.verdict-accepted').size
  counter=page.css('span.page-index > a')[-1].text.to_i
  page_count = 2
  page_count.upto(counter).each do |page_count|
    new_page = handle_link+"page/#{page_count}"
    page = agent.get new_page
    problem_count += page.css('span.verdict-accepted').size
  end
  puts "Your successful problem submissions are: #{problem_count}"
rescue NoMethodError
  puts 'Error'
rescue SocketError
  puts 'Please connect to internet.'
end
