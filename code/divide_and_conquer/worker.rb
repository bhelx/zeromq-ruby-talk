require 'ffi-rzmq'

ctx = ZMQ::Context.new

receiver = ctx.socket ZMQ::PULL
receiver.connect 'tcp://127.0.0.1:1337'

sender = ctx.socket ZMQ::PUSH
sender.connect 'tcp://127.0.0.1:1338'

loop do
  receiver.recv_string(msec = '')

  $stdout << "#{msec}."
  $stdout.flush

  sleep(msec.to_f / 1000)

  sender.send_string("")
end
