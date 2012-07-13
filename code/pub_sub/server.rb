require 'ffi-rzmq'

ctx = ZMQ::Context.new

publisher = ctx.socket ZMQ::PUB
publisher.bind 'tcp://*:1337'

loop do
  zipcode = rand(1_000) + 10_000
  temperature = rand(215) - 80
  relhumidity = rand(50) + 10

  update = "#{zipcode} #{temperature} #{relhumidity}"
  puts update

  publisher.send_string update
end
