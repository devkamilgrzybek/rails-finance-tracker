require 'test_helper'

class ChatroomTest < ActiveSupport::TestCase
  def setup
    @chatroom = Chatroom.new(topic:"BTC")
  end

  test "valid topic?" do
    assert @chatroom.valid?
  end

end
