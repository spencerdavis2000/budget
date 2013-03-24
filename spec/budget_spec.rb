require 'budget'

describe Budget do 

	it "should be able to load the csv file" do
		file = "./documents/budget.csv"
		open = Budget.new
		open.read(file)
		open.result.size.should > 1 if File.zero?(file) == false
	end
	it "should search through transactions by keyword and find value" do
		pending
	end
	it "should total the values" do
		pending
	end
end
