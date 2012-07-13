require 'ffi-rzmq'

ctx = ZMQ::Context.new

sock = ctx.socket ZMQ::REQ
sock.connect('tcp://127.0.0.1:1337')

sock.send_string 'BarCampers', ZMQ::NOBLOCK

puts 'Message Sent'

sock.recv_string(msg = '')

puts msg

