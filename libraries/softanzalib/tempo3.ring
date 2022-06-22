load "stzlib.ring"

/*-----------------------

# In softanza the ..ed() form returns the expected result
# from the function without altering the object content:

o1 = new stzList(' "♥1" : "♥3" ')
? @@( o1.ItemsReversed() )
#--> Returns [ "♥3", "♥2", "♥1" ]
# But the object content is left as-is:
? @@( o1.Content() )
#--> [ "♥1", "♥2", "♥3" ]

# Using the function directly with ...ed() will definetly alter
# the object content, without returning anything:
o1.ReverseItems() # The items are reversed but nothing is returned
# Let's see the object content:
? @@( o1.Content() )
#--> [ "♥3", "♥2", "♥1" ]

# If you want to alter the object and then return it to continue
# working on it, then use the ...Q() form like this:
? o1.ReverseItemsQ().ToStzListOfStrings().ConcatenatedUsing("~")
# returns a string containing "♥1~♥2~♥3"

#--> Initially the object contained [ "♥3", "♥2", "♥1" ]. It's then
# reversed and became [ "♥3", "♥2", "♥1" ]. Finally, the stzList object
# is transformed to a stzListOfStrings object so it can be concatenated
# and returned as a string containing "♥1~♥2~♥3".

/*-----------------------

o1 = new stzList(1:3)
? o1.ReversedItems()
#--> [ 3, 2, 1 ]

/*-----------------------
*/
# In softanza the ..ed() form returns the expected result
# from the function without altering the object content:

o1 = new stzListOfPairs([ [ "A1", "A2" ], [ "B1", "B2" ], ["C1", "C2" ] ])
? @@( o1.Reversed() ) + NL
#--> Returns [ [ "C1", "C2" ], [ "B1", "B2" ], [ "A1", "A2" ] ]

o1.ReverseItemsInPairs()
? @@( o1.Content() )
#--> [ [ "A2", "A1" ], [ "B2", "B1" ], [ "C2", "C1" ] ]

# If you need it, when you have lists of different sizes, the same code
# works for general lists (and not only for pairs like in the code above),
# by undertaking a slight semantic adaptation:

o1 = new stzListOfLists([ [ "A1", "A2", "A3" ], [ "B1", "B2" ], ["C1", "C2" ] ])
? @@( o1.Reversed() ) + NL
#--> Returns [ [ "C1", "C2" ], [ "B1", "B2" ], [ "A1", "A2" ] ]

o1.ReverseItemsInLists()
? @@( o1.Content() )
#--> [ [ "A2", "A1" ], [ "B2", "B1" ], [ "C2", "C1" ] ]

# Note that this is a not a casual, but general feature you will find it anywhere
# in Softanza: you can go from speciefic to more general, or from general to more
# specific using nearly the same code and the same semantics.
# PS: CONSISTENCY is one of the 7 design goals of SoftanzaLib.

/*-----------------------

o1 = new stzListOfStrings([
	"___ ring ___ ring",
	"ring ___ ring ___ ring",
	"___ ring"
])

? @@( o1.FindNFirstOccurrencesOfSubString(4, "ring") )
#--> [ [ 1, 5 ], [ 1, 14 ], [ 2, 1], [ 2, 10 ] ]

? @@( o1.FindNLastOccurrencesOfSubString(3, "ring") )
#--> [ [ 2, 10 ], [ 2, 19 ], [ 3, 5 ] ]

/*-----------------------

o1 = new stzListOfStrings([
	"what's your name please",
	"mabrooka",
	"your name and my name are not the same",
	"i see",
	"nice to meet you",
	"mabrooka"
])

? @@( o1.FindSubStrings([ "name", "mabrooka"]) ) + NL
#-->
#  [
#	# "name" is found here
#	[
#		[ 1, [ 13 ] ], [ 3, [ 6, 18 ] ]
#	],
#
#	# and "mabrooka" is found here
#	[
#		[ 2, [ 1 ] ], [ 6, [ 1 ] ]
#	]
#  ]

? @@( o1.FindSubStringsXT([ "name", "mabrooka"]) )
#-->
#  [
#	# "name" is found here
#	[
#		[ 1, 13 ], [ 3, 6 ], [ 3, 18 ]
#	],
#
#	# and "mabrooka" is found here
#	[
#		[ 2, 1 ], [ 6, 1 ]
#	]
#  ]

/*------------------

o1 = new stzListOfStrings([
	"What's your name please",
	"Mabrooka",
	"Your name and my name are not the same",
	"I see",
	"Nice to meet you",
	"Mabrooka"
])

? o1.FindNthOccurrenceOfSubString(2, "name")
#--> [ 3, 6 ]

/*------------------

o1 = new stzListOfStrings([
	"What's your name please?",
	"Mabrooka!",
	"Your name and my name are not the same...",
	"I see.",
	"Nice to meet you,",
	"Mabrooka!"
])
	
? @@( o1.FindSubstring("name") ) + NL
#--> [ [ 1, [ 13 ] ], [ 3, [6, 18 ] ] ]

# For your convinience, you can get the result in an exmpanded form:
? @@( o1.FindSubStringXT("name") )
#--> [ [ 1, 13 ], [ 3, 6 ], [ 3, 18 ] ]

/*------------------

o1 = new stzListOfStrings([
	"___ ring ___",
	"___ ring ___ ring",
	"___ ruby ___ ring",
	"___ ring ___ ruby ___ ring"
])

? o1.NumberOfOccurrenceOfManySubStrings([ "ring", "ruby", "python" ])
#--> [ 6, 2, 0 ]

? @@( o1.NumberOfOccurrenceOfManySubStringsXT([ "ring", "ruby", "python" ]) )
#--> [
#	[ [ 1, 1], [2, 2], [3, 1], [4, 2] ], 	#<<< Occurrence of "ring"
#	[ [ 3, 1 ], , [ 4, 1 ] ], 				#<<< Occurrences of "ruby"
#	[  ] 					#<<< No occurrences at all for "pyhthon"
#   ]

/*--------------

o1 = new stzListOfStrings([ "ring php", "php", "ring php ring" ])

# How many occurrence are there of the substring "ring" in the list?
? o1.NumberOfOccurrenceOfSubString("ring") #--> 3

# Show these 3 in detail, string by string:
? @@( o1.NumberOfOccurrenceOfSubStringXT("ring") )
#--> [ [ 1, 1 ], [ 3, 2 ] ]

#====================== DISTRIBUTING ITEMS OVER THE ITEMS OF AN OTHER LIST

/*
Softanza can distribute the items of a list over the items of an other,
called metaphorically 'Beneficiary Items'  as they benfit from that
distribution.
		
The distribution is defined by the share of each item.
		
The share of each item determines how many items should be given to
the each beneficiary item.
		
Let's see:	

o1 = new stzList([ :water, :coca, :milk, :spice, :cofee, :tea, :honey ] )
? @@( o1.DistributeOver([ :arem, :mohsen, :hamma ]) ) + NL
# Gives:
# [
#	:arem   = [ :water, :coca ],
#	:mohsen = [ :milk, :spice, :cofee ],
#	:hamma  = [ :tea, honey ]
# ]

# Same can be made using the extended form of the function, that allows
# us to specify how the items are explicitely shared:

? @@( o1.DistributeOverXT([ :arem, :mohsen, :hamma ], :Using = [ 3, 2, 2 ] ) ) + NL

# And so you can change the share at your will:
? @@( o1.DistributeOverXT([ :arem, :mohsen, :hamma ], :Using = [ 1, 2, 4 ] ) ) + NL
#--> 
# [
#	[ "arem",   [ "water" ] ],
#	[ "mohsen", [ "coca", "milk" ] ],
#	[ "hamma",  [ "spice", "cofee", "tea", "honey" ] ]
# ]

# But if you try to share more items then it exists in the list (1 + 2 + 6 > 7!):
? @@( o1.DistributeOverXT([ :arem, :mohsen, :hamma ], :Using = [ 1, 2, 6 ] ) )
# Softanza won't let you do so and tells you why:

#   What : Can't distribute the items of the main list over the items of the provided list!
#   Why  : Sum of items to be distributed (in anShareOfEachItem) must be equal to number of items of the main list.
#   Todo : Provide a share list where the sum of its items is equal to the number of items of the list.


/*-----------------

# The distribution of the items of a list can be made directly using
# the "/" operator on the list object:

o1 = new stzList(' "♥1" : "♥6" ')
? @@( o1 / 8 )
#--> [ [ "♥1" ], [ "♥2" ], [ "♥3" ], [ "♥4" ], [ "♥5" ], [ "♥6" ], [ ], [ ] ]

# NOTE
#--> The beneficiary items can be of any type. In practice, they are
# strings and hence the returned result is a hashlist.

/*-----------------

o1 = new stzList(1:12)
? @@( o1.DistributeOver([ "Mansoor", "Teeba", "Haneen", "Hussein", "Sherihen" ]) )
#-->
# [
#	[ "Mansoor",  [ 1, 2, 3 ] ],
#	[ "Teeba",    [ 4, 5, 6 ] ],
#	[ "Haneen",   [ 7, 8    ] ],
#	[ "Hussein",  [ 9, 10   ] ],
#	[ "Sherihen", [ 11, 12  ] ]
# ]

/*-----------------

o1 = new stzList(' "♥1" : "♥9" ')
? @@( o1 / [ "Mansoor", "Teeba", "Haneen" ] )
#-->
# [
#	[ "Mansoor", 	[ "♥1", "♥2", "♥3" ] ],
#	[ "Teeba", 	[ "♥4", "♥5", "♥6" ] ],
#	[ "Haneen", 	[ "♥7", "♥8", "♥9" ] ]
# ]

/*-----------------

o1 = new stzListOfStrings([ "php", "ring php ring python ring", "python" ])

		o1.ReplaceInStringN(2, "ring", :With = "♥")
		? o1.Content()
		#--> [ "php", "♥ php ♥ python ♥", "python" ]


/*
o1 = new stzListOfStrings([ "php", "php ring python", "python" ])
o1.ReplaceInStringNSubstringAtPositionN(2, 5, "ring", "♥" )
? o1.Content()
#--> [ "php", "php ♥ python", "python" ]

		o1 = new stzListOfStrings([ "php", "ring php ring python ring", "python" ])
		o1.ReplaceInStringNTheNthOccurrence(2, 1, "ring", "♥" )
		? o1.Content()
		#--> [ "php", "ring php ring python ♥", "python" ]

		o1 = new stzListOfStrings([ "php", "ring php ring python ring", "python" ])
		o1.ReplaceInStringNTheFirstOccurrence(2, "ring", "♥" )
		? o1.Content()
		#--> [ "php", "♥ php ring python ring", "python" ]

		o1 = new stzListOfStrings([ "php", "ring php ring python ring", "python" ])
		o1.ReplaceInStringNTheLastOccurrence(2, "ring", "♥" )
		? o1.Content()
		#--> [ "php", "ring php ring python ♥", "python" ]

