require 'ffi-rzmq'

ctx = ZMQ::Context.new

sender = ctx.socket ZMQ::PUSH
sender.bind 'tcp://*:1337'

puts "Press enter when the workers are ready"
$stdin.read(1)
puts "Sending tasks to workers"

sender.send_string '0' # start

total_msec = 0
100.times do
  workload = rand(100) + 1
  total_msec += workload
  $stdout << "#{workload}."
  sender.send_string(workload.to_s)
end


puts "\nTotal expected cost: #{total_msec} msec"

ctx.terminate
