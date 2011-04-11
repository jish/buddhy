require 'buddhy/config'
require 'buddhy/bot'
require 'buddhy/connection'

require 'buddhy/plugins/le_truc'
require 'buddhy/plugins/bart_departures'

config     = Buddhy::Config.load
bot        = Buddhy::Bot.new(config.nick, config.name)
connection = Buddhy::Connection.open(config.server)
connection.join_channel(bot, config.channel)

connection.listen(/hello/) do |msg|
  connection.say "hello #{msg.nick}"
end

connection.listen(/who is buddhy/i) do
  connection.say("I'm a bot. https://github.com/jish/buddhy")
end

connection.listen(/le\s?truc/i) do
  result = Buddhy::Plugins::LeTruc.execute
  connection.say result
end

connection.listen(/bart/i) do
  departures = Buddhy::Plugins::BartDepartures.execute

  connection.say "Upcoming departures for the powell street station:"
  departures.each do |departure|
    connection.say departure
  end
end

connection.listen!
