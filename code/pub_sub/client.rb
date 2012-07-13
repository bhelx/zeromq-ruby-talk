require 'ffi-rzmq'

ctx = ZMQ::Context.new

subscriber = ctx.socket ZMQ::SUB
subscriber.connect 'tcp://127.0.0.1:1337'

zip = '10001'
subscriber.setsockopt(ZMQ::SUBSCRIBE, zip) # subscribe to zip code

sample_size = 100
total_temp = 0
sample_size.times do
  subscriber.recv_string(msg = '')

  zipcode, temperature, relhumidity = msg.split.map(&:to_i)
  total_temp += temperature
end

puts "Average temperature for zipcode '#{zip}' was #{total_temp / sample_size}F"
