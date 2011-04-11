require 'test_helper'
require 'buddhy/message'

class MessageTest < MiniTest::Unit::TestCase

  def test_should_detect_nick
    data = ':nick!~nick@example.com PRIVMSG #buddhy :hello'
    message = Buddhy::Message.new(data)
    assert_equal('nick', message.nick)
  end

  def test_should_detect_text
    data = ':nick!~nick@example.com PRIVMSG #buddhy :hello'
    message = Buddhy::Message.new(data)
    assert_equal('hello', message.text)
  end

end
