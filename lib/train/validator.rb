module Train
	module Validator

		MAX_SPEED = 110
		STATION_RANGE = (1..100)

		def valid? *args
			clear_error!

			args.each do |validator_name|
				send "check_#{validator_name}!"
			end

			@error.nil? ? true : false
		end

		def clear_error!
			@error = nil
		end

		def check_station_range!
			@error = "Поезд не может начать движение, потому что номер станции должен быть представлен в виде целого числа от 1 до 100." unless @engine.station.instance_of?(Integer) && STATION_RANGE === @engine.station
		end

		def check_current_station!
			@error = "Поезд не может начать движение, потому что вы уже находитесь на станции номер #{@engine.station}. Пожалуйста, выберите другой номер станции." if @engine.current_station == @engine.station
		end

		def check_max_speed!
			@error = "Поезд не может начать движение, потому что установленная скорость #{@engine.speed} км/ч превышает максимальную скорость поезда #{MAX_SPEED} км/ч." unless allowed_speed?
		end

		def check_less_zero_speed!
			@error = "Поезд не может начать движение, потому что установленная скорость должна быть больше нуля." if @engine.speed <= 0
		end

		def allowed_speed?
			@engine.speed <= MAX_SPEED
		end

	end
end
