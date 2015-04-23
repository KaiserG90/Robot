require_relative 'robot.rb'

def main
	#create table and robot objects
	@table = Table.new
	@robot = Robot.new

	#place a new robot on the table
	def place(cmd)
		pars = cmd.split(',')
		x = pars[0].to_i
		y = pars[1].to_i
		f = pars[2]
		@robot.place_on_table(@table,x,y,f)
	end

	# read standard input
	skip_iteration = false
	ARGV.each_with_index do |cmd,index|
		unless skip_iteration
			case cmd.downcase
				when 'move' then @robot.move
				when 'left' then @robot.left
				when 'right' then @robot.right
				when 'report' then @table.report
				when /place/
					raise ArgumentError, "Command is not valid" unless ARGV[index+1].include? ','
					place(ARGV[index+1])
					skip_iteration = true
				else
					raise ArgumentError, "Command is not valid"
			end
		else
			skip_iteration = false
		end
	end
end

main