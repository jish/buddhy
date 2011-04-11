require 'socket'
require 'buddhy/listener'

module Buddhy
  class Connection

    def initialize
      @listening = false
      @listener = Listener.new
    end

    def self.open(server)
      new.connect(server)
    end

    def connect(server)
      @socket = TCPSocket.open(server, 6667)
      @listener.register(/PING/) { @socket.puts "PONG" }
      self
    end

    def join_channel(bot, channel)
      login(bot.nick, bot.name)
      join(channel)
    end

    def login(nick, name)
      @socket.puts "USER #{nick} 0 * #{name}" # no idea what `0 *` means
      @socket.puts "NICK #{nick}"
    end

    def join(channel)
      @channel = channel
      @socket.puts "JOIN #{channel}"
    end

    def close
      @socket.puts "PART #{@channel}"
      @socket.puts "QUIT"
    end

    def say(msg)
      @socket.puts "PRIVMSG #{@channel} :#{msg}"
    end

    def listen(pattern, &block)
      @listener.register(pattern, &block)
    end

    def listen!
      setup_trap
      start_listening
    end

    private

    def setup_trap
      Kernel.trap("INT") do
        @socket.puts "PART #{@channel} :parting"
        @socket.puts "QUIT"
        @shutdown = true
      end
    end

    def start_listening
      until @shutdown || @socket.eof?
        msg = @socket.gets
        puts msg

        @listener.execute(msg)
      end
    end

  end
end
