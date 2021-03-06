
func StzListOfUnicodesQ(aListOfNumbers)
	return new stzListOfUnicodes(aListOfNumbers)

func UnicodesToChars(anUnicodes)
	return StzListOfUnicodesQ(anUnicodes).Chars()

func UnicodesToCharsNames(anUnicodes)
	return StzListOfUnicodesQ(anUnicodes).Names()

func NamesOfInvisibleChars()
	return UnicodesToCharsNames( InvisibleUnicodes() )

func IsUnicode(n)
	if n >= 0 and n <= 1114111
		return TRUE
	else
		return FALSE
	ok

	#< @FunctionAlternativeForm

	func IsUnicodeNumber(n)
		return IsUnicode()

	#>

func UnicodesToString(anUnicodes)
	return StzListOfUnicodesQ(anUnicodes).ToString()

class stzListOfUnicodes from stzListOfNumbers
	@anUnicodes

	def init(aList)

		if isList(aList) and ( Q(aList).IsEmpty() or Q(aList).IsListOfNumbers() )

			if len(aList) > 0
		  
		   		if StzListOfNumbersQ(aList).Min() >= 0 and
		   		   StzListOfNumbersQ(aList).Max() <= 1114111

					@anUnicodes = aList
				ok
			ok

		else
			stzRaise("Can't create the stzListOfUnicodes object!")
		ok

	def Content()
		return @anUnicodes

	def Unicodes()
		return This.Content()

	def ListOfUnicodes()
		return This.Content()

	def UnicodesAndChars()
		aResult = []

		for n in This.Content()
			aResult + [ n, StzCharQ(n).Content() ]
		next

		return aResult

	def CharsAndUnicodes()
		aResult = []

		for n in This.Content()
			aResult + [ StzCharQ(n).Content(), n ]
		next

		return aResult
		
	def Chars()
		aResult = []
		
		for n in This.Content()
			aResult + StzCharQ(n).Content()
		next

		return aResult

		#< @FunctionAlternativeForm

		def ToChars()
			return This.Chars()

		#>

	def Names()
		aResult = []

		for n in This.Content()
			aResult + StzCharQ(n).Name()
		next

		return aResult

	def String()
		cResult = ""
		for n in This.ListOfUnicodes()
			cResult += UnicodeToChar(n)
		next

		return cResult

		#< @FunctionAlternativeForm

		def ToString()
			return This.String()

		#>
