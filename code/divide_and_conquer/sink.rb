require 'ffi-rzmq'

ctx = ZMQ::Context.new
receiver = ctx.socket ZMQ::PULL
receiver.bind 'tcp://*:1338'

receiver.recv_string ''
tstart = Time.now

100.times do |task_nbr|
  receiver.recv_string ''
  $stdout << ((task_nbr % 10 == 0) ? ':' : '.')
  $stdout.flush
end

tend = Time.now
total_msec = (tend-tstart) * 1000
puts "Total elapsed time: #{total_msec} msec"
