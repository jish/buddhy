class TCPSocket < IPSocket

  def initialize
    @messages = []
  end

  def self.open(*args)
    new
  end

  def puts(message)
    @messages << message
  end

end
