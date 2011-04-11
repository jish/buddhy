require 'bart/station'

module Buddhy
  module Plugins
    class BartDepartures

      def self.execute
        station = Bart::Station.new('powl')
        station.load_departures

        station.departures.map do |departure|
          "#{departure.destination.name}: " + 
          departure.estimates.map { |e| e.time.strftime("%I:%M") }.join(", ")
        end
      end

    end
  end
end
