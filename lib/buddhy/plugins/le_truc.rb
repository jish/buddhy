require 'twitter'

module Buddhy
  module Plugins
    class LeTruc

      def self.execute
        "le truc's most recent tweet: " +
        Twitter.user_timeline('eatletruc').first.text
      end

    end
  end
end
