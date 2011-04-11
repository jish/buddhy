require 'test_helper'
require 'buddhy/connection'
require 'mock/socket' # must be required after 'buddhy/connection'

class ConnectionTest < MiniTest::Unit::TestCase

  def test_login
    connection = Buddhy::Connection.open('example.com')
    result = connection.login('nick', 'Name')

    assert_equal(['USER nick 0 * Name', 'NICK nick'], result.pop(2))
  end

  def test_join
    connection = Buddhy::Connection.open('example.com')
    result = connection.join('#channel')

    assert_equal(['JOIN #channel'], result.pop(1))
  end

  def test_close
    connection = Buddhy::Connection.open('example.com')
    connection.join('#channel')
    result = connection.close

    assert_equal(['PART #channel', 'QUIT'], result.pop(2))
  end

  def test_say
    connection = Buddhy::Connection.open('example.com')
    connection.join('#channel')
    result = connection.say('hello')

    assert_equal(['PRIVMSG #channel :hello'], result.pop(1))
  end

  def test_listen
    connection = Buddhy::Connection.new
    assert connection.listen(/foo/) { 'bar' }
  end

end
