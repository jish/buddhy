require 'test_helper'
require 'buddhy/bot'

class BotTest < MiniTest::Unit::TestCase

  def test_should_initialize
    bot = Buddhy::Bot.new('nick', 'Name')
    assert_equal('nick', bot.nick)
    assert_equal('Name', bot.name)
  end

end
