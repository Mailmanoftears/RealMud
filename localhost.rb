require 'webrick'
#open uri is for reading
include WEBrick

puts 'manual input ignored... continuing'
server = HTTPServer.new(Port:8000)
server.mount_proc '/' do |request, response|
  response.body = 'Connection established'
end
server.mount_proc '/local_data' do |request, response|
  response.body = 'Local data coming soon...'
end

trap 'INT' do server.shutdown end

server.start
