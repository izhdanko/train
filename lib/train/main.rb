require_relative 'engine'
require_relative 'validator'

module Train
	class Main

		include Validator

		def initialize
			@engine = Engine.new # Шаблон компоновщик.
		end

		def move station
			@engine.station = station

			if valid? :station_range, :current_station, :max_speed, :less_zero_speed
				@engine.move station # Шаблон делегирования.
			else
				puts @error
			end
		end

		def gain! speed
			@engine.gain! speed
		end

		def reduce! speed
			@engine.reduce! speed
		end

	end
end
