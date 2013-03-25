require 'pry'

class Budget2

	def file_size(file)
		#first thing is we don't know how many columns
		#we need to read the first row and get this number
		size 0
		File.open(file, "r") do |handle|
			handle.each do |line|
				column = line.split(",")
				if column.last.match(//)
			end
		end

	end


end
binding.pry

