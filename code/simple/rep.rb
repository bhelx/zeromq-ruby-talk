require 'ffi-rzmq'

ctx = ZMQ::Context.new

sock = ctx.socket ZMQ::REP
sock.bind 'tcp://*:1337'

loop do
  sock.recv_string(msg = '')

  puts "Client: #{msg}"
  sock.send_string "Ohai #{msg}"
end
