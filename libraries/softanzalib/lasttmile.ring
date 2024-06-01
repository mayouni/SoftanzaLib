load "stzlib.ring"

/*======

pron()

o1 = new stzString("ve <<Ring>> programming language!")
? o1.ContainsSubStringBetween("ram", "prog", "ing")
#--> TRUE

proff()

/*=====

pron()

o1 = new stzString("I love <<Ring>> programming language!")

? o1.ContainsSubStringBetween("Ring", "love", "program")
#--> TRUE

? o1.ContainsSubStringBoundedBy("Ring", [ "<<", ">>" ])
#--> TRUE

? o1.ContainsSubStringBetweenS("ram", "pr", "ng", 5)
#--> TRUE

? o1.ContainsSubStringBoundedByS("ramm", ["prog", "ing"], 5)
#--> TRUE

proff()
# Executed in 0.04 second(s)

/*===

pron()

o1 = new stzString("THE START <<ring>> ring <<ring>> THE END")

? o1.NumberOfOccurrenceBetween("ring", "START", "END")
#--> 3

? o1.NumberOfOccurrenceBoundedBy("ring", [ "<<", ">>" ])
#--> 2

? o1.NumberOfSubStringBetweenS("ring", "START", "END", 3)
#--> 3

? o1.NumberOfSubStringBoundedByS("ring", [ "<<", ">>" ], 5)
#--> 2

proff()
# Executed in 0.06 second(s)

/*===

pron()

o1 = new stzString("THE START <<ring>> ring <<ring>> THE END")

? o1.ContainsNOccurrencesOfSubStringBetween(3, "ring", "ring", "END")
#--> TRUE

? o1.ContainsNOccurrencesOfSubStringboundedBy(2, "ring", [ "<<", ">>" ])
#--> TRUE

? o1.ContainsNOccurrencesOfSubStringBetweenS(3, "ring", "ring", "END", 3)
#--> TRUE

? o1.ContainsNOccurrencesOfSubStringBoundedByS(2, "ring", [ "<<", ">>" ], 5)

proff()
# Executed in 0.05 second(s)

/*===

pron()

o1 = new stzString("THE START <<ring>> ring <<ring>> _ring_ THE END")

? o1.FindSubStringBetween("ring", "START", "END")
#--> [ 13, 20, 27, 35 ]

? o1.FindSubstringBoundedBy("ring", [ "<<", ">>" ])
#--> [ 13, 27 ]

? @@( o1.FindSubstringBoundedBy("ring", "_") ) + NL
#--> [ 35 ]

? @@( o1.FindSubStringBetweenZZ("ring", "START", "END") ) + NL
#--> [ [ 13, 16 ], [ 20, 23 ], [ 27, 30 ], [ 35, 38 ] ]

? @@( o1.FindSubStringBoundedByZZ("ring", ["<<", ">>" ]) ) + NL
#--> [ [ 13, 16 ], [ 27, 30 ] ]

? @@( o1.FindSubStringBoundedByZZ("ring", "_") ) + NL
#--> [ [ 35, 38 ] ]


proff()
# Executed in 0.10 second(s)

/*---

pron()
#                             11            25
#                             v             v
o1 = new stzString("THE START <<ring>> ring <<ring>> _ring_ THE END")

? @@( o1.FindSubStringBoundedByIB("ring", ["<<", ">>"]) ) + NL
#--> [ 11, 25 ]

proff()
# Executed in 0.04 second(s)

/*---

pron()
#                       5       13     20     27
#                       v       v      v      v
o1 = new stzString("THE START <<ring>> ring <<ring>> _ring_ THE END")

? @@( o1.FindSubStringBetweenS("ring", "<<", ">>", 5) ) + NL
#--> [ 13, 20, 27 ]

? @@( o1.FindSubStringBoundedByS("ring", "_", 5) ) + NL
#--> [ 35 ]

? @@( o1.FindSubStringBetweenSZZ("ring", "<<", ">>", 5) ) + NL
#--> [ [ 13, 16 ], [ 20, 23 ], [ 27, 30 ] ]

? @@( o1.FindSubStringBoundedBySZZ("ring", "_", 5) )
#--> [ [ 35, 38 ] ]

proff()
# Executed in 0.05 second(s)

/*---

pron()
#                       5                            34     41
#                       v                            v      v
o1 = new stzString("THE START <<ring>> ring <<ring>> __ring__ THE END")

? @@( o1.FindSubStringBoundedBySIB("ring", "__", 5) ) + NL
#--> [ 34 ]

? @@( o1.FindSubStringBoundedBySIBZZ("ring", "__", 5) )
#--> [ [ 35, 41 ] ]

proff()
# Executed in 0.04 second(s)

/*===
*/
pron()
#                       5              20     27
#                       v              v      v
o1 = new stzString("THE START <<ring>> ring <<ring>> __ring__ THE END")

? o1.FindNextNthSubStringBetweenS(2, "ring", "START", "END", :StartingAt = 5)
#--> 20

? o1.FindNextNthSubStringBoundedByS(2, "ring", ["<<", ">>"], :StartingAt = 5)
#--> 27

//? o1.FindNextNthSubStringBoundedBySIB(2, "ring", ["<<", ">>"], 5)

//FindNextSubStringBetweenS(pcSubStr,pcSubStr1, pcSubStr2, pnStartingAt)

//FindNextSubStringBoundedByS(pcSubStr, pacBounds, pnStartingAt)

proff()

/*---

FindPreviousNthSubStringBetweenS(n, pcSubStr, pcSubStr1, pcSubStr2, pnStartingAt)

FindPreviousNthSubStringBoundedByS(n, pcSubStr, pacBounds, pnStartingAt)

FindPreviousSubStringBoundedByS(pcSubStr, pacBounds, pnStartingAt)

FindPreviousSubStringBetweenS(pcSubStr, pcSubStr1, pcSubStr2, pnStartingAt)

/*---

FindNthNextSubStringBoundedBySIB(n, pcSubStr, pacBounds, pnStartingAt)

FindNextSubStringBoundedBySIB(pcSubStr, pacBounds, pnStartingAt)

/*---

FindNthPreviousSubStringBoundedBySIB(n, pcSubStr, pacBounds, pnStartingAt)

FindPreviousSubStringBoundedBySIB(pcSubStr, pacBounds, pnStartingAt)

/*===

FindNthSubStringBetween(n, pcSubStr, pcBound1, pcBound2)

FindNthSubStringBoundedBy(n, pcSubStr, pacBounds)

FindFirstSubStringBetween(pcSubStr, pcBound1, pcBound2)

FindFirstSubStringBoundedBy(pcSubStr, pacBounds)

FindLastSubStringBetween(pcSubStr, pcBound1, pcBound2)

FindLastSubStringBoundedBy(pcSubStr, pacBounds)

/*---

FindNthSubStringBetweenZZ(n, pcSubStr, pcBound1, pcBound2)

FindNthSubStringBoundedByZZ(n, pcSubStr, pacBounds)

#--

FindNthSubStringBoundedByIB(n, pcSubStr, pacBounds)

FindNthSubStringBoundedByIBZZ(n, pcSubStr, pacBounds)

/*--

FindNthSubStringBetweenS(n, pcSubStr, pcBound1, pcBound2, pnStartingAt)

FindNthSubStringBoundedByS(n, pcSubStr, pacBounds, pnStartingAt)

FindNthSubStringBetweenSZZ(n, pcSubStr, pcBound1, pcBound2, pnStartingAt)

FindNthSubStringBoundedBySZZ(n, pcSubStr, pacBounds, pnStartingAt)

/*--

FindNthSubStringBoundedBySIB(n, pcSubStr, pacBounds, pnStartingAt)

FindNthSubStringBoundedBySIBZZ(n, pcSubStr, pacBounds, pnStartingAt)

/*====

FindNthSubStringBetweenDZ(n, pcSubStr, pcBound1, pcBound2, pcDirection)

FindNthSubStringBoundedByD(n, pcSubStr, pacBounds, pcDirection)

FindNthSubStringBetweenAsSectionsD(n, pcSubStr, pcBound1, pcBound2, pcDirection)

FindNthSubStringBoundedByAsSectionsD(n, pcSubStr, pacBounds, pcDirection)

/*---

FindNthSubStringBoundedByDIB(n, pcSubStr, pacBounds, pcDirection)

FindNthSubStringBoundedByDIBZZ(n, pcSubStr, pacBounds, pcDirection)

/*--

FindNthSubStringBetweenSD(n, pcSubStr, pcBound1, pcBound2, pnStartingAt, pcDirection)

FindNthSubStringBoundedBySD(n, pcSubStr, pacBounds, pnStartingAt, pcDirection)

FindNthSubStringBetweenSDZZ(n, pcSubStr, pcBound1, pcBound2, pnStartingAt, pcDirection)

FindNthSubStringBoundedBySDZZ(n, pcSubStr, pacBounds, pnStartingAt, pcDirection)

/*--

FindNthSubStringBoundedBySDIB(n, pcSubStr, pacBounds, pnStartingAt, pcDirection)

FindNthSubStringBoundedBySDIBZZ(n, pcSubStr, pacBounds, pnStartingAt, pcDirection)

/*--

FindFirstSubStringBetweenZZ(pcSubStr, pcBound1, pcBound2)

FindFirstSubStringBoundedByZZ(pcSubStr, pacBounds)

/*--

FindFirstSubStringBoundedByIB(pcSubStr, pacBounds)

FindFirstSubStringBoundedByIBZZ(pcSubStr, pacBounds)

/*--

FindFirstSubStringBetweenS(pcSubStr, pcBound1, pcBound2, pnStartingAt)

FindFirstSubStringBoundedByS(pcSubStr, pacBounds, pnStartingAt)

FindFirstSubStringBetweenSZZ(pcSubStr, pcBound1, pcBound2, pnStartingAt)

FindFirstSubStringBoundedBySZZ(pcSubStr, pacBounds, pnStartingAt)

/*--

FindFirstSubStringBoundedBySIB(pcSubStr, pacBounds, pnStartingAt)

FindFirstSubStringBoundedBySIBZZ(pcSubStr, pacBounds, pnStartingAt)

/*--

FindFirstSubStringBetweenD(pcSubStr, pcBound1, pcBound2, pcDirection)

FindFirstSubStringBoundedByD(pcSubStr, pacBounds, pcDirection)

FindFirstSubStringBetweenDZZ(pcSubStr, pcBound1, pcBound2, pcDirection)

FindFirstSubStringBoundedByDZZ(pcSubStr, pacBounds, pcDirection)

/*--

FindFirstSubStringBoundedByDIB(pcSubStr, pacBounds, pcDirection)

FindFirstSubStringBoundedByDIBZZ(pcSubStr, pacBounds, pcDirection)

/*--

FindFirstSubStringBetweenSD(pcSubStr, pcBound1, pcBound2, pnStartingAt, pcDirection)

FindFirstSubStringBoundedBySD(pcSubStr, pacBounds, pnStartingAt, pcDirection)

FindFirstSubStringBetweenSDZZ(pcSubStr, pcBound1, pcBound2, pnStartingAt, pcDirection)

FindFirstSubStringBoundedBySDZZ(pcSubStr, pacBounds, pnStartingAt, pcDirection)

/*--

FindFirstSubStringBoundedBySDIB(pcSubStr, pacBounds, pnStartingAt, pcDirection)

FindFirstSubStringBoundedBySDIBZZ(pcSubStr, pacBounds, pnStartingAt, pcDirection)

/*--

FindLastSubStringBetweenZZ(pcSubStr, pcBound1, pcBound2)

FindLastSubStringBoundedByZZ(pcSubStr, pacBounds)

/*--

FindLastSubStringBoundedByIB(pcSubStr, pacBounds)

FindLastSubStringBoundedByIBZZ(pcSubStr, pacBounds)

/*--

FindLastSubStringBetweenS(pcSubStr, pcBound1, pcBound2, pnStartingAt)

FindLastSubStringBoundedByS(pcSubStr, pacBounds, pnStartingAt)

FindLastSubStringBetweenSZZ(pcSubStr, pcBound1, pcBound2, pnStartingAt)

FindLastSubStringBoundedBySZZ(pcSubStr, pacBounds, pnStartingAt)

/*--

FindLastSubStringBoundedBySIB(pcSubStr, pacBounds, pnStartingAt)

FindLastSubStringBoundedBySIBZZ(pcSubStr, pacBounds, pnStartingAt)

/*--

FindLastSubStringBetweenD(pcSubStr, pcBound1, pcBound2, pcDirection)

FindLastSubStringBoundedByD(pcSubStr, pacBounds, pcDirection)

FindLastSubStringBetweenDZZ(pcSubStr, pcBound1, pcBound2, pcDirection)

FindLastSubStringBoundedByDZZ(pcSubStr, pacBounds, pcDirection)

/*--

FindLastSubStringBoundedByDIB(pcSubStr, pacBounds, pcDirection)

FindLastSubStringBoundedByDIBZZ(pcSubStr, pacBounds, pcDirection)

/*--

FindLastSubStringBetweenSD(pcSubStr, pcBound1, pcBound2, pnStartingAt, pcDirection)

FindLastSubStringBoundedBySD(pcSubStr, pacBounds, pnStartingAt, pcDirection)

FindLastSubStringBetweenSDZZ(pcSubStr, pcBound1, pcBound2, pnStartingAt, pcDirection)

FindLastSubStringBoundedBySDZZ(pcSubStr, pacBounds, pnStartingAt, pcDirection)

/*--

FindLastSubStringBoundedBySDIB(pcSubStr, pacBounds, pnStartingAt, pcDirection, pCaseSensitive)

FindLastSubStringBoundedBySDIBZZ(pcSubStr, pacBounds, pnStartingAt, pcDirection)

/*--



