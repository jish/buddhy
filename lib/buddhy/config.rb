require 'yaml'

module Buddhy
  class Config

    attr_accessor :nick, :name, :server, :channel

    def self.load
      new.read_yaml
    end

    def read_yaml
      root = File.expand_path('../../..', __FILE__)
      file = File.join(root, 'config', 'buddhy.yml')
      hash = YAML.load(File.read(file))

      @nick    = hash[:nick]
      @name    = hash[:name]
      @server  = hash[:server]
      @channel = hash[:channel]

      self
    end

  end
end
