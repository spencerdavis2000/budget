#Some notes used to talk out ideas, potential problems and solutions, etc..

	So, one problem I forsee is if I want to use another Bank's csv and it
	is formatted differently.  So, would have to create a program to change
	the order of the headers so it is always
#Type of transaction (debit or credit), Date, Description, Amount

	The description and the amount are actually very important to make sure
	they are in the 2nd and 3rd position respectively 

#Examples
	
	JPM Chase has the headers like:
	transaction_type, date, description, amount, how_paid, balance

	Charter One has the headers like:
	transaction_type, date, account type, description, amount, reference no, credit, debits

	So, they are two different formats which will pose problems.

#Basically we need 2 things:
	Descrition (for the search)
	Amount 
	If we needed the date, we could easily get this as well

#Solution A
	It could be to load the file, then match it manually.
	This is not a bad solution if:
		we need to match a lot of columns
		we have a GUI in which to point and click
		we potentially have a TON of lines of information - like 30k + 

#Solution B
	We read every column for the search instead of just one.  
	This could take longer, but I will test it on a years worth of data and see.
	Description can be matched like:
		description[/[\w\s]+/]
			The only problem with this is if the other columns also include the 
			search word.  
			However, it seems as though the csv forms are pretty simple, so it
			should be fine.
	Amount can be matched like:
		amount = amount.to_s
		amount[+-]?\d+.\d{2}
			This is a little specific and could break, but it seems most amounts
			are always in the form
				-124.95 for negative, or 34.54 for positive
	So, as long as the amount stays in that format and the description keywords
	are not all over the place, and it does not take too long to read through the
	longest available timeframe from the bank (which I think is a year) it should
	at least be less of a headache the trying to match the headers ---especially
	without a GUI to point and click.
	












