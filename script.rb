require 'mechanize'

def exit_prog
  puts 'No handle'
  exit
end

begin
  handle = ARGV[0]
  puts 'Please specify a handle' unless handle
  until options.include? handle
    puts 'Enter a handle'
    handle = eval gets.chomp.downcase
    break if options.include? handle
  end
  agent = Mechanize.new
  page = agent.get "http://codeforces.com/submissions/#{handle}"
  code = page.code
  exit_prog if code == 302
rescue SocketError
  puts 'Please connect to internet.'
end
