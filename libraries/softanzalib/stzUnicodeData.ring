#-------------------------------------------------------------------------#
# 		   SOFTANZA LIBRARY (V1.0) - STZUNICODEDATA	          #
# 	An accelerative library for Ring applications, and more!	  #
#-------------------------------------------------------------------------#
#									  #
# 	Description : The class for managing Unicode data in Softanza     #
#	Version	    : V1.0 (2020-2023)				          #
#	Author	    : Mansour Ayouni (kalidianow@gmail.com)		  #
#								          #
#-------------------------------------------------------------------------#

/* GENERAL NOTES

	RATIONALE : Why this class and related large file are necessary
	---------------------------------------------------------------

	The Unicode database is a large file provided by the Unicode foundation here:
	https://www.unicode.org/Public/UCD/latest/ucd/UnicodeData.txt

	Programming languages and frameworkks supporting Unicode have different
	strategies in including this data. Hence, some of them prefer not including
	it and relying on its presence on the hosting OS where the application runs.

	Qt, includes it internallay, which enables us to have most of the data
	we need (via RingQt). This is really helpful, and it's done, of course, with
	a good performance.

	Unfortunately, some features provided by Softanza are not supported in Qt,
	like for example the fact of getting chars names, or finding chars by their
	names (and not their Unicode codes).

	That's why Softanza included itw own copy of the Unicode database.

	In practice, Softanza will use RingQt for any available Unicode feature,
	otherwise its own text file is used (called stzUnicodeData.txt).

	The current file contains a class (stzUnicodeData) with the functions
	added specifically by Softanza. The others can be found in stzChar.ring class.

	DATA STRUCTURE OF THE UNICODE TEXT FILE
	---------------------------------------

	Fields separated by (details here http://www.unicode.org/L2/L1999/UnicodeData.html):

	01. Code value
	02. Character name
	03. General category
	04. Canonical combining classes
	05. Bidirectional category
	06. Character decomposition mapping
	07. Decimal digit value
	08. Digit value
	09. Numeric value
	10. Mirrored
	11. Unicode 1.0 Name
	12. 10646 comment field()
	13. Uppercase mapping
	14. Lowercase mapping
	15. Titlecase mapping

	TODO (futute)
	-------------

	TODO: understand and include this resource (if necessary):
	https://www.unicode.org/Public/UCD/latest/ucd/NameAliases.txt

*/

_nNumberOfUnicodeChars = 149_186

_nMaxUnicode = 1_114_112

_cUnicodeData = read("stzUnicodeData.txt")

_anMathUnicodes = [
	172, 176, 177, 188, 189, 190, 215, 247, 915, 916, 920, 923,
	926, 928, 931, 933, 934, 936, 937, 945, 946, 947, 948, 949,
	950, 951, 952, 953, 954, 955, 956, 957, 958, 959, 960, 961,
	963, 964, 965, 966, 967, 968, 969, 8531, 8532, 8704, 8706,
	8707, 8709, 8711, 8712, 8713, 8719, 8721, 8730, 8733, 8734,
	8736, 8743, 8744, 8747, 8754, 8756, 8776, 8800, 8801, 8804, 8805
]

func UnicodeData()
	return _cUnicodeData
	
	func StzUnicodeDataQ()
		return new stzUnicodeData()

	func UnicodeDataAsString()
		return UnicodeData()

		func UnicodeDataAsStringQ()
			return new stzUnicodeDataAsString()

func MaxUnicode()
	return _nMaxUnicode

	func LastUnicode()
		return MaxUnicode()

	func MaxUnicodeNumber()
		return MaxUnicode()

func NumberOfUnicodeChars()
	return _nNumberOfUnicodeChars

func MathUnicodes()
	return _anMathUnicodes

func NumberOfMathChars()
	return len(_anMathUnicodes)

	func HowManyMathChars()
		return NumberOfMathChars()

func MathChars()
	return UnicodesToChars(MathUnicodes())

	func MathCharsQ()
		return MathCharsQR(:stzList)

	func MathCharsQR(pcReturnType)

		switch pcReturnType
		on :stzList
			return new stzList(MathChars())

		on :stzListOfChars
			return new stzListOfChars(MathChars())

		on :stzListOfStrings
			return new stzListOfStrings(MathChars())

		other
			StzRaise("Insupported return type!")
		off

class stzUnicodeDataAsString from stzUnicodeData

class stzUnicodeData
	@oStzStrUnicodeData

	def init()
		@oStzStrUnicodeData = new stzString( UnicodeData() )

	def ContainsCharName(pcCharName)
		if This.FindCharName(pcCharName) > 0
			return TRUE
		else
			return FALSE
		ok

		def ContainsName(pcCharName)
			return This.ContainsCharName()

	def FindCharName(pcCharName)
		if NOT isString(pcCharName)
			StzRaise("Incorrect param type! pcCharName must be a string.")
		ok

		pcCharName = Q(pcCharName).Uppercased()

		nPos = @oStzStrUnicodeData.FindFirstCS( pcCharName, :CS = FALSE )
		return nPos

		def FindcharByName(pcCharName)
			return This.FindCharName(pcCharName)

	def SearchCharName(pcCharName)
		return @oStzStrUnicodeData.FindAllCS( pcCharName, :CS = FALSE )

		def SearchForCharName(pcCharName)
			return SearchCharName(pcCharName)

		def SearchCharByName(pcCharName)
			return SearchCharName(pcCharName)


	def CharByName(pcCharName)
		cHex = This.CharHexCodeByName(pcCharName)
		nUnicode = HexToDecimal( cHex )

		cChar = StzCharQ(nUnicode).Content()
		return cChar

	def CharHexCodeByName(pcCharName)
		n = This.FindCharName(";"+ pcCharName + ";")

		if n > 0
			n2 = n - 1
			n1 = @oStzStrUnicodeData.PreviousOccurrence(NL, n) + 1
			cHex = HexPrefix() + @oStzStrUnicodeData.Section(n1, n2)

			return cHex
		else
			return HexPrefix() 
		ok

	def CharUnicodeByName(pcCharName)
		return StzHexNumberQ( This.CharHexCodeByName(pcCharName) ).ToDecimal()

		def CharDecimalCodeByName(pcCharName)
			return This.CharUnicodeByName(pcCharName)

	def CharByHexCode(pcHex)
		cHex = StzHexNumberQ(pcHex).WithoutPrefix()
		if @oStzStrUnicodeData.Contains(NL + cHex + ";")
			nUnicode = StzHexNumberQ(pcHex).ToDecimal()
			return StzCharQ(nUnicode).Content()
		ok

	def CharByUnicode(nUnicode)
		cHex = StzNumberQ(nUnicode).ToHex()
		return This.CharByHexCode(cHex)

		def CharByDecimalCode(nUnicode)
			return This.CharByUnicode(nUnicode)

	def CharNameByHexCode(pcHex)

		cHex = StzHexNumberQ(pcHex).WithoutPrefix()

		if cHex = ""
			return NULL
		ok

		switch len(cHex)
		on 3
			cHex = "0" + cHex
		on 2
			cHex = "00" + cHex
		on 1
			cHex = "000" + cHex
		off


		n = @oStzStrUnicodeData.FindFirst(NL + cHex + ";")
		
		if n = 0
			return NULL
		ok

		n++	# To compensate the NL

		# Defininging start of the char name in n1

		bContinue = TRUE
		i = 0

		while bContinue
			i++
			c = @oStzStrUnicodeData[n + i]

			if c = ";"
				n1 = n + i + 1
				bContinue = FALSE
			ok
		end

		# Defininging end of the char name in n2
		n = n1
		bContinue = TRUE
		i = 0

		while bContinue
			i++
			c = @oStzStrUnicodeData[n + i]

			if c = ";"
				n2 = n + i - 1
				bContinue = FALSE
			ok
		end

		
		cResult = @oStzStrUnicodeData.Section(n1, n2)
		return cResult

	def CharNameByUnicode(nUnicode)
		cHex = StzNumberQ(nUnicode).ToHex()
		cResult = This.CharNameByHexCode(cHex)
		return cResult

	def CharsContaining(pcCharName)
		anUnicodes = This.SearchCharByName(pcCharName)
		acResult = StzListOfCharsQ(anUnicodes).Content()

		return acResult

	def CharsNamesContaining(pcCharName)
		anUnicodes = This.SearchCharName(pcCharName)
		aResult = UnicodesToCharsNames(anUnicodes)
		return aResult
