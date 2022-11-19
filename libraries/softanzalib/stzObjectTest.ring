load "stzlib.ring"

/*====== TODO: YIELD AND CUMULATE

o1 = new stzList([ "one", "two", "three" ])
? o1.Yield("len(@item)")
#--> [ 3, 3, 5 ]

? o1.YieldAndCumulate('len(@item)')
#--> [ 3, 6, 11 ]

? o1.YieldAndCumulateXT('len(@item)', :ReturnLast )
#--> 11

? o1.YielAndCumulateXT('len(@item)', :Using = '@item += @PreviousItem')
#--> [ 3, 6, 11 ]

? o1.YieldAndCumulateXT('len(@item)', [ :Using = '@item += @PreviousItem', :ReturnLast ])
#--> 11

/*==================
*/
? Q(5).ToNumber()
#--> 5

? Q("5").ToNumber()
#--> 5

? Q([ "a", "b", "c" ])
#--> 3

/*==================

o1 = new stzNumber(8)
? o1.ToNumber()
#--> 8

/*-----------------

o1 = new stzString("142")
? o1.ToNumber()
#--> 142

? o1.ToNumberXT('@.NumberOfChars()')
#--> 3
? o1.ToNumberXT('
	YieldAndCumulate('0+ @item')
')
#--> 7
? o1.ToNumberXT('
	YieldAndCumulateXT('0+ @item', :ReturnIntermediate)
')
#--> [ 1, 5, 7 ]

/*-----------------

o1 = new stzList([ "one", "two", "three" ])
? o1.ToNumber()
#--> 3

? o1.ToNumberXT('
	YieldAndCumulateXT("len(@item)", :ReturnIntermediate )
')


/*=================

? Q(StzTypesXT()).IsHashList()
#--> TRUE

? StzHashListQ(StzTypesXT()).FindValue('stzchars')
#--> 17

/*-----------------

? PluralOfThisStzType(:stzchar)
#--> "stzchars"

? StzTypeToPlural(:stzchar)
#--> "stzchars"

? PluralToStzType(:stzchars)
#--> "stzchar"

/*-----------------

? Q("2").IsA([ :Number, :Or = :String, :Or = :List ])
#--> TRUE
# Same as: ? Q("2").IsOneOfTheseTypes([ :Number, :String, :List ])

? Q([10, 20]).IsA([ :List, :Pair, :ListOfNumbers, :PairOfNumbers ])
#--> TRUE

? Q("str").IsAList()
#--> FALSE

? Q("str").IsANumber()
#--> FALSE

? Q("str").IsAString()
#--> TRUE

? Q("5").IsNumberInString()
#--> TRUE

? Q("str").IsA(:String)
#--> TRUE

? Q("str").IsA(:StzString)
#--> TRUE

? Q("str").IsAn(:Object)
#--> TRUE

? Q("2").IsAString()
#--> TRUE

? Q("2").IsA(:String)
#--> TRUE

? Q("2").IsA(:NumberInString)
#--> TRUE

? Q("2").IsEitherA(:Number, :Or = :String)
#--> TRUE

? Q("2").IsOneOfThese([ 3, "2", 5 ])
#--> TRUE

? Q([ 10, 20, 30 ]).IsA(:ListOfNumbers)
#--> TRUE

/*------------ TODO: Check error

# Using a ChainOfTruth (started with "_" and ended with "_":

? _([10, 20, 30 ]).IsA(:ListOfNumbers)._
#--> TRUE

# The chain of truth is more useful when we chain more checks
# in the same time:

? _([ :name = "mio", :age = 12 ]).
	IsA(:List).
	IsA(:HashList).
	IsA(:Pair)._
#--> TRUE

/*--------------------

? StzClasses()

/*--------------------

o1 = new stzNumber(12500)
? o1.Is(:StzNumber)
? o1.Is(:String)

/*--------------------

o1 = new stzString("hello")
? o1.Is(:StzString)

/*--------------------

o1 = new stzGrid([ [1,2,3], [4,5,6], [7,8,9] ])
? o1.Is(:StzGrid) # from stzObject based on the name of the class
? o1.IsAGrid() # used by natural code in stzChainOfTruth

/*--------------------

o1 = new Person { name = "Ali" age = 32 job = "Developer" }

# NOTE: if you provide the name of the object in a string (as :o1),
# then you can get the variable name of the object using ObjectVarName()

StzObjectQ( :o1 ) {

	? "ID: " + ObjectUID() + NL

	? "Object Name: " + ObjectVarName() + NL

	? "Object class: " + ObjectClassName() + NL

	? "Attributes:"
	? ObjectAttributes()

	? "Values:"
	? ObjectValues()

	? "Attributes and their values:"
	? ObjectAttributesAndValues()

	? "Methods:"
	? ObjectMethods()

	? "Object listified:"
	? Listify()

}

class Person
	name
	age
	job

	def init(cName)
		name = cName

	def show()
		? "Name : " + name
		? "Age  : " + age
		? "Job  : " + job

/*----------------

o1 = new QString()
? IsQObject(o1)
? IsQtObject(o1)

# Both return TRUE --> Flexible syntax!

/*----------------

? len(RingQtClasses())

o1 = new stzString("n")

? IsConstraintObjectParam(o1)
? IsConstraintObjectParam(:In = o1)
? IsConstraintObjectParam(:InObject = o1)
? IsConstraintObjectParam(:On = o1)
? IsConstraintObjectParam(:OnObject = o1)
