module Train
	module SpeedController

		def gain! speed
			@speed += speed
			puts "Увеличение скорости: установлена скорость #{@speed} км/ч."
		end

		def reduce! speed
			@speed -= speed
			puts "Уменьшение скорости: установлена скорость #{@speed} км/ч."
		end

	end
end
