require 'buddhy/message'

module Buddhy
  class Listener

    def initialize
      @rules = []
    end

    def execute(line)
      @rules.each do |rule|
        if rule[:pattern].match(line)
          message = Message.new(line)
          return rule[:block].call(message)
        end
      end
    end

    def register(pattern, &block)
      @rules.push({ :pattern => pattern, :block => block }) && @rules.last
    end

  end
end
