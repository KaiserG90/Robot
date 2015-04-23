require './table.rb'

#needed for deg to rad conversion
class Numeric
  def to_rad
    self * Math::PI / 180 
  end
end

#Robot is an implementation of the generic Piece.
class Robot < Piece
	def initialize
		@piece_type = 'Robot'
	end

	def move
		check_on_table_exception
		new_x = @x + Math.cos(facing_degrees.to_rad).round(0)
		new_y = @y + Math.sin(facing_degrees.to_rad).round(0)
		@table.admissible_place_for(new_x,new_y)
		@x = new_x
		@y = new_y 
	end

	def right
		check_on_table_exception
		new_degree = (@facing_degrees+90)%360 
		set_facing(new_degree)
	end

	def left
		check_on_table_exception
		new_degree = (@facing_degrees-90)%360 
		set_facing(new_degree)
	end

	#set facing of the robot. Input can be a direction(string) or an angle(integer)
	private
	def set_facing(par)
		if par.is_a? Integer
			@facing_degrees = par
			case par
				when 0 then @facing = "East"
				when 90 then @facing = "North"
				when 180 then @facing = "West"
				when 270 then @facing = "South"
				else
					raise ArgumentError, "Wrong facing parameter. Be sure to use a valid angle"
			end 
		elsif par.is_a? String
			@facing = par
			case par.downcase
			 	when /^e/ then @facing_degree = 0
			 	when /^w/ then @facing_degree = 180
			 	when /^n/ then @facing_degree = 90
				when /^s/ then @facing_degree = 270
				else
					raise ArgumentError, "Wrong facing parameter. Be sure to use a valid direction"
			end
		end
	end

	def to_s
		"#{@x},#{@y},#{@facing}"
	end
end
