class Gear 
	attr_reader :chainring, :cog, :wheel
	def initialize(args)
		@chainring 	= args[:chainring]
		@cog 		= args[:cog]
		@wheel		= args[:wheel]
	end	

	def ratio 
		chainring/ cog.to_f
	end

	def gear_inches
		#tire goes around rim twice for diameter
		ratio * diameter
	end

	def diameter
		wheel.diameter
	end


	Wheel = Struct.new(:rim, :tire) do 
		def diameter
			rim + (tire * 2 )
		end
	end
end

class Wheel

	attr_reader :rim, :tire

	def initialize(rim,tire)
		@rim = rim 
		@tire = tire
	end

	def diameter
		rim + (tire * 2 )
	end

	def circumfrence
		Math::PI * diameter
	end

end




@wheel = Wheel.new(26,1.5)

puts @wheel.circumfrence

puts Gear.new(chainring: 52, cog: 11, wheel: @wheel).gear_inches

puts Gear.new(chainring: 52, cog: 11).ratio



