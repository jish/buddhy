module Buddhy
  class Message

    def initialize(data)
      @data = data
    end

    def nick
      (match = @data.match(/^:(.*)!/)) && match[1]
    end

    def text
      @data.split(':').last
    end

  end
end
