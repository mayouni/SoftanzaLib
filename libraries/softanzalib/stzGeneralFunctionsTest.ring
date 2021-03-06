load "stzlib.ring"

/*--------------

? InfereDataTypeFromString(:ListsOfObjects) #--> :List

/*--------------

? Q([ 1, 2, 3 ]).IsListOf(:Numbers)		#--> TRUE
? Q([ "A", "B", "C" ]).IsListOf(:Strings)	#--> TRUE

o1 = new stzNumber(10)
? Q([ o1, o1, o1 ]).IsListOf(:StzNumbers)	#--> TRUE

o1 = new stzString("A")
? Q([ o1, o1, o1 ]).IsListOf(:StzStrings)	#--> TRUE

? Q([ [1,2], [3,4], [5,6] ]).IsListOf(:ListsOfNumbers)	#--> TRUE
? Q([ [1,2], [3,4], [5,6] ]).IsListOf(:PairsOfNumbers)	#--> TRUE

/*------------------- InfereDataTypeFromString

# NOTE: the function is useful for internal features of SoftanzaLib,
# inorder to enable the goal of expressive code.

# In particular, it is used in the stzList.IsListOf(pcType) method.

# From a particular string, it tries to detect the most relevant
# Ring or Softanza type.

# So, Softanza can do its best to infere the datatype included
# in a string, whatever form the string takes: lowercase or
# uppercase, and singular or plural!

? InfereDataTypeFromString('number')	# --> :Number
? InfereDataTypeFromString('String')	# --> :String

? InfereDataTypeFromString('NuMBer')	# --> :Number
? InfereDataTypeFromString('STRING')	# --> :String

? InfereDataTypeFromString('numbers')	# --> :Number
? InfereDataTypeFromString('STRINGS')	# --> :String

? InfereDataTypeFromString(:StzNumber)	# --> :StzNumber
? InfereDataTypeFromString(:StzNumbers)	# --> :StzNumber

? InfereDataTypeFromString(:ListOfNumbers)	# --> :List
? InfereDataTypeFromString(:ListsOfNumbers)	# --> :List

? InfereDataTypeFromString(:PairOfNumbers)	# --> :List
? InfereDataTypeFromString(:PairsOfNumbers)	# --> :List

? InfereDataTypeFromString(:StzListOfNumbers)	# --> :StzListOfNumbers
? InfereDataTypeFromString(:StzListsOfNumbers)	# --> :StzListOfNumbers

? InfereDataTypeFromString(:ListOfStzStrings)	# --> :List
? InfereDataTypeFromString(:ListsOfStzStrings)	# --> :List

/*-------------------
*/
# Getting the data type of a given value

? _(5).@.DataType()		# --> :Number
? _("Ring").@.DataType()	# --> :String
? _(1:3).@.DataType()		# --> :List

obj = new Person { name = "Nehro" }
? _(obj).@.DataType()		# --> :Object

class Person name

/*-------------------

? ComputableForm(4) # --> 4
? ComputableForm("Ring") # --> "Ring"
? ComputableForm([ 1, 2, "a" ]) # --> [ 1, 2, "a" ]
// TODO: the case of objects...

/*-------------------

? "??" = "??"	# --> FALSE
? "??" = "??"	# --> FALSE
? "??" = "??"	# --> FALSE
? "??" = "??"	# --> FALSE
? "??" = "??"	# --> FALSE		
? "??" = "??"	# --> FALSE
? ""
? Unicode("??")	# --> 1777
? Unicode("??")	# --> 1633
? ""
? AreEqual([ "O", "??", "??" ]) # --> FALSE
? ""
? Unicodes([ "O", "??", "??" ]) # --> [ 79, 927, 1054 ]
? Scripts([ "O", "??", "??" ]) # --> [ :Latin, :Greek, :Cyrillic ]


/*
The point is that Unicode assigns unique code to Chars and
not to their visual glyfs. To give a clear example:

"O", "??", and "??" seam the same for us, and for the particular
font we use in our system to render them, but from a unicode
stand point, they are different.

If you try to get their unicode code points, you find them
respectively: 79, 927, and 1054.

In fact, the first is Latin "O", the second is Greek "??", and
the third is Cyrillic "??".
*/

/*
? "??" = "??"	# TRUE		01636	01636
? "??" = "??"	# TRUE		01637	01637
? "??" = "??"	# TRUE		01638	01638
? "??" = "??"	# TRUE		01639	01639
*/
