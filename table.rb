require 'set'

class TableError < StandardError; end

class Table
	attr_reader :width
	attr_reader :height
	attr_reader :pieces

	def initialize(width=5,height=5)
		@width = width
		@height = height
		@pieces = Set.new
	end

	def add(piece)
		@pieces.add(piece) if admissible_place_for(piece.x,piece.y)
	end

	def admissible_place_for(new_piece_x, new_piece_y)
		if new_piece_x >= self.width || new_piece_y >= self.height || new_piece_x < 0 || new_piece_y < 0
			raise TableError, "This position is not available, I might fall and break apart" 
		end

		@pieces.each do |piece|
			if new_piece_x == piece.x && new_piece_y == piece.y
				raise TableError, "This position is already occupied"
			end
		end
	end 

	def remove(piece)
		@pieces.delete(piece) 
		@pieces.each { |piece| puts piece }
	end

	def report
		@pieces.each { |piece| puts piece }
	end
end

# generic "abstract piece".
class Piece 
	attr_reader :x
	attr_reader :y
	attr_reader :facing
	attr_reader :facing_degrees

	def initialize
		raise "This is an abstract piece, implement your own"
	end

	def place_on_table(table,x=0,y=0,facing="north")
		@on_table = true
		@table = table
		@x = x
		@y = y
		@facing = facing
		@facing_degrees = set_facing(facing)
		table.add(self)
	end

	protected
	def check_on_table_exception
		raise TableError, "Robot is not on table" unless @on_table
	end

end