require_relative 'speed_controller'

module Train
	class Engine

		include SpeedController

		attr_reader :current_station
		attr_accessor :station
		attr_accessor :speed

		def initialize
			@current_station = 1
			@speed = 0
		end

		def move station
			if station > @current_station
				forward station
			else
				backward station
			end

			set_current_station! station
			puts "Остановка. Текущая станция номер #{@current_station}."
		end


		private

		def forward station
			puts "Начало движения. Поезд едет вперёд со скоростью #{@speed} км/ч."

			@current_station.upto(station) do |station_number|
				sleep 1
				puts "Станция номер #{station_number}."
			end
		end

		def backward station
			puts "Начало движения. Поезд едет назад со скоростью #{@speed} км/ч."

			@current_station.downto(station) do |station_number|
				sleep 1
				puts "Станция номер #{station_number}."
			end
		end

		def set_current_station! station
			@current_station = station
		end

	end
end
