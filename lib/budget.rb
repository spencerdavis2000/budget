require 'pry'
class Budget
	attr_accessor :result, :description, 
				  :amount, :matched_list, :totaled_list, 
				  :set_columns

	def initialize
		@description = ""
		@amount = ""
		@result = Hash.new {|k,v| k[v] = [] }
		@matched_list = Hash.new {|k,v| k[v] = [] }
		@totaled_list = {}
		@set_columns = []
	end
	def input
		message = {0 => "Enter description column: ", 
				   1 => "Enter amount column: "}
		2.times do |i|
			input_values = false
			while !input_values
				
				print message[i]
				@set_columns[i] = gets.chomp
				
				if !valid?(@set_columns[i])
					puts "Integers only please"
					input_values = false
				else
					input_values = true
				end
			end
		end
	end
	def valid?(input)
		if !input.match(/\A\d+\z/)
			false
		else
			true
		end
	end
	def read(file)
		row = 0
		File.open(file, "r") do |handle|
			handle.each_line do |line|
				column = line.split(",")
				@description = column[@set_columns[0].to_i]
				@description = @description.split(" ")
				@description = @description.join(" ")
				@description = @description[/[\w\s\/*]+/]
				@amount = column[@set_columns[1].to_i]
				result[row] << @description << @amount
				row += 1
			end
		end
	end
	def search(input)
		input = input.downcase
		@result.keys.each do |key|
			if @result[key][0].downcase.match(input)
				@matched_list[@result[key][0]] << @result[key][1]
			end
		end
		nil #just so it does not return anything.
	end
	def total
		@matched_list.each_pair do |key, value|
			total = []
			@matched_list[key].each do |value|
				total << value.to_f
			end
			@totaled_list[key] = total.inject{|x,y| x + y}.round(2)
		end
		nil #just so it does not return anything
	end
	def show
		@totaled_list
	end
end

#binding.pry