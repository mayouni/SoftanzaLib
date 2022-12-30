#---------------------------------------------------------------------------#
# 		    SOFTANZA LIBRARY (V1.0) - STZLISTOFLISTS		    #
#		An accelerative library for Ring applications		    #
#---------------------------------------------------------------------------#
#									    #
# 	Description	: The core class for managing lists of lists        #
#	Version		: V1.0 (2020-2022)				    #
#	Author		: Mansour Ayouni (kalidianow@gmail.com)		    #
#									    #
#---------------------------------------------------------------------------#

func StzListOfListsQ(paList)
	return new stzListOfLists(paList)

func LL(p)
	if isList(p)
		return StzListQ(p).OnlyLists()

	but isString(p) and Q(p).IsListInString()
		aResult = Q(p).ToListQ().OnlyLists()
		return aResult

	but isNumber(p)
		aResult = []
		for i = 1 to p
			aResult + []
		next
		return aResult

	ok

	func LLQ(p)
		return Q(LL(p))

		func QLL(p)
			return LLQ(p)

	func LoL(p)
		return LL(p)

		func LoLQ(p)
			return LLQ(p)

func ItemExists(pItem, paList)
	oTempList = new stzList(paList)
	if oTempList.Contains(pItem) 
		return TRUE
	else
		return FALSE
	ok

func ListsMerge(paListOfLists)
	return StzListOfListsQ(paListOfLists).Merged()

	func ListsMergeQ(paListOfLists)
		return new stzList( ListsMerge(paListOfLists) )

func ListsFlatten(paListOfLists)
	return StzListOfListsQ(paListOfLists).Flattened()


class stzListOfLists from stzList

	@aContent = []

	def init(paList)

		if isList(paList) and
		   ( Q(paList).IsEmpty() or Q(paList).IsListOfLists() )

			@aContent = paList

		else
			StzRaise("Can't create the stzListOfLists object!")
		ok

	  #--------------#
	 #   GENERAL    #
	#--------------#

	def Content()
		return @aContent

	def ListOfLists()
		return This.Content()

	def Copy()
		oCopy = new stzListOfLists( This.Content() )
		return oCopy

	def NumberOfLists()
		return len(@aContent)

	def Update( paList )

		if isList(paList) and Q(paList).IsListOfLists()

			@aContent = paList

		else
			StzRaise([
				:File = "stzListOfLists (541) > Update()",
				:What = "Can't update the list of lists!",
				:Why  = "The value you provided is not a list of lists."
			])
		ok

	  #----------------#
	 #   ADD LISTS    #
	#----------------#

	def AddList(paList)
		@aContent + paList

	def AddMany(paListOfLists)
		nLen = len(paListOfLists)
		for i = 1 to nLen
			@aContent + paListOfLists[i]
		next

	  #---------------#
	 #   NTH LIST    #
	#---------------#

	def NthList(n)
		return This.ListOfLists()[n]

		#< @FunctionFluentForm
		
		def NthListQ(n)
			return new stzList( This.NthList(n) )

		#>

		#< @FunctionAlternativeForms

		def ListAt(n)
			return This.NthList()

		def ListAtPosition(n)
			return  This.NthList(n)

		#>

	  #------------------#
	 #   LISTS WHERE    #
	#------------------#

	def ListsW(pcCondition)

		cCondition = StzStringQ(pcCondition).RemoveBoundsQ(["{","}"]).Simplified()
		aResult = []

		aListOfLists = This.ListOfLists()
		nLen = len(aListOfLists)

		for @i = 1 to nLen 
			@list = aListOfLists[@i]

			@item = @list # Allows using both @list and @item in the user's script
			cCode = "if " + cCondition + NL +
				TAB + "aResult + @list" + NL +
			"ok"

			eval(cCode)
		next

		return aResult

		#< @FunctionFluentForm

		def ListsWQ(pcCondition)
			return new stzList( This.ListsW(pcCondition) )

		#>

		#< @FunctionAlternativeForm

		def ListsWhere(pcCondition)
			return This.ListsW(pcCondition)

			#< @FunctionFluentForm

			def ListsWhereQ(pcCondition)
				return new stzList(This.ListsWhere(pcCondition))

			#>
		#>

	  #----------------------#
	 #   POSITIONS WHERE    #
	#----------------------#

	def PositionsW(pcCondition)

		cCondition = StzStringQ(pcCondition).RemoveBoundsQ(["{","}"]).Simplified()
		aResult = []

		aListOfLists = This.ListOfLists()
		nLen = len(aListOfLists)

		for @i = 1 to nLen 
			@list = aListOfLists[@i]

			@item = @list # Allows using both @list and @item in the user's script
			cCode = "if " + cCondition + NL +
				TAB + "aResult + @i" + NL +
			"ok"

			eval(cCode)
		next

		return aResult

		#< @FunctionFluentForm

		def PositionsWQ(pcCondition)
			return new stzList( This.PositionsW(pcCondition) )

		#>

		#< @FunctionAlternativeForm

		def PositionsWhere(pcCondition)
			return This.PositionsW(pcCondition)

			#< @FunctionFluentForm

			def PositionsWhereQ(pcCondition)
				return new stzList(This.PositionsWhere(pcCondition))

			#>
		#>

	  #-------------------------------------------#
	 #   SIZES, AND SMALLEST AND BIGGEST SIZES   #
	#-------------------------------------------#

	def Sizes()
		aResult = []
		aListOfLists = This.ListOfLists()
		nLen = len(aListOfLists)

		for i = 1 to nLen
			aResult + len(aListOfLists[i])
		next

		return aResult

	def SmallestSize()
		return StzListOfNumbersQ( StzSetQ(This.Sizes()).Content() ).Min()

		def MinSize()
			return This.SmallestSize()

	def BiggestSize()
		return StzListOfNumbersQ( StzSetQ(This.Sizes()).Content() ).Max()

		def MaxSize()
			return This.BiggestSize()

		def Largestsize()
			return This.BiggestSize()

	def ListsHaveSameNumberOfItems()
		bResult = TRUE
		
		for i = 2 to This.NumberOfLists()
			if len( This.NthList(i) ) != len( This.NthList(i-1) )
				bResult = FALSE
				exit
			ok
		next

		return bResult

		def ListsHaveSameSize()
			return This.ListsHaveSameNumberOfItems()

	  #--------------------------------#
	 #   SMALLEST AND BIGGEST LISTS   #
	#--------------------------------#

	def SmallestLists()

		aListOfLists = This.Content()
		nLen = len(aListOfLists)
		nSmallestSize = This.SmallestSize()

		aResult = []

		for i = 1 to nLen
			aList = aListOfLists[i]
			nLenList = len(aList)

			if nLenList = nSmallestSize
				aResult + aList
			ok
		next

		return aResult

	# TODO: adds "big", "great", and "large" as alternatives al over the library
	def BiggestLists()
		aListOfLists = This.Content()
		nLen = len(aListOfLists)
		nBiggestSize = This.BiggestSize()

		aResult = []

		for i = 1 to nLen
			aList = aListOfLists[i]
			nLenList = len(aList)

			if nLenList = nBiggestSize
				aResult + aList
			ok
		next

		return aResult

		def GreatestLists()
			return This.BiggestLists()

		def LargestLists()
			return This.BiggestLists()

	def FindSmallestLists()

		aListOfLists = This.Content()
		nLen = len(aListOfLists)

		aResult = []
		nSmallestSize = This.SmallestSize()

		for i = 1 to nLen
			aList = aListOfLists[i]
			nLenList = len(aList)

			if nLenList = nSmallestSize
				aResult + i
			ok

		next

		return aResult

		def FindMinLists()
			return This.FindSmallestLists()

		def PositionsOfSmallestLists()
			return This.FindSmallestLists()

		def SmallestListsPositions()
			return This.FindSmallestLists()

		def PositionsOfMinLists()
			return This.FindSmallestLists()

		def MinListsPositions()
			return This.FindSmallestLists()

	def FindBiggestLists()
		return This.PositionsW('{ len(@list) = This.BiggestSize() }')

		def FindMaxLists()
			return This.FindBiggestLists()

		def PositionsOfBiggestLists()
			return This.FindBiggestLists()

		def BiggestListsPositions()
			return This.FindBiggestLists()

		def PositionsOfMaxLists()
			return This.FindBiggestLists()

		def MaxListsPositions()
			return This.FindBiggestLists()

		#--

		def FindGeatestLists()
			return This.FindBiggestLists()

		def PositionsOfGreatestLists()
			return This.FindBiggestLists()

		def GreatestListsPositions()
			return This.FindBiggestLists()

		#--

		def FindLargestLists()
			return This.FindBiggestLists()

		def PositionsOfLargestLists()
			return This.FindBiggestLists()

		def LargestListsPositions()
			return This.FindBiggestLists()

	  #---------------------#
	 #   LISTS OF SIZE N   #
	#---------------------#

	def ListsOfSizeN(n)
		return This.ListsW('{ len(@list) = ' + n + ' }')

		#< @FunctionAlternativeForm

		def ListsOfSize(n)
			return This.ListsOfSizeN(n)

		#>

	def PositionsOfListsOfSizeN(n)
		return This.PositionsW('{ len(@list) = ' + n + ' }')

		#< @FunctionAlternativeForm

		def ListsOfSizeNPositions(n)
			return This.PositionsOfListsOfSizeN(n)

		def PositionsOfListsOfSize(n)
			return This.PositionsOfListsOfSizeN(n)

		#>

	  #--------------------------#
	 #   ITEMS AT POSITION N    #
	#--------------------------#

	def ItemsAtPositionN(n)
		aResult = []

		aListOfLists = This.ListOfLists()
		nLen = len(aListOfLists)

		for i = 1 to nLen
			aList = aListOfLists[i]
			if len(aList) >= n
				aResult + aList[n]
			ok
		next

		return aResult

		#< @FunctionFluentForm

		def ItemsAtPositionNQ(n)
			return This.ItemsAtPositionNQR(n, :stzList)

		def ItemsAtPositionsNQR(n, pcReturnType)
			if isList(pcReturnType) and Q(pcReturnType).IsOneOfTheseNamedParams([ :ReturnedAs, :ReturnAs ])
				pcReturnType = pcReturnType[2]
			ok

			if NOT isString(pcReturnType)
				StzRaise("Incorrect param! pcReturnType must be a string.")
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.ItemsAtPositionN(n) )

			on :stzListOfLists
				return new stzListOfLists( This.ItemsAtPositionN(n) )

			on :stzListOfPairs
				return new stzListOfPairs( This.ItemsAtPositionN(n) )

			other
				StzRaise("Unsupported return type!")
			off

		#>

		#< @FunctionAlternativeForms

		def ItemsAt(n)
			return This.ItemsAtPositionN(n)

			def ItemsAtQ(n)
				return This.ItemsAtPositionNQR(n, :stzList)

			def ItemsAtQR(n, pcReturnType)
				return This.ItemsAtPositionNQR(n, pcReturnType)

		def ItemsAtPosition(n)
			return This.ItemsAtPositionN(n)

			def ItemsAtPositionQ(n)
				return This.ItemsAtPositionQR(n, :stzList)

			def ItemsAtPositionQR(n, pcReturnType)
				return This.ItemsAtPositionQR(n, pcReturnType)

		def ListsAtPositionN(n)
			return This.ItemsAtPositionN(n)

			def ListsAtPositionNQ(n)
				return This.ListsAtPositionNQR(n, :stzList)

			def ListsAtPositionNQR(n, pcReturnType)
				return This.ListsAtPositionNQR(n, pcReturnType)

		def ListsAt(n)
			return This.ItemsAtPositionN(n)

			def ListsAtQ(n)
				return This.ListsAtQR(n, :stzList)

			def ListsAtQR(n, pcReturnType)
				return This.ListsAtQR(n, pcReturnType)

		def ListsAtPosition(n)
			return This.ItemsAtPositionN(n)

			def ListsAtPositionQ(n)
				return This.ListsAtPositionQR(n, :stzList)

			def ListsAtPositionQR(n, pcReturnType)
				return This.ListsAtPositionQR(n, pcReturnType)

		#>

	  #-------------------------------------#
	 #   REVERSING THE ITEMS OF THE LIST   #
	#-------------------------------------#

	# To avoid confusion, it's better to use the alternative forms
	# ReverseItems() and ItemsReversed()

	def ReverseLists()

		aResult = []
		
		for i = This.NumberOfLists() to 1 step -1
			aResult + This[i]
		next

		This.Update( aResult )

		def ReverseListsQ()
			This.ReverseLists()
			return This

		def ReverseItems()
			This.ReverseLists()

			def ReverseItemsQ()
				This.ReverseItems()
				return This

		def Reverse()
			This.ReverseLists()

			def ReverseQ()
				This.Reverse()
				return This

	def ReversedLists()
		aResult = This.Copy().ReverseListsQ().Content()
		return aResult

		#< @FunctionAlternativeForms

		def ListsReversed()
			return This.ReversedLists()

		def Reversed()
			return This.ReversedLists()

		def ReversedItems()
			return This.ReversedLists()

		#>

	  #--------------------------------------#
	 #   REVERSING ITEMS INSIDE THE LISTS   #
	#--------------------------------------#

	def ReverseItemsInLists()
		aListOfLists = This.ListOfLists()
		nLen = len(aListOfLists)

		for i = 1 to nLen
			@aContent[i] = Q(aListOfLists[i]).Reversed()
		next

		def ReverseItemsInListsQ()
			This.ReverseItemsInLists()
			return This

		def ReverseListsContent()
			This.ReverseItemsInLists()

			def ReverseListsContentQ()
				This.ReverseListsContent()
				return This

	def ItemsInListsReversed()
		aResult = This.Copy().ReverseItemsInListsQ().Content()
		return aResult

		def ListsContentReversed()
			return This.ItemsInListsReversed()

	  #---------------#
	 #   INDEXING    #
	#---------------#

	def Index()
		return This.IndexByPosition()

	def Indexed()
		return This.Index()

	#--

	def IndexByPosition()
		return This.IndexBy(:Position)

		def IndexOnPosition()
			return This.IndexByPosition()

	def IndexedByPosition()
		return This.IndexByPosition()

		def IndexedOnPosition()
			return This.IndexedByPosition()

	#--

	def IndexNyNumberOfOccurrence()
		return This.IndexBy(:NumberOfOccurrence)

		def IndexByNumberOfOccurrences()
			return This.IndexByNumberOfOccurrence()

		def IndexOnNumberOfOccurrence()
			return This.IndexByNumberOfOccurrence()

		def IndexOnNumberOfOccurrences()
			return This.IndexByNumberOfOccurrence()

	def IndexedByNumberOfOccurrence()
		return This.IndexByNumberOfOccurrence()

		def IndexedByNumberOfOccurrences()
			return This.IndexedByNumberOfOccurrence()

		def IndexedOnNumberOfOccurrence()
			return This.IndexedByNumberOfOccurrence()

		def IndexedOnNumberOfOccurrences()
			return This.IndexedByNumberOfOccurrence()

	#--

	def IndexBy(pcOn) # pcOn can be :NumberOfOccurrence(s) or :Position
		/*
		Problem:

			Let:

			a1 = [ "A", "A", "B", "C" ]
			a2 = [ "B", "A", "C", "B", "A", "X" ]

			Getting the index of each list alone, by number of
			occurrence for example, is simply done by calling
			the method IndexBy(:NumberOfOccurrence) of stzList,
			so we get:

			Index(a1) --> [ :A = 2, :B = 1, :C = 1 ]
		   	Index(a2) --> [ :A = 2, :B = 1, :C = 1, :X = 1 ]

			What we need is to make the Index of these TWO lists
			togethor so we can have:

			[ :A = [2,2] , :B = [1,2] , :C = [1,1] , :X = [0,1] ]

			Note: we shloumd be able tp do it for any number of lists...
		*/

		aIndexes = []
		aListOfLists = This.Content()
		nLen = len(aListOfLists)

		for i = 1 to nLen
			oTempList = new stzList( aListOfLists[i] )
			aIndexes + oTempList.IndexBy(pcOn)
		next
		// aIndexes => [ [ :A = 2, :B = 1, :C = 1 ],
		//		 [ :A = 2, :B = 1, :C = 1, :X = 1 ] ]	


		aKeys = This.ToStzList().MergeQ().DuplicatesRemoved()
		// aKeys => [ :A, :B, :C, :X ]
		
		nLenKeys = len(aKeys)
		nLenIndexes = len(aIndexes)
		aResult = []

		for i = 1 to nLenKeys
			key = aKeys[i]
			aValues = []

			for v = 1 to nLenIndexes
				aIndex = aIndexes[v]
				value = aIndex[key]
				
				if pcOn = :NumberOfOccurrence or pcOn = :NumberOfOccurrences
					if isString(value) and value = NULL
						value = 0
					ok

					aValues + value

				but pcOn = :Position
					aPositions = value
					/* aPositions = [ 1, 3 , 2 ]
					   => [ (i,1) , (i,3) , (i,2) ]
					*/
					nLenPositions = len(aPositions)

					for q = 1 to nLenPositions 
						aValues + [ v, aPositions[q] ]
					next
				ok
			next
			aResult + [ key, aValues ]
		next
		// aIndex => [ :A = [2,2] , :B = [1,2] , :C = [1,1] , :X = [0,1] ]

		return aResult

		def IndexOn(pcOn)
			return This.IndexBy(pcOn)

	def IndexedBy(pcOn)
		return This.IndexBy(pcOn)

		def IndexedOn(pcOn)
			return This.IndexedBy(pcOn)

	  #------------#
	 #   ENTRY    #
	#------------#

	def EntryByPosition(pEntry)
		return This.Entry(pEntry, :ByPosition)

	def EntryByNumberOfOccurrence(pEntry)
		return This.Entry(pEntry, :ByNumberOfOccurrence)

		def EntryByNumberOfOccurrences(pEntry)
			return This.EntryByNumberOfOccurrence(pEntry)

	def Entry(pEntry,pcBy)
		if pcBy = :ByPosition
			return This.IndexOn(:Position)[pEntry]

		but pcBy = :ByNumberOfOccurrence or pcBy = :ByNumberOfOccurrences
			return This.IndexOn(:NumberOfOccurrence)[pEntry]
		ok

	  #-----------------------------------------#
	 #   OCCURRENCE OF AN ENTRY IN THE INDEX   #
	#-----------------------------------------#

	def NumberOfOccurrenceOfEntry(pEntry)
		return len(o1.IndexOn(:Position)[pEntry])

		def NumberOfOccurrencesOfEntry(pEntry)
			return This.NumberOfOccurrenceOfEntry(pEntry)

	def NthOccurrenceOfEntry(n, pEntry)
		return o1.IndexOn(:Position)[pEntry][n]

		def NthOccurrencesOfEntry(n, pEntry)
			return This.NthOccurrenceOfEntry(n, pEntry)

	def FirstOccurrenceOfEntry(pEntry)
		return NthOccurrenceOfEntry(1, pEntry)

	def LastOccurrenceOfEntry(pEntry)
		return NthOccurrenceOfEntry(This.NumberOfOccurrenceOfEntry(pEntry), pEntry)

	  #------------------#
	 #   CONTAINMENT    #
	#------------------#

	def ContainsItem(pItem)
		bResult = FALSE
		aListOfLists = This.ListOfLists()
		nLen = len(aListOfLists)

		for i = 1 to nLen
			oStzList = new stzList( aListOfLists[i] )
			if oStzList.Contains(pItem)
				bResult = TRUE
				exit
			ok
		next

		return bResult

	def ListsContainingItem(pItem)
		aResult = []
		aListOfLists = This.ListOfLists()
		nLen = len(aListOfLists)

		for i = 1 to nLen
			oStzList = new stzList(aListOfLists[i])
			if oStzList.Contains(pItem)
				aResult + list
			ok
		next
		return aResult

	  #----------------------------------#
	 #   INTERSECTION & COMMON ITEMS    #
	#----------------------------------#

	def HaveSameContent()
		// TODO

	def CommonItems()
		return This.Intersection()

	def Intersection()
		/*
		The intersection between a list of lists (ie their common item) is
		given by the duplicated items of the merged list of all those lists.
		*/
		oStzList = new stzList(This.Merge())
		return oStzList.DuplicatedItems()

	  #-----------------------------------------------------#
	 #   MERGING THE LISTS AND RETURNING ONE MERGED LIST   #
	#-----------------------------------------------------#

	def Merge()

		aResult = []
		aListOfLists = This.ListOfLists()
		nLenListOfLists = len(aListOfLists)

		for i = 1 to nLenListOfLists
			aList = aListOfLists[i]
			nLenList = len(aList)

			for v = 1 to nLenList
				aResult + aList[v]
			next
		next

		return aResult

		def MergeQ()
			return This.MergeQR(:stzList)

		def MergeQR(pcReturnType)
			switch pcReturnType
			on :stzList
				return new stzList( This.Merged() )

			on :stzListOfNumbers
				return new stzListOfNumbers( This.Merged() )

			on :stzListOfStrings
				return new stzListOfStrings( This.Merged() )

			on :stzListOfChars
				return new stzListOfChars( This.Merged() )

			on :stzListOfPairs
				return new stzListOfPairs( This.Merged() )

			on :stzListOfLists
				return new stzListOfLists( This.Merged() )

			other
				StzRaise("Unsupported return type!")
			off
	def Merged()
		return This.Merge()

	  #-----------------------------------------------------------#
	 #   FLATTENING THE LISTS AND RETURNING ONE FLATTENED LIST   #
	#-----------------------------------------------------------#

	def Flatten()
		aResult = This.ToStzList().Flattened()
		return aResult

		def FlattenQ()
			return This.FlattenQR(:stzList)

		def FlattenQR(pcReturnType)
			switch pcReturnType
			on :stzList
				return new stzList( This.Flattened() )

			on :stzListOfNumbers
				return new stzListOfNumbers( This.Flattened() )

			on :stzListOfStrings
				return new stzListOfStrings( This.Flattened() )

			on :stzListOfChars
				return new stzListOfChars( This.Flattened() )

			on :stzListOfPairs
				return new stzListOfPairs( This.Flattened() )

			on :stzListOfLists
				return new stzListOfLists( This.Flattened() )

			other
				StzRaise("Unsupported return type!")
			off

	def Flattened()
		return This.Flatten()

	  #---------------------#
	 #   TO OTHER TYPES    #
	#---------------------#

	def ToStzList()
		return new stzList( This.Content() )

	def ToStzListQ()
		return new stzList( This.Content() )

	def ToListOfStrings()
		aResult = []
		aListOfLists = This.ListOfLists()
		nLen = len(aListOfLists)

		for i = 1 to nLen 
			aResult + @@( aListOfLists[i] ) # @@ --> ComputableForm( list )
		next

		return aResult

		def Stringify()
			return This.ToListOfStrings()

	def ToStzListOfStrings()
		return new stzListOfStrings( This.Stringify() )

	  #-----------#
	 #   MISC.   #
	#-----------#
		
	def stzType()
		return :stzListOfLists

	def ToListsInString()
		acResult = []
		aListOfLists = This.ListOfLists()
		nLen = len(aListOfLists)

		for i = 1 to nLen
			acResult + StzListQ(aListOfLists[i]).ToListInString()
		next

		return acResult

		def ToListsInStringQ()
			return new stzString( This.ToListsInString() )

		def ToListInStringInNormalForm()
			return This.ToListsInString()

			def ToListInStringInNormalFormQ()
				return new stzString( This.ToListInStringInNormalForm() )

		def ToListInNormalForm()
			return This.ToListsInString()

			def ToListInNormalFormQ()
				return new stzString( This.ToListInNormalForm() )

	def ToListInStringInShortForm()
		acResult = []
		aListOfLists = This.ListOfLists()
		nLen = len(aListOfLists)

		for i = 1 to len(aListOfLists)
			acResult + StzListQ(aListOfLists[i]).ToListInStringInShortForm()
		next

		return acResult

		def ToListInStringInShortFormQ()
			return new stzString( This.ToListInStringInShortForm() )

		def ToListInShortForm()
			return This.ToListInStringInShortForm()

			def ToListInShortFormQ()
				return new stzString( This.ToListInShortForm() )

		def ToListInStringSF()
			return This.ToListInStringInShortForm()
	
			def ToListInStringSFQ()
				return new stzString( This.ToListInStringSF() )
