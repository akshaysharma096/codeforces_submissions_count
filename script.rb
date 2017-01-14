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
  handle_link = "http://codeforces.com/submissions/#{handle}"
  agent = Mechanize.new
  agent.redirect_ok = !1
  page = agent.get handle_link
  exit_prog if page.code == "302"
rescue SocketError
  puts 'Please connect to internet.'
end
