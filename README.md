#This project was inspired by looking at my bank account and wondering,''where all the money was going.''
	
	So, I go to my chase account and download the CSV file

It is usually the the following format:
	
	If you use Chase, simply login to your account as normal
	Go to either checking or savings
	Click on search transactions
	Then pick starting date and ending date, type like all or just debit
	Then click ok and it will show you the transactions.
	There is a "Download" link which outputs it in CSV format
	Download this link --- should be called JPMC.CSV


#debit or credit, date, description, amount, how_paid, balance

		Basically we will search for something.  When we find it, we
		will list all the transactions as well as amounts and totals.

		This will give an idea of how much money is spent at say
			Whole Foods
			Trader Joe's
			Gas Station

		This knowledge will help make better descisions and perhaps 
			Save More Money:-) 

#Using the program
	After you download the csv from Chase (if a different bank, just)
	make sure the format is correct:
		Debit-credit, date, description, amount  -this is really all we need
	Put the csv file on your desktop for now
	Start up the Terminal and go to the root folder
	$ruby budget_main.rb
	This will start up a 'pry' session 
	$file = "../JPMC.csv"
	$budget.read(file)
	$budget.search("whole")  #enter search term like "Whole Foods"
		just remember to enter less than what you are looking for
		for "TRADER JOE" you can just enter "trader" not case sensitive
	$budget.total
	$budget.show
		here you will get the output of the transactions totaled.
#Basically, this is a good way to keep an eye on how much money is being spent at a specific store(s), and therefore being a useful tool.  The bank allows you to only search by amount and not by "store name".  Other tools might also be useful, but I think they also tend to focus on categorizing transactions into categorize like consumer goods, etc.. Therefore, for my purposes, this is much more accurate and exactly what I needed -- which is why I created it :-)  

