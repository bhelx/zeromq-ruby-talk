require 'ffi-rzmq'

ctx = ZMQ::Context.new

sock = ctx.socket ZMQ::REQ
sock.connect 'tcp://127.0.0.1:1337'

delay = ARGV[0].to_i
counter = 0

loop do
  sock.send_string ARGV[1]
  sock.recv_string(msg = '')

  time = Time.now.strftime('%H:%M:%S')

  puts "#{counter} #{time}: #{msg}"
  counter += 1

  sleep delay
end


