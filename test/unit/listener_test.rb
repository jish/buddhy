require 'test_helper'
require 'buddhy/listener'

class ListenerTest < MiniTest::Unit::TestCase

  def test_register
    listener = Buddhy::Listener.new
    @called = false
    result = listener.register(/foo/) { 'bar' }

    # Is this leaking too many implementation details? =/
    assert_equal(/foo/, result[:pattern])
    assert_equal('bar', result[:block].call)
  end

  def test_execute
    listener = Buddhy::Listener.new
    @called = false
    listener.register(/foo/) { @called = true }

    listener.execute('this is a random line')
    assert !@called

    listener.execute('this is a line with foo in it')
    assert @called
  end

  def test_shuould_call_with_a_message_object
    listener = Buddhy::Listener.new
    listener.register(/foo/) { |msg| assert msg.is_a?(Buddhy::Message) }
    listener.execute('foo')
  end

end
