#---------------------------------------------------------------------------#
# 		    SOFTANZA LIBRARY (V1.0) - STZSTRING			    #
#		An accelerative library for Ring applications		    #
#---------------------------------------------------------------------------#
#									    #
# 	Description	: The core class for managing Unicode strings       #
#	Version		: V1.0 (2020-2022)				    #
#	Author		: Mansour Ayouni (kalidianow@gmail.com)		    #
#									    #
#---------------------------------------------------------------------------#

/*
	TODO Add:
	QStringRef methods

	Also: use QStringView for read-only operations, and QByteArray for
	UT8-only string
	#--> Better performance.

	Todo:
	Get inspiration from the pyhthon ftfy library to add Unicode text
	cleansing in Softanza
	link: https://ftfy.readthedocs.io/en/latest/fixes.html
*/

  /////////////////////
 ///   FUNCTIONS   ///
/////////////////////

func StzStringQ(str)
	return new stzString(str)
	
func StzStringMethods()
	return Stz(:String, :Methods)

func StzStringAttributes()
	return Stz(:String, :Attributes)

func StzStringClassName()
	return Stz(:String, :ClassName)

	func StzStringClass()
		return StzStringClassName()

func S(p)
	if isString(p)
		return p

	but isNumber(p)
		return ""+ p

	but isList(p)
		return Q(p).ToCode()

	but isObject(p)
		return LQ(p).ToCode()
	ok

	func SQ(p)
		return Q( S(p) )

		func QS(p)
			return SQ(p)

func IsNotString(pcStr)
	return NOT isString(pcStr)
	
func IsNullString(cStr)
	if isString(cStr) and cStr != NULL
		return TRUE
	else
		return FALSE
	ok

	func IsEmptyString(cStr)
		return IsNullString(cStr)

func IsNonNullString(cStr)
	return NOT IsNullString(cStr)

	func IsNonEmptyString(cStr)
		return This.IsNonNullString(cStr)

	func IsFullString(cStr)
		return This.IsNonNullString(cStr)

func StringToQString(cStr)
	oStr = new stzString(cStr)
	return oStr.QStringObject()
	
func IsQString(p)

	if isObject(p) and ( classname(p) = "qstring" or classname(p) = "qstring2" )
		return TRUE
	else
		return FALSE
	ok

	#--

	def IsQStringObject(p)
		return IsQString(p)
	
func QStringContent(oQStr)

	try
		return oQStr.left(oQStr.count())
	catch
		stzRaise(stzStringError(:CanNotTransformQStringToString))
	done

	#--

	func QStringObjectContent(oQStr)
		return QStringContent(oQStr)

	func QStringToString(oQStr)
		return QStringContent(oQStr)

	func QStringObjectToString(oQStr)
		return QStringContent(oQStr)
	
func QStringToStzString(oQString)
	return new stzString(QStringToString(oQString))

	func QStringObjectToStzString(oQString)
		return QStringToStzString(oQString)
	
func StringIsEmpty(pcStr)
	return pcStr = ""

func StringIsNull(pcStr)
	return pcStr = ""

func StzStringToQString(oStr)
	return oStr.QStringObject()
	
func StringIsLocaleAbbreviation(cStr)
	oStr = new stzString(cStr)
	return oStr.IsLocaleAbbreviation()
	
func StringIsLanguageAbbreviation(cStr)
	oStr = new stzString(cStr)
	return oStr.IsLanguageAbbreviation()
	
func StringIsShortLanguageAbbreviation(cStr)
	oStr = new stzString(cStr)
	return oStr.IsShortLanguageAbbreviation()
	
func StringIsLongLanguageAbbreviation(cStr)
	oStr = new stzString(cStr)
	return oStr.IsLongLanguageAbbreviation()
	
func StringIsLanguageName(cStr)
	oStr = new stzString(cStr)
	return oStr.IsLanguageName()
	
func StringIsLanguageNumber(cStr)
	oStr = new stzString(cStr)
	return oStr.IsLanguageNumber()
	
func StringIsCountryAbbreviation(cStr)
	oStr = new stzString(cStr)
	return oStr.IsCountryAbbreviation()
	
func StringIsCountryName(cStr)
	oStr = new stzString(cStr)
	return oStr.IsCountryName()
	
func StringIsCountryNumber(cStr)
	oStr = new stzString(cStr)
	return oStr.IsCountryNumber()
	
func StringIsShortCountryAbbreviation(cStr)
	oStr = new stzString(cStr)
	return oStr.IsShortCountryAbbreviation()
	
func StringIsLongCountryAbbreviation(cStr)
	oStr = new stzString(cStr)
	return oStr.IsLongCountryAbbreviation()
	
func StringIsScriptAbbreviation(cStr)
	oStr = new stzString(cStr)
	return oStr.IsScriptAbbreviation()
	
func StringIsScriptName(cStr)
	oStr = new stzString(cStr)
	return oStr.IsScriptName()
	
func StringIsScriptNumber(cStr)
	oStr = new stzString(cStr)
	return oStr.IsScriptNumber()
	
func StringIsLowercase(cStr)
	return StzStringQ(cStr).IsLowercase()

func StringIsUppercase(cStr)
	return StzStringQ(cStr).IsUppercase()

func StringLowercased(cStr)
	oStr = new stzString(cStr)
	return oStr.Lowercased()
	
	func StringLowercase(cStr)
		return StringLowercased(cStr)

func StringUppercased(cStr)
	oStr = new stzString(cStr)
	return oStr.Uppercased()
	
	func StringUppercase(cStr)
		return StringUppercased(cStr)
	
func StringTitlecased(cStr)
	oStr = new stzString(cStr)
	return oStr.Titlecased()
	
	func StringTitlecase(cStr)
		return StringTitlecased(cStr)

	func Titlecase(cStr)
		return StringTitlecased(cStr)

	func Titlecased(cStr)
		return StringTitlecased(cStr)

	
func StringAlign(cString, nWidth, cChar, cDirection)
	oString = new stzString(cString)
	return oString.AlignQ(nWidth, cChar, cDirection).Content()
	
func StringLeftAlign(cString, nWidth, cChar)
	return StringAlign(cString, nWidth, cChar, :Left)
	
func StringRightAlign(cString, nWidth, cChar)
	return StringAlign(cString, nWidth, cChar, :Right)
	
func StringCenterAlign(cString, nWidth, cChar)
	return StringAlign(cString, nWidth, cChar, :Center)
	
func StringRepeat(cString, n)
	oString = new stzString(cString)
	return oString.RepeatedNTimes(n)
	
func StringNumberOfChars(cStr)
	oString = new stzString(cStr)
	return oString.NumberOfChars()
	
func StringReverseChars(cStr)
	oString = new stzString(cStr)
	return oString.CharsReversed()
	
func StringIsWord(cStr)
	oString = new stzString(cStr)
	return oString.IsWord()
	
func StringContains(pcStr, pcSubStr)
	return StzStringQ(pcStr).Contains(pcSubStr)
	
func StringNumberOfOccurrence(pcStr, pcSubStr)
	return StzStringQ(pcStr).NumberOfOccurrence(pcSubStr)
	
func StringToUnicodes(pcStr)
	return StzStringQ(pcStr).Unicodes()
	
	func StringUnicodes(pcStr)
		return StringToUnicodes(pcStr)
	
func StringInvert(cStr)
	return StzStringQ(cStr).Inverted()
	
func StringScript(cStr)
	return StzStringQ(cStr).Script()

# Some functions used mainly in natural-code

func UppercaseOf(cStr)
	return StzStringQ(cStr).Uppercased()

	func UppercaseIn(cStr)
		return UppercaseOf(cStr)

func LowercaseOf(cStr)
	return StzStringQ(cStr).Lowercased()

	func LowercaseIn(cStr)
		return LowercaseOf(cStr)

func FoldcaseOf(cStr)
	return StzStringQ(cStr).Foldcase()

	func FoldcaseIn(cStr)
		return FoldcaseOf(cStr)

func NthCharOf(n, cStr)
	return StzStringQ(cStr)[n]

	func NthCharIn(n, cStr)
		return NthCharOf(n, cStr)

func NthLetterOf(n, cStr)
		aOnlyLetters = StzStringQ(cStr).OnlyLetters()
		return aOnlyLetters[n]

	func NthLetterIn(n, cStr)
		return NthLetterOf(n, cStr)

func StringIsArabicWord(pcStr)
	return StzStringQ(pcStr).IsArabicWord()

func StringIsCharName(pcStr)
	return StzStringQ(pcStr).IsCharName()

# Used for natural-coding

func String(pcStr)
	if isString(pcStr)
		return pcStr
	ok

func Text(pcStr)
	# NOTE: In the future, there will be a difference
	# between String and Text
	if isString(pcStr)
		return pcStr
	ok

func Word(pcStr)
	if StringIsWord(pcStr)
		return pcStr
	ok

func String@(pcStr)
	if isString(pcStr)
		return ComputableForm(pcStr)
	ok

func NumberOfCharsOf(pcStr)
	return StzStringQ(pcStr).NumberOfChars()

	func NumberOfCharsIn(pcStr)
		return NumberOfCharsOf(pcStr)

func BothStringsAreEqualCS(pcStr1, pcStr2, pCaseSensitive)
	return StringsAreEqualCS( [ pcStr1, pcStr2 ], pCaseSensitive )

func BothStringsAreEqual(pcStr1, pcStr2)
	return BothStringsAreEqualCS(pcStr1, pcStr2, :CaseSensitive = TRUE)

func StringsAreEqualCS(paStrings, pCaseSensitive)
	if NOT ListIsListOfStrings(paStrings)
		stzRaise("You must provide a list of strings!")
	ok

	if NOT len(paStrings) > 1
		stzRaise("You must provide at least two strings in the list!")
	ok

	if isList(pCaseSensitive) and StzListQ(pCaseSensitive).IsCaseSensitiveNamedParam()
		pCaseSensitive = pCaseSensitive[2]
	ok

	bResult = TRUE

	if pCaseSensitive = TRUE
		
		cFirstStr = StzStringQ(paStrings[1]).Lowercased()

		for i = 2 to len(paStrings)
			if StzStringQ(paStrings[i]).Lowercased() != cFirstStr
				bResult = FALSE
				exit
			ok 
		next

		return bResult
	else

		cFirstStr = paStrings[1]

		for i = 1 to len(paStrings)
			if paStrings[i] != cFirstStr
				bResult = FALSE
				exit
			ok
		next

	ok

	return bResult

func StringsAreEqual(paStrings)
	return StringsAreEqualCS(paStrings, :CaseSensitive = TRUE)

func RemoveDiacritics(pcStr)
	return StzStringQ(pcStr).DiacriticsRemoved()

func StringCases()
	return [ :Lowercase, :Uppercase, :Capitalcase, :Titlecase, :Foldercase ]

func StringCase(pcStr)

	return StzStringQ(pcStr).StringCase()


  /////////////////
 ///   CLASS   ///
/////////////////

class stzString from stzObject

	@oQString
	@@aConstraints = []

	@cLanguage = :English	# Set explicitly using SetLanguage()
				# TODO (future): Infere the language from the string

	// Initializes the content of the softanza string object
	def init(pcStr)

		if isString(pcStr)
			@oQString = new QString2()
			@oQString.append(pcStr)

		but IsQString(pcStr)
			@oQString = pcStr

		else
			stzRaise("Can't create the stzString object! You must provide a string (or a QString).")
		ok

	  #--------------------------#
	 #   CHECKING CONSTRAINTS   #
	#--------------------------#
	
	# TODO: Generalize this feature to other classes

	def EnforcedConstraints()
		return @@aConstraints

		def Constraints()
			return This.EnforcedConstraints()

	def VerifyConstraint(pcConstraintName)

		@str = This.Content()

		cCondition = Constraints()[ :OnStzString ][ pcConstraintName ]

		if cCondition = NULL
			stzRaise("Inexsitant contraint!")
		ok

		CompileConstraint(cCondition)

		StzStringQ(cCondition) {

			ReplaceCS("@string", @str, :CS = FALSE)
			Simplify()
			RemoveBounds("{", "}")

			cCondition = Content()
		}

		cCode  = 'bResult = ""+ (' + cCondition + ')'
		eval(cCode)

		if bResult = FALSE
			stzRaise([
				:Where = "stzString.ring > VerifyCondition()",
				:What  = "Execution is cancelled by Softanza",
				:Why   = "A constraint on the string object is not verified!",
				:Todo  = "Check that constraint (" + pcName + ") and adjust your logic accordingly ;)"

			])
		ok

	def VerifyConstraints()
		bResult = TRUE

		for aPair in This.Constraints()
			cConstraintName = aPair[1]
			This.VerifyConstraint(cConstraintName) = FALSE
			
		next

	  #-------------------------------#
	 #     APPENDING & PEPENDING     #
	#-------------------------------#

	// Appends the main string by an other string
	def Append(pcOtherStr)
		cResult = This.String() + pcOtherStr
		This.Update( cResult )

		#< @FunctionFluentForm

		def AppendQ(pcOtherStr)
			This.Append(pcOtherStr)
			return This
	
		#>

	// Prepends the string by an other string
	def Prepend(pcOtherStr)
		cResult = pcOtherStr + This.String()
		This.Update( cResult )

		#< @FunctionFluentForm

		def PrependQ(pcOtherStr)
			This.Prepend(pcOtherStr)
			return This
	
		#>

	  #---------------------------------------#
	 #     GETTING CONTENT OF THE STRING     #
	#---------------------------------------#

	// Returns the string's content
	def Content()

		return QStringToString( @oQString )

		#< @FunctionFluentForm

		def ContentQ()
			return This

		#>
	
	def QStringObject()
		return @oQString

		def ToQStringObject()
			return This.QStringObject()

		def ToQString()
			return This.QStringObject()

	def String()
		return This.Content()

		#< @FunctionFluentForm

		def StringQ()
			return This
	
		#>

	  #---------------------------------------------#
	 #     GETTING A COPY OF THE STRING OBJECT     #
	#---------------------------------------------#

	def Copy()

		# t0 = clock()

		oCopy = new stzString( This.String() )

		# ? ( clock() - t0 ) / clockspersecond()

		return oCopy

	def ReversedCopy()
		return This.ReverseQ()

	  #-------------------------------#
	 #     CASE OF THE STRING        #
	#-------------------------------#

	def StringCase()

		if This.IsLowercase()

			return :Lowercase

		but This.IsUppercase()

			return :Uppercase

		but This.IsCapitalcase()

			return :Capitalcase

		but This.IsTitlecase()

			return :Titlecase

		but This.IsFoldercase()

			return :Foldercase

		else

			return :Hybridcase
		ok

	def CharCase()
		if This.NumberOfChars() = 1
			return This.StringCase()
		ok

	def HasSameCaseAs(pcOtherStr)
		return This.CharCase() = StzStringQ(pcOtherStr).CharCase()

		def HasSameCharCaseAs(pcOtherStr)
			return This.HasSameCaseAs(pcOtherStr)

	def HasDifferentCaseAs(pcOtherStr)
		return NOT This.HasSameCaseAs(pcOtherStr)

		def HasDifferentCharCase(pcOtherStr)
			return This.HasDifferentCaseAs(pcOtherStr)

		def HasNoSameCaseAs(pcOtherStr)
			return This.HasDifferentCaseAs(pcOtherStr)

			def HasNoSameCharCaseAs(pcOtherStr)
				return This.HasNoSameCaseAs(pcOtherStr)

	def IsHybridcase()
		return _@( This.StringCase() ).IsNotOneOfThese([ StringCases() ])

		def IsHybridCased()
			return This.IsHybridcase()

	  #-------------------------------#
	 #     LOWERCASING THE STRING    #
	#-------------------------------#

	// Transforms the string to lowercase
	def ApplyLowercase() # Understand it as a verb, an action on main string!
		oQLocale = new QLocale("C")
		This.Update( oQLocale.toLower(This.String()) )

		#< @FunctionFluentForm

	 	// Transforms the string to lowercase AND Returns the lowercased
		// stzString object to take other actions on it!
		def ApplyLowercaseQ() # Q for Queue -> a chain of actions
			This.ApplyLowercase()
			return This

		#>

		#< @FunctionAlternativeForm	// TODO: replace with @FunctionAlternativeFormForm

		def Lowercase() # Understand it as a verb that "lowercases" the string
			This.ApplyLowercase()

			def LowercaseQ()
				This.Lowercase()
				return This
	
		#>

	def Lowercased()
		cResult = This.Copy().LowercaseQ().Content()
		return cResult

	// Tranforms the string to LOCALE-SENSITIVE lowercase
	def ApplyLowercaseInLocale(pcLocale)
		/*
		Apply the special cases documented in unicode here:
		--> http://unicode.org/Public/UNIDATA/SpecialCasing.txt

		*/

		oLocale = new stzLocale(pcLocale)
		This.Update( oLocale.ToLowercase(This.String()) )

		#< @FunctionFluentForm

		def ApplyLowercaseInLocaleQ(pcLocale)
			This.ApplyLowercaseInLocale(pcLocale)
			return This
	
		#>

		#< @FunctionAlternativeForm	// TODO: replace with @FunctionAlternativeFormForm

		def LowercaseInLocale(pLocale) # Understand it as a verb that "lowercases" the string in the givan locale
			This.ApplyLowercaseInLocale(pLocale)

			def LowercaseInLocaleQ(pLocale)
				This.LowercaseInLocale(pLocale)
				return This
	
		#>
			
	def LowercasedInLocale(pcLocale)
		cResult = This.Copy().LowercaseInLocaleQ(pcLocale).Content()
		return cResult

		#< @FunctionFluentForm

		def LowercasedInLocaleQ(pLocale)
			return new stzString( This.LowercasedInLocale(pLocale) )

		#>

	def IsLowercase()
	
		if This.ToStzText().IsLatinScript() and This.Lowercased() = This.String()
			return TRUE
		else
			return FALSE
		ok

		#< @FunctionAlternativeForm

		def IsLowercased()
			return This.IsLowercase()
		#>

		#< @FunctionNegativeForm

		def IsNotLowercase()
			return NOT This.IsLowercase()

		def IsNotLowercased()
			return This.IsNotLowercase()
		#>

	def IsLowercaseInLocale(pLocale)
		return StzLocaleQ(pLocale).StringLowercased(This.String()) = This.String() # TODO: replace with DefaultLocale

	def IsLowercaseOf(pcStr)
		return StzStringQ(pcStr).Lowercased() = This.String()

	def IsLowercaseOfXT(pcStr, paLocale)
		/* Example
		Q("many").IsLowercaseOfXT("MANY", :InThisLocale = "fr_FR")
		*/
	
		if NOT ( isList(paLocale) and len(paLocale) = 2 )
			stzRaise("Incorrect format!")
		ok
	
		if NOT isString(paLocale[1])
			stzRaise("Incorrect format!")
		ok
	
		if NOT ( Q(paLocale[1]).IsOneOfThese([ :InThisLocale, :InLocale ]) )
			stzRaise("Incorrect format!")
		ok
	
		if NOT ( isString(paLocale[2]) or (isList([paLocale[2]]) and len(paLocale[2]) = 2) )
			stzRaise("Incorrect format!")
		ok
	
		if isString(paLocale[2]) and NOT StzStringQ(paLocale[2]).IsLocaleAbbreviation()
			stzRaise("Incorrect format!")
		ok
	
		if isList(paLocale[2]) and NOT StzListQ(paLocale[2]).IsLocaleList()
			stzRaise("Incorrect format!")
		ok
	
		return Q(pcStr).LowercasedInLocale(paLocale[2]) = This.String()

	  #-------------------------------#
	 #     UPPERCASING THE STRING    #
	#-------------------------------#

	def ApplyUppercase()
		oQLocale = new QLocale("C")
		This.Update( oQLocale.toUpper(This.String()) )

		#< @FunctionFluentForm

		def ApplyUppercaseQ()
			This.ApplyUppercase()
			return This
	
		#>

		#< @FunctionAlternativeForm	// TODO: replace with @FunctionAlternativeFormForm

		def Uppercase() # Understand it as a verb that "uppercases" the string
			This.ApplyUppercase()

			def UppercaseQ()
				This.Uppercase()
				return This
	
		#>

	def Uppercased()
		return This.Copy().UppercaseQ().Content()

	// Tranforms the string to LOCALE-SENSITIVE UPPERCase
	def ApplyUppercaseInLocale(pcLocale)
		oLocale = new stzLocale(pcLocale)
		This.Update( oLocale.ToUpperCase(This.String()) )

		#< @FunctionFluentForm

		def ApplyUppercaseInLocaleQ(pcLocale)
			This.ApplyUppercaseInLocale(pcLocale)
			return This

		#>

		#< @FunctionAlternativeForm

		def UppercaseInLocale(pLocale) # Understand it as a verb that "uppercases" the string in the givan locale
			This.ApplyUppercaseInLocale(pLocale)

			def UppercaseInLocaleQ(pLocale)
				This.ApplyUppercaseInLocale(pLocale)
				return This
	
		#>

	def UppercasedInLocale(pcLocale)
		return This.Copy().UppercaseInLocaleQ(pcLocale).Content()

		#< @FunctionFluentForm

		def UpperCasedInLocaleQ(pcLocale)
			return new stzString( This.UppercasedInLocale(pcLocale) )
	
		#>

	def IsUppercase()
		If This.IsEmpty()
			return FALSE
		ok

		bResult = TRUE

		for i = 1 to This.NumberOfChars()
			if This.CharAtQ(i).IsLetter() and
			   (NOT This.CharAtQ(i).IsUppercase())

				bResult = FALSE
				exit
			ok
		next

		return bResult

		#< @FunctionAlternativeForm

		def IsUppercased()
			return This.IsUppercase()

		#>


	def IsUppercaseOf(pcStr)
		return This.Uppercased() = pcStr

	def IsUppercaseOfInLocale(pcStr, pLocale)
		return This.UppercasedInLocale(pLocale) = pcStr


	  #--------------------------------#
	 #     CAPITALIZING THE STRING    #
	#--------------------------------#

	def ApplyCapitalcase()
		if This.IsEmpty()
			return
		ok
		# Lowercasing all the string first

		oStr = This.Copy().LowercaseQ()

		# Getting the positions of the words in the string
		# TODO: delegate the work to stzText when ready

		anPositions = oStr.FindAll(" ")
		anPositions = StzListOfNumbersQ(anPositions).AddedToEach(1)

		anPositions + 1
		anPositions = sort(anPositions)
		
		for n in anPositions
			cCapitalizedChar = oStr.CharAtPositionQ(n).Uppercased()
			oStr.ReplaceCharAtPosition(n, cCapitalizedChar)
		next

		This.Update( oStr.Content() )

		#< @FunctionFluentForm

		def ApplyCapitalcaseQ()
			This.ApplyCapitalcase()
			return This		

		#>

		#< @FunctionAlternativeForms

		def Capitalcase() # Understand it as a verb that "capitalcases" the string
			This.ApplyCapitalcase()

			def CapitalcaseQ()
				This.Capitalcase()
				return This

		def Capitalise()
			This.ApplyCapitalcase()

			def CapitaliseQ()
				This.Capitalise()
				return This

		def Capitalize()
			This.ApplyCapitalcase()

			def CapitalizeQ()
				This.Capitalize()
				return This

		#>	
	
	def CapitalCased()
		return This.Copy().ApplyCapitalCaseQ().Content()

		def CapitalCaseApplied()
			return This.CapitalCased()

		def Capitalised()
			return This.CapitalCased()

		def Capitalized()
			return This.CapitalCased()

	// Tranforms the string to LOCALE-SENSITIVE titlecase
	def ApplyCapitalCaseInLocale(pLocale)
		# Lowercasing all the string first

		oStr = This.Copy().LowercaseQ()

		# Getting the positions of the words in the string
		# TODO: delegate the work to stzText when ready

		anPositions = oStr.FindAll(" ")
		anPositions = StzListOfNumbersQ(anPositions).AddedToEach(1)
		insert(anPositions, 1, 1)
		anPositions = sort(anPositions)

		for n in anPositions
			cCapitalizedChar = oStr.CharAtPositionQ(n).UppercasedInLocale(pLocale)
			oStr.ReplaceCharAtPosition(n, cCapitalizedChar)
		next

		This.Update( oStr.Content() )

		#< @FunctionFluentForm

		def ApplyCapitalcaseInLocaleQ(pLocale)
			This.ApplyCapitalCaseInLocale(pLocale)
			return This
	
		#>

		#< @FunctionAlternativeForms

		def CapitalcaseInLocale(pLocale) # Understand it as a verb that "capitalcases" the string in the givan locale
			This.ApplyCapitalCaseInLocale(pLocale)

			def CapitalcaseInLocaleQ(pLocale)
				This.CapitalcaseInLocale(pLocale)
				return This

		def CapitaliseInLocale(pLocale)
			This.ApplyCapitalCaseInLocale(pLocale)

			def CapitaliseInLocaleQ(pLocale)
				This.CapitaliseInLocale(pLocale)
				return This

		def CapitalizeInLocale(pLocale)
			This.ApplyCapitalCaseInLocale(pLocale)

			def CapitalizeInLocaleQ(pLocale)
				This.CapitalizeInLocale(pLocale)
				return This
		
		#>
		
	def CapitalCasedInLocale(pLocale)
		return This.Copy().CapitalCaseInLocaleQ(pLocale).Content()

		#< @FunctionFluentForm

		def CapitalcasedInLocaleQ()
			return new stzString( This.CapitalCasedInLocale() )

		#>

		#< @FunctionAlternativeForms

		def CapitalisedInLocale(pLocale)
			return CapitalcasedInLocale(pLocale)

		def CapitalizedInLocale(pLocale)
			return CapitalcasedInLocale(pLocale)

		#>

	def IsCapitalcase()
		return This.CapitalCased() = This.String()
		
		#< @FunctionAlternativeForms

		def IsCapitalCased()
			return This.IsCapitalcase()

		def IsCapitalised()
			return This.IsCapitalcase()

		def IsCapitalized()
			return This.IsCapitalcase()

		#>

	def IsCapitalcaseOf(pcStr)
		return This.Capitalcased() = pcStr

	def IsCapitalcaseOfInLocale(pcStr, pLocale)
		return This.CapitalcasedInLocale(pLocale) = pcStr

	  #-------------------------------#
	 #     TITLECASING THE STRING    #
	#-------------------------------#

	def ApplyTitlecase()
		oLocale = new stzLocale( "C" )
		This.Update( oLocale.ToTitlecase(This.String()) )

		#< @FunctionFluentForm

		def ApplyTitlecaseQ()
			This.ApplyTitlecase()
			return This		

		#>

		#< @FunctionAlternativeForms

		def Titlecase() # Understand it as a verb that "titlecases" the string
			This.ApplyTitleCase()

			def TitlecaseQ()
				This.Titlecase()
				return This

		def Titelise()
			This.ApplyTitleCase()

			def TiteliseQ()
				This.Titelise()
				return This

		def Titelize()
			This.ApplyTitleCase()

			def TitelizeQ()
				This.Titelize()
				return This
		#>	

	def TitleCased()
		return This.Copy().ApplyTitleCaseQ().Content()

		def Titelised()
			return This.TitleCased()
	
		def Titelized()
			return This.TitleCased()
	
	// Tranforms the string to LOCALE-SENSITIVE titlecase
	def ApplyTitlecaseInLocale(pLocale)
		oLocale = new stzLocale(pLocale)
		This.Update( oLocale.ToTitlecase(This.String()) )

		#< @FunctionFluentForm

		def ApplyTitlecaseInLocaleQ(pLocale)
			This.ApplyTitlecaseInLocale(pLocale)
			return This
	
		#>

		#< @FunctionAlternativeForms

		def TitlecaseInLocale(pLocale) # Understand it as a verb that "titlecases" the string in the givan locale
			This.ApplyTitlecaseInLocale(pLocale)

			def TitlecaseInLocaleQ(pLocale)
				This.TitelcaseInLocale(pLocale)
				return This
		
		def TiteliseInLocale(pLocale)
			This.ApplyTitleCase(pLocale)

			def TiteliseInLocaleQ(pLocale)
				This.TiteliseInLocale(pLocale)
				return This

		def TitelizeInLocale(pLocale)
			This.ApplyTitleCaseInLocale(pLocale)

			def TitelizeInLocaleQ(pLocale)
				This.TitelizeInLocale(pLocale)
				return This
		#>
			
	def TitlecasedInLocale(pLocale)
		return This.Copy().TitleCaseInLocaleQ(pLocale).Content()

		def TitelisedInLocale(pLocale)
			return This.TitlecasedInLocale(pLocale)

		def TitelizedInLocale(pLocale)
			return This.TitlecasedInLocale(pLocale)

	def IsTitlecase()
		
		return This.TitleCased() = This.String()

		#< @FunctionAlternativeForms

		def IsTitlecased()
			return This.IsTitlecase()

		def IsTitelised()
			return This.IsTitlecase()

		def IsTitelized()
			return This.IsTitlecase()

		#>

	def IsTitlecaseOf(pcStr)
		return This.Titlecased() = pcStr

	  #----------------------------------#
	 #      CASEFOLDING THE STRING      #
	#----------------------------------#

	/*
	INFO
	----

	The casefold() method is an aggressive lower() method which
	converts strings to case folded strings for caseless matching.
	
	WARNING:
	--------

	Review the Qt behaviour regarding QString.toCaseFolded() method.

	In fact, when writing:

	? StzStringQ("der Fluß").CaseFolded()

	We should have as result:

	"der fluss"

	since "ß" is casefolded to "ss" in german.

	But, Qt don't do that!
	
	*/

	// Transforms the string to casefolded style
	def CaseFold() # Understand it as a verb that "casefolds" the string
		This.Update( This.CaseFolded() )

		#< @FunctionFluentForm

		def CaseFoldQ()
			This.CaseFold()
			return This
	
		#>

	def CaseFolded()
		return @oQString.toCasefolded()

	def IsCaseFolded()
		If This.IsEmpty()
			return FALSE
		ok

		if This.Copy().CaseFolded() = This.Content()
			return TRUE
		else
			return FALSE
		ok

		return bResult

		#< @FunctionAlternativeForm

		def IsCaseFold()
			return This.IsCaseFolded()

		#>

	def IsCaseFoldedOf(pcStr)
		return This.CaseFolded() = pcStr

	  #---------------------------------#
	 #   CHECKING IF STRING IS WORD    #
	#---------------------------------#

	def IsWord()

		if This.IsEmpty() or This.IsNumberInString()
			return FALSE
		ok

		bResult = TRUE

		for i = 1 to This.NumberOfChars()
			c = This.NthChar(i)
			oChar = new stzChar(c)

			if oChar.IsNotLetter() and
			   oChar.IsNotNumber() and
			   c != HyphenShort() and
			   c != HyphenLong() and
			   c != Underscore() and
			   oChar.IsNotArabic7arakah() and
			   c != ArabicTamdeed()

				bResult = FALSE
				exit
			ok

		next

		return bResult

	def IsArabicWord()
		bResult = This.ToStzText().IsArabicWord()
		return bResult

	def IsLatinWord()
		bResult = This.ToStzText().IsLatinWord()
		return bResult

	  #-------------------------------------#
	 #   CHECKING IF STRING IS STOPWORD    #
	#-------------------------------------#

	def IsStopWord()
		return StopWordsQ().Contains(This.Lowercased())

	def IsStopWordIn(pcLang)
		bResult = This.ToStzText().IsStopWordIn(pcLang)
		return bResult

	def LanguageIfStopWord()
		cResult = This.ToStzText().LanguageIfStopWord()
		return cResult

	  #-----------------------------------------------#
	 #  GETTING THE LIST OF ALL POSSIBLE SUBSTRINGS  #
	#-----------------------------------------------#

	def SubStrings()

		nLen = This.NumberOfChars()
		aTemp = []

		for i = 1 to nLen
			aTemp + This.Section(i, nLen)
		next

		aResult = []

		for str in aTemp
			for i = 1 to Q(str).NumberOfChars()
				aResult + Q(str).SplitToPartsOfNChars(i)
			next 
		next

		aResult = Q(aResult).FlattenQ().RemoveDuplicatesQ().Content() //SortedBy('Q(@item).NumberOfChars()')
		return aResult

		def SubStringsQ()
			return This.SubStringsQR(:stzList)

		def SubStringsQR(pcReturnType)
			switch pcReturnType
			on :stzList
				return new stzList( This.SubStrings() )
			on :stzListOfStrings
				return new stzListOfStrings( This.SubStrings() )
			other
				StzRaise("Unsupported return type!")
			off

	def SubStringsOfNChars(n)
		nLenStr	   = This.NumberOfChars()
		nRest      =  nLenStr % n
		nLenSubStr = ( nLenStr - nRest ) / n

		acResult = This.SplitToPartsOfExactlyNChars(nLenSubStr)

		return acResult


	  #-----------------------------------------------------#
	 #  GETTING THE LIST OF SUBSTRINGS -- EXTENDED  #
	#-----------------------------------------------------#

	def SubStringsAndTheirPositions()
		aResult = []

		for cSubStr in This.SubStrings()
			aResult + [ cSubStr, This.FindAll(cSubStr) ]
		next

		return aResult

		def SubStringsXT()
			return This.SubStringsAndTheirPositions()

	  #=================#
	 #      LINES      #
	#=================#

	def Lines()
		return This.Split(NL)

		#< @FunctionFluentForm

		def LinesQ()
			return new stzListOfStrings( This.Lines() )

		def LinesQR(pcReturnType)
			if isList(pcReturnType) and Q(pcReturnType).IsReturnAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList(This.Lines())

			on :stzListOfStrings
				return new stzListOfStrings(This.Lines())

			other
				stzRaise("Unsupported return type!")
			off

		#>
	
	def NumberOfLines()
		return len(This.Lines())

	  #----------------#
	 #  UNIQUE LINES  #
	#----------------#

	def UniqueLines()
		acResult = This.LinesQ().DuplicatesRemoved()
		return acResult

		#< @FunctionFluentForm

		def UniqueLinesQ()
			return new stzListOfStrings( This.UniqueLines() )

		def UniqueLinesQR(pcReturnType)
			if isList(pcReturnType) and Q(pcReturnType).IsReturnAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList(This.UniqueLines())

			on :stzListOfStrings
				return new stzListOfStrings(This.UniqueLines())

			other
				stzRaise("Unsupported return type!")
			off

		#>

	  #------------------------------------------#
	 #  REMOVING LINES UNDER A GIVEN CONDITION  #
	#------------------------------------------#

	def RemoveLinesW(pcCondition) // TODO
		/* EXAMPLE

		o1 = new stzString("
			ABCDEF
			GHIJKL
			123346
			MNOPQU
			RSTUVW
			984332
		")

		o1.RemoveLinesW(' Q(@line).IsMadeOf(:Numbers) ')
		? o1.Content()

		#--> "
			ABCDEF
			GHIJKL
			MNOPQU
			RSTUVW
		"
		*/

		stzRaise("Function unavailable yet!")

		def RemoveLinesWQ(pcCondition)
			This.RemoveLinesW(pcCondition)
			return This

	  #------------------------#
	 #  REMOVING EMPTY LINES  #
	#------------------------#

	def RemoveEmptyLines()
		cResult = This.LinesQR(:stzListOfStrings).
				RemoveEmptyStringsQ().
				ConcatenatedUsing(NL)

		This.Update(cResult)

		def RemoveEmptyLinesQ()
			This.RemoveEmptyLines()
			return This

	  #================#
	 #    MARQUERS    #
	#================#

	// Removing zeros at the begining of marquer numbers
	def NormalizeMarquers()
		/* Example

		StzStringQ("The first candidate is #003, the second is #01, while the third is #2!") {	
			NormalizeMarquers()
			? Content()
		}

		# --> "The first candidate is #3, the second is #1, while the third is #2!"
		*/
		if This.Contains("#0")

			bContinue = TRUE
	
			While bContinue
	
				n = This.ReplaceLast("#0", "#")
	
				if This.ContainsNo("#0")
					bContinue = FALSE
				ok
			end
		ok

		def NormaliseMarquers()
			This.NormaliseMarquers()

	def ContainsMarquers()
		if This.NumberOfMarquers() > 0
			return TRUE
		else
			return FALSE
		ok

	def Marquers()
		anPos = This.FindAll("#")

		if len(anPos) = 0
			return []
		ok

		aResult = []

		for n in anPos
			n1 = n + 1
			n2 = This.WalkForewardW( :StartingAt = n+1, :Until = '{ NOT StzStringQ(@char).RepresentsNumberInDecimalForm() }' )

			if n1 != n2

				cMarquer = This.SectionQ(n1, n2).OnlyNumbersQ().RemoveThisRepeatedLeadingCharQ("0").Content()

				if cMarquer != ""
					if cMarquer[1] = "0"
						cMarquer = StzStringQ(cMarquer).Section(2, :LastChar)
					ok
				
					aResult + ("#" + cMarquer)
				ok
			ok
			
		next

		return aResult

		def MarquersQR(pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType

			on :stzListOfStrings
				return new stzListOfStrings(This.Marquers())

			on :stzList
				return new stzList(This.Marquers())

			other
				stzRaise("Unsupported return type!")
			off

	def UniqueMarquers()
		return StzListQ(This.Marquers()).UniqueItems()

		def UniqueMarquersQR(pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType

			on :stzListOfStrings
				return new stzListOfStrings(This.UniqueMarquers())

			on :stzList
				return new stzList(This.UniqueMarquers())

			other
				stzRaise("Unsupported return type!")
			off

		def SetOfMarquers()
			return This.UniqueMarquers()

			def SetOfMarquersQR(pcReturnType)
				if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
	
				on :stzListOfStrings
					return new stzListOfStrings(This.SetOfMarquers())
	
				on :stzList
					return new stzList(This.SetOfMarquers())
	
				other
					stzRaise("Unsupported return type!")
				off

	def NumberOfMarquers()
		return len(This.Marquers())

	def NumberOfCharsInEachMarquer()
		aResult = []
		for cMarquer in This.Marquers()
			aResult + len(cMarquer)
		next

		return aResult

		def MarquersNumbersOfChars()
			return This.NumberOfCharsInEachMarquer()

	  #----------------------------------#
	 #   MARQUERS AND THEIR POSITIONS   #
	#----------------------------------#

	def MarquersPositions()
		/* Example:

		StzStringQ("My name is #1, my age is #2, and my job is #3. Again: my name is #1!") {
		
			? MarquersPositions()
			# --> [   12,   25,   44,   66 ]
		
		}
		*/

		acMarquers = This.Marquers()
		aResult = []

		n = 1

		for cMarquer in acMarquers
			n = This.FindNextOccurrence( cMarquer, n )
			/* WARNING: Don't use:
			n = This.FindNextMarquer(cMarquer)
			--> Circular call --> Stackoverflow
			*/
			aResult + n
		next

		return aResult

		#< @FunctionFluentForm

		def MarquersPositionsQ()
			return This.MarquersPositionsQR(:stzListOfNumbers)

		def MarquersPositionsQR(pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType

			on :stzListOfNumbers
				return new stzListOfNumbers(This.MarquersPositions())

			on :stzList
				return new stzList(This.MarquersPositions())

			other
				stzRaise("Unsupported return type!")
			off
		#>

		#< @FunctionAlternativeForm

		def MarquersOccurrences()
			return This.MarquersPositions()

			def MarquersOccurrencesQ()
				return This.MarquersOccurrencesQR(:stzListOfNumbers)
	
			def MarquersOccurrencesQR(pcReturnType)
				if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok

				switch pcReturnType
	
				on :stzListOfNumbers
					return new stzListOfNumbers(This.MarquersOccurrences())
	
				on :stzList
					return new stzList(This.MarquersOccurrences())
	
				other
					stzRaise("Unsupported return type!")
				off

		def FindMarquers()
			return This.MarquersPositions()

			def FindMarquersQ()
				return This.FindMarquersQR(:stzListOfNumbers)
	
			def FindMarquersQR(pcReturnType)
				if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok

				switch pcReturnType
	
				on :stzListOfNumbers
					return new stzListOfNumbers(This.FindMarquers())
	
				on :stzList
					return new stzList(This.FindMarquers())
	
				other
					stzRaise("Unsupported return type!")
				off
		#>

	def MarquersAndPositions()
		/* Example:

		StzStringQ("My name is #1, my age is #2, and my job is #3. Again: my name is #1!") {
		
			? MarquersAndPositions()
			# --> [ "#1" = 12, "#2" = 25 , "#3" = 44, "#1" = 66 ]
		
		}
		*/

		aResult = StzPairOfListsQ( This.Marquers(), This.MarquersPositions() ).AssociateQ().Content()
		return aResult

		#< @FunctionFluentForm

		def MarquersAndPositionsQ()
			return This.MarquersAndPositionsQR(:stzList)

		def MarquersAndPositionsQR(pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.MarquersAndPositions() )

			on :stzHashList
				return new stzHashList( This.MarquersAndPositions() )

			other
				stzRaise("Insupported returned type!")
			off

		#>

		#< @FunctionAlternativeForms

		def MarquersAndOccurrences()
			return This.MarquersAndPositions()

			def MarquersAndOccurrencesQ()
				return This.MarquersAndPositionsQ()

			def MarquersAndOccurrencesQR(pcReturnType)
				if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok

				return This.MarquersAndPositionsQR(pcReturnType)
		#>

	def MarquersAndTheirPositions()
		/* Example:

		StzStringQ("My name is #1, my age is #2, and my job is #3. Again: my name is #1!") {
		
			? MarquersAndTheirpositions()
			# --> [ "#1" = [12, 66], "#2" = [26], "#3" = [44] ]
		
		}
		*/
		acMarquers = This.UniqueMarquers()
		aResult = []

		for cMarquer in acMarquers
			anPos = This.FindAll(cMarquer)
			aResult + [ cMarquer, anPos ]
		next

		return aResult
		
		#< @FunctionFluentForm

		def MarquersAndTheirPositionsQR(pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType

			on :stzHashList
				return new stzHashList( This.MarquersAndTheirPositions() )

			on :stzList
				return new stzList( This.MarquersAndTheirPositions() )

			other
				stzRaise("Invalid param type!")
			off

		#>

		#< @FunctionAlternativeForm

		def MarquersAndTheirOccurrences()
			return This.MarquersAndTheirPositions()

		def MarquersAndPositionsXT()
			return This.MarquersAndTheirPositions()

		#>

	  #----------------------------#
	 #      FINDING A MARQUER     #
	#----------------------------#

	def OccurrencesOfMarquer(pcMarquer)
		
		aResult = This.MarquersAndTheirPositions()[pcMarquer]
		if isString(aResult) and aResult = NULL
			return []
		else
			return aResult
		ok

		#< @FunctionFluentForm

		def OccurrencesOfMarquerQ(pcMarquer)
			return This.OccurrencesOfMarquerQR(pcMarquer, :stzList)

		def OccurrencesOfMarquerQR(pcMarquer, pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.OccurrencesOfMarquer(pcMArquer) )

			on :stzListOfNumbers
				return new stzListOfNumbers( This.OccurrencesOfMarquer(pcMArquer) )

			other
				stzRaise("Unsupported return type!")

			off
		#>

		#< @FunctionAlternativeForms

		def PositionsOfMarquer(pcMarquer)
			return This.OccurrencesOfMarquer(pcMarquer)

			def PositionsOfMarquerQ(pcMarquer)
				return This.OccurrencesOfMarquerQ(pcMarquer)
	
			def PositionsOfMarquerQR(pcMarquer, pcReturnType)
				return This.OccurrencesOfMarquerQR(pcMarquer, pcReturnType)

		def MarquerPositions(pcMarquer)
			return This.OccurrencesOfMarquer(pcMarquer)

			def MarquerPositionsQ(pcMarquer)
				return This.OccurrencesOfMarquerQ(pcMarquer)
	
			def MarquerPositionsQR(pcMarquer, pcReturnType)
				return This.OccurrencesOfMarquerQR(pcMarquer, pcReturnType)

		def FindMarquer(pcMarquer)
			return This.OccurrencesOfMarquer(pcMarquer)

			def FindMarquerQ(pcMarquer)
				return This.OccurrencesOfMarquerQ(pcMarquer)
	
			def FindMarquerQR(pcMarquer, pcReturnType)
				return This.OccurrencesOfMarquerQR(pcMarquer, pcReturnType)


			#>

	  #-------------------------------------#
	 #    GETTING A MARQUER BY POSITION    #
	#-------------------------------------#

	def MarquerByPosition(pnPosition)
		aMarquers = This.MarquersAndTheirPositions()
		cResult = ""

		for aLine in aMarquers
			n = ring_find(aLine[2], pnPosition)
			if n > 0
				cResult = aLine[1]
				exit
			ok
		next

		return cResult

		def MarquerByPositionQ(pnPosition)
			return new stzString( This.MarquerByPosition() )

		def MarquerByOccurrence(pnPosition)
			return This.MarquerByPosition(pnPosition)

			def MarquerByOccurrenceQ(pnPosition)
				return new stzString( This.MarquerByOccurrence(pnPosition) )

	  #---------------------------------#
	 #   MARQUERS AND THEIR SECTIONS   #
	#---------------------------------#

	def MarquersSections()
		/* Example:

		StzStringQ("My name is #1, my age is #2, and my job is #3. Again: my name is #1!") {
		
			? MarquersPositions()
			# --> [  [12, 13], [ 25, 26],  [44, 45], [66, 67]  ]
		
		}
		*/

		anStartPos  = This.MarquersPositions()
		anNbOfChars = This.MarquersNumbersOfChars()

		aResult = []

		for i = 1 to len(anStartPos)
			aResult + [ anStartPos[i], anStartPos[i] + anNbOfChars[i] - 1 ]
		next

		return aResult


		#< @FunctionFluentForm

		def MarquersSectionsQ()
			return new stzList( This.MarquersSections() )

		#>

	def MarquersAndSections()
		/* Example:

		StzStringQ("My name is #1, my age is #2, and my job is #3. Again: my name is #1!") {
		
			? MarquersAndPositions()
			# --> [ "#1" = 12, "#2" = 25 , "#3" = 44, "#1" = 66 ]
		
		}
		*/

		aResult = StzPairOfListsQ( This.Marquers(), This.MarquersSections() ).AssociateQ().Content()
		return aResult

		#< @FunctionFluentForm

		def MarquersAndSectionsQ()
			return This.MarquersAndSectionsQR(:stzList)

		def MarquersAndSectionsQR(pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.MarquersAndSections() )

			on :stzHashList
				return new stzHashList( This.MarquersAndSections() )

			other
				stzRaise("Insupported returned type!")
			off

		#>

	def MarquersAndTheirSections()
		/* Example:

		StzStringQ("My name is #1, my age is #2, and my job is #3. Again: my name is #1!") {
		
			? MarquersAndTheirpositions()
			# --> [ "#1" = [12, 66], "#2" = [26], "#3" = [44] ]
		
		}
		*/

		aMarquers = This.MarquersAndTheirPositions()
		aResult = []

		for aMarquer in aMarquers
			cMarquer = aMarquer[1]
			anMarquerPositions = aMarquer[2]

			aMarquerSections = []

			for nPos in anMarquerPositions
				aMarquerSections + [ nPos, nPos + len(cMarquer) - 1 ]
			next

			aResult + [ cMarquer, aMarquerSections ]
		next
		
		return aResult

		#< @FunctionFluentForm

		def MarquersAndTheirSectionsQR(pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType

			on :stzHashList
				return new stzHashList( This.MarquersAndTheirSections() )

			on :stzList
				return new stzList( This.MarquersAndTheirSections() )

			other
				stzRaise("Invalid param type!")
			off

		#>

		#< @FunctionAlternativeForm

		def MarquersAndSectionsXT()
			return This.MarquersAndTheirSections()

		#>
	
	  #-----------------------------------------#
	 #    SORTING MARQUERS INSIDE THE STRING   #
	#-----------------------------------------#

	def MarquersAreSorted()
		bResult = StzListQ(This.Marquers()).ItemsAreSorted()
		return bResult

	def MarquersSortingOrder()
		bResult = StzListQ(This.Marquers()).SortingOrder()
		return bResult

	def MarquersAreUnsorted()
		bResult = StzListQ(This.Marquers()).ItemsAreUnsorted()
		return bResult

		def MarquersAreNotSorted()
			return This.MarquersAreUnsorted()

	def MarquersAreSortedInAscending()
		bResult = StzListQ(This.Marquers()).ItemsAreSortedInAscending()
		return bResult

	def MarquersAreSortedInDescending()
		bResult = StzListQ(This.Marquers()).ItemsAreSortedInDescending()
		return bResult

	def MarquersSortedInAscending()
		aResult = StzListQ(This.Marquers()).SortedInAscending()
		return aResult

	def MarquersSortedInDescending()
		aResult = StzListQ(This.Marquers()).SortedInDescending()
		return aResult

	def MarquersPositionsSortedInAscending()
		aResult = StzListQ(This.MarquersPositions()).SortedInAscending()
		return aResult

	def MarquersPositionsSortedInDescending()
		aResult = StzListQ(This.MarquersPositions()).SortedInDescending()
		return aResult

	def MarquersAndPositionsSortedInAscending()
		acMarquers  = This.MarquersSortedInAscending()
		anPositions = This.MarquersPositionsSortedInAscending()

		aResult = StzPairOfListsQ( acMarquers, anPositions).Associate()

		return aResult

		def MarquersSortedInAscendingAndTheirPositions()
			return This.MarquersAndPositionsSortedInAscending()


	def MarquersAndPositionsSortedInDescending()
		acMarquers  = This.MarquersSortedInDescending()
		anPositions = This.MarquersPositionsSortedInDescending()

		aResult = StzPairOfListsQ( acMarquers, anPositions ).Associate()

		return aResult

		def MarquersSortedInDescendingAndTheirPositions()
			return This.MarquersAndPositionsSortedInDescending()

	def MarquersAndSectionsSortedInAscending()
		acMarquers  = This.MarquersSortedInAscending()
		anPositions = This.MarquersPositionsSortedInAscending()

		aResult = []
		i = 0

		for cMarquer in acMarquers
			i++

			n1 = anPositions[i]
			n2 = n1 + len(cMarquer) - 1
		
			aResult + [ cMarquer, [ n1, n2 ] ]
		next

		return aResult

		def MarquersSortedInAscendingAndTheirSections()
			return This.MarquersAndSectionsSortedInAscending()

	def MarquersAndSectionsSortedInDescending()
		acMarquers  = This.MarquersSortedInDescending()
		anPositions = This.MarquersPositionsSortedInAscending()

		aResult = []
		i = 0

		for cMarquer in acMarquers
			i++

			n1 = anPositions[i]
			n2 = n1 + len(cMarquer) - 1
		
			aResult + [ cMarquer, [ n1, n2 ] ]
		next

		return aResult

		def MarquersSortedInDescendingAndTheirSections()
			return This.MarquersAndSectionsSortedInDescending()

	def SortMarquersInAscending()
		#< @MotherFunction = This.ReplaceSection() > @QtBased = TRUE #>

		/* Example

		Q("My name is #2, may age is #1, and my job is #3.") {
			SortMarquersInAscending()
			? Content()
		}

		# !--> My name is #1, may age is #2, and my job is #3.
		*/

		aMarquersSections = This.MarquersAndSectionsSortedInAscending()
		/* Reminder
		# --> [ "#1" = [12, 13], "#1" = [26, 27], "#2" = [44, 45], "#3" = [66, 67] ]
		*/

		for i = len(aMarquersSections) to 1 step -1
			cMarquer = aMarquersSections[i][1]
			n1 = aMarquersSections[i][2][1]
			n2 = aMarquersSections[i][2][2]

			This.ReplaceSection(n1, n2, cMarquer)
		next

		def SortMarquersInAscendingQ()
			This.SortMarquersInAscending()
			return This

	def StringWithMaquersSortedInAscending()
		cResult = This.Copy().SortMarquersInAscendingQ().Content()
		return cResult

	def SortMarquersInDescending()
		#< @MotherFunction = This.ReplaceSection() > @QtBased = TRUE #>

		/* Example

		Q("My name is #2, may age is #1, and my job is #3.") {
			SortMarquersInDescending()
			? Content()
		}

		# !--> My name is #3, may age is #2, and my job is #1.
		*/

		aMarquersSections = This.MarquersAndSectionsSortedInDescending()
		/* Reminder
		Q("My name is #2, may age is #1, and my job is #3.") {
			? MarquersAndSectionsSortedInDescending()
		}

		# --> [ "#3" = [45, 46], "#2" = [27, 28], "#1" = [12, 13] ]
		*/

		for i = 1 to len(aMarquersSections)
			cMarquer = aMarquersSections[i][1]
			n1 = aMarquersSections[i][2][1]
			n2 = aMarquersSections[i][2][2]

			This.ReplaceSection(n1, n2, cMarquer)
		next

		def SortMarquersInDescendingQ()
			This.SortMarquersInDescending()
			return This

	def StringWithMaquersSortedInDescending()
		cResult = This.Copy().SortMarquersInDescendingQ().Content()
		return cResult

	  #------------------------------------------#
	 #    REPLACING SUBSTRINGS WITH MARQUERS    # TODO: Test it
	#------------------------------------------#

	def ReplaceSubstringsWithMarquersCS(pacSubstrings, pCaseSensitive)

		acSubStrings = StzListOfStringsQ(pacSubstrings).DuplicatesRemovedCS(pCaseSensitive)

		acMarquers = []

		for i = 1 to len(acSubStrings)
			acMarquers + ( "#" + i )
		next

		This.ReplaceManyCS( acSubStrings, acMarquers, pCaseSensitive )

		def ReplaceSubstringsWithMarquersCSQ(pacSubstrings, pCaseSensitive)
			This.ReplaceSubstringsWithMarquersCS(pacSubstrings, pCaseSensitive)
			return This

	def SubstringsReplacedWithMarquersCS(pacSubstrings, pCaseSensitive)
		cResult = This.Copy().ReplaceSubstringsWithMarquersCSQ(pacSubstrings, pCaseSensitive).Content()
		return cResult

	#-- WITHOUT CASESENSITIVITY

	def ReplaceSubstringsWithMarquers(pacSubstrings)
		This.ReplaceSubstringsWithMarquersCS(pacSubstrings, :CaseSensitive = TRUE)

	def SubstringsReplacedWithMarquers(pacSubstrings)
		return This.SubstringsReplacedWithMarquersCS(pacSubstrings, :CaseSensitive = TRUE)

	  #------------------------#
	 #    PARSING MARQUERS    #
	#------------------------#

	def NthMarquer(n)
		if NOT isNumber(n)
			stzRaise("Incorrect param type! n should be a number.")
		ok

		try
			return This.Marquers()[n]
		catch
			return NULL
		done

		def NthMarquerQ(n)
			return new stzString( This.NthMarquer(n) )

	def FirstMarquer()
		return This.NthMarquer(1)

		def FirstMarquerQ()
			return new stzString( This.LastMarquer() )

	def LastMarquer()
		n = This.NumberOfMarquers()
		acResult = This.Marquers()[ n ]
		return acResult

		def LastMarquerQ()
			return new stzString( This.LastMarquer() )

	#-----

	def FindNthMarquer(n)
		if isString(n)
			if n = :First or n = :FirstMarquer
				n = 1
			but n = :Last or n = :LastMarquer
				n = This.NumberOfMarquers()
			ok
		ok

		return This.FindNthOccurrence( n, "#" )

		def NthMarquerOccurrence(n)
			return This.FindNthMarquer(n)

		def NthMarquerPosition(n)
			return This.FindNthMarquer(n)

		def PositionOfNthMarquer(n)
			return This.FindNthMarquer(n)

	def FindFirstMarquer()
		return This.FindNthMarquer(1)

		def FirstMarquerOccurrence()
			return This.FindFirstMarquer()

		def FirstMarquerPosition()
			return This.FindFirstMarquer()

		def PositionOfFirstMarquer()
			return This.FindFirstMarquer()

	def FindLastMarquer()
			return This.FindNthMarquer(:Last)

		def LastMarquerOccurrence()
			return This.FindLastMarquer()

		def LastMarquerPosition()
			return This.FindLastMarquer()

		def PositionOfLastMarquer()
			return This.FindLastMarquer()


	#----- NEXT MARQUERS

	def NextMarquers(pnStartingAt)
		if isList(pnStartingAt) and StzListQ(pnStartingAt).IsStartingAtNamedParam()
			pnStartingAt = pnStartingAt[2]
		ok

		return This.SectionQ(pnStartingAt, :LastChar).Marquers()

		def NextMarquersQ(pnStartingAt)
			return This.NextMarquersQR(pnstartingAt, :stzList)

		def NextMarquersQR(pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.NextMarquers(pnStartingAt) )
	
			on :stzListOfStrings
				return new stzListOfStrings( This.NextMarquers(pnStartingAt) )

			other
				stzRaise("Unsupported return type!")
			off

	def NthNextMarquer(n, pnStartingAt)
		/*
		StzStringQ("My name is #1, my age is #2, and my job is #3. Again: my name is #1!") {
			? NthNextMarquer(2, :StartingAt = 14)
		}

		# --> #3
		*/

		if isList(pnStartingAt) and StzListQ(pnStartingAt).IsStartingAtNamedParam()
			pnStartingAt = pnStartingAt[2]
		ok

		oStr = This.SectionQ(pnStartingAt, :LastChar)
		return oStr.Marquers()[ n ]


		def NthNextMarquerQ(n, pnStartingAt)
			return new stzString( This.NthNextMarquer(n, pnStartingAt) )

		def NextNthMarquer(n, pnStartingAt)
			return This.NthNextMarquer(n, pnStartingAt)

			def NextNthMarquerQ(n, pnStartingAt)
				return new stzString( This.NextNthMarquer(n, pnStartingAt) )

	def FindNthNextMarquer(n, pnStartingAt)
		/*
		StzStringQ("My name is #1, my age is #2, and my job is #3. Again: my name is #1!") {
			? NthNextMarquer(2, :StartingAt = 14)
		}

		# --> 44
		*/

		if isList(pnStartingAt) and StzListQ(pnStartingAt).IsStartingAtNamedParam()
			pnStartingAt = pnStartingAt[2]
		ok

		oStr = This.SectionQ(pnStartingAt, :LastChar)

		nPos = oStr.MarquersPositions()[ n ] + pnStartingAt - 1
		
		return nPos

		def FindNextNthMarquer(n, pnStartingAt)
			return This.FindNthNextMarquer(n, pnStartingAt)

		def NextNthMarquerOccurrence(n, pnStartingAt)
			return This.FindNthNextMarquer(n, pnStartingAt)

		def NthNextMarquerOccurrence(n, pnStartingAt)
			return This.FindNthNextMarquer(n, pnStartingAt)		

		def NthNextMarquerPosition(n, pnStartingAt)
			return This.FindNthNextMarquer(n, pnStartingAt)

		def PositionOfNthNextMarquer(n, pnStartingAt)
			return This.FindNthNextMarquer(n, pnStartingAt)

		def NextNthMarquerPosition(n, pnStartingAt)
			return This.FindNthNextMarquer(n, pnStartingAt)

		def PositionOfNextNthMarquer(n, pnStartingAt)
			return This.FindNthNextMarquer(n, pnStartingAt)

	def NthNextMarquerAndItsPosition(n, pnStartingAt)
		cMarquer  = This.NthNextMarquer(n, pnStartingAt)
		nPosition = This.FindNthNextMarquer(n, pnStartingAt)

		return [ cMarquer, nPosition ]

		#< @FunctionFluentForm

		def NthNextMarquerAndItsPositionQ(n, pnStartingAt)
			return This.NthNextMarquerAndItsPositionQR(n, pnStartingAt, pnStartingAt, :stzList)

		def NthNextMarquerAndItsPositionQR(n, pnStartingAt, pnStartingAt, pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.NthNextMarquerAndItsPosition(n, pnStartingAt) )

			on :stzHashList
				return new stzHashList( This.NthNextMarquerAndItsPosition(n, pnStartingAt) )

			other
				stzRaise("Unsupported return type!")
			off

		#>

		#< @FunctionAlternativeForm

		def NextNthMarquerAndItsPosition(n, pnStartingAt)
			return This.NthNextMarquerAndItsPosition(n, pnStartingAt)

		#>

	def FindNextMarquer(pnStartingAt)

		return This.FindNthNextMarquer(1, pnStartingAt)

		def NextMarquerPosition(pnStartingAt)
			return This.FindNextMarquer(pnStartingAt)

		def PositionOfNextMarquer(pnStartingAt)
			return This.FindNextMarquer(pnStartingAt)

		def NextMarquerOccurrence(pnStartingAt)
			return This.FindNextMarquer(pnStartingAt)

	def NextMarquer(pnStartingAt)
		return This.NthNextMarquer(1, pnStartingAt)

		def NextMarquerQ(pnStartingAt)
			return new stzString( This.NextMarquer(pnStartingAt) )

	def NextMarquerAndItsPosition(pnStartingAt)
		cMarquer  = This.NextMarquer(pnStartingAt)
		nPosition = This.NextMarquerPosition(pnStartingAt)

		return [ cMarquer, nPosition ]

		def NextMarquerAndItsPositionQ(pnStartingAt)
			return new stzString( This.NextMarquerAndItsPosition(pnStartingAt) )

		def NextMarquerAndItsOccurrence(pnStartingAt)
			return This.NextMarquerAndItsPosition(pnStartingAt)

			def NextMarquerAndItsOccurrenceQ(pnStartingAt)
				return new stzString( This.NextMarquerAndItsOccurrence(pnStartingAt) )

	#----- PREVIOUS MARQUERS

	def PreviousMarquers(pnStartingAt)
		if isList(pnStartingAt) and StzListQ(pnStartingAt).IsStartingAtNamedParam()
			pnStartingAt = pnStartingAt[2]
		ok

		return This.SectionQ(1, pnStartingAt).Marquers()

		def PreviousMarquersQ(pnStartingAt)
			return This.PreviousMarquersQR(pnstartingAt, :stzList)

		def PreviousMarquersQR(pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.PreviousMarquers(pnStartingAt) )
	
			on :stzListOfStrings
				return new stzListOfStrings( This.PreviousMarquers(pnStartingAt) )

			other
				stzRaise("Unsupported return type!")
			off

	def NthPreviousMarquer(n, pnStartingAt)
		nPos = This.FindNthPreviousMarquer(n, pnStartingAt)

		return This.MarquerByPosition(nPos)
		
		def NthPreviousMarquerQ(n, pnStartingAt)
			return new stzString( This.NthPreviousMarquer(n, pnStartingAt) )

		def PreviousNthMarquer(n, pnStartingAt)
			return This.NthPreviousMarquer(n, pnStartingAt)

			def PreviousNthMarquerQ(n, pnStartingAt)
				return new stzString( This.PreviousNthMarquer(n, pnStartingAt) )

	def FindNthPreviousMarquer(n, pnStartingAt)

		if isList(pnStartingAt) and StzListQ(pnStartingAt).IsStartingAtNamedParam()
			pnStartingAt = pnStartingAt[2]
		ok

		oStr = This.SectionQ(1,  pnStartingAt)

		aPositions = oStr.MarquersPositions()
		
		try
			return aPositions[ len(aPositions) - n + 1 ]
		catch
			return 0
		done
		
		#< @FunctionAlternativeForm

		def FindPreviousNthMarquer(n, pnStartingAt)
			return This.FindNthPreviousMarquer(n, pnStartingAt)

		def PreviousNthMarquerOccurrence(n, pnStartingAt)
			return This.FindNthPreviousMarquer(n, pnStartingAt)

		def NthPreviousMarquerOccurrence(n, pnStartingAt)
			return This.FindNthPreviousMarquer(n, pnStartingAt)		

		def NthPreviousMarquerPosition(n, pnStartingAt)
			return This.FindNthPreviousMarquer(n, pnStartingAt)

		def PositionOfNthPreviousMarquer(n, pnStartingAt)
			return This.FindNthPreviousMarquer(n, pnStartingAt)

		def PreviousNthMarquerPosition(n, pnStartingAt)
			return This.FindNthPreviousMarquer(n, pnStartingAt)

		def PositionOfPreviousNthMarquer(n, pnStartingAt)
			return This.FindNthPreviousMarquer(n, pnStartingAt)

		#>

	def NthPreviousMarquerAndItsPosition(n, pnStartingAt)
		cMarquer  = This.NthPreviousMarquer(n, pnStartingAt)
		nPosition = This.FindNthPreviousMarquer(n, pnStartingAt)

		return [ cMarquer, nPosition ]

		#< @FunctionFluentForm

		def NthPreviousMarquerAndItsPositionQ(n, pnStartingAt)
			return This.NthPreviousMarquerAndItsPositionQR(n, pnStartingAt, pcReturnType)

		def NthPreviousMarquerAndItsPositionQR(n, pnStartingAt, pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.NthPreviousMarquerAndItsPosition(n, pnStartingAt) )

			on :stzHashList
				return new stzHashList( This.NthPreviousMarquerAndItsPosition(n, pnStartingAt) )

			other
				stzRaise("Unsupported return type!")
			off

		#>

		#< @FunctionAlternativeForm

		def PreviousNthMarquerAndItsPosition(n, pnStartingAt)
			return This.NthPreviousMarquerAndItsPosition(n, pnStartingAt)

		#>

	def FindPreviousMarquer(pnStartingAt)
		return This.FindNthPreviousMarquer(1, pnStartingAt)

		def PreviousMarquerPosition(pnStartingAt)
			return This.FindPreviousMarquer(pnStartingAt)

		def PositionOfPreviousMarquer(pnStartingAt)
			return This.FindPreviousMarquer(pnStartingAt)

		def PreviousMarquerOccurrence(pnStartingAt)
			return This.FindPreviousMarquer(pnStartingAt)

	def PreviousMarquer(pnStartingAt)
		return This.NthPreviousMarquer(1, pnStartingAt)

		def PreviousMarquerQ(pnStartingAt)
			return new stzString( This.PreviousMarquer(pnStartingAt) )

	def PreviousMarquerAndItsPosition(pnStartingAt)
		cMarquer  = This.PreviousMarquer(pnStartingAt)
		nPosition = This.PreviousMarquerPosition(pnStartingAt)

		return [ cMarquer, nPosition ]

		def PreviousMarquerAndItsPositionQ(pnStartingAt)
			return new stzString( This.PreviousMarquerAndItsPosition(pnStartingAt) )

		def PreviousMarquerAndItsOccurrence(pnStartingAt)
			return This.PreviousMarquerAndItsPosition(pnStartingAt)

			def PreviousMarquerAndItsOccurrenceQ(pnStartingAt)
				return new stzString( This.PreviousMarquerAndItsOccurrence(pnStartingAt) )

	  #------------------#
	 #      TO TEXT     #
	#------------------#

	def ToStzText()
		return new stzText( This.String() )

	  #---------------------------#
	 #      TO SET OF CHARS      #
	#---------------------------#

	def ToSetOfChars()

		//t0 = clock()

		aResult = []

		for i = 1 to This.NumberOfChars()

			c = This.NthChar(i)

			if NOT ring_find(aResult, c)
				aResult + c
			ok

		next

		//? ( clock() - t0 ) / clockspersecond()

		return aResult

		#< @FunctionFluentForm

		def ToSetOfCharsQR(pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType

			on :stzSet
				return new stzSet( This.ToSetOfChars() )

			on :stzList
				return new stzList( This.ToSetOfChars() )

			on :stzListOfChars
				return new stzListOfChars( This.ToSetOfChars() )

			on :stzListOfStrings
				return new stzListOfStrings( This.ToSetOfChars() )
			off

		def ToSetOfCharsQ()
			return This.ToSetOfCharsQR(:stzSet)

		#>

	  #-----------------------------------------------#
	 #      NUMBER OF OCCURRENCE OF A SUBSTRING      #
	#-----------------------------------------------#

	def NumberOfOccurrenceCS(pcSubStr, pCaseSensitive)

		nResult = len( This.FindAllCS(pcSubStr, pCaseSensitive) )
		return nResult

		#< @FunctionAlternativeForm
	
		def NumberOfOccurrencesCS(pcSubStr, pCaseSensitive)
			return This.NumberOfOccurrenceCS(pcSubStr, pCaseSensitive)

		def NumberOfOccurrenceOfSubstringCS(pcSubStr, pCaseSensitive)
			return This.NumberOfOccurrenceCS(pcSubStr, pCaseSensitive)

			def NumberOfOccurrencesOfSubstringCS(pcSubStr, pCaseSensitive)
				return This.NumberOfOccurrenceOfSubstringCS(pcSubStr, pCaseSensitive)
	
		def CountCS(pcSubStr, pCaseSensitive)
			return This.NumberOfOccurrenceCS(pcSubStr, pCaseSensitive)

		#>

	def NumberOfOccurrence(pcSubStr)
		if isList(pcSubStr) and StzListQ(pcSubStr).IsOfNamedParam()
			pcSubStr = pcSubStr[2]
		ok

		return NumberOfOccurrenceCS(pcSubStr, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForm

		def NumberOfOccurrences(pcSubStr)
			return This.NumberOfOccurrence(pcSubStr)

		def NumberOfOccurrenceOfSubstring(pcSubStr)
			return This.NumberOfOccurrence(pcSubStr)

			def NumberOfOccurrencesOfSubstring(pcSubStr)
				return This.NumberOfOccurrenceOfSubstring(pcStr)

		def Count(pcSubStr)
			return This.NumberOfOccurrence(pcSubStr)

		#>

	  #-------------------------------------------------------#
	 #    CHECKING IF THE STRING IS ONE OF THE RING TYPES    #
	#-------------------------------------------------------#

	def IsRingType()
		return This.UppercaseQ().IsOneOfThese([ "NUMBER", "STRING", "LIST", "OBJECT", "COBJECT" ])

	  #-------------------------#
	 #      SIZE IN BYTES      #
	#-------------------------#

	def NumberOfBytes()
		return This.ToStzListOfBytes().NumberOfBytes()

		#< @FunctionAlternativeForm

		def SizeInBytes()
			return This.NumberOfBytes()

		def CountBytes()
			return This.NumberOfBytes()

		#>
	
	def NumberOfBytesPerChar()
		aResult = []

		for i = 1 to This.NumberOfChars()
			aResult + [ This[i], StzStringQ(This[i]).NumberOfBytes() ]
		next

		return aResult

		def CountBytesPerChar()
			return This.NumberOfBytesPerChar()

	  #-----------------------------------------#
	 #   N CHARS, LEFT & RIGHT, FIRST & LAST   #
	#-----------------------------------------#
							
	// Returns n chars from the right
	def NRightChars(n)

		if n = 0
			return NULL
		else
			if This.IsRightToleft()
				cResult = This.Section( 1, n )
			else
				cResult = This.Section( This.NumberOfChars()-n+1, NumberOfChars() )
			end
					
			return cResult
		ok

		#< @FunctionFluentForm

		def NRightCharsQ(n)
			return new stzString( This.NRightChars(n) )

		#>

		#< @FunctionAlternativeForm

		def RightNChars(n)
			return This.NRightChars(n)
	
			def RightNCharsQ(n)
				return This.NRightCharsQ(n)
	
		def Right(n)
			return This.NRightChars(n)

			def RightQ(n)
				return This.NRightCharsQ(n)

		#>

	// Returns n Chars from the left
	def NLeftChars(n)
		if n = 0
			return NULL
		else
			if IsRightToleft()
				cResult = Section( This.NumberOfChars()-n+1, NumberOfChars() )
			else
				cResult = Section( 1, n)
			end
	
			return cResult
		ok

		#< @FunctionFluentForm

		def NLeftCharsQ(n)
			return new stzString( This.NLeftChars(n) )

		#>

		#< @FunctionAlternativeForm

		def LeftNChars(n)
			return This.NLeftChars(n)
	
			def LeftNCharsQ(n)
				return This.NLeftCharsQ(n)
	
		def Left(n)
			return This.NLeftChars(n)

			def LeftQ(n)
				return This.NLeftCharsQ(n)

		#>

	def NFirstChars(n)
		if This.IsRightToLeft()
			return This.NRightChars(n)
		else
			return This.NLeftChars(n)
		ok

		#< @FunctionFluentForm

		def NFirstCharsQ(n)
			return new stzString( This.NFirstChars(n) )

		#>

		#< @FunctionAlternativeForm

		def FirstNChars(n)
			return This.NFirstChars(n)
	
			def FirstNCharsQ(n)
				return This.NFirstCharsQ(n)

		#>

	def NLastChars(n)
		if This.IsRightToLeft()
			return This.NLeftChars(n)
		else
			return This.NRightChars(n)
		ok

		#< @FunctionFluentForm

		def NLastCharsQ(n)
			return new stzString( This.NLastChars(n) )

		#>

		#< @FunctionAlternativeForm

		def LastNChars(n)
			return This.NLastChars(n)
	
			def LastNCharsQ(n)
				return This.NLastCharsQ(n)

		#>

	def NextNthChar(n, pnStartingAt)
		cResult = ""

		if isList(pnStartingAt) and StzListQ(pnStartingAt).IsStartingAtNamedParam()
			pnStartingAt = pnStartingAt[2]
		ok

		if isString(pnStartingAt)
			if Q(pnStartingAt).IsOneOfTheseCS([
				:First, :FirstPosition, :FirstString, :FirstStringItem ], :CS = FALSE)

				pnStartingAt = 1
			
			but Q(pnStartingAt).IsOneOfTheseCS([
				:Last, :LastPosition, :LastString, :LastStringItem ], :CS = FALSE)

				pnStartingAt = This.NumberOfStrings()
			ok
		ok

		if NOT isNumber(pnStartingAt)
			stzRaise("Incorrect param! pnStartingAt must be a number.")
		ok

		if Q(pnStartingAt).IsBetween(1, This.NumberOfChars() - 1)
			if pnStartingAt + n <= This.NumberOfChars()
				cResult = This.CharAt(pnStartingAt + n)
			ok
		ok

		return cResult

		#< @FunctionFluentForms

		def NextNthCharQ(n, pnStartingAt)
			return This.NextNthCharQR(n, pnStartingAt, :stzString)

		def NextNthCharQR(n, pnStartingAt, pcReturnType)
			if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			if NOT isString(pcReturnType)
				stzRaise("Incorrect param! pcReturnType must be a string.")
			ok

			switch pcReturnType
			on :stzString
				return new stzString( This.NextNthChar(n, pnStartingAt) )

			on :stzChar
				return new stzChar( This.NextNthChar(n, pnStartingAt) )

			other
				stzRaise("Unsupported return type!")
			off

		#>
		
		#< @FunctionAlternativeForms

		def NthNextChar()
			return This.NextNthChar()

			def NthNextCharQ()
				return This.NthNextCharQR(:stzString)
	
			def NthNextCharQR(pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok

				if NOT isString(pcReturnType)
					stzRaise("Incorrect param! pcReturnType must be a string.")
				ok
	
				switch pcReturnType
				on :stzString
					return new stzString( This.NthNextChar(n, pnStartingAt) )
	
				on :stzChar
					return new stzChar( This.NthNextChar(n, pnStartingAt) )
	
				other
					stzRaise("Unsupported return type!")
				off

		#>

	def NextChar(paStartingAt)
		return This.NextNthChar(1)

		#< @FunctionFluentForm

		def NextCharQ(pnStartingAt)
			return This.NextCharQR(pnStartingAt, :stzString)

		def NextCharQR(pnStartingAt, pcReturnType)
			if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			if NOT isString(pcReturnType)
				stzRaise("Incorrect param! pcReturnType must be a string.")
			ok

			switch pcReturnType
			on :stzString
				return new stzString( This.NextChar(pnStartingAt) )

			on :stzChar
				return new stzChar( This.NextChar(pnStartingAt) )

			other
				stzRaise("Unsupported return type!")
			off	
		#>

	def PreviousNthChar(n, pnStartingAt)
		cResult = ""

		if isList(pnStartingAt) and StzListQ(pnStartingAt).IsStartingAtNamedParam()
			pnStartingAt = pnStartingAt[2]
		ok

		if isString(pnStartingAt)
			if Q(pnStartingAt).IsOneOfTheseCS([
				:First, :FirstPosition, :FirstString, :FirstStringItem ], :CS = FALSE)

				pnStartingAt = 1
			
			but Q(pnStartingAt).IsOneOfTheseCS([
				:Last, :LastPosition, :LastString, :LastStringItem ], :CS = FALSE)

				pnStartingAt = This.NumberOfStrings()
			ok
		ok

		if NOT isNumber(pnStartingAt)
			stzRaise("Incorrect param! pnStartingAt must be a number.")
		ok

		if Q(pnStartingAt).IsBetween(2, This.NumberOfChars())
			if pnStartingAt - n >= 1
				cResult = This.CharAt(pnStartingAt - n)
			ok
		ok

		return cResult

		#< @FunctionFluentForms

		def PreviousNthCharQ(n, pnStartingAt)
			return This.PreviousNthCharQR(n, pnStartingAt, :stzString)

		def PreviousNthCharQR(n, pnStartingAt, pcReturnType)
			if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			if NOT isString(pcReturnType)
				stzRaise("Incorrect param! pcReturnType must be a string.")
			ok

			switch pcReturnType
			on :stzString
				return new stzString( This.PreviousNthChar(n, pnStartingAt) )

			on :stzChar
				return new stzChar( This.PreviousNthChar(n, pnStartingAt) )

			other
				stzRaise("Unsupported return type!")
			off

		#>
		
		#< @FunctionAlternativeForms

		def NthPreviousChar()
			return This.PreviousNthChar()

			def NthPreviousCharQ()
				return This.NthPreviousCharQR(:stzString)
	
			def NthPreviousCharQR(pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok

				if NOT isString(pcReturnType)
					stzRaise("Incorrect param! pcReturnType must be a string.")
				ok
	
				switch pcReturnType
				on :stzString
					return new stzString( This.NthPreviousChar(n, pnStartingAt) )
	
				on :stzChar
					return new stzChar( This.NthPreviousChar(n, pnStartingAt) )
	
				other
					stzRaise("Unsupported return type!")
				off

		#>

	def PreviousChar(n)
		return This.PreviousNthChar(n, 1)

		#< @FunctionFluentForm

		def PreviousCharQ(pnStartingAt)
			return This.PreviousCharQR(pnStartingAt, :stzString)

		def PreviousCharQR(pnStartingAt, pcReturnType)
			if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			if NOT isString(pcReturnType)
				stzRaise("Incorrect param! pcReturnType must be a string.")
			ok

			switch pcReturnType
			on :stzString
				return new stzString( This.PreviousChar(pnStartingAt) )

			on :stzChar
				return new stzChar( This.PreviousChar(pnStartingAt) )

			other
				stzRaise("Unsupported return type!")
			off	
		#>

	  #------------------------------#
	 #   BYTES AND BYTES PER CHAR   #
	#------------------------------#

	def ToStzListOfBytes()
		return new stzListOfBytes( This.String() )

	def Bytes()
		return This.ToStzListOfBytes().Content()

		#< @FunctionFluentForm

		def BytesQ()
			return This.ToStzListOfBytes()

		#>
	
		#< @FunctionAlternativeForm

		def ToListOfBytes()
			return This.Bytes()

			#< @FunctionFluentForm
	
			def ToListOfBytesQ()
				return This.BytesQ()
		
			#>
	
		#>

	def BytesPerChar()
		return This.ToStzListOfBytes().BytesPerChar()

	  #--------------------------------------#
	 #   BYTECODES AND BYTECODES PER CHAR   #
	#--------------------------------------#

	def Bytecodes()
		return This.ToStzListOfBytes().Bytecodes()

	def BytecodesPerChar()
		return This.ToStzListOfBytes().BytecodesPerChar()

	  #----------------------------------------------------#
	 #  INFERING A RING OR SOFTANZA TYPE FROM THE STRING  #
	#----------------------------------------------------#

	def InfereType()
		cStr = This.Lowercased()

		# Checking if the string correponds to one of the 4 Ring types

		if cStr = :number or cStr = :numbers or Q(cStr).BeginsWith(:Number)
			return :Number
	
		but cStr = :string or cStr = :strings or Q(cStr).BeginsWith(:String)
			return :String
	
		but cStr = :list or cStr = :lists or Q(cStr).BeginsWith(:List) or
		    cStr = :pair or cStr = :pairs or Q(cStr).BeginsWith(:pair)
	
			return :List
	
		but cStr = :object or cStr = :objects or Q(cStr).BeginsWith(:Object)
			return :Object
	
		ok
	
		# Checking if the string correponds to one of the Softanza types

		if Q(cStr).BeginsWithCS("stz", :CS = FALSE)
	
			for aPair in StzClassesXT()
				if aPair[1] = cStr or aPair[2] = cStr
					return aPair[1]
				ok
			next

		but Q("stz" + cStr).IsStzType()
			return "stz" + cStr

		but Q(cStr).IsPluralOfAStzType()
			return PluralToStzType(cStr)

		but Q("stz" + cStr).IsPluralOfAStzType()
			return PluralToStzType("stz" + cStr)

		ok

	def InfereMethod(pcFromStzClass)

		if isList(pcFromStzClass) and
		   Q(pcFromStzClass).IsOneOfTheseNamedParams([ :From, :In, :Of ])
			pcFromStzClass = pcFromStzClass[2]
		ok

		if NOT isString(pcFromStzClass)
			stzRaise("Incorrect param type! pcFromStzClass must be a string.")
		ok

		if NOT Q(pcFromStzClass).IsStzClass()
			stzRaise("Syntax error! pcFromStzClass must be a valid Softanza class name.")
		ok

		cCode = 'acTheseMethods = Stz("' +
			Q(pcFromStzClass).FirstNCharsRemoved(3) + '",
			:Methods)'

		eval(cCode)

		cMethod = ""

		oListStr = new stzListOfStrings( acTheseMethods )

		if oListStr.ContainsCS( "is" + This.String(), :CS = FALSE )
			cMethod = "is" + This.String()

		but oListStr.ContainsCS( "is" + This.LastCharRemoved(), :CS = FALSE )
			cMethod = "is" + This.LastCharRemoved()

		else
			stzRaise("Sorry! Can't infere the method name from the provided string.")
		ok

		return cMethod

	def IsPluralOfAStzType()
		oHash = new stzHashList( StzTypesXT() )
		anPos = oHash.FindValue( This.Lowercased() )
		if len(anPos) > 0
			return TRUE
		else
			return FALSE
		ok

		def IsAPluralOfStzClassName()
			return This.IsPluralOfAStzType()

	def IsPluralOfThisStzType(cType)

		if Q(cType).IsAStzType() and
		   PluralOfThisStzType(cType) = This.String()

			return TRUE
		else
			return FALSE
		ok

		def IsPluralOfThisStzClassName(cType)
			return This.IsPluralOfThisStzType()

	  #==============================#
	 #     BOUNDS OF THE STRING     #
	#==============================#

	// Verifies if the string is bounded by substrings 1 and 2 
	def IsBoundedByCS(pacBounds, pCaseSensitive)
		/* EXAMPLE

		o1 = new stzString("-♥-")
		? o1.IsBoundedBy("-") #--> TRUE

		o1 = new stzString("-♥_")
		? o1.IsBoundedBy([ "-", "_" ]) #--> TRUE

		*/

		# Managing this special syntax:
		# ? Q("♥").IsBoundedBy([ "-", :In = "-♥-" ])

		if isList(pacBounds) and Q(pacBounds).IsPair() and
		   isList(pacBounds[2]) andQ(pacBounds[2]).IsPair() and
		   Q(pacBounds[2]).IsInNamedParam()
		   
			return This.IsBoundedByInCS(pacBounds[1], :In = pacBounds[2], pCaseSensitive)

		ok

		if isString(pacBounds)
			cBound1 = pacBounds
			cBound2 = pacBounds

		but isList(pacBounds) and Q(pacBounds).IsPairOfStrings()
			cBound1 = pacBounds[1]
			cBound2 = pacBounds[2]

		else
			StzRaise("Incorrect param type! pacBounds must be a string or a list of pairs.")
		ok

		if This.BeginsWithCS(cBound1, pCaseSensitive) and
		   This.EndsWithCS(cBound2, pCaseSensitive)
			return TRUE
		else
			return FALSE
		ok

	#-- WITHOUT CASESENSITIVITY

	def IsBoundedBy(pacBounds)
		return This.IsBoundedByCS(pacBounds, :CaseSensitive = TRUE)

	   #--------------------------------------------------------#
	  #  CHECKING IF THE STRING IS BOUNDED BY A GIVEN PAIR OF  #
	 #  SUBSTRINGS INSIDE A GIVEN STRING                      #
	#--------------------------------------------------------#

	def IsboundedByInCS(pacBounds, pIn, pCaseSensitive)
		/* EXAMPLE

		o1 = new stzString("♥")
		? o1.IsBoundedBy([ "-", "-" ], :In = "... -♥- ...")
		#--> TRUE

		*/

		if NOT ( isList(pacBounds) and Q(pacBounds).IsPairOfStrings() )
			StzRaise("Incorrect param type! paBounds must be a pair of strings.")
		ok

		if isList(pIn) and Q(pIn).IsInNamedParam()
			pIn = pIn[2]
		ok
		if NOT ( isString(pIn) or isList(pIn) )
			StzRaise("Incorrect param type! pIn must be a string or list.")
		ok

		bResult = FALSE

		if isString(pIn)
			oStr = new stzString(pIn)
			bResult = oStr.SubStringIsBoundedByCS( This.String(), paBounds, pCaseSensitive )

		but isList(pIn)
			// TODO
			StzRaise("Insupported feature in this version!")

			if Q(pIn).IsListOfStrings()

			else

			ok
		ok
		
		return bResult

	#-- WITHOUT CASESENSITIVITY

	def IsboundedByIn(pacBounds, pIn)
		return This.IsboundedByInCS(pacBounds, pIn, :CaseSensitive = TRUE)

	  #------------------------------------------------------------------------------#
	 #  CHECKING IF THE STRING IS BOUNDING OF A GIVEN STRING INSIDE ANOTHER STRING  #
	#------------------------------------------------------------------------------#

	def IsBoundOfCS(pcSubStr, pcInStr, pCaseSensitive)
		/* EXAMPLE
		o1 = new stzString("_")
		? o1.IsBoundOf("world", :In = "hello _world_ and <world>!")
		#--> TRUE
		*/

		pcStr = pcInStr[2]
		acBounds = Q(pcStr).BoundsOfCS(pcSubStr, :UpToNChars = This.NumberOfChars(), pCaseSensitive )
		#--> [ [ "_", "_" ], [ "<", ">" ] ]

		bResult = Q(acBounds).Contains( [ This.String(), This.String() ] )
		return bResult

	#-- WITHOUT CASESNESITUVURT

	def IsBoundOf(pcSubStr, pcInStr)
		bResult = This.IsBoundOfCS(pcSubStr, pcInStr, :CaseSensitive = TRUE)
		return bResult

	def IsNthBoundOfCS(pcOther, pCaseSensitive)
		// TODO

	def IsFirstBoundOfCS(pcOtherStr, pCaseSensitive)
		// TODO

	def IsLastBoundOfCS(pcOtherStr, pCaseSensitive)
		// TODO

	def IsLeftBoundOfCS(pcOtherStr, pCaseSensitive)
		// TODO

	def IsRightBoundOfCS(pcOtherStr, pCaseSensitive)
		// TODO

	  #------------------------------------#
	 #     ADDING BOUNDS TO THE STRING    #
	#------------------------------------#

	def AddBounds(pacBounds)
		if isList(pacBounds) and Q(pacBounds).IsPairOfStrings()
			cBound1 = pacBounds[1]
			cBound2 = pacBounds[2]

		but isString(pacBounds)
			cBound1 = pacBounds
			cBound2 = pacBounds

		else
			StzString("Incorrect param type! pacBounds mus tbe a string or pair of strings.")
		ok

		cResult = cBound1 + This.String() + cBound2
		This.UpdateWith( cResult )

		def AddBoundsQ(pacBounds)
			This.AddBounds(pacBounds)
			return This

		def BoundWith(pacBounds)
			This.AddBounds(pacBounds)

			def BoundWithQ(pacBounds)
				This.BoundWith(pacBounds)
				return This

	def StringWithBoundsAdded(pacBounds)
		cResult = This.Copy().AddBoundsQ(pacBounds).Content()

		def StringBoundedWith(pacBounds)
			return This.StringWithBoundsAdded(pacBounds)

		def BoundedWith()
			return This.StringWithBoundsAdded(pacBounds)

		def BoundsAdded()
			return This.StringWithBoundsAdded(pacBounds)

	  #-------------------------------------#
	 #  IDENTIFYING BOUNDS OF A SUBSTRING  #
	#-------------------------------------#
	
	def SubStringIsBoundedByCS(pcSubStr, pacBounds, pCaseSensitive)
		/* EXAMPLE

		o1 = new stzString("aa♥♥aaa bb♥♥bbb")
		
		? o1.SubStringIsBoundedBy("♥♥", "aa") #--> TRUE
		? o1.SubStringIsBoundedBy("♥♥", "bb") #--> TRUE
		
		? o1.SubStringIsBoundedBy("♥♥", [ "aa", "aaa" ] ) #--> TRUE
		? o1.SubStringIsBoundedBy("♥♥", [ [ "aa","aaa" ], ["bb","bbb"] ]) #--> TRUE		*/
		
		if isList(pacBounds) and Q(pacBounds).IsPairOfStrings()

			aTemp = []
			aTemp + pacBounds
			pacBounds = aTemp

		but isString(pacBounds)
			aTemp = [ [ pacBounds, pacBounds ] ]
			pacBounds = aTemp
		ok

		if NOT ( isList(pacBounds) and Q(pacBounds).AllItemsArePairsOfStrings() )
			StzRaise("Incorrect param type! pacBounds must be lists of pairs of strings.")
		ok

		bResult = FALSE

		for acPair in pacBounds
			anUpToNChars = [ Q(acPair[1]).NumberOfChars(),
					 Q(acPair[2]).NumberOfChars() ]
	
			acBounds = This.BoundsOfCS(pcSubStr, anUpToNChars, pCaseSensitive)
	
			
			bResult = Q(pacBounds).AllItemsExistIn(acBounds)
		next
		return bResult
		

	def SubStringIsBoundedBy(pcSubStr, pacBounds)
		return This.SubStringIsBoundedByCS(pcSubStr, pacBounds, :CaseSensitive = TRUE)

	   #--------------------------------------------------#
	  #  SETTLING ON A GUVEN POSITION (OR SECTION) AND   #
	 #  THEN HARVESTING N CHARS BEORE AND N CHARS LEFT  #
	#--------------------------------------------------#

	def Settle(paPositionOrSection, paHarvest)
		/* EXAMPLE

		o1 = new stzString("what a <<nice>>> day!")

		o1.Settle(
			:OnSection = [10, 13],
			:Harvest = [ :NCharsBefore = 2, :NCharsAfter = 3 ]
		)

		#--> [ "<<", ">>>" ]

		*/

		if isList(paPositionOrSection) and
			Q(paPositionOrSection).IsOneOfTheseNamedParams([
				:On, :OnPosition, :OnSection
			])

			paPositionOrSection = paPositionOrSection[2]
		ok

		if isNumber(paPositionOrSection)

			aTemp = []
			aTemp + paPositionOrSection
			aTemp + paPositionOrSection

			paPositionOrSection = aTemp
		ok

		if NOT ( isList(paPositionOrSection) and
			 Q(paPositionOrSection).IsPairOfNumbers() )

			stzRaise("Incorrect param! paPositionOrSection must be a position (number) or a section (pair of numbers).")
		ok

		aSection = paPositionOrSection
		bReturnSections = FALSE

		if isList(paHarvest) and
		   Q(paHarvest).IsOneOfTheseNamedParams([

				:Harvest, :AndHarvest,
				:AndThenHarvest, :ThenHarvest,

				:Yield, :AndYield,
				:AndThenYield, :ThenYield,

				:HarvestSection, :AndHarvestSection,
				:AndThenHarvestSection, :ThenHarvestSection,

				:YieldSection, :AndYieldSection,
				:AndThenYieldSection, :ThenYieldSection,

				:HarvestSections, :AndHarvestSections,
				:AndThenHarvestSections, :ThenHarvestSections,

				:YieldSections, :AndYieldSections,
				:AndThenYieldSections, :ThenYieldSections ])

			if Q(paHarvest[1]).ContainsCS(:Section, :CS = FALSE)
				bReturnSections = TRUE
			ok

			paHarvest = paHarvest[2]
		ok

		if NOT len(paHarvest) = 2
			stzRaise("Incorrect param! paHarvest must be a list of 2 items.")
		ok

		if isList(paHarvest[1]) and Q(paHarvest[1]).IsNCharsBefore()
			paHarvest[1] = paHarvest[1][2]
		ok

		if isList(paHarvest[2]) and Q(paHarvest[2]).IsNCharsAfter()
			paHarvest[2] = paHarvest[2][2]
		ok

		if NOT BothAreNumbers(paHarvest[1], paHarvest[2])
			stzRaise("Incorrect param! paHarvest must be a pair of numbers.")
		ok

		nCharsBefore = paHarvest[1]
		nCharsAfter  = paHarvest[2]

		anSectionBefore = [0, 0]
		if nCharsBefore != 0
			anSectionBefore[1] = (aSection[1] - nCharsBefore)
			anSectionBefore[2] = (aSection[1] - 1)
		ok

		anSectionAfter = [0, 0]
		if anSectionAfter != 0
			anSectionAfter[1] = (aSection[2] + 1)
			anSectionAfter[2] = (aSection[2] + nCharsAfter)
		ok

		if bReturnSections
			aResult = [ anSectionBefore, anSectionAfter ]
			
		else
			aResult = This.Sections([ anSectionBefore, anSectionAfter ])
		ok

		return aResult

		def Stay(paPositionOrSection, paHervest)
			return Settle(paPositionOrSection, paHervest)

	  #-----------------------------------------------#
	 #  GETIING BOUNDS OF A SUBSTRING UP TO N CHARS  #
	#-----------------------------------------------#

	def BoundsCS(pcSubStr, panUpToNChars, pCaseSensitive)
		/* EXAMPLES

		#-- EXAMPLE 1

		o1 = new stzString("<<word>> and __word__")
		? @@( o1.Bounds( :Of = "word", :UpToNChars = 2 ) )
		#--> [ [ "<<", ">>" ], [ "__", "__" ] ]
		
		#-- EXAMPLE 2
		
		o1 = new stzString("<<word>> and __word__")
		? @@( o1.Bounds( :Of = "word", :UpToNChars = [ 2, 2 ]  ) )
		#--> [ [ "<<", ">>" ], [ "__", "__" ] ]
		
		#-- EXAMPLE 3
	
		o1 = new stzString("<<word>>> and  _word__")
		? o1.Bounds( :Of = "word", :UpToNChars = [ [ 2, 3 ], [ 1, 2 ] ]  )

		*/

		if isList(pcSubStr) and
			( Q(pcSubStr).IsOfNamedParam() or
			  Q(pcSubStr).IsOfSubStringNamedParam()
			)

			pcSubStr = pcSubStr[2]
		ok

		if isList(panUpToNChars) and Q(panUpToNChars).IsUpToNCharsNamedParam()
			panUpToNChars = panUpToNChars[2]
		ok

		# CASE: ? o1.Bounds(:Of = "many", :UpToNChars = 2]
		#--> panUpToNChars will be transformed to the more general
		#    form [ [2,2], [2, 2], ... ] depending on the number
		#    of occurrence of the substring "many" in the string

		if isNumber(panUpToNChars)

			aTemp = Q([ panUpToNChars, panUpToNChars ]).
				RepeatedNTimes(	This.CountCS(pcSubStr, pCaseSensitive) )

			panUpToNChars = aTemp
			
		# CASE: ? o1.Bounds(:Of = "many", :UpToNChars = [2, 3])
		#--> panUpToNChars will be transformed to the more general
		#    form [ [2, 3], [2, 3], ... ]

		but isList(panUpToNChars) and
			len(panUpToNChars) = 2 and
			Q(panUpToNChars).IsListOfNumbers()

			aTemp = Q(panUpToNChars).
				RepeatedNTimes( This.CountCS(pcSubStr, pCaseSensitive) )

			panUpToNChars = aTemp
		ok

		# CASE: ? o1.Bounds(:Of = "many", :UpToNChars = [ 0, 2, 0, 3, [1,2] ])
		#--> panUpToNChars will be tranformed to the more general form:
		#    [ [0,0], [2,2], [0,0], [3,3], [1,2] ]
		if isList(panUpToNChars) and
			Q(panUpToNChars).IsListOfNumbersAndPairsOfNumbers()

			for item in panUpToNChars
				if isNumber(item)
					item = Q(item).ReproducedInAPair()
				ok
			next
		ok

		if NOT 	( isList(panUpToNChars) and
			  Q(panUpToNChars).IsListOfPairsOfNumbers()
			)

			stzRaise("Incorrect param type! panUpToNChars must be a number, " +
				 "or a pair of numbers, or a list of pairs of numbers.")
		ok

		# Doing the job


		anSections = This.FindSectionsCS(pcSubStr, pCaseSensitive)

		acResult = []

		i = 0

		for aSection in anSections

			i++

			if i > len(panUpToNChars)
				exit
			ok

			if Q(panUpToNChars[i]) = [ 0, 0 ]

				acResult + [ "", "" ]
			else

				nBefore = panUpToNChars[i][1]
				nAfter  = panUpToNChars[i][2]

				acResult + This.Settle(
					:OnSection  = aSection,
					:AndHarvest = [ :NCharsBefore = nBefore, :NCharsAfter = nAfter ]
				)

			ok

		next

		return acResult

	def Bounds(pcSubStr, pnUpToNChars)
		return This.BoundsCS(pcSubStr, pnUpToNChars, :CaseSensitive = TRUE)

	#-----------------------------

	def LeftBoundsOfCS(pcStr, pCaseSensitive)
		// TODO (future)

	def RightBoundsOfCS(pcStr, pCaseSensitive)
		// TODO (future)

	def FirstBoundsOfCS(pcStr, pCaseSensitive)
		// TODO (future)
		# For general use with left-to-right and right-toleft strings

	def LastBoundsOfCS(pcStr, pCaseSensitive)
		// TODO (future)

	  #--------------------------------------------#
	 #     REMOVING BOTH BOUNDS FROM THE STRING   #
	#--------------------------------------------#

	def RemoveBoundsCS(pacBounds, pCaseSensitive)
		if isList(pacBounds) and Q(pacBounds).IsPairOfStrings()
			cBound1 = pacBounds[1]
			cBound2 = pacBounds[2]

		but isString(pacBounds)
			cBound1 = pacBounds
			cBound2 = pacBounds

		else
			StzString("Incorrect param type! pacBounds mus tbe a string or pair of strings.")
		ok

		if This.IsBoundedByCS(pacBounds, pCaseSensitive)
			This.RemoveFirstCS(cBound1, pCaseSensitive)
			This.RemoveLastCS(cBound2, pCaseSensitive)
		ok
		
		#< @FunctionFluentForm
	
		def RemoveBoundsCSQ(pacBounds, pCaseSensitive)
			This.RemoveBoundsCS(pacBounds, pCaseSensitive)
			return This
		
		#>

	def BoundsRemovedCS(pacBounds, pCaseSensitive)
		cResult = This.Copy().RemoveBoundsCSQ(pacBounds, pCaseSensitive).Content()
		return cResult

	#-- WITHOUT CASESENSITIVITY

	def RemoveBounds(pacBounds)
		This.RemoveBoundsCS(pacBounds, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def RemoveBoundsQ(pacBounds)
			This.RemoveBounds(pacBounds)
			return This
		#>

	def BoundsRemoved(pacBounds)
		cResult = This.Copy().RemoveBoundsQ(pacBounds).Content()
		return cResult

	  #------------------------------------------------------------#
	 #   REMOVING BOUNDS OF A GIVEN SUBSTRING INSIDE THE STRING   #
	#------------------------------------------------------------#

	def RemoveBoundsOfSubStringCS(pacBounds, pcSubStr, pCaseSensitive)
		if isList(pacBounds) and Q(pacBounds).IsPairOfStrings()
			cBound1 = pacBounds[1]
			cBound2 = pacBounds[2]

		but isString(pacBounds)
			cBound1 = pacBounds
			cBound2 = pacBounds

		else
			StzString("Incorrect param type! pacBounds mus tbe a string or pair of strings.")
		ok

		anSections = This.FindSectionsBetweenCS(pcSubStr, cBound1, cBound2, pCaseSensitive)

		nLen1 = StzStringQ(cBound1).NumberOfChars()
		nLen2 = StzStringQ(cBound2).NumberOfChars()

		anBoundsSections = []

		for aSection in anSections

			n1 = aSection[1]
			n2 = n1 + nLen1 - 1
			anBoundsSections + [n1, n2]

			n1 = aSection[2] - 1
			n2 = n1 + nLen2 - 1
			anBoundsSections + [n1, n2]

		next
	
		This.RemoveSections(anBoundsSections)

		#< @FunctionFluentForm
	
		def RemoveBoundsOfSubStringCSQ(pacBounds, pcSubStr, pCaseSensitive)
			This.RemoveBoundsOfSubStringCS(pacBounds, pcSubStr, pCaseSensitive)
			return This
		
		#>

	def BoundsOfSubStringRemovedCS(pacBounds, pcSubStr, pCaseSensitive)
		cResult = This.Copy().RemoveBoundsOfSubStringCSQ(pacBounds, pcSubStr, pCaseSensitive)
		return cResult

	#-- WITHOUT CASESENSITIVITY

	def RemoveBoundsOfSubString(pacBounds, pcSubStr)
		This.RemoveBoundsOfSubStringCS(pacBounds, pcSubStr, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def RemoveBoundsOfSubStringQ(pacBounds, pcSubStr)
			This.RemoveBoundsOfSubString(pacBounds, pcSubStr)
			return This
		#>

	def BoundsOfSubStringRemoved(pacBounds, pcSubStr)
		cResult = This.Copy().RemoveBoundsOfSubStringQ(pacBounds, pcSubStr).Content()
		return cResult

	  #--------------------------------------------#
	 #     REMOVING MANY BOUNDS FROM THE STRING   #
	#--------------------------------------------#

	def RemoveManyBoundsCS(paBoundsOrPairsOfBounds, pCaseSensitive)
		for BoundOrPairOfBounds in paBoundsOrPairsOfBounds
			This.RemoveBoundsCS(BoundOrPairOfBounds, pCaseSensitive)
		next

		def RemoveManyBoundsCSQ(paBoundsOrPairsOfBounds, pCaseSensitive)
			This.RemoveManyBoundsCS(paBoundsOrPairsOfBounds, pCaseSensitive)
			return This

	def ManyBoundsRemovedCS(paBoundsOrPairsOfBounds, pCaseSensitive)
		cResult = This.Copy().RemoveManyBoundsCSQ(paBoundsOrPairsOfBounds, pCaseSensitive).Content()
		return cResult

	#-- WITHOUT CASESENSITIVITY

	def RemoveManyBounds(paBoundsOrPairsOfBounds)
		This.RemoveManyBoundsCS(paBoundsOrPairsOfBounds, :CaseSensitive = TRUE)

		def RemoveManyBoundsQ(paBoundsOrPairsOfBounds)
			This.RemoveManyBounds(paBoundsOrPairsOfBounds)
			return This
		
	def ManyBoundsRemoved(paBoundsOrPairsOfBounds)
		cResult = This.Copy().RemoveManyBoundsQ(paBoundsOrPairsOfBounds).Content()
		return cResult

	  #-----------------------------------------------------------------#
	 #     REMOVING MANY BOUNDS OF A GIVEN SUBSTRING FROM THE STRING   #
	#-----------------------------------------------------------------#

	def RemoveManyBoundsOfSubStringCS(paBoundsOrPairsOfBounds, pcSubStr, pCaseSensitive)
		for BoundOrPairOfBounds in paBoundsOrPairsOfBounds
			This.RemoveBoundsOfSubStringCS(BoundOrPairOfBounds, pcSubStr,pCaseSensitive)
		next

		def RemoveManyBoundsOfSubStringCSQ(paBoundsOrPairsOfBounds, pcSubStr, pCaseSensitive)
			This.RemoveManyBoundsOfSubStringCS(paBoundsOrPairsOfBounds, pcSubStr, pCaseSensitive)
			return This

	def ManyBoundsOfSubStringRemovedCS(paBoundsOrPairsOfBounds, pcSubStr, pCaseSensitive)
		cResult = This.Copy().RemoveManyBoundsOfSubStringCSQ(paBoundsOrPairsOfBounds, pcSubStr, pCaseSensitive).Content()
		return cResult

	#-- WITHOUT CASESENSITIVITY

	def RemoveManyBoundsOfSubString(paBoundsOrPairsOfBounds)
		This.RemoveManyBoundsOfSubStringCS(paBoundsOrPairsOfBounds, pcSubStr,  :CaseSensitive = TRUE)

		def RemoveManyBoundsOfSubStringQ(paBoundsOrPairsOfBounds)
			This.RemoveManyBoundsOfSubString(paBoundsOrPairsOfBounds)
			return This
		
	def ManyBoundsOfSubStringRemoved(paBoundsOrPairsOfBounds)
		cResult = This.Copy().RemoveManyBoundsOfSubStringQ(paBoundsOrPairsOfBounds).Content()
		return cResult

	  #-------------------------------------------------------#
	 #  REMOVING ANY SUBSTRING BETWEEN TWO OTHER SUBSTRINGS  #
	#-------------------------------------------------------#

	def RemoveAnyBetweenCS(pcBound1, pcBound2, pCaseSensitive)
		aSections = This.FindAnySectionsBetweenCS(pcBound1, pcBound2, pCaseSensitive)
		This.RemoveSections(aSections)

		def RemoveAnyBetweenCSQ(pcBound1, pcBound2, pCaseSensitive)
			This.RemoveAnyBetweenCS(pcBound1, pcBound2, pCaseSensitive)
			return This

		def RemoveAnySubStringBetweenCS(pcBound1, pcBound2, pCaseSensitive)
			This.RemoveAnyBetweenCS(pcBound1, pcBound2, pCaseSensitive)

			def RemoveAnySubStringBetweenCSQ(pcBound1, pcBound2, pCaseSensitive)
				This.RemoveSubStringBetweenCS(pcBound1, pcBound2, pCaseSensitive)
				return This

	def AnySubstringBetweenRemovedCS(pcBound1, pcBound2, pCaseSensitive)
		cResult = This.RemoveAnyBetweenCSQ(pcBound1, pcBound2, pCaseSensitive).Content()
		return cResult

	#-- WITHOUT CASESENSITIVITY

	def RemoveAnyBetween(pcBound1, pcBound2)
		This.RemoveAnyBetweenCS(pcBound1, pcBound2, :CaseSensitive = TRUE)
		
		def RemoveAnyBetweenQ(pcBound1, pcBound2)
			This.RemoveAnyBetween(pcBound1, pcBound2)
			return This

		def RemoveAnySubStringBetween(pcBound1, pcBound2)
			This.RemoveAnyBetween(pcBound1, pcBound2)

			def RemoveAnySubStringBetweenQ(pcBound1, pcBound2)
				This.RemoveSubStringBetween(pcBound1, pcBound2)
				return This

	def AnySubstringBetweenRemoved(pcBound1, pcBound2)
		cResult = This.RemoveAnyBetweenQ(pcBound1, pcBound2).Content()
		return cResult

	  #---------------------------------------------#
	 #     REMOVING LEFT BOUND FROM THE STRING     #
	#---------------------------------------------#

	def RemoveLeftBoundCS(pcSubStr, pCaseSensitive)
	
		nLenSubStr = StzStringQ( pcSubStr).NumberOfChars()
	
		if This.LeftNChars( nLenSubStr ) = pcSubStr
			This.ReplaceFirstOccurrenceCS(pcSubStr, "", pCaseSensitive)
		ok
	
		#< @FunctionFluentForm

		def RemoveLeftBoundCSQ(pcSubStr, pCaseSensitive)
			This.RemoveLeftBoundCS(pcSubStr, pCaseSensitive)
			return This
		#>

	def LeftBoundRemovedCS(pcSubStr, pCaseSensitive)
		cResult = This.Copy().RemoveLeftBoundCSQ(pcSubStr, pCaseSensitive).Content()
		return cResult

	#-- WITHOUT CASESENSITIVITY

	def RemoveLeftBound(pcSubStr)
		This.RemoveLeftBoundCS(pcSubStr, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def RemoveLeftBoundQ(pcSubStr)
			This.RemoveLeft(pcSubStr)
			return This
		#>

	def LeftBoundRemoved(pcSubStr)
		cResult = This.Copy().RemoveLeftBoundQ(pcSubStr).Content()
		return cResult

	  #--------------------------------------------#
	 #    REMOVING RIGHT BOUND FROM THE STRING    #
	#--------------------------------------------#

	def RemoveRightBoundCS(pcSubStr, pCaseSensitive)
	
		nLenSubStr = StzStringQ( pcSubStr).NumberOfChars()
	
		if This.RightNChars( nLenSubStr ) = pcSubStr
			This.ReplaceLastOccurrenceCS(pcSubStr, "", pCaseSensitive)
		ok
	
		#< @FunctionFluentForm

		def RemoveRightBoundCSQ(pcSubStr, pCaseSensitive)
			This.RemoveRightBoundCS(pcSubStr, pCaseSensitive)
			return This
	
		#>

	def RightBoundRemovedCS(pcSubStr, pCaseSensitive)
		cResult = This.Copy().RemoveRightBoundCSQ(pcSubStr, pCaseSensitive).Content()
		return cResult

	#-- WITHOUT CASESENSITIVITY

	def RemoveRightBound(pcSubStr)
		This.RemoveRightBoundCS(pcSubStr, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def RemoveRightBoundQ(pcSubStr)
			This.RemoveRightBound(pcSubStr)
			return This

		#>

	def RightBoundRemoved(pcSubStr)
		cResult = This.Copy().RemoveRightBoundQ(pcSubStr).Content()
		return cResult

	  #-------------------------------------------#
	 #   REMOVING FIRST BOUND FROM THE STRING    #
	#-------------------------------------------#

	def RemoveFirstBoundCS(pcSubStr, pCaseSensitive)
	
		if This.IsLeftToRight()
			This.RemoveLeftBoundCS(pcSubStr, pCaseSensitive)
	
		else
				# It IsRightToTeft() than...
				This.RemoveRightBoundCS(pcSubStr, pCaseSensitive)
				
		ok
	
		#< @FunctionFluentForm
	
		def RemoveFirstBoundCSQ(pcSubStr, pCaseSensitive)
			This.RemoveFirstBoundCS(pcSubStr, pCaseSensitive)
			return This
	
		#>

	def FirstBoundRemovedCS(pcSubStr, pCaseSensitive)
		cResult = This.Copy().RemoveFirstBoundCSQ(pcSubStr, pCaseSensitive).Content()
		return cResult

	#-- WITHOUT CASESENSITIVITY

	def RemoveFirstBound(pcSubStr)
		This.RemoveFirstBoundCS(pcSubStr, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def RemoveFirstBoundQ(pcSubStr)
			This.RemoveFirstBound(pcSubStr)
			return This

		#>

	def FirstBoundRemoved(pcSubStr)
		cResult = This.Copy().RemoveFirstBoundQ(pcSubStr).Content()
		return cResult

	  #-----------------------------------------#
	 #   REMOVING LAST BOUND FROM THE STRING   #
	#-----------------------------------------#

	def RemoveLastBoundCS(pcSubStr, pCaseSensitive)
	
		if This.IsLeftToRight()
			This.RemoveRightBoundsCS(pcSubStr, pCaseSensitive)
	
		else
			# It IsRightToTeft() then...
			This.RemoveLeftBoundsCS(pcSubStr, pCaseSensitive)
				
		ok
	
		#< @FunctionFluentForm

		def RemoveLastBoundCSQ(pcSubStr, pCaseSensitive)
			This.RemoveLastBoundCS(pcSubStr, pCaseSensitive)
			return This

		#>

	def LastBoundRemovedCS(pcSubStr, pCaseSensitive)
		cResult = This.Copy().RemoveLastBoundCSQ(pcSubStr, pCaseSensitive).Content()
		return cResult

	#-- WITHOUT CASESENSITIVITY

	def RemoveLastBound(pcSubStr)
		This.RemoveLastBoundCS(pcSubStr, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def RemoveLastBoundQ(pcSubStr)
			This.RemoveFirstBound(pcSubStr)
			return This
	
		#>

	def LastBoundRemoved(pcSubStr)
		cResult = This.Copy().RemoveLastBoundQ(pcSubStr).Content()
		return cResult

	  #------------------------------------------------------#
	 #   CHECKING OF THE STRING CONTAINS THE GIVEN BOUNDS   # TODO (future)
	#------------------------------------------------------#

	def ContainsBounds() // TODO

	def ContainsTheseBounds() // TODO

	  #------------------------------------------------------------------------#
	 #   ADDING BOUNDS TO THE OCCURRENCES OF A SUBSTRING INSIDE THE STRING    #
	#------------------------------------------------------------------------#

	def AddBoundsToSubStringCS(pcSubStr, pcBound1, pcBound2, pCaseSensitive)
		anSections = This.FindSectionsCSQ(pcSubStr, pCaseSensitive).Reversed()
	
		for aSection in anSections
			n1 = aSection[1]
			n2 = aSection[2]

			nLenBound2 = StzStringQ(pcBound2).NumberOfChars()

			if n2 < This.NumberOfChars() and
			   This.Section(n2 + 1, n2 + nLenBound2) != pcBound2

				This.InsertAfter(n2, pcBound2)
			ok

			nLenBound1 = StzStringQ(pcBound1).NumberOfChars()

			if n1 > 1 and
			   This.Section(n1 - nLenBound1, n1 - 1) != pcBound1

				This.InsertBefore(n1, pcBound1)
			ok
		next

		def AddBoundsToSubStringCSQ(pcSubStr, pcBound1, pcBound2, pCaseSensitive)
			This.AddBoundsToSubStringCS(pcSubStr, pcBound1, pcBound2, pCaseSensitive)
			return This

		def BoundSubStringWithCS(pcSubStr,  pcBound1, pcBound2, pCaseSensitive)
			This.AddBoundsToSubStringCS(pcSubStr, pcBound1, pcBound2, pCaseSensitive)

			def BoundSubStringWithCSQ(pcSubStr, pcBound1, pcBound2, pCaseSensitive)
				This.BoundSubStringWithCS(pcSubStr, pcBound1, pcBound2, pCaseSensitive)
				return This

	#---

	def AddBoundsToSubString(pcSubStr, pcBound1, pcBound2)
		This.AddBoundsToSubStringCS(pcSubStr, pcBound1, pcBound2, :CaseSensitive = TRUE)

		def AddBoundsToSubStringQ(pcSubStr, pcBound1, pcBound2)
			This.AddBoundsToSubString(pcSubStr, pcBound1, pcBound2)
			return This

		def BoundSubStringWith(pcSubStr, pcBound1, pcBound2)
			This.AddBoundsToSubString(pcSubStr, pcBound1, pcBound2)

			def BoundSubStringWithCQ(pcSubStr, pcBound1, pcBound2)
				This.BoundSubStringWithCS(pcSubStr, pcBound1, pcBound2)
				return This

	  #---------------------------------------------------------#
	 #   ADDING BOUNDS TO MANYS SUBSTRINGS AT THE SAME TIME    #
	#---------------------------------------------------------#

	def AddBoundsToManySubStringsCS(pacSubStr, pcBound1, pcBound2, pCaseSensitive)
		for str in pacSubStr
			This.AddBoundsToSubStringCS(str, pcBound1, pcBound2, pCaseSensitive)
		next

		#< @FunctionFluentForm

		def AddBoundsToManySubStringsCSQ(pacSubStr, pcBound1, pcBound2, pCaseSensitive)
			This.AddBoundsToManySubStringsCS(pacSubStr, pcBound1, pcBound2, pCaseSensitive)
			return This

		#>

		#< @FunctionAlternativeForms

		def AddBoundsToSubStringsCS(pacSubStr, pcBound1, pcBound2, pCaseSensitive)
			This.AddBoundsToManySubStringsCS(pacSubStr, pcBound1, pcBound2, pCaseSensitive)

			def AddBoundsToSubStringsCSQ(pacSubStr, pcBound1, pcBound2, pCaseSensitive)
				This.AddBoundsToSubStringsCS(pacSubStr, pcBound1, pcBound2, pCaseSensitive)
				return This

		def BoundManySubStringsWithCS(pacSubStr,  pcBound1, pcBound2, pCaseSensitive)
			This.AddBoundsToManySubStringsCS(pacSubStr, pcBound1, pcBound2, pCaseSensitive)

			def BoundManySubStringsWithCSQ(pacSubStr, pcBound1, pcBound2, pCaseSensitive)
				This.BoundManySubStringsWithCS(pacSubStr, pcBound1, pcBound2, pCaseSensitive)
				return This

		def BoundSubStringsWithCS(pacSubStr,  pcBound1, pcBound2, pCaseSensitive)
			This.AddBoundsToManySubStringsCS(pacSubStr, pcBound1, pcBound2, pCaseSensitive)

			def BoundSubStringsWithCSQ(pacSubStr, pcBound1, pcBound2, pCaseSensitive)
				This.BoundSubStringsWithCS(pacSubStr, pcBound1, pcBound2, pCaseSensitive)
				return This

		#>

	#---

	def AddBoundsToManySubStrings(pacSubStr, pcBound1, pcBound2)
		This.AddBoundsToManySubStringsCS(pacSubStr, pcBound1, pcBound2, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def AddBoundsToManySubStringsQ(pacSubStr, pcBound1, pcBound2)
			This.AddBoundsToManySubStrings(pacSubStr, pcBound1, pcBound2)
			return This

		#>

		#< @FunctionAlternativeForms

		def AddBoundsToSubStringsC(pacSubStr, pcBound1, pcBound2)
			This.AddBoundsToManySubStringsC(pacSubStr, pcBound1, pcBound2)

			def AddBoundsToSubStringsCQ(pacSubStr, pcBound1, pcBound2)
				This.AddBoundsToSubStringsC(pacSubStr, pcBound1, pcBound2)
				return This

		def BoundManySubStringsWith(pacSubStr,  pcBound1, pcBound2)
			This.AddBoundsToManySubStringsC(pacSubStr, pcBound1, pcBound2)

			def BoundManySubStringsWithCQ(pacSubStr, pcBound1, pcBound2)
				This.BoundManySubStringsWith(pacSubStr, pcBound1, pcBound2)
				return This

		def BoundSubStringsWith(pacSubStr,  pcBound1, pcBound2)
			This.AddBoundsToManySubStrings(pacSubStr, pcBound1, pcBound2)

			def BoundSubStringsWithQ(pacSubStr, pcBound1, pcBound2)
				This.BoundSubStringsWith(pacSubStr, pcBound1, pcBound2)
				return This

		#>

	   #----------------------------------------------------------#
	  #   REMOVING BOUNDS FROM THE NTH OCCURRENCE OF A BOUNDED   #
	 #   SUBSTRING (INSIDE THE STRING)                          #
	#----------------------------------------------------------#

	// TODO (future)
	def RemoveNthBound()

	  #---------------------------------------------------------------------#
	 #   REMOVING OCCURRENCES OF A BOUNDED SUBSTRING (INSIDE THE STRING)   #
	#---------------------------------------------------------------------#

	// TODO (future)
	def RemoveBoundedSubString()

	  #----------------------------------------------------------#
	 #   REMOVING MANY BOUNDED SUBSTRINGS (INSIDE THE STRING)   #
	#----------------------------------------------------------#

	// TODO (future)
	def RemoveManyBoundedSubStrings()

	  #-----------------------------------------------------------------------#
	 #   REMOVING NTH OCCURRENCE OF A BOUNDED SUBSTRING (INSIDE THE STRING)  #
	#-----------------------------------------------------------------------#

	// TODO (future)
	def RemoveNthBoundedSubString()

	  #-------------------------------------------------------------------------#
	 #   REMOVING FIRST OCCURRENCE OF A BOUNDED SUBSTRING (INSIDE THE STRING)  #
	#-------------------------------------------------------------------------#

	// TODO (future)
	def RemoveFirstBoundedSubString()

	  #-------------------------------------------------------------------------#
	 #   REMOVING LAST OCCURRENCE OF A BOUNDED SUBSTRING (INSIDE THE STRING)  #
	#-------------------------------------------------------------------------#

	// TODO (future)
	def RemoveLastBoundedSubString()

	  #============================#
	 #   REPEATED LEADING CHARS   #
	#============================#

	def HasRepeatedLeadingCharsCS(pCaseSensitive)

		if This.RepeatedLeadingCharsCS(pCaseSensitive) != NULL
			return TRUE
		else

			return FALSE
		ok

		def HasLeadingRepeatedCharsCS(pCaseSensitive)
			return This.HasRepeatedLeadingCharsCS(pCaseSensitive)

		def HasLeadingCharsCS(pCaseSensitive)
			return This.HasRepeatedLeadingCharsCS(pCaseSensitive)
	
	def RepeatedLeadingCharsCS(pCaseSensitive)
		/* Example:
			'eeeTUNIS' 	--> 'eee'
			'exeeeeeTUNIS' 	--> ''
		*/

		if isList(pCaseSensitive) and Q(pCaseSensitive).IsCaseSensitiveNamedParam()
			pCaseSensitive = pCaseSensitive[2]
		ok

		if NOT isBoolean(pCaseSensitive)
			stzRaise("Incorrect param! pCaseSensitive must be TRUE or FALSE.")
		ok

		if NOT This.IsEmpty()

			cResult = ""
	
			bContinue = TRUE
			cFirstChar = This.FirstChar()
			i = 1

			while bContinue
				i++

				if i > This.NumberOfChars()
					bContinue = FALSE
				ok

				cCurrentChar = This[i]

				if NOT StzStringQ(cCurrentChar).IsEqualToCS(cFirstChar, pCaseSensitive)
					bContinue = FALSE
				ok

			end

			if i > 2
				return This.NFirstChars(i-1)
			ok
		ok

		def RepeatedLeadingCharsCSQ(pCaseSensitive)
			return new stzString( This.RepeatedLeadingCharsCS(pCaseSensitive) )
	
		def LeadingRepeatedCharsCS(pCaseSensitive)
			return This.RepeatedLeadingCharsCS(pCaseSensitive)

			def LeadingRepeatedCharsCSQ(pCaseSensitive)
				return new stzString( This.LeadingRepeatedCharsCS(pCaseSensitive) )
	
		def LeadingCharsCS(pCaseSensitive)
			return This.RepeatedLeadingCharsCS(pCaseSensitive)

			def LeadingCharsCSQ(pCaseSensitive)
				return new stzString( This.LeadingCharsCS(pCaseSensitive) )
	
	def RepeatedLeadingCharCS(pCaseSensitive)

		if This.HasRepeatedLeadingCharsCS(pCaseSensitive)
			return This[1]
		ok

		def RepeatedLeadingCharCSQR(pcReturnType, pCaseSensitive)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzChar
				return new stzChar(This.RepeatedLeadingCharCS(pCaseSensitive))

			on :stzString
				return new stzString(This.RepeatedLeadingChar(pCaseSensitive))
			other
				stzRaise("Unsupported returned type!")
			off

		def RepeatedLeadingCharCSQ(pCaseSensitive)
			return This.RepeatedLeadingCharCSQR(:stzChar, pCaseSensitive)
	
		def LeadingRepeatedCharCS(pCaseSensitive)
			return This.RepeatedLeadingCharCS(pCaseSensitive)

			def LeadingRepeatedCharCSQR(pcReturnType, pCaseSensitive)
				if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok

				return This.RepeatedLeadingCharCSQR(pcReturnType, pCaseSensitive)

			def LeadingRepeatedCharCSQ(pCaseSensitive)
				return This.LeadingRepeatedCharQR(:stzChar, pCaseSensitive)
	
		def LeadingCharCS(pCaseSensitive)
			return This.RepeatedLeadingCharCS(pCaseSensitive)

			def LeadingCharCSQR(pcReturnType, pCaseSensitive)
				if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok

				return This.RepeatedLeadingCharCSQR(pcReturnType, pCaseSensitive)

			def LeadingCharCSQ(pCaseSensitive)
				return This.LeadingCharCSQR(:stzChar, pCaseSensitive)
	
	def NumberOfRepeatedLeadingCharsCS(pCaseSensitive)
		if This.HasRepeatedLeadingCharsCS(pCaseSensitive)
			return StzStringQ( This.RepeatedLeadingCharsCS(pCaseSensitive) ).NumberOfChars()
		else
			return 0
		ok

		def NumberOfLeadingRepeatedCharsCS(pCaseSensitive)
			return This.NumberOfRepeatedLeadingCharsCS(pCaseSensitive)

		def NumberOfLeadingCharsCS(pCaseSensitive)
			return This.NumberOfRepeatedLeadingCharsCS(pCaseSensitive)
	
	def RepeatedLeadingCharIsCS(c, pCaseSensitive)
		if This.HasRepeatedLeadingCharsCS(pCaseSensitive) and
		   This.FirstCharQ().IsEqualToCS(c, pCaseSensitive)

			return TRUE
		else
			return FALSE
		ok

		def LeadingRepeatedCharIsCS(c, pCaseSensitive)
			return This.RepeatedLeadingCharIsCS(c, pCaseSensitive)

		def LeadingCharIsCS(c, pCaseSensitive)
			return This.RepeatedLeadingCharIsCS(c, pCaseSensitive)
	
	#---

	def HasRepeatedLeadingChars()
		return This.HasRepeatedLeadingCharsCS(:CaseSensitive = TRUE)

		def HasLeadingRepeatedChars()
			return This.HasRepeatedLeadingChars()

		def HasLeadingChars()
			return This.HasRepeatedLeadingChars()
	
	def RepeatedLeadingChars()
		/* Example:
			    'eeeTUNIS' 	--> 'eee'
			'exeeeeeTUNIS' 	--> ''
		*/

		return This.RepeatedLeadingCharsCS(:CaseSensitive = TRUE)

		def RepeatedLeadingCharsQ()
			return new stzString( This.RepeatedLeadingChars() )
	
		def LeadingRepeatedChars()
			return This.RepeatedLeadingChars()

			def LeadingRepeatedCharsQ()
				return new stzString( This.LeadingRepeatedChars() )
	
		def LeadingChars()
			return This.RepeatedLeadingChars()

			def LeadingCharsQ()
				return new stzString( This.LeadingChars() )
	
	def RepeatedLeadingChar()
		cResult = This.RepeatedLeadingCharCS(:CaseSensitive = TRUE)
		return cResult

		def RepeatedLeadingCharQ()
			return This.RepeatedLeadingCharQR(:stzString)

		def RepeatedLeadingCharQR(pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzString
				return new stzString(This.RepeatedLeadingChar())

			on :stzChar
				return new stzChar(This.RepeatedLeadingChar())


			other
				stzRaise("Unsupported returned type!")
			off
	
		def LeadingRepeatedChar()
			return This.RepeatedLeadingChar()

			def LeadingRepeatedCharQ()
				return This.LeadingRepeatedCharQR(:stzString)

			def LeadingRepeatedCharQR(pcReturnType)
				if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok

				return This.RepeatedLeadingCharQR(pcReturnType)
	
		def LeadingChar()
			return This.RepeatedLeadingChar()

			def LeadingCharQ()
				return This.LeadingCharQR(:stzString)

			def LeadingCharQR(pcReturnType)
				if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok

				return This.RepeatedLeadingCharQR(pcReturnType)
	
	def NumberOfRepeatedLeadingChars()
		return This.NumberOfRepeatedLeadingCharsCS(:CaseSensitive = TRUE)

		def NumberOfLeadingRepeatedChars()
			return This.NumberOfRepeatedLeadingChars()

		def NumberOfLeadingChars()
			return This.NumberOfRepeatedLeadingChars()
	
	def RepeatedLeadingCharIs(c)
		return This.RepeatedLeadingCharIsCS(c, :CaseSensitive = TRUE)

		def LeadingRepeatedCharIs(c)
			return This.RepeatedLeadingCharIs(c)

		def LeadingCharIs(c)
			return This.RepeatedLeadingCharIs(c)

	  #-----------------------------#
	 #   REPEATED TRAILING CHARS   #
	#-----------------------------#

	def HasRepeatedTrailingCharsCS(pCaseSensitive)
		return This.Copy().ReverseCharsQ().HasRepeatedLeadingCharsCS(pCaseSensitive)

		def HasTrailingRepeatedCharsCS(pCaseSensitive)
			return This.HasRepeatedTrailingCharsCS(pCaseSensitive)

		def HasTrailingCharsCS(pCaseSensitive)
			return This.HasRepeatedTrailingCharsCS(pCaseSensitive)
	
	def RepeatedTrailingCharsCS(pCaseSensitive)
		/* Example:
			'TUNISeee' 	--> 'eee'
			'TUNISexeeeee' 	--> ''
		*/

		cResult = This.Copy().ReverseCharsQ().RepeatedLeadingCharsCS(pCaseSensitive)
		return cResult

		def RepeatedTrailingCharsCSQ(pCaseSensitive)
			return new stzString( This.RepeatedTrailingCharsCS(pCaseSensitive) )
	
		def TrailingRepeatedCharsCS(pCaseSensitive)
			return This.RepeatedTrailingCharsCS(pCaseSensitive)

			def TrailingRepeatedCharsCSQ(pCaseSensitive)
				return new stzString( This.TrailingRepeatedCharsCS(pCaseSensitive) )
	
		def TrailingCharsCS(pCaseSensitive)
			return This.RepeatedTrailingCharsCS(pCaseSensitive)

			def TrailingCharsCSQ(pCaseSensitive)
				return new stzString( This.TrailingCharsCS(pCaseSensitive) )
	
	def RepeatedTrailingCharCS(pCaseSensitive)
		if This.HasRepeatedTrailingCharsCS(pCaseSensitive)
			return This[:LastChar]
		ok

		def RepeatedTrailingCharCSQ(pCaseSensitive)
			return This.RepeatedTrailingCharCSQR(:stzString, pCaseSensitive)

		def RepeatedTrailingCharCSQR(pcReturnType, pCaseSensitive)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzString
				return new stzString(This.RepeatedTrailingChar(pCaseSensitive))

			on :stzChar
				return new stzChar(This.RepeatedTrailingCharCS(pCaseSensitive))

			other
				stzRaise("Unsupported returned type!")
			off
	
		def TrailingRepeatedCharCS(pCaseSensitive)
			return This.RepeatedTrailingCharCS(pCaseSensitive)

			def TrailingRepeatedCharCSQ(pCaseSensitive)
				return This.TrailingRepeatedCharQR(:stzString, pCaseSensitive)

			def TrailingRepeatedCharCSQR(pcReturnType, pCaseSensitive)
				if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok

				return This.RepeatedTrailingCharCSQR(pcReturnType, pCaseSensitive)
	
		def TrailingCharCS(pCaseSensitive)
			return This.RepeatedTrailingCharCS(pCaseSensitive)

			def TrailingCharCSQR(pcReturnType, pCaseSensitive)
				if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok

				return This.RepeatedTrailingCharCSQR(pcReturnType, pCaseSensitive)

			def TrailingCharCSQ(pCaseSensitive)
				return This.TrailingCharCSQR(:stzChar, pCaseSensitive)
	
	def NumberOfRepeatedTrailingCharsCS(pCaseSensitive)
		if This.HasRepeatedTrailingCharsCS(pCaseSensitive)
			return StzStringQ( This.RepeatedTrailingCharsCS(pCaseSensitive) ).NumberOfChars()
		else
			return 0
		ok

		def NumberOfTrailingRepeatedCharsCS(pCaseSensitive)
			return This.NumberOfRepeatedTrailingCharsCS(pCaseSensitive)

		def NumberOfTrailingCharsCS(pCaseSensitive)
			return This.NumberOfRepeatedTrailingCharsCS(pCaseSensitive)
	
	def RepeatedTrailingCharIsCS(c, pCaseSensitive)
		if This.HasRepeatedTrailingCharsCS(pCaseSensitive) and
		   This.LastCharQ().IsEqualToCS(c, pCaseSensitive)

			return TRUE
		else
			return FALSE
		ok

		def TrailingRepeatedCharIsCS(c, pCaseSensitive)
			return This.RepeatedTrailingCharIsCS(c, pCaseSensitive)

		def TrailingCharIsCS(c, pCaseSensitive)
			return This.RepeatedTrailingCharIsCS(c, pCaseSensitive)
	
	#---
	
	def HasRepeatedTrailingChars()
		return This.HasRepeatedTrailingCharsCS(:CaseSensitive = TRUE)

		def HasTrailingRepeatedChars()
			return This.HasRepeatedTrailingChars()

		def HasTrailingChars()
			return This.HasRepeatedTrailingChars()
	
	def RepeatedTrailingChars()
		/* Example:
			'TUNISeee' 	--> 'eee'
			'TUNISexeeeee' 	--> ''
		*/

		return This.RepeatedTrailingCharsCS(:CaseSensitive = TRUE)

		def RepeatedTrailingCharsQ()
			return new stzString( This.RepeatedTrailingChars() )
	
		def TrailingRepeatedChars()
			return This.RepeatedTrailingChars()

			def TrailingRepeatedCharsQ()
				return new stzString( This.TrailingRepeatedChars() )
	
		def TrailingChars()
			return This.RepeatedTrailingChars()

			def TrailingCharsQ()
				return new stzString( This.TrailingChars() )
	
	def RepeatedTrailingChar()
		return This.RepeatedTrailingCharCS(:CaseSensitive = TRUE)

		def RepeatedTrailingCharQ()
			return This.RepeatedTrailingCharQR(:stzString)

		def RepeatedTrailingCharQR(pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzString
				return new stzString(This.RepeatedTrailingChar())

			on :stzChar
				return new stzChar(This.RepeatedTrailingChar())

			other
				stzRaise("Unsupported returned type!")
			off
	
		def TrailingRepeatedChar()
			return This.RepeatedTrailingChar()

			def TrailingRepeatedCharQ()
				return This.TrailingRepeatedCharQR(:stzString)

			def TrailingRepeatedCharQR(pcReturnType)
				if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok

				return This.RepeatedTrailingCharQR(pcReturnType)

		def TrailingChar()
			return This.RepeatedTrailingChar()


			def TrailingCharQ()
				return This.TrailingCharQR(:stzString)

			def TrailingCharQR(pcReturnType)
				if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok

				return This.RepeatedTrailingCharQR(pcReturnType)
	
	def NumberOfRepeatedTrailingChars()
		return This.NumberOfRepeatedTrailingCharsCS(:CaseSensitive = TRUE)

		def NumberOfTrailingRepeatedChars()
			return This.NumberOfRepeatedTrailingChars()

		def NumberOfTrailingChars()
			return This.NumberOfRepeatedTrailingChars()
	
	def RepeatedTrailingCharIs(c)
		return This.RepeatedTrailingCharIsCS(c, :CaseSensitive = TRUE)

		def TrailingRepeatedCharIs(c)
			return This.RepeatedTrailingCharIs(c)

		def TrailingCharIs(c)
			return This.RepeatedTrailingCharIs(c)
	
	  #-------------------------------------#
	 #   REMOVING REPEATED LEADING CHARS   #
	#-------------------------------------#

	def RemoveRepeatedLeadingCharsCS(pCaseSensitive)
		if This.HasRepeatedLeadingCharsCS(pCaseSensitive)
			This.RemoveFirstNChars( This.NumberOfRepeatedLeadingCharsCS(pCaseSensitive) )
		ok

		def RemoveRepeatedLeadingCharsCSQ()
			This.RemoveRepeatedLeadingCharsCS(pCaseSensitive)
			return This

		def RemoveLeadingRepeatedCharsCS(pCaseSensitive)
			This.RemoveRepeatedLeadingCharsCS(pCaseSensitive)

			def RemoveLeadingRepeatedCharsCSQ(pCaseSensitive)
				This.RemoveLeadingRepeatedCharsCS(pCaseSensitive)
				return This
	
		def RemoveLeadingCharsCS(pCaseSensitive)
			This.RemoveRepeatedLeadingCharsCS(pCaseSensitive)

			def RemoveLeadingCharsCSQ(pCaseSensitive)
				This.RemoveLeadingCharsCS(pCaseSensitive)
				return This
	
	def RepeatedLeadingCharsRemovedCS(pCaseSensitive)
		cResult = This.Copy().RemoveRepeatedLeadingCharsCSQ(pCaseSensitive).Content()
		return cResult

		def LeadingRepeatedCharsRemovedCS(pCaseSensitive)
			return This.RepeatedLeadingCharsRemovedCS(pCaseSensitive)

		def LeadingCharsRemovedCS(pCaseSensitive)
			return This.RepeatedLeadingCharsRemovedCS(pCaseSensitive)

	#---

	def RemoveRepeatedLeadingChars()
		This.RemoveRepeatedLeadingCharsCS(:CaseSensitive = TRUE)

		def RemoveRepeatedLeadingCharsQ()
			This.RemoveRepeatedLeadingChars()
			return This

		def RemoveLeadingRepeatedChars()
			This.RemoveRepeatedLeadingChars()

			def RemoveLeadingRepeatedCharsQ()
				This.RemoveLeadingRepeatedChars()
				return This
	
		def RemoveLeadingChars()
			This.RemoveRepeatedLeadingChars()

			def RemoveLeadingCharsQ()
				This.RemoveLeadingChars()
				return This
	
	def RepeatedLeadingCharsRemoved()
		cResult = This.Copy().RemoveRepeatedLeadingCharsQ().Content()
		return cResult

		def LeadingRepeatedCharsRemoved()
			return This.RepeatedLeadingCharsRemoved()

		def LeadingCharsRemoved()
			return This.RepeatedLeadingCharsRemoved()

	  #--------------------------------------#
	 #   REMOVING REPEATED TRAILING CHARS   #
	#--------------------------------------#

	def RemoveRepeatedTrailingCharsCS(pCaseSensitive)
		if This.HasRepeatedTrailingCharsCS(pCaseSensitive)
			This.RemoveLastNChars( This.NumberOfRepeatedTrailingCharsCS(pCaseSensitive) )
		ok

		def RemoveRepeatedTrailingCharsCSQ()
			This.RemoveRepeatedTrailingCharsCS(pCaseSensitive)
			return This

		def RemoveTrailingRepeatedCharsCS(pCaseSensitive)
			This.RemoveRepeatedTrailingCharsCS(pCaseSensitive)

			def RemoveTrailingRepeatedCharsCSQ(pCaseSensitive)
				This.RemoveTrailingRepeatedCharsCS(pCaseSensitive)
				return This
	
		def RemoveTrailingCharsCS(pCaseSensitive)
			This.RemoveRepeatedTrailingCharsCS(pCaseSensitive)

			def RemoveTrailingCharsCSQ(pCaseSensitive)
				This.RemoveTrailingCharsCS(pCaseSensitive)
				return This
	
	def RepeatedTrailingCharsRemovedCS(pCaseSensitive)
		cResult = This.Copy().RemoveRepeatedTrailingCharsCSQ(pCaseSensitive).Content()
		return cResult

		def TrailingRepeatedCharsRemovedCS(pCaseSensitive)
			return This.RepeatedTrailingCharsRemovedCS(pCaseSensitive)

		def TrailingCharsRemovedCS(pCaseSensitive)
			return This.RepeatedTrailingCharsRemovedCS(pCaseSensitive)

	#---

	def RemoveRepeatedTrailingChars()
		This.RemoveRepeatedTrailingCharsCS(:CaseSensitive = TRUE)

		def RemoveRepeatedTrailingCharsQ()
			This.RemoveRepeatedTrailingChars()
			return This

		def RemoveTrailingRepeatedChars()
			This.RemoveRepeatedTrailingChars()

			def RemoveTrailingRepeatedCharsQ()
				This.RemoveTrailingRepeatedChars()
				return This
	
		def RemoveTrailingChars()
			This.RemoveRepeatedTrailingChars()

			def RemoveTrailingCharsQ()
				This.RemoveTrailingChars()
				return This
	
	def RepeatedTrailingCharsRemoved()
		cResult = This.Copy().RemoveRepeatedTrailingCharsQ().Content()
		return cResult

		def TrailingRepeatedCharsRemoved()
			return This.RepeatedTrailingCharsRemoved()

		def TrailingCharsRemoved()
			return This.RepeatedTrailingCharsRemoved()
	
	  #--------------------------------------------#
	 #   REMOVING A GIVEN REPEATED LEADING CHAR   #
	#--------------------------------------------#

	def RemoveThisRepeatedLeadingCharCS(c, pCaseSensitive)
		if This.RepeatedLeadingCharQ().IsEqualToCS(c, pCaseSensitive)
			This.RemoveRepeatedLeadingCharsCS(pCaseSensitive)
		ok

		def RemoveThisRepeatedLeadingCharCSQ(c, pCaseSensitive)
			This.RemoveThisRepeatedLeadingCharCS(c, pCaseSensitive)
			return This

		def RemoveThisLeadingRepeatedCharCS(c, pCaseSensitive)
			This.RemoveThisRepeatedLeadingCharCS(c, pCaseSensitive)

			def RemoveThisLeadingRepeatedCharCSQ(c, pCaseSensitive)
				This.RemoveThisLeadingRepeatedCharCS(c, pCaseSensitive)
				return This

		def RemoveThisLeadingCharCS(c, pCaseSensitive)
			This.RemoveThisRepeatedLeadingCharCS(c, pCaseSensitive)

			def RemoveThisLeadingCharCSQ(c, pCaseSensitive)
				This.RemoveThisLeadingCharCS(c, pCaseSensitive)
				return This

	def ThisRepeatedLeadingCharRemovedCS(c, pCaseSensitive)
		cResult = This.Copy().RemoveThisRepeatedLeadingCharCSQ(c, pCaseSensitive).Content()
		return cResult

		def ThisLeadingRepeatedCharRemovedCS(c, pCaseSensitive)
			return This.ThisRepeatedLeadingCharRemoved(c, pCaseSensitive)

		def ThisLeadingCharRemovedCS(c, pCaseSensitive)
			return This.ThisRepeatedLeadingCharRemoved(c, pCaseSensitive)

	#---

	def RemoveThisRepeatedLeadingChar(c)
		if This.RepeatedLeadingCharQ().IsEqualTo(c)
			This.RemoveThisRepeatedLeadingCharCS(c, :CaseSensitive = TRUE)
		ok

		def RemoveThisRepeatedLeadingCharQ(c)
			This.RemoveThisRepeatedLeadingChar(c)
			return This

		def RemoveThisLeadingRepeatedChar(c)
			This.RemoveThisRepeatedLeadingChar(c)

			def RemoveThisLeadingRepeatedCharQ(c)
				This.RemoveThisLeadingRepeatedChar(c)
				return This

		def RemoveThisLeadingChar(c)
			This.RemoveThisRepeatedLeadingChar(c)

			def RemoveThisLeadingCharQ(c)
				This.RemoveThisLeadingChar(c)
				return This

	def ThisRepeatedLeadingCharRemoved(c)
		cResult = This.Copy().RemoveThisRepeatedLeadingCharQ(c).Content()
		return cResult

		def ThisLeadingRepeatedCharRemoved(c)
			return This.ThisRepeatedLeadingCharRemoved(c)

		def ThisLeadingCharRemoved(c)
			return This.ThisRepeatedLeadingCharRemoved(c)

	  #---------------------------------------------#
	 #   REMOVING A GIVEN REPEATED TRAILING CHAR   #
	#---------------------------------------------#

	def RemoveThisRepeatedTrailingCharCS(c, pCaseSensitive)
		if This.RepeatedTrailingCharQ().IsEqualToCS(c, pCaseSensitive)
			This.RemoveRepeatedTrailingCharsCS(pCaseSensitive)
		ok

		def RemoveThisRepeatedTrailingCharCSQ(c, pCaseSensitive)
			This.RemoveThisRepeatedTrailingCharCS(c, pCaseSensitive)
			return This

		def RemoveThisTrailingRepeatedCharCS(c, pCaseSensitive)
			This.RemoveThisRepeatedTrailingCharCS(c, pCaseSensitive)

			def RemoveThisTrailingRepeatedCharCSQ(c, pCaseSensitive)
				This.RemoveThisTrailingRepeatedCharCS(c, pCaseSensitive)
				return This

		def RemoveThisTrailingCharCS(c, pCaseSensitive)
			This.RemoveThisRepeatedTrailingCharCS(c, pCaseSensitive)

			def RemoveThisTrailingCharCSQ(c, pCaseSensitive)
				This.RemoveThisTrailingCharCS(c, pCaseSensitive)
				return This

	def ThisRepeatedTrailingCharRemovedCS(c, pCaseSensitive)
		cResult = This.Copy().RemoveThisRepeatedTrailingCharCSQ(c, pCaseSensitive).Content()
		return cResult

		def ThisTrailingRepeatedCharRemovedCS(c, pCaseSensitive)
			return This.ThisRepeatedTrailingCharRemoved(c, pCaseSensitive)

		def ThisTrailingCharRemovedCS(c, pCaseSensitive)
			return This.ThisRepeatedTrailingCharRemoved(c, pCaseSensitive)

	#---

	def RemoveThisRepeatedTrailingChar(c)
		if This.RepeatedTrailingCharQ().IsEqualTo(c)
			This.RemoveThisRepeatedTrailingCharCS(c, :CaseSensitive = TRUE)
		ok

		def RemoveThisRepeatedTrailingCharQ(c)
			This.RemoveThisRepeatedTrailingChar(c)
			return This

		def RemoveThisTrailingRepeatedChar(c)
			This.RemoveThisRepeatedTrailingChar(c)

			def RemoveThisTrailingRepeatedCharQ(c)
				This.RemoveThisTrailingRepeatedChar(c)
				return This

		def RemoveThisTrailingChar(c)
			This.RemoveThisRepeatedTrailingChar(c)

			def RemoveThisTrailingCharQ(c)
				This.RemoveThisTrailingChar(c)
				return This

	def ThisRepeatedTrailingCharRemoved(c)
		cResult = This.Copy().RemoveThisRepeatedTrailingCharQ(c).Content()
		return cResult

		def ThisTrailingRepeatedCharRemoved(c)
			return This.ThisRepeatedTrailingCharRemoved(c)

		def ThisTrailingCharRemoved(c)
			return This.ThisRepeatedTrailingCharRemoved(c)

	  #--------------------------------------------------------#
	 #   REMOVING GIVEN REPEATED LEADING AND TRAILING CHARS   #
	#--------------------------------------------------------#

	def RemoveTheseRepeatedLeadingAndTrailingCharsCS(c1, c2, pCaseSensitive)
		This.RemoveThisRepeatedLeadingCharCS(c1, pCaseSensitive)
		This.RemoveThisRepeatedTrailingCharCS(c2, pCaseSensitive)
		
		def RemoveTheseRepeatedLeadingAndTrailingCharsCSQ(c1, c2, pCaseSensitive)
			This.RemoveTheseRepeatedLeadingAndTrailingCharsCS(c1, c2, pCaseSensitive)
			return This

		def RemoveTheseLeadingAndRepeatedCharsCS(c1, c2, pCaseSensitive)
			This.RemoveTheseRepeatedLeadingAndTrailingCharsCS(c1, c2, pCaseSensitive)

			def RemoveTheseLeadingAndRepeatedCharsCSQ(c1, c2, pCaseSensitive)
				This.RemoveTheseLeadingAndRepeatedCharsCS(c1, c2, pCaseSensitive)
				return This

		def RemoveTheseLeadingAndTrailingCharsCS(c1, c2, pCaseSensitive)
			This.RemoveTheseRepeatedLeadingAndTrailingCharsCS(c1, c2, pCaseSensitive)

			def RemoveTheseLeadingAndTrailingCharsCSQ(c1, c2, pCaseSensitive)
				This.RemoveTheseLeadingAndTrailingCharsCS(c1, c2, pCaseSensitive)
				return This

	def TheseRepeatedLeadingAndTrailingCharsRemovedCS(c1, c2, pCaseSensitive)
		cResult = This.Copy().RemoveTheseRepeatedLeadingAndTrailingCharsCSQ(c1, c2, pCaseSensitive).Content()
		return cResult

		def TheseLeadingAndRepeatedCharsRemovedCS(c1, c2, pCaseSensitive)
			return This.TheseRepeatedLeadingAndTrailingCharsRemoved(c1, c2, pCaseSensitive)

		def TheseLeadingAndTrailingCharsRemovedCS(c1, c2, pCaseSensitive)
			return This.TheseRepeatedLeadingAndTrailingCharsRemoved(c1, c2, pCaseSensitive)

	#---

	def RemoveTheseRepeatedLeadingAndTrailingChars(c1, c2)
		This.RemoveTheseRepeatedLeadingAndTrailingCharsCS(c1, c2, :CaseSensitive = TRUE)

		def RemoveTheseRepeatedLeadingAndTrailingCharsQ(c1, c2)
			This.RemoveTheseRepeatedLeadingAndTrailingChars(c1, c2)
			return This

		def RemoveTheseLeadingAndRepeatedChars(c1, c2)
			This.RemoveTheseRepeatedLeadingAndTrailingChars(c1, c2)

			def RemoveTheseLeadingAndRepeatedCharsQ(c1, c2)
				This.RemoveTheseLeadingAndRepeatedChars(c1, c2)
				return This

		def RemoveTheseLeadingAndTrailingChars(c1, c2)
			This.RemoveTheseRepeatedLeadingAndTrailingChars(c1, c2)

			def RemoveTheseLeadingAndTrailingCharsQ(c1, c2)
				This.RemoveTheseLeadingAndTrailingChars(c1, c2)
				return This

	def TheseRepeatedLeadingAndTrailingCharsRemoved(c1, c2)
		cResult = This.Copy().RemoveTheseRepeatedLeadingAndTrailingCharsQ(c1, c2).Content()
		return cResult

		def TheseLeadingAndRepeatedCharsRemoved(c1, c2)
			return This.TheseRepeatedLeadingAndTrailingCharsRemoved(c1, c2)

		def TheseLeadingAndTrailingCharsRemoved(c1, c2)
			return This.TheseRepeatedLeadingAndTrailingCharsRemoved(c1, c2)
	
	  #-----------------------------#
	 #   REPLACING LEADING CHARS   #
	#-----------------------------#

	def ReplaceRepeatedLeadingCharsCS(cNewSubStr, pCaseSensitive)
		#< @MotherFunction = This.ReplaceSection() > @QtBased = TRUE #>

		/* Example:

		StzStringQ("aaaAAAH RING!").
		ReplaceRepeatedLeadingCharsCS( :With = "O", :CS = TRUE)
		--> Gives: "OOOAAAH RING!"

		StzStringQ("aaaAVAR").
		ReplaceRepeatedLeadingCharsCS( :With = "O", :CS = FALSE)
		--> Gives: "OOOOOOH RING!"

		*/

		if isList(cNewSubStr) and StzListQ(cNewSubStr).IsWithOrByNamedParam()
			cNewSubStr = cNewSubStr[2]
		ok

		n = This.NumberOfRepeatedLeadingCharsCS(pCaseSensitive)

		if n > 0
			This.ReplaceSection(
				1, n,
				StzStringQ(cNewSubStr).RepeatedNTimes(n)
			)
		ok

		#< @FunctionFluentForm


		def ReplaceRepeatedLeadingCharsCSQ(cNewSubStr, pCaseSensitive)
			This.ReplaceRepeatedLeadingCharsCS(cNewSubStr, pCaseSensitive)
			return This

		#>

		#< @FunctionAlternativeForms

		def ReplaceLeadingCharsCS(cNewSubStr, pCaseSensitive)
			This.ReplaceRepeatedLeadingCharsCS(cNewSubStr, pCaseSensitive)

			def ReplaceLeadingCharsCSQ(cNewSubStr, pCaseSensitive)
				This.ReplaceLeadingCharsCS(cNewSubStr, pCaseSensitive)
				return This

		def ReplaceLeadingRepeatedCharsCS(cNewSubStr, pCaseSensitive)
			This.ReplaceRepeatedLeadingCharsCS(cNewSubStr, pCaseSensitive)

			def ReplaceLeadingRepeatedCharsCSQ(cNewSubStr, pCaseSensitive)
				This.ReplaceLeadingRepeatedCharsCS(cNewSubStr, pCaseSensitive)
				return This
		#>

	def RepeatedLeadingCharsReplacedCS(cNewSubStr, pCaseSensitive)
		cResult = This.
			  Copy().
			  ReplaceRepeatedLeadingCharsCSQ(cNewSubStr, pCaseSensitive).
			  Content()

		return cResult

		def LeadingCharsReplacedCS(cNewSubStr, pCaseSensitive)
			return This.RepeatedLeadingCharsReplacedCS(cNewSubStr, pCaseSensitive)

		def LeadingRepeatedCharsReplacedCS(cNewSubStr, pCaseSensitive)
			return This.RepeatedLeadingCharsReplacedCS(cNewSubStr, pCaseSensitive)

	#---

	def ReplaceRepeatedLeadingChars(cNewSubStr)

		This.ReplaceRepeatedLeadingCharsCS(cNewSubStr, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def ReplaceRepeatedLeadingCharsQ(cNewSubStr)
			This.ReplaceRepeatedLeadingChars(cNewSubStr)
			return This

		#>

		#< @FunctionAlternativeForms

		def ReplaceLeadingChars(cNewSubStr)
			This.ReplaceRepeatedLeadingChars(cNewSubStr)

			def ReplaceLeadingCharsQ(cNewSubStr)
				This.ReplaceLeadingChars(cNewSubStr)
				return This

		def ReplaceLeadingRepeatedChars(cNewSubStr)
			This.ReplaceRepeatedLeadingChars(cNewSubStr)

			def ReplaceLeadingRepeatedCharsQ(cNewSubStr)
				This.ReplaceLeadingRepeatedChars(cNewSubStr)
				return This
		#>

	def RepeatedLeadingCharsReplaced(cNewSubStr)
		cResult = This.
			  Copy().
			  ReplaceRepeatedLeadingCharsQ(cNewSubStr).
			  Content()

		return cResult

		def LeadingCharsReplaced(cNewSubStr)
			return This.RepeatedLeadingCharsReplaced(cNewSubStr)

		def LeadingRepeatedCharsReplaced(cNewSubStr)
			return This.RepeatedLeadingCharsReplaced(cNewSubStr)

	  #------------------------------#
	 #   REPLACING TRAILING CHARS   #
	#------------------------------#

	def ReplaceRepeatedTrailingCharsCS(cNewSubStr, pCaseSensitive)
		#< @MotherFunction = This.ReplaceSection() > @QtBased = TRUE #>

		/* Example:

		StzStringQ("RINGaaaAAA").
		ReplaceRepeatedTrailingCharsCS( :With = "O", :CS = TRUE)
		--> Gives: "RINGaaaOOO"

		StzStringQ("RINGaaaAAA").
		ReplaceRepeatedTrailingCharsCS( :With = "O", :CS = FALSE)
		--> Gives: "RINGOOOOOO"

		*/

		if isList(cNewSubStr) and StzListQ(cNewSubStr).IsWithOrByNamedParam()
			cNewSubStr = cNewSubStr[2]
		ok

		n = This.NumberOfRepeatedTrailingCharsCS(pCaseSensitive)

		if n > 0
			nStart = This.NumberOfChars() - n + 1
			This.ReplaceSection(
				nStart, This.NumberOfChars(),
				StzStringQ(cNewSubStr).RepeatedNTimes(n)
			)
		ok

		#< @FunctionFluentForm


		def ReplaceRepeatedTrailingCharsCSQ(cNewSubStr, pCaseSensitive)
			This.ReplaceRepeatedTrailingCharsCS(cNewSubStr, pCaseSensitive)
			return This

		#>

		#< @FunctionAlternativeForms

		def ReplaceTrailingCharsCS(cNewSubStr, pCaseSensitive)
			This.ReplaceRepeatedTrailingCharsCS(cNewSubStr, pCaseSensitive)

			def ReplaceTrailingCharsCSQ(cNewSubStr, pCaseSensitive)
				This.ReplaceTrailingCharsCS(cNewSubStr, pCaseSensitive)
				return This

		def ReplaceTrailingRepeatedCharsCS(cNewSubStr, pCaseSensitive)
			This.ReplaceRepeatedTrailingCharsCS(cNewSubStr, pCaseSensitive)

			def ReplaceTrailingRepeatedCharsCSQ(cNewSubStr, pCaseSensitive)
				This.ReplaceTrailingRepeatedCharsCS(cNewSubStr, pCaseSensitive)
				return This
		#>

	def RepeatedTrailingCharsReplacedCS(cNewSubStr, pCaseSensitive)
		cResult = This.
			  Copy().
			  ReplaceRepeatedTrailingCharsCSQ(cNewSubStr, pCaseSensitive).
			  Content()

		return cResult

		def TrailingCharsReplacedCS(cNewSubStr, pCaseSensitive)
			return This.RepeatedTrailingCharsReplacedCS(cNewSubStr, pCaseSensitive)

		def TrailingRepeatedCharsReplacedCS(cNewSubStr, pCaseSensitive)
			return This.RepeatedTrailingCharsReplacedCS(cNewSubStr, pCaseSensitive)

	#---

	def ReplaceRepeatedTrailingChars(cNewSubStr)

		This.ReplaceRepeatedTrailingCharsCS(cNewSubStr, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def ReplaceRepeatedTrailingCharsQ(cNewSubStr)
			This.ReplaceRepeatedTrailingChars(cNewSubStr)
			return This

		#>

		#< @FunctionAlternativeForms

		def ReplaceTrailingChars(cNewSubStr)
			This.ReplaceRepeatedTrailingChars(cNewSubStr)

			def ReplaceTrailingCharsQ(cNewSubStr)
				This.ReplaceTrailingChars(cNewSubStr)
				return This

		def ReplaceTrailingRepeatedChars(cNewSubStr)
			This.ReplaceRepeatedTrailingChars(cNewSubStr)

			def ReplaceTrailingRepeatedCharsQ(cNewSubStr)
				This.ReplaceTrailingRepeatedChars(cNewSubStr)
				return This
		#>

	def RepeatedTrailingCharsReplaced(cNewSubStr)
		cResult = This.
			  Copy().
			  ReplaceRepeatedTrailingCharsQ(cNewSubStr).
			  Content()

		return cResult

		def TrailingCharsReplaced(cNewSubStr)
			return This.RepeatedTrailingCharsReplaced(cNewSubStr)

		def TrailingRepeatedCharsReplaced(cNewSubStr)
			return This.RepeatedTrailingCharsReplaced(cNewSubStr)

	  #---------------------------------------------------#
	 #   REPLACING REPEATED LEADING AND TRAILING CHARS   #
	#---------------------------------------------------#
	
	def ReplaceRepeatedLeadingAndTrailingCharsCS(cNewSubStr, pCaseSensitive)
		This.ReplaceRepeatedLeadingCharsCS(cNewSubStr, pCaseSensitive)
		This.ReplaceRepeatedTrailingCharsCS(cNewSubStr, pCaseSensitive)

		#< @FunctionFluentForm

		def ReplaceRepeatedLeadingAndTrailingCharsCSQ(cNewSubStr, pCaseSensitive)
			This.ReplaceRepeatedLeadingAndTrailingCharsCS(cNewSubStr, pCaseSensitive)
			return This

		#>

		#< @FunctionAlternativeForms

		def ReplaceRepeatedTrailingAndLeadingCharsCS(cNewSubStr, pCaseSensitive)
			This.ReplaceRepeatedLeadingAndTrailingCharsCS(cNewSubStr, pCaseSensitive)

			def ReplaceRepeatedTrailingAndLeadingCharsCSQ(cNewSubStr, pCaseSensitive)
				This.ReplaceRepeatedTrailingAndLeadingCharsCS(cNewSubStr, pCaseSensitive)
				return This

		def ReplaceLeadingAndTrailingCharsCS(cNewSubStr, pCaseSensitive)
			This.ReplaceRepeatedLeadingAndTrailingCharsCS(cNewSubStr, pCaseSensitive)

			def ReplaceLeadingAndTrailingCharsCSQ(cNewSubStr, pCaseSensitive)
				This.ReplaceLeadingAndTrailingCharsCS(cNewSubStr, pCaseSensitive)
				return This

		def ReplaceTrailingAndLeadingCharsCS(cNewSubStr, pCaseSensitive)
			This.ReplaceRepeatedTrailingAndLeadingCharsCS(cNewSubStr, pCaseSensitive)

			def ReplaceTrailingAndLeadingCharsCSQ(cNewSubStr, pCaseSensitive)
				This.ReplaceTrailingAndLeadingCharsCS(cNewSubStr, pCaseSensitive)
				return This

		def ReplaceLeadingAndTrailingRepeatedCharsCS(cNewSubStr, pCaseSensitive)
			This.ReplaceRepeatedLeadingAndTrailingCharsCS(cNewSubStr, pCaseSensitive)

			def ReplaceLeadingAndTrailingRepeatedCharsCSQ(cNewSubStr, pCaseSensitive)
				This.ReplaceLeadingAndTrailingRepeatedCharsCS(cNewSubStr, pCaseSensitive)
				return This

		def ReplaceTrailingAndLeadingRepeatedCharsCS(cNewSubStr, pCaseSensitive)
			This.ReplaceRepeatedTrailingAndLeadingCharsCS(cNewSubStr, pCaseSensitive)

			def ReplaceTrailingAndLeadingRepeatedCharsCSQ(cNewSubStr, pCaseSensitive)
				This.ReplaceTrailingAndLeadingRepeatedCharsCS(cNewSubStr, pCaseSensitive)
				return This
		#>

	def RepeatedLeadingAndTrailingCharsReplacedCS(cNewSubStr, pCaseSensitive)
		cResult = This.
			  Copy().
			  ReplaceRepeatedLeadingAndTrailingCharsCSQ(cNewSubStr, pCaseSensitive).
			  Content()

		return cResult

		def RepeatedTrailingAndLeadingCharsReplacedCS(cNewSubStr, pCaseSensitive)
			return This.RepeatedLeadingAndTrailingCharsReplacedCS(cNewSubStr, pCaseSensitive)

		def LeadingAndTrailingCharsReplacedCS(cNewSubStr, pCaseSensitive)
			return This.RepeatedLeadingAndTrailingCharsReplacedCS(cNewSubStr, pCaseSensitive)

		def TrailingAndLeadingCharsReplacedCS(cNewSubStr, pCaseSensitive)
			return This.RepeatedTrailingAndLeadingCharsReplacedCS(cNewSubStr, pCaseSensitive)

		def LeadingAndTrailingRepeatedCharsReplacedCS(cNewSubStr, pCaseSensitive)
			return This.RepeatedLeadingAndTrailingCharsReplacedCS(cNewSubStr, pCaseSensitive)

		def TrailingAndLeadingRepeatedCharsReplacedCS(cNewSubStr, pCaseSensitive)
			return This.RepeatedTrailingAndLeadingCharsReplacedCS(cNewSubStr, pCaseSensitive)

	#---

		def ReplaceRepeatedLeadingAndTrailingChars(cNewSubStr)
		This.ReplaceRepeatedLeadingChars(cNewSubStr)
		This.ReplaceRepeatedTrailingChars(cNewSubStr)

		#< @FunctionFluentForm

		def ReplaceRepeatedLeadingAndTrailingCharsQ(cNewSubStr)
			This.ReplaceRepeatedLeadingAndTrailingChars(cNewSubStr)
			return This

		#>

		#< @FunctionAlternativeForms

		def ReplaceRepeatedTrailingAndLeadingChars(cNewSubStr)
			This.ReplaceRepeatedLeadingAndTrailingChars(cNewSubStr)

			def ReplaceRepeatedTrailingAndLeadingCharsQ(cNewSubStr)
				This.ReplaceRepeatedTrailingAndLeadingChars(cNewSubStr)
				return This

		def ReplaceLeadingAndTrailingChars(cNewSubStr)
			This.ReplaceRepeatedLeadingAndTrailingChars(cNewSubStr)

			def ReplaceLeadingAndTrailingCharsQ(cNewSubStr)
				This.ReplaceLeadingAndTrailingChars(cNewSubStr)
				return This

		def ReplaceTrailingAndLeadingChars(cNewSubStr)
			This.ReplaceRepeatedTrailingAndLeadingChars(cNewSubStr)

			def ReplaceTrailingAndLeadingCharsQ(cNewSubStr)
				This.ReplaceTrailingAndLeadingChars(cNewSubStr)
				return This

		def ReplaceLeadingAndTrailingRepeatedChars(cNewSubStr)
			This.ReplaceRepeatedLeadingAndTrailingChars(cNewSubStr)

			def ReplaceLeadingAndTrailingRepeatedCharsQ(cNewSubStr)
				This.ReplaceLeadingAndTrailingRepeatedChars(cNewSubStr)
				return This

		def ReplaceTrailingAndLeadingRepeatedChars(cNewSubStr)
			This.ReplaceRepeatedTrailingAndLeadingChars(cNewSubStr)

			def ReplaceTrailingAndLeadingRepeatedCharsQ(cNewSubStr)
				This.ReplaceTrailingAndLeadingRepeatedChars(cNewSubStr)
				return This
		#>

	def RepeatedLeadingAndTrailingCharsReplaced(cNewSubStr)
		cResult = This.
			  Copy().
			  ReplaceRepeatedLeadingAndTrailingCharsQ(cNewSubStr).
			  Content()

		return cResult

		def RepeatedTrailingAndLeadingCharsReplaced(cNewSubStr)
			return This.RepeatedLeadingAndTrailingCharsReplaced(cNewSubStr)

		def LeadingAndTrailingCharsReplaced(cNewSubStr)
			return This.RepeatedLeadingAndTrailingCharsReplaced(cNewSubStr)

		def TrailingAndLeadingCharsReplaced(cNewSubStr)
			return This.RepeatedTrailingAndLeadingCharsReplaced(cNewSubStr)

		def LeadingAndTrailingRepeatedCharsReplaced(cNewSubStr)
			return This.RepeatedLeadingAndTrailingCharsReplaced(cNewSubStr)

		def TrailingAndLeadingRepeatedCharsReplaced(cNewSubStr)
			return This.RepeatedTrailingAndLeadingCharsReplaced(cNewSubStr)

	  #---------------------------------------------#
	 #   REPLACING A GIVEN REPEATED LEADING CHAR   #
	#---------------------------------------------#

	def ReplaceThisRepeatedLeadingCharCS(c, cNewSubStr, pCaseSensitive)
		#< @MotherFunction = This.ReplaceSection() > @QtBased = TRUE #>

		if isList(cNewSubStr) and StzListQ(cNewSubStr).IsWithOrByNamedParam()
			cNewSubStr = cNewSubStr[2]
		ok

		if This.RepeatedLeadingCharQ().IsEqualToCS(c, pCaseSensitive)
			This.ReplaceRepeatedLeadingCharsCS(cNewSubStr, pCaseSensitive)
		ok

		#< @FunctionFluentForm


		def ReplaceThisRepeatedLeadingCharCSQ(c, cNewSubStr, pCaseSensitive)
			This.ReplaceThisRepeatedLeadingCharCS(c, cNewSubStr, pCaseSensitive)
			return This

		#>

		#< @FunctionAlternativeForms

		def ReplaceThisLeadingCharCS(c, cNewSubStr, pCaseSensitive)
			This.ReplaceThisRepeatedLeadingCharCS(c, cNewSubStr, pCaseSensitive)

			def ReplaceThisLeadingCharCSQ(c, cNewSubStr, pCaseSensitive)
				This.ReplaceThisLeadingCharCS(c, cNewSubStr, pCaseSensitive)
				return This

		def ReplaceThisLeadingRepeatedCharCS(c, cNewSubStr, pCaseSensitive)
			This.ReplaceThisRepeatedLeadingCharCS(c, cNewSubStr, pCaseSensitive)

			def ReplaceThisLeadingRepeatedCharCSQ(c, cNewSubStr, pCaseSensitive)
				This.ReplaceThisLeadingRepeatedCharCS(c, cNewSubStr, pCaseSensitive)
				return This
		#>

	def ThisRepeatedLeadingCharReplacedCS(c, cNewSubStr, pCaseSensitive)
		cResult = This.
			  Copy().
			  ReplaceThisRepeatedLeadingCharCSQ(c, cNewSubStr, pCaseSensitive).
			  Content()

		return cResult

		def ThisLeadingCharReplacedCS(c, cNewSubStr, pCaseSensitive)
			return This.ThisRepeatedLeadingCharReplacedCS(c, cNewSubStr, pCaseSensitive)

		def ThisLeadingRepeatedCharReplacedCS(c, cNewSubStr, pCaseSensitive)
			return This.ThisRepeatedLeadingCharReplacedCS(c, cNewSubStr, pCaseSensitive)

	#---

	def ReplaceThisRepeatedLeadingChar(c, cNewSubStr)

		This.ReplaceThisRepeatedLeadingCharCS(c, cNewSubStr, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def ReplaceThisRepeatedLeadingCharQ(c, cNewSubStr)
			This.ReplaceThisRepeatedLeadingChar(c, cNewSubStr)
			return This

		#>

		#< @FunctionAlternativeForms

		def ReplaceThisLeadingChar(c, cNewSubStr)
			This.ReplaceThisRepeatedLeadingChar(c, cNewSubStr)

			def ReplaceThisLeadingCharQ(c, cNewSubStr)
				This.ReplaceThisLeadingChar(c, cNewSubStr)
				return This

		def ReplaceThisLeadingRepeatedChar(c, cNewSubStr)
			This.ReplaceThisRepeatedLeadingChar(c, cNewSubStr)

			def ReplaceThisLeadingRepeatedCharQ(c, cNewSubStr)
				This.ReplaceThisLeadingRepeatedChar(c, cNewSubStr)
				return This
		#>

	def ThisRepeatedLeadingCharReplaced(c, cNewSubStr)
		cResult = This.
			  Copy().
			  ReplaceThisRepeatedLeadingCharQ(c, cNewSubStr).
			  Content()

		return cResult

		def ThisLeadingCharReplaced(c, cNewSubStr)
			return This.ThisRepeatedLeadingCharReplaced(c, cNewSubStr)

		def ThisLeadingRepeatedCharReplaced(c, cNewSubStr)
			return This.ThisRepeatedLeadingCharReplaced(c, cNewSubStr)

	  #----------------------------------------------#
	 #   REPLACING A GIVEN REPEATED TRAILING CHAR   #
	#----------------------------------------------#

	def ReplaceThisRepeatedTrailingCharCS(c, cNewSubStr, pCaseSensitive)
		#< @MotherFunction = This.ReplaceSection() > @QtBased = TRUE #>

		if isList(cNewSubStr) and StzListQ(cNewSubStr).IsWithOrByNamedParam()
			cNewSubStr = cNewSubStr[2]
		ok

		if This.RepeatedTrailingCharQ().IsEqualToCS(c, pCaseSensitive)
			This.ReplaceRepeatedTrailingCharsCS(cNewSubStr, pCaseSensitive)
		ok

		#< @FunctionFluentForm


		def ReplaceThisRepeatedTrailingCharCSQ(c, cNewSubStr, pCaseSensitive)
			This.ReplaceThisRepeatedTrailingCharCS(c, cNewSubStr, pCaseSensitive)
			return This

		#>

		#< @FunctionAlternativeForms

		def ReplaceThisTrailingCharCS(c, cNewSubStr, pCaseSensitive)
			This.ReplaceThisRepeatedTrailingCharCS(c, cNewSubStr, pCaseSensitive)

			def ReplaceThisTrailingCharCSQ(c, cNewSubStr, pCaseSensitive)
				This.ReplaceThisTrailingCharCS(c, cNewSubStr, pCaseSensitive)
				return This

		def ReplaceThisTrailingRepeatedCharCS(c, cNewSubStr, pCaseSensitive)
			This.ReplaceThisRepeatedTrailingCharCS(c, cNewSubStr, pCaseSensitive)

			def ReplaceThisTrailingRepeatedCharCSQ(c, cNewSubStr, pCaseSensitive)
				This.ReplaceThisTrailingRepeatedCharCS(c, cNewSubStr, pCaseSensitive)
				return This
		#>

	def ThisRepeatedTrailingCharReplacedCS(c, cNewSubStr, pCaseSensitive)
		cResult = This.
			  Copy().
			  ReplaceThisRepeatedTrailingCharCSQ(c, cNewSubStr, pCaseSensitive).
			  Content()

		return cResult

		def ThisTrailingCharReplacedCS(c, cNewSubStr, pCaseSensitive)
			return This.ThisRepeatedTrailingCharReplacedCS(c, cNewSubStr, pCaseSensitive)

		def ThisTrailingRepeatedCharReplacedCS(c, cNewSubStr, pCaseSensitive)
			return This.ThisRepeatedTrailingCharReplacedCS(c, cNewSubStr, pCaseSensitive)

	#---

	def ReplaceThisRepeatedTrailingChar(c, cNewSubStr)

		This.ReplaceThisRepeatedTrailingCharCS(c, cNewSubStr, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def ReplaceThisRepeatedTrailingCharQ(c, cNewSubStr)
			This.ReplaceThisRepeatedTrailingChar(c, cNewSubStr)
			return This

		#>

		#< @FunctionAlternativeForms

		def ReplaceThisTrailingChar(c, cNewSubStr)
			This.ReplaceThisRepeatedTrailingChar(c, cNewSubStr)

			def ReplaceThisTrailingCharQ(c, cNewSubStr)
				This.ReplaceThisTrailingChar(c, cNewSubStr)
				return This

		def ReplaceThisTrailingRepeatedChar(c, cNewSubStr)
			This.ReplaceThisRepeatedTrailingChar(c, cNewSubStr)

			def ReplaceThisTrailingRepeatedCharQ(c, cNewSubStr)
				This.ReplaceThisTrailingRepeatedChar(c, cNewSubStr)
				return This
		#>

	def ThisRepeatedTrailingCharReplaced(c, cNewSubStr)
		cResult = This.
			  Copy().
			  ReplaceThisRepeatedTrailingCharQ(c, cNewSubStr).
			  Content()

		return cResult

		def ThisTrailingCharReplaced(c, cNewSubStr)
			return This.ThisRepeatedTrailingCharReplaced(c, cNewSubStr)

		def ThisTrailingRepeatedCharReplaced(c, cNewSubStr)
			return This.ThisRepeatedTrailingCharReplaced(c, cNewSubStr)

	  #---------------------------------------------------------#
	 #   REPLACING GIVEN REPEATED LEADING AND TRAILING CHARS   #
	#---------------------------------------------------------#

	def ReplaceTheseRepeatedLeadingAndTrailingCharsCS(c1, c2, cNewSubStr, pCaseSensitive)
	
		This.ReplaceThisRepeatedLeadingCharCS(c1, cNewSubStr, pCaseSensitive)
		This.ReplaceThisRepeatedTrailingCharCS(c2, cNewSubStr, pCaseSensitive)

		#< @FunctionFluentForm

		def ReplaceTheseRepeatedLeadingAndTrailingCharsCSQ(c1, c2, cNewSubStr, pCaseSensitive)
			This.ReplaceTheseRepeatedTrailingCharsCS(c1, c2, cNewSubStr, pCaseSensitive)
			return This

		#>

		#< @FunctionAlternativeForms

		def ReplaceTheseRepeatedTrailingAndLeadingCharsCS(c1, c2, cNewSubStr, pCaseSensitive)
			This.ReplaceTheseRepeatedLeadingAndTrailingCharsCS(c1, c2, cNewSubStr, pCaseSensitive)

			def ReplaceTheseRepeatedTrailingAndLeadingCharsCSQ(c1, c2, cNewSubStr, pCaseSensitive)
				This.ReplaceTheseRepeatedTrailingAndLeadingCharsCS(c1, c2, cNewSubStr, pCaseSensitive)
				return This

		def ReplaceTheseLeadingAndTrailingCharsCS(c1, c2, cNewSubStr, pCaseSensitive)
			This.ReplaceTheseRepeatedLeadingAndTrailingCharsCS(c1, c2, cNewSubStr, pCaseSensitive)

			def ReplaceTheseLeadingAndTrailingCharsCSQ(c1, c2, cNewSubStr, pCaseSensitive)
				This.ReplaceTheseLeadingAndTrailingCharsCS(c1, c2, cNewSubStr, pCaseSensitive)
				return This

		def ReplaceTheseTraingAndLeadingCharsCS(c1, c2, cNewSubStr, pCaseSensitive)
			This.ReplaceTheseRepeatedLeadingAndTrailingCharsCS(c1, c2, cNewSubStr, pCaseSensitive)

			def ReplaceTheseTraingAndLeadingCharsCSQ(c1, c2, cNewSubStr, pCaseSensitive)
				This.ReplaceTheseTraingAndLeadingCharsCS(c1, c2, cNewSubStr, pCaseSensitive)
				return This

		#>

	def TheseRepeatedLeadingAndTrailingCharsReplacedCS(c1, c2, cNewSubStr, pCaseSensitive)
		cResult = This.
			  Copy().
			  ReplaceTheseRepeatedLeadingAndTrailingCharsCSQ(c1, c2, cNewSubStr, pCaseSensitive).
			  Content()

		return cResult

		def TheseRepeatedTrailingAndLeadingCharsReplacedCS(c1, c2, cNewSubStr, pCaseSensitive)
			return This.TheseRepeatedLeadingAndTrailingCharsReplacedCS(c1, c2, cNewSubStr, pCaseSensitive)

		def TheseLeadingAndTrailingCharsReplacedCS(c1, c2, cNewSubStr, pCaseSensitive)
			return This.TheseRepeatedLeadingAndTrailingCharsReplacedCS(c1, c2, cNewSubStr, pCaseSensitive)

		def TheseTrailingAndLeadingCharsReplacedCS(c1, c2, cNewSubStr, pCaseSensitive)
			return This.TheseRepeatedLeadingAndTrailingCharsReplacedCS(c1, c2, cNewSubStr, pCaseSensitive)

	#---

	def ReplaceTheseRepeatedLeadingAndTrailingChars(c1, c2, cNewSubStr)
	
		This.ReplaceTheseRepeatedLeadingAndTrailingCharsCS(c1, c2, cNewSubStr, :CaseSensitive = TRUE)
	

		#< @FunctionFluentForm

		def ReplaceTheseRepeatedLeadingAndTrailingCharsQ(c1, c2, cNewSubStr)
			This.ReplaceTheseRepeatedTrailingChars(c1, c2, cNewSubStr)
			return This

		#>

		#< @FunctionAlternativeForms

		def ReplaceTheseRepeatedTrailingAndLeadingChars(c1, c2, cNewSubStr)
			This.ReplaceTheseRepeatedLeadingAndTrailingChars(c1, c2, cNewSubStr)

			def ReplaceTheseRepeatedTrailingAndLeadingCharsQ(c1, c2, cNewSubStr)
				This.ReplaceTheseRepeatedTrailingAndLeadingChars(c1, c2, cNewSubStr)
				return This

		def ReplaceTheseLeadingAndTrailingChars(c1, c2, cNewSubStr)
			This.ReplaceTheseRepeatedLeadingAndTrailingChars(c1, c2, cNewSubStr)

			def ReplaceTheseLeadingAndTrailingCharsQ(c1, c2, cNewSubStr)
				This.ReplaceTheseLeadingAndTrailingChars(c1, c2, cNewSubStr)
				return This

		def ReplaceTheseTraingAndLeadingChars(c1, c2, cNewSubStr)
			This.ReplaceTheseRepeatedLeadingAndTrailingChars(c1, c2, cNewSubStr)

			def ReplaceTheseTraingAndLeadingCharsQ(c1, c2, cNewSubStr)
				This.ReplaceTheseTraingAndLeadingChars(c1, c2, cNewSubStr)
				return This

		#>

	def TheseRepeatedLeadingAndTrailingCharsReplaced(c1, c2, cNewSubStr)
		cResult = This.
			  Copy().
			  ReplaceTheseRepeatedLeadingAndTrailingCharsQ(c1, c2, cNewSubStr).
			  Content()

		return cResult

		def TheseRepeatedTrailingAndLeadingCharsReplaced(c1, c2, cNewSubStr)
			return This.TheseRepeatedLeadingAndTrailingCharsReplaced(c1, c2, cNewSubStr)

		def TheseLeadingAndTrailingCharsReplaced(c1, c2, cNewSubStr)
			return This.TheseRepeatedLeadingAndTrailingCharsReplaced(c1, c2, cNewSubStr)

		def TheseTrailingAndLeadingCharsReplaced(c1, c2, cNewSubStr)
			return This.TheseRepeatedLeadingAndTrailingCharsReplaced(c1, c2, cNewSubStr)

	  #-------------------------------#
	 #     FORWARD TO END OF LINE    #
        #-------------------------------#

	def ForwardToEndOfLine(nStart)

		if isList(nStart) and len(nStart) = 2 and
		   nStart[1] = :StartingAt and isNumber(nStart[2])

			nStart = nStart[2]

		ok

		if nStart < 1 or nStart > This.NumberOfChars()
			return NULL
		ok

		bInside = TRUE
		cResult = ""
		i = nStart - 1

		while bInside
			i++
						 
			if i = This.NumberOfChars() or
			   This.CharAtQ(i).IsLineSeparator()
			   
				bInside = FALSE

			else
				cResult += This.NthChar(i)
			ok	
		end

		return cResult

		#< @FunctionFluentForm
	
		def ForwardToEndOfLineQ(nStart)
			return new stzString( This.ForwardToEndOfLine(nStart) )
	
		#>

	  #----------------------------------#
	 #     BACKWARD TO START OF LINE    #
        #----------------------------------#

	def BackwardToStartOfLine( nStart )

		/* Example:
	
			o1 = new stzString( "Mohammed Ali
				Ben Salah" )
			? o1.BackwardToStartOfLine( :StartingAt = 16 ) # --> Ben
			
		*/

		# Enabling the :StartingAt syntax

		if isList(nStart) and len(nStart) = 2 and
		   nStart[1] = :StartingAt and isNumber(nStart[2])

			nStart = nStart[2]

		ok

		# Checking the range of possible values for nStart param

		if nStart < 1 or nStart > This.NumberOfChars()
			return NULL
		ok

		# Computing the rest of the line

		bInside = TRUE
		cResult = ""
		i = nStart + 1

		while bInside
			i--
					 
			if i = 0 or This.CharAtQ(i).IsLineSeparator()

				bInside = FALSE
			
			else
				cResult += This.NthChar(i)
			ok
				
		end

		return StringReverse(cResult)

		#< @FunctionFluentForm

		def BackwardToStartOfLineQ( nStart )
			return new stzString( This.BackToStartOfLine( nStart ) )
	
		#>

	  #------------------------------------------------#
	 #   GETTING A SECTION (OR SLICE) OF THE STRING   #
	#------------------------------------------------#

	// Returns a subset of the string between n1 and n2 positions
	def Section(n1, n2)

		# Managing the use of :From and :To named params

		if isList(n1) and StzListQ(n1).IsFromNamedParam()
			n1 = n1[2]
		ok

		if isList(n2) and StzListQ(n2).IsToNamedParam()
			n2 = n2[2]
		ok

		# Managing the use of :NthToFirst named param

		if isList(n1) and Q(n1).IsOneOfTheseNamedParams([
					:NthToFirst, :NthToFirstChar ])

			n1 = n1[2] + 1
		ok

		if isList(n2) and Q(n2).IsOneOfTheseNamedParams([
					:NthToFirst, :NthToFirstChar ])

			n2 = n2[2] + 1
		ok

		# Managing the use of :NthToLast named param

		if isList(n1) and Q(n1).IsOneOfTheseNamedParams([
					:NthToLast, :NthToLastChar ])

			n1 = This.NumberOfChars() - n1[2]
		ok

		if isList(n2) and Q(n2).IsOneOfTheseNamedParams([
					:NthToLast, :NthToLastChar ])

			n2 = This.NumberOfChars() - n2[2]
		ok

		# Managing the case of :First and :Last keywords

		if isString(n1)
			if Q(n1).IsOneOfThese([ :First, :FirstChar ])
				n1 = 1

			but Q(n1).IsOneOfThese([ :Last, :LastChar ])
				n1 = This.NumberOfChars()

			but n1 = :@
				n1 = n2
			ok
		ok
	
		if isString(n2)
			if Q(n2).IsOneOfThese([ :Last, :LastChar, :EndOfString ])
				n2 = This.NumberOfChars()

			but Q(n2).IsOneOfThese([ :First, :FirstChar ])
				n2 = 1

			but n2 = :@
				n2 = n1
			ok
		ok

		if n1 = :@ and n2 = :@
			n1 = 1
			n2 = This.NumberOfChars()
		ok

		# If the params are not numbers, so find them and take their positions
		# EXAMPLE: ? Q("SOFTANZA").Section(:From = "F", :To = "A") #--> "FTA"

		if NOT isNumber(n1)
			n1 = This.FindFirst(n1)
		ok

		# Managing the case of :EndOfSentence, :EndOfLine, and :EndOfWord keywords

		if n1 > 0 and n2 = :EndOfSentence
			return This.ToStzText().ForwardToEndOfSentence( :StartingAt = n1 )
		ok

		if n1 > 0 and n2 = :EndOfLine
			return This.ForwardToEndOfLine( :StartingAt = n1 )
		ok

		if n1 > 0 and n2 = :EndOfWord # TODO: should move to stzText?
			return This.ToStzText().ForwardToEndOfWord( :StartingAt = n1 )
		ok

		if NOT isNumber(n2)
			n2 = This.FindFirst(n2)
		ok

		# Params must be numbers

		if NOT BothAreNumbers(n1, n2)
			stzRaise("Incorrect params! n1 and n2 must be numbers.")
		ok

		# Managing out of range params

		if NOT 	( Q(n1).IsBetween(1, this.NumberOfChars()) and
			  Q(n2).IsBetween(1, this.NumberOfChars())
			)
			
			return NULL
		ok
	
		# Finally, we're ready to extract the section...
		# NOTRE: when positions are given in inversed order
		# --> Reversing the section

		if n1 > n2
			return Q( @oQString.mid( (n2 - 1) , (n1 - n2 + 1) ) ).Reversed()

		else
			return @oQString.mid( (n1 - 1) , (n2 - n1 + 1) )
		ok

		#< @FunctionFluentForm

		def SectionQ(n1, n2)
			return new stzString( This.Section(n1, n2) )

		#>

		#< @FunctionAlternativeForm

		def Slice(n1, n2)
			return This.Section(n1, n2)

			#< @FunctionFluentForm

			def SliceQ(n1, n2)
				return This.SectionQ(n1, n2)

			#>
		#>	

	  #-----------------------------------#
	 #   GETTING A RANGE OF THE STRING   #
	#-----------------------------------#

	// Returns a subset of the string starting from nStart and ranging over nRange Chars
	def Range(nStartPos, nRange)
		
		if nRange = 0
			return NULL
		else
			return Section( nStartPos, nStartPos + nRange -1 )
		ok

		#< @FunctionFluentForm

		def RangeQ(nStartPos, nRange)
			return new stzString( This.Range(nStartPos, nRange) )
	
		#>

		#< @FunctionNamedParamForm

		def nmdRange(paParams)
			
			// Default values
			nStartPos = 1
			nRange = This.NumberOfChars()

			// Reading the params
			if StzListQ(paParams).IsRangeNamedParam()
				if isNumber(paParams[ :Start ])
					nStartPos = paParams[ :Start ]
				ok

				if isNumber(paParams[ :Range ])
					nRange = paParams[ :Range ]
				ok

				return This.Range(nStartPos, nRange)
			else
				stzRaise("Incorrect params!")
			ok

		#>

		#< @FunctionInfoForm

		def infRange()
			return [
				:Syntax = "Range(pnstart, pnRange)",
				:Description = "Returns pnRange chars starting at pnStart position",
				:ReturnType = "STRING",
				:NumberOfParams = 2,
				:Params = [
					[
						:Param = "pnStart",
						:Type = "NUMBER",
						:Description = "Start position",
						:Default = 1
					],
					[
						:Param = "pnRange",
						:Type = "NUMBER",
						:Description = "Number of chars of the range",
						:Default = This.NumberOfChars()
					]
				]
			]
		#>

		#< @FunctionDefaultForm

		def dftRange()
			return This.nmdRange([ :Start = 1, :Range = This.NumberOfChars() ])

		#>

		#< @FunctionExampleForm

		def expRange()
			return 	'StzStringQ("Ring programming language").Range(6, 11)' + NL +
				'--> "programming"'

		#>

		#< @FunctionRandomForm

		def rndRange()
			nStart = random( This.NumberOfChars() )
			nRange = random( This.NumberOfChars() - nStart )

			return 	'This.Range(' + nStart + ', ' + nRange + ')' + NL +
				'--> ' + This.Range(nStart, nRange)

		#>

		#< @FunctionTestForm

		def tstRange()
			nCases = This.tstRangeXT()[ :NumberOfTestCases ]
			nSucceeded = This.tstRangeXT()[ :NumberOfSuccessfulCases ]
			nFailed = This.tstRangeXT()[ :NumberOfFailedCases ]


			if nCases = 0
				return "Failed! (" + nFailed + "/" + nCases + ")"

			but nFailed = 0
				return "SUCCESS! (" + nSucceeded + "/" + nCases + ")"
			ok

			if nSucceeded != 0
				return "FAILED! (" + nFailed + "/" + nCases + ")"
			ok

		def tstRangeXT()
			aTestCases = [
			['StzStringQ("Ringorialand").Range(9, 4)' , 'land'],
			['StzStringQ("Ringorialand").Range(1, 4)' , 'Ring'],
			['StzStringQ("Ringorialand").Range(4, 6)' , 'gorial']
			]

			aSucceeded = []
			aFailed = []
			i = 0

			for aTest in aTestCases
				i++
				cCode = "cResult = " + aTest[1]

				try
					 eval(cCode)

					if cResult = aTest[2]
						aSucceeded + i
					else
						aFailed + i
					ok
				catch
					aFailed + i
				done
			next
			
			aResult = [
				:NumberOfTestCases = len(aTestCases),
				:NumberOfSuccessfulCases = len(aSucceeded),
				:NumberOfFailedCases = len(aFailed),

				:SuccessfulCases = aSucceeded,
				:FailedCases = aFailed,

				:TestCases = aTestCases
			]

			return aResult

		#>

	  #---------------------------------------#
	 #   GETIING MANY SECTIONS (OR SLICES)   #
	#---------------------------------------#

	def Sections(paSections)
		if isString(paSections) or
			(isList(paSections) and
				(Q(paSections).IsOfNamedParam() or
					Q(paSections).IsOfSubStringNamedParam()
				)
			)

			return This.FindSections(paSections)
		ok

		if NOT 	( isList(paSections) and
				Q(paSections).IsListOfPairsOfNumbers()
			)

			stzRaise("Incorrect param! paSections must be a list of pairs of numbers.")
		ok

		aResult = []

		for aSection in paSections
			aResult + This.Section( aSection[1], aSection[2] )
		next

		return aResult

		#< @FunctionFluentForm

		def SectionsQ(paSections)
			return This.SectionsQR(paSections, pcReturnType)

		def SectionsQR(paSections, pcReturnType)
			if NOT isString(pcReturnType)
				StzRaise("Incorrect param type! pcReturnType must be a string.")
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.Sections(paSections) )

			on :stzListOfStrings
				return new stzListOfStrings( This.Sections(paSections) )

			other
				stzRaise("Unsupported return type!")
			off

		#>

		#< @FunctionAlternativeForms

		def ManySections(paSections)
			return This.Sections(paSections)

			def ManySectionsQ(paSections)
				return This.SectionsQ(paSections)
	
			def ManySectionsQR(paSections, pcReturnType)
				return This.SectionsQR(paSections, pcReturnType)

		def Slices(paSections)
			return This.Sections(paSections)

			def SlicesQ(paSections)
				return This.SectionsQ(paSections)
	
			def SlicesQR(paSections, pcReturnType)
				return This.SectionsQR(paSections, pcReturnType)

		def ManySlices(paSections)
			return This.Sections(paSections)

			def ManySlicesQ(paSections)
				return This.SectionsQ(paSections)
	
			def ManySlicesQR(paSections, pcReturnType)
				return This.SectionsQR(paSections, pcReturnType)

		#>

	  #--------------------------------------------------#
	 #   GETIING MANY SECTIONS (OR SLICES) -- EXTENDED  #
	#--------------------------------------------------#

	def SectionsXT(paSections)

		aResult = []

		for aSection in paSections
			cSection = This.Section( aSection[1], aSection[2] )
			aResult + [ cSection, aSection ]
		next

		return aResult

		#< @FunctionFluentForm

		def SectionsXTQ(paSections)
			return This.SectionsXTQR(paSections, pcReturnType)

		def SectionsXTQR(paSections, pcReturnType)
			if NOT isString(pcReturnType)
				StzRaise("Incorrect param type! pcReturnType must be a string.")
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.SectionsXT(paSections) )

			on :stzListOfStrings
				return new stzListOfStrings( This.SectionsXT(paSections) )

			other
				stzRaise("Unsupported return type!")
			off

		#>

		#< @FunctionAlternativeForms

		def ManySectionsXT(paSections)
			return This.SectionsXT(paSections)

			def ManySectionsXTQ(paSections)
				return This.SectionsXTQ(paSections)
	
			def ManySectionsXTQR(paSections, pcReturnType)
				return This.SectionsXTQR(paSections, pcReturnType)

		def SlicesXT(paSections)
			return This.SectionsXT(paSections)

			def SlicesXTQ(paSections)
				return This.SectionsXTQ(paSections)
	
			def SlicesXTQR(paSections, pcReturnType)
				return This.SectionsXTQR(paSections, pcReturnType)

		def ManySlicesXT(paSections)
			return This.SectionsXT(paSections)

			def ManySlicesXTQ(paSections)
				return This.SectionsXTQ(paSections)
	
			def ManySlicesXTQR(paSections, pcReturnType)
				return This.SectionsXTQR(paSections, pcReturnType)

		#>

	  #----------------------------------------------------------#
	 #   FINDING THE ANTI-SECTIONS OF A GIVEN SET OF SECTIONS   #
	#----------------------------------------------------------#

	def NumberOfAntiSections(paSections)
		return len( This.FindAntiSections(paSections) )

	def FindAntiSections(paSections)

		aResult = StzListQ( 1 : This.NumberOfChars() ).
				FindAntiSectionsQ(paSections).
				Content()

		return aResult

		#< @FunctionFluentForm

		def FindAntiSectionsQ(paSections)
			return This.FindAntiSectionsQR(paSections, :stzList)

		def FindAntiSectionsQR(paSections, pcReturnType)
			if NOT isString(pcReturnType)
				StzRaise("Incorrect param type! pcReturnType must be a string.")
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.FindAntiSections(paSections) )

			on :stzListOfLists
				return new stzListOfLists( This.FindAntiSections(paSections) )

			on :stzListOfPairs
				return new stzListOfPairs( This.FindAntiSections(paSections) )

			other
				StzRaise("Unsupported return type!")
			off

		#>

	  #----------------------------------------------------------------------#
	 #   FINDING THE ANTI-SECTIONS OF A GIVEN SET OF SECTIONS -- EXTENDED   #
	#----------------------------------------------------------------------#

	def FindAntiSectionsXT(paSections)
		aAntiSections = This.FindAntiSections(paSections)

		aResult = []
		for aSection in aAntiSections
			aResult + [ aSection, This.Section(aSection[1], aSection[2]) ]
		next

		return aResult

	  #----------------------------------------------------------#
	 #   GETIING THE ANTI-SECTIONS OF A GIVEN SET OF SECTIONS   #
	#----------------------------------------------------------#

	def AntiSections(paSections)
		/* EXAMPLE
		o1 = new stzList("ABCDEFGHIJ")
		? o1.AntiSections( :Of = [ [3,5], [7,8] ])
		#--> [ "AB", "F", "IJ" ]
		*/

		aAntiSections = This.FindAntiSections(paSections)
		aResult = This.Sections( aAntiSections )

		return aResult

		#< @FunctionFluentForm

		def AntiSectionsQ(paSections)
			return This.AntiSectionsQR(paSections, pcReturnType)

		def AntiSectionsQR(paSections, pcReturnType)
			if NOT isString(pcReturnType)
				StzRaise("Incorrect param type! pcReturnType must be a string.")
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.AntiSections(paSections) )

			on :stzListOfStrings
				return new stzListOfStrings( This.AntiSections(paSections) )

			other
				stzRaise("Unsupported return type!")
			off

		#>

		#< @FunctionAlternativeForms

		def SectionsOtherThan(paSections)
			return This.AntiSections(paSections)

			def SectionsOtherThanQ(paSections)
				return This.AntiSectionsQ(paSections)
	
			def SectionsOtherThanQR(paSections, pcReturnType)
				return This.AntiSectionsQR(paSections, pcReturnType)

		#>

	  #---------------------------------------------------------------------#
	 #   GETIING THE ANTI-SECTIONS OF A GIVEN SET OF SECTIONS -- EXTENDED  #
	#---------------------------------------------------------------------#

	def AntiSectionsXT(paSections)

		aAntiSections = This.FindAntiSections(paSections)
		aResult = This.SectionsXT( aAntiSections )

		return aResult

		#< @FunctionFluentForm

		def AntiSectionsXTQ(paSections)
			return This.AntiSectionsXTQR(paSections, pcReturnType)

		def AntiSectionsXTQR(paSections, pcReturnType)
			if NOT isString(pcReturnType)
				StzRaise("Incorrect param type! pcReturnType must be a string.")
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.AntiSectionsXT(paSections) )

			on :stzListOfStrings
				return new stzListOfStrings( This.AntiSectionsXT(paSections) )

			other
				stzRaise("Unsupported return type!")
			off

		#>

		#< @FunctionAlternativeForms

		def SectionsOtherThanXT(paSections)
			return This.AntiSectionsXT(paSections)

			def SectionsOtherThanXTQ(paSections)
				return This.AntiSectionsXTQ(paSections)
	
			def SectionsOtherThanXTQR(paSections, pcReturnType)
				return This.AntiSectionsXTQR(paSections, pcReturnType)

		#>

	  #---------------------------------------------------------#
	 #   GETIING NTH ANTI-SECTION OF A GIVEN SET OF SECTIONS   #
	#---------------------------------------------------------#

	def NthAntiSection(n, paSections)
		if n = :First or n = :FirstAntiSection
			n = 1
		but n = :Last or n = :LastAntiSection
			n = This.NumberOfAntiSections(paSections)
		ok

		return This.AntiSections(paSections)[n]

	def FirstAntiSection(paSections)
		return This.NthAntiSections(1, paSections)

	def LastAntiSection(paSections)
		return This.NthAntiSection(:Last, paSections)

	  #-------------------------------------------------------------------#
	 #   FINDING SECTIONS AND ANTI-SECTIONS OF A GIVEN SET OF SECTIONS   #
	#-------------------------------------------------------------------#

	def FindSectionsAndAntiSections(paSections)
		aResult = StzListQ( 1 : This.NumberOfChars() ).
				FindSectionsAndAntiSectionsQ(paSections).
				Content()

		return aResult

		#< @FunctionFluentForm

		def FindSectionsAndAntiSectionsQ(paSections)
			return This.FindSectionsAndAntiSectionsQR(paSections, :stzList)

		def FindSectionsAndAntiSectionsQR(paSections, pcReturnType)
			if NOT isString(pcReturnType)
				StzRaise("Incorrect param type! pcReturnType must be a string.")
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.FindSectionsAndAntiSections(paSections) )

			on :stzListOfLists
				return new stzListOfLists( This.FindSectionsAndAntiSections(paSections) )

			on :stzListOfPairs
				return new stzListOfPairs( This.FindSectionsAndAntiSections(paSections) )

			other
				StzRaise("Unsupported return type!")
			off

		#>

	  #-------------------------------------------------------------------#
	 #   GETTING SECTIONS AND ANTI-SECTIONS OF A GIVEN SET OF SECTIONS   #
	#-------------------------------------------------------------------#
		
	def SectionsAndAntiSections(paSections)
		aSectionsAntiSections = This.FindSectionsAndAntiSections(paSections)
		aResult = This.Sections( aSectionsAntiSections )

		return aResult

		#< @FunctionFluentForm

		def SectionsAndAntiSectionsQ(paSections)
			return This.SectionsAndAntiSectionsQR(paSections, pcReturnType)

		def SectionsAndAntiSectionsQR(paSections, pcReturnType)
			if NOT isString(pcReturnType)
				StzRaise("Incorrect param type! pcReturnType must be a string.")
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.SectionsAndAntiSections(paSections) )

			on :stzListOfStrings
				return new stzListOfStrings( This.SectionsAndAntiSections(paSections) )

			other
				stzRaise("Unsupported return type!")
			off

		#>

		#< @FunctionAlternativeForms

		def AllSectionsIncluding(paSections)
			return This.SectionsAndAntiSections(paSections)

			def AllSectionsIncludingQ(paSections)
				return This.SectionsAndAntiSectionsQ(paSections)
	
			def AllSectionsIncludingQR(paSections, pcReturnType)
				return This.SectionsAndAntiSectionsQR(paSections, pcReturnType)

		#>

	  #------------------------------------------------------------------------------#
	 #   GETTING SECTIONS AND ANTI-SECTIONS OF A GIVEN SET OF SECTIONS -- EXTENDED  #
	#------------------------------------------------------------------------------#
		
	def SectionsAndAntiSectionsXT(paSections)
		aSectionsAntiSections = This.FindSectionsAndAntiSections(paSections)

		aResult = []

		for aSection in aSectionsAntiSections
			aResult + [ This.Section(aSection[1], aSection[2]), aSection ]
		next

		return aResult

		#< @FunctionFluentForm

		def SectionsAndAntiSectionsXTQ(paSections)
			return This.SectionsAndAntiSectionsXTQR(paSections, pcReturnType)

		def SectionsAndAntiSectionsXTQR(paSections, pcReturnType)
			if NOT isString(pcReturnType)
				StzRaise("Incorrect param type! pcReturnType must be a string.")
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.SectionsAndAntiSectionsXT(paSections) )

			on :stzListOfStrings
				return new stzListOfStrings( This.SectionsAndAntiSectionsXT(paSections) )

			other
				stzRaise("Unsupported return type!")
			off

		#>

		#< @FunctionAlternativeForms

		def AllSectionsIncludingXT(paSections)
			return This.SectionsAndAntiSectionsXT(paSections)

			def AllSectionsIncludingXTQ(paSections)
				return This.SectionsAndAntiSectionsXTQ(paSections)
	
			def AllSectionsIncludingXTQR(paSections, pcReturnType)
				return This.SectionsAndAntiSectionsXTQR(paSections, pcReturnType)

		#>

	  #------------------------------------------------------------#
	 #   GENERATING ALL POSSIBLE SECTIONS BETWEEN TOW SUBSTRINGS  #
	#------------------------------------------------------------#

	def SectionsFromToCS(pcSubStr1, pcSubStr2, pCaseSensitive)
		/* EXAMPLE

		o1 = new stzString("TAYOUBTA")
		? o1.SectionsFromTo( :From = "T", :To = "A" )
		#--> [ "TA", "TAYOUBTA", "TA" ]

		*/

		if isList(pcSubStr1) and Q(pcSubStr1).IsFromNamedParam()
			pcSubStr1 = pcSubStr1[2]
		ok

		if isList(pcSubStr2) and Q(pcSubStr2).IsToNamedParam()
			pcSubStr2 = pcSubStr2[2]
		ok

		anSections = []

		anPos1 = This.FindAllCS(pcSubStr1, pCaseSensitive) #--> [ 1, 7 ]
		anPos2 = This.FindAllCS(pcSubStr2, pCaseSensitive) #--> [ 2, 8 ]

		for n1 in anPos1
			for n2 in anPos2
				if n1 < n2
					anSections + [ n1, n2 ]
				ok
			next
		next

		#--> [ [ 1, 2 ], [ 1, 8 ], [ 7, 8 ] ]

		acResult = This.Sections(anSections)
		return acResult

		def AllPossibleSectionsFromToCS(pcSubStr1, pcSubStr2, pCaseSensitive)
			return This.SectionsFromToCS(pcSubStr1, pcSubStr2, pCaseSensitive)

		def AllPossibleSectionsCS(pcSubStr1, pcSubStr2, pCaseSensitive)
			return This.SectionsFromToCS(pcSubStr1, pcSubStr2, pCaseSensitive)

		def PossibleSectionsFromToCS(pcSubStr1, pcSubStr2, pCaseSensitive)
			return This.SectionsFromToCS(pcSubStr1, pcSubStr2, pCaseSensitive)

		def PossibleSectionsCS(pcSubStr1, pcSubStr2, pCaseSensitive)
			return This.SectionsFromToCS(pcSubStr1, pcSubStr2, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def SectionsFromTo(pcSubStr1, pcSubStr2)
		return This.SectionsFromToCS(pcSubStr1, pcSubStr2, :CaseSensitive = TRUE)

		def AllPossibleSectionsFromTo(pcSubStr1, pcSubStr2, pCaseSensitive)
			return This.SectionsFromTo(pcSubStr1, pcSubStr2)

		def AllPossibleSections(pcSubStr1, pcSubStr2)
			return This.SectionsFromTo(pcSubStr1, pcSubStr2)

		def PossibleSectionsFromTo(pcSubStr1, pcSubStr2)
			return This.SectionsFromTo(pcSubStr1, pcSubStr2)

		def PossibleSections(pcSubStr1, pcSubStr2)
			return This.SectionsFromToCS(pcSubStr1, pcSubStr2)

	  #--------------------------------------#
	 #   GETTING MANY RANGES OF THE STRING  #
	#--------------------------------------#

	def Ranges(paRanges)
		aResult = []

		for aRange in paRanges
			aResult + This.Range( aRange[1], aRange[2] )
		next

		return aResult

		def ManyRanges(paSections)
			return This.Ranges(paRanges)

	  #--------------------------------------------------------#
	 #   GETIING THE ANTI-RANGES OF A GIVEN SET OF SECTIONS   #
	#--------------------------------------------------------#

	def AntiRanges(paRanges)
		aSections = RangesToSections(paRanges)
		aResult = This.AntiSections(aSections)

		return aResult

		def RangesOtherThan(paRanges)
			return This.AntiRanges()

	  #-------------------------------------------------------------#
	 #    INSERTING A SUBSTRING BEFORE OR AFTER A GIVEN POSITION   #
	#-------------------------------------------------------------#

	def Insert(pcSubStr, pWhere)
		if isList(pcSubStr) and Q(pcSubStr).IsStringOrSubStringNamedParam()
			pcSubStr = pcSubStr[2]
		ok

		if NOT isString(pcSubStr)
			stzRaise("Incorrect param type! pcSubStr must be a string.")
		ok

		if isList(pWhere)
			if Q(pWhere).IsOneOfTheseNamedParams([
				:At, :AtPosition, :Before, :BeforePosition ])

				This.InsertBefore(pWhere[2], pcSubStr)
				return

			but Q(pWhere).IsOneOfTheseNamedParams([ :After, :AfterPosition ])

				This.InsertAfter(pWhere[2], pcSubStr)
				return
			ok
		else
			This.InsertBefore(pWhere, pcSubStr)
		ok

		def InsertSubString(pcSubStr, pWhere)
			This.Insert(pcSubStr, pWhere)

	  #----------------------------------------------------#
	 #    INSERTING A SUBSTRING BEFORE A GIVEN POSITION   #
	#----------------------------------------------------#

	/* Inserts a substring:

	 	- in a given position inside the string
	 	  Note: in this case, if nPos > NumberOfChars()
		  --> string is extended with white spaces

		- or, before the occurrence of a given substring
	*/
	 
	def InsertBefore(nPos, pcSubStr)
		if isList(nPos) and Q(nPos).IsPositionNamedParam()
			nPos = nPos[2]
		ok

		if isList(nPos) and Q(nPos).IsListOfNumbers()
			This.InsertBeforeThesePositions(nPos, pcSubStr)
			return
		ok

		if isList(pcSubStr) and Q(pcSubStr).IsStringOrSubStringNamedParam()
			pcSubStr = pcSubStr[2]
		ok

		@oQString.insert(nPos-1, pcSubStr)

		# The string has changed, check constraints...
		//This.VerifyConstraints()

		#< @FunctionFluentForm
		
		def InsertBeforeQ(nPos, pcSubStr)
			This.InsertBefore(nPos, pcSubStr)
			return This

		#>

		#< @FunctionAlternativeForm

		def InsertBeforePosition(nPos, pcSubStr)
			This.InsertBefore(nPos, pcSubStr)

			def InsertBeforePositionQ(nPos, pcSubStr)
				This.InsertBeforePosition(nPos, pcSubStr)
				return This

		def InsertAt(nPos, pcSubStr)
			This.InsertBefore(nPos, pcSubStr)

			def InsertAtQ(nPos, pcSubStr)
				This.InsertAt(nPos, pcSubStr)

		def InsertAtPosition(nPos, pcSubStr)
			This.InsertBefore(nPos, pcSubStr)

			def InsertAtPosiitonQ(nPos, pcSubStr)
				This.InsertAt(nPos, pcSubStr)

		#>

	   #--------------------------------------------------------#
	  #    INSERTING A SUBSTRING BEFORE A POSITION DEFINED     #
	 #    BY A GIVEN CONDITION APPLIED ON THE STRING CHARS    #
	#--------------------------------------------------------#

	def InsertBeforeW(pcCondition, pcSubStr)
		anPositions = This.FindCharsW(pcCondition)
		This.InsertBeforeManyPositions( anPositions, pcSubStr )

		def InsertBeforeWQ(pcCondition, pcSubStr)
			This.InsertBeforeW(pcCondition, pcSubStr)
			return This

		def InsertAtW(pcCondition, pcSubStr)
			This.InsertBefore(pcCondition, pcSubStr)

			def InsertAtWQ(pcCondition, pcSubStr)
				This.InsertAtW(pcCondition, pcSubStr)
				return This

	  #----------------------------------------------------#
	 #    INSERTING A SUBSTRING AFTER A GIVEN POSITION    #
	#----------------------------------------------------#

	def InsertAfter(nPos, pcSubStr)
		@oQString.insert(nPos, pcSubStr)

		//VerifyConstraints()

		#< @FunctionFluentForm
		
		def InsertAfterQ(nPos, pcSubStr)
			This.InsertAfter(nPos, pcSubStr)
			return This

		#>

		#< @FunctionAlternativeForm

		def InsertAfterPosition(nPos, pcSubStr)
			This.InsertAfer(nPos, pcSubStr)

			def InsertAfterePositionQ(nPos, pcSubStr)
				This.InsertAfterPosition(nPos, pcSubStr)
				return This

		def InsertAfterCharAtPosition(nPos, pcSubStr)
			This.InsertAfter(nPos, pcSubStr)

			def InsertAfterCharAtPositionQ(nPos, pcSubStr)
				This.InsertAfterCharAtPosition(nPos, pcSubStr)
				return This

		#>

	  #---------------------------------------------------#
	 #    INSERTING A SUBSTRING (BEFORE) EVERY N CHARS   #
	#---------------------------------------------------#

	def InsertBeforeEveryNChars(n, pcSubStr)

		if NOT isNumber(n)
			stzRaise("Incorrect param! n must be a number.")
		ok

		if NOT isString(pcSubStr)
			stzRaise("Incorrect param! pcSubStr must be a string.")
		ok

		anPositions = []

		if n = 1
			anPositions = [ 1 ]

		else
		
			for i = 2 to This.NumberOfChars() step n
				anPositions + [ i - 1 ]
			next
		ok

		This.InsertBeforeThesePositions(anPositions, " ")

		def InsertBeforeEveryNCharsQ(n, pcSubStr)
			This.InsertBeforeEveryNChars(n, pcSubStr)
			return This

		def InsertEveryNChars(n, pcSubStr)
			This.InsertBeforeEveryNChars(n, pcSubStr)

			def InsertEveryNCharsQ(n, pcSubStr)
				This.InsertAfterEveryNChars(n, pcSubStr)
				return This
	
		def InsertSubStringEveryNChars(n, pcSubStr)
			This.InsertEveryNChars(n, pcSubStr)

			def InsertSubStringEveryNCharsQ(n, pcSubStr)
				This.InsertEveryNChars(n, pcSubStr)
				return This

	  #---------------------------------------------------#
	 #    INSERTING A SUBSTRING (AFTER) EVERY N CHARS    #
	#---------------------------------------------------#

	def InsertAfterEveryNChars(n, pcSubStr)

		if NOT isNumber(n)
			stzRaise("Incorrect param! n must be a number.")
		ok

		if NOT isString(pcSubStr)
			stzRaise("Incorrect param! pcSubStr must be a string.")
		ok

		anPositions = []

		if n > 1
			for i = 1 to This.NumberOfChars() - 1 step n
				anPositions + ( i + 1 )
			next
		ok

		This.InsertAfterThesePositions(anPositions, " ")

		def InsertAfterEveryNCharsQ(n, pcSubStr)
			This.InsertAfterEveryNChars(n, pcSubStr)
			return This

	   #--------------------------------------------------------#
	  #    INSERTING A SUBSTRING AFTER A POSITION DEFINED      #
	 #    BY A GIVEN CONDITION APPLIED ON THE STRING CHARS    #
	#--------------------------------------------------------#

	def InsertAfterW( pcCondition, pcSubStr )
		anPositions = This.FindCharsW(pcCondition)
		This.InsertAfterManyPositions( anPositions, pcSubStr )


		def InsertAfterWQ( pcCondition, pcSubStr )
			This.InsertAfterW( pcCondition, pcSubStr )
			return This

		def InsertAfterWhere( pcCondition, pcSubStr )
			This.InsertAfterW( pcCondition, pcSubStr )

			def InsertAfterWhereQ( pcCondition, pcSubStr )
				This.InsertAfterWhere( pcCondition, pcSubStr )
				return This

		def InserAfterEachCharW( pcCondition, pcSubStr )
			This.InsertAfterW( pcCondition, pcSubStr )

			def InserAfterEachCharWQ( pcCondition, pcSubStr )
				This.InserAfterEachCharW( pcCondition, pcSubStr )
				return This

	  #------------------------------------------------#
	 #   INSERTING A SUBSTRING AFTER MANY POSITIONS   #
	#------------------------------------------------#

	 def InsertAfterThesePositions(panPositions, pcSubStr)
		if NOT ( isList(panPositions) and Q(panPositions).IsListOfNumbers() )

			stzRaise("Incorrect param! paPositions must be a list of numbers.")
		ok

		if NOT isString(pcSubStr)
			stzRaise("Incorrect param! pcSubStr must be a string.")
		ok

		if NOT len(panPositions) = 0
			anPositions = StzListQ(panPositions).SortedInDescending()
	
			for n in anPositions
				This.InsertAfter(n, pcSubStr)
			next
		ok	

		def InsertAfterManyPositions(panPositions, pcSubstr)
			This.InsertAfterThesePositions(panPositions, pcSubStr)

	  #-------------------------------------------------#
	 #   INSERTING A SUBSTRING BEFORE MANY POSITIONS   #
	#-------------------------------------------------#

	 def InsertBeforeThesePositions(panPositions, pcSubStr)

		if NOT ( isList(panPositions) and Q(panPositions).IsListOfNumbers() )

			stzRaise("Incorrect param! panPositions must be a list of numbers.")
		ok

		if isList(pcSubStr) and Q(pcSubStr).IsStringOrSubStringNamedParam()
			pcSubStr = pcSubStr[2]
		ok

		anPositions = StzListOfNumbersQ(panPositions).SubstractFromEachQ(1).Content()
		This.InsertAfterThesePositions(anPositions, pcSubStr)

		def InsertBeforeManyPositions(panPositions, pcSubStr)
			This.InsertBeforeThesePositions(panPositions, pcSubStr)

	  #-------------------------------------#
	 #    INSERTING A LIST OF SUBSTRINGS   #
	#-------------------------------------#

	// Inserts many substrings in a given position of the main string
	// by concatenating them according to a specific format
	def InsertListOfSubstringsXT( nPos, aSubStr, paOptions)
		/*
		Example:
	
		o1 = new stzString("All our software versions must be updated!")
		# Defining the position of insertion
		nPosition = o1.PositionAfterSubstring("versions") + 1
			
		# Inserting the list of string using extended configuration
		? o1.InsertListOfSubstringsXT(
			nPosition, [ "V1", "V2", "V3", "V4", "V5" ],
			
			[
			:cInsertBeforOrAfter = :Before,
			:OpeningChar = "(",
			:ClosingChar = ")", 
		
			:MainSeparator = ",",
			:AddSpaceAfterSeparator = TRUE,
			
			:LastSeparator = "and",
			:AddLastToMainSeparator = TRUE,
			
			:SpaceOption = :optEnsureLeadingSpace + :optEnsureTrailingSpace
			])
	
		Gives :
		All our software versions (V1, V2, V3, V4, and V5) must be updated!
		*/
	
		# Setting the default options
			
		cInsertBeforeOrAfter = :Before
		cOpeningChar = "("
		cClosingChar = ")"
			
		cMainSeparator = ","
		bAddSpaceAfterSeparator = TRUE
					
		cLastSeparator = NULL
		bAddLastToMainSeparator = FALSE
			
		cSpaceOption = :EnsureLeadingSpace + :EnsureTrailingSpace
	
		# Verifying the syntax of the options provided
		if NOT ( len(paOptions) = 0 or
			 ( len(paOptions) = 1 and paOptions[1] = :Default) )
	
			aPossibleOptions = [ :InsertBeforeOrAfter, :OpeningChar, :ClosingChar, :MainSeparator,
				  :AddSpaceAfterSeparator, :LastSeparator, :AddLastToMainSeparator,
				  :SpaceOption ]
		
			oHash = new stzHashList(paOptions)
			aListOfProvidedOptions = oHash.Keys()
		
			oListOfProvidedOptions = new stzList(aListOfProvidedOptions)
		
			if NOT oListOfProvidedOptions.IsMadeOfSome(aPossibleOptions)
				stzRaise(stzStringError(:UnsupportedOptionsWhileInsertingListOfStrings))
			ok
		
			# If some options are provided then we take them
			# Note : if len(paOptions) = 0 or paOptions = [ :Default ] then we preserve
			# the default options already defined
				
			cInsertBeforeOrAfter = paOptions[ :InsertBeforeOrAfter ]	
			cOpeningChar = paOptions[ :OpeningChar ]
			cClosingChar = paOptions[ :ClosingChar ]
					
			cMainSeparator = paOptions[ :MainSeparator ]
			bAddSpaceAfterSeparator = paOptions[ :AddSpaceAfterSeparator ]
		
			cLastSeparator = paOptions[ :LastSeparator ]
			bAddLastToMainSeparator = paOptions[ :AddLastToMainSeparator ]
		
			cSpaceOption = paOptions[ :SpaceOption ]
		ok
	
		# At this level, all the options are defined
		# Beginning the substring construction but the opening char
	
		cSubStr = cOpeningChar
			
		# Checking the behavior of the first inserted substring in regard of adjacent left space
	
		if NOT cSpaceOption = :DoNothingForSpace
			if cSpaceOption = :EnsureLeadingSpace OR
			   cSpaceOption = :EnsureLeadingSpace + :EnsureTrailingSpace
	
				if nPos > 1 and This.NthChar(nPos - 1) != " "
					cSubStr = " " + cOpeningChar
				ok
			ok
		ok
	
		# Looping over the list of strings to concatenate them
		# depending on the logic defined by the options
	
		for i = 1 to len(aSubStr)
			# we add the string itslef
			cSubStr += aSubStr[i]
	
			# while we are not on the last item, or
			# we are on the last item but we are not asked
			# to use an alternative separator at the end
	
			if i < len(aSubStr) - 1 OR
			   (i = len(aSubStr)-1 and cLastSeparator = NULL)
	
				# Add the main separator after each string
				cSubStr += cMainSeparator
	
				# Add space after separator if required
				if bAddSpaceAfterSeparator = TRUE
						cSubstr += " "
				ok	
	
			# When reaching the last string, and an alternative
			# separator must be used (it's not null), we check
			# if we should use this last separator alone or
			# in addition to the main separator
	
			but i = len(aSubStr) - 1
	
				if bAddLastToMainSeparator = TRUE
					cSubStr += cMainSeparator
				ok
	
				if bAddSpaceAfterSeparator = TRUE
					cSubstr += " "
				ok
	
				if cLastSeparator != NULL
					cSubStr += cLastSeparator
				ok
	
				if bAddSpaceAfterSeparator = TRUE
					cSubstr += " "
				ok
			ok		
		next
	
		# Add the closing char to get the final substring
	
		cSubStr += cClosingChar
	
		# Checking the option of leaving the trailing space
	
		if cSpaceOption = :EnsureTrailingSpace OR
		   cSpaceOption = :EnsureLeadingSpace + :EnsureTrailingSpace
	
			cSubStr += " "
		ok
	
		if cInsertBeforeOrAfter = :After
			nPos++
		ok


		This.InsertBefore(nPos, cSubStr)
	
		#< @FunctionFluentForm
		
		def InsertListOfSubstringsXTQ( nPos, aSubStr, paOptions)
			This.InsertListOfSubstringsXT( nPos, aSubStr, paOptions)
			return This
		
		#>

	// Inserts many substrings in a given position of the main string
	def InsertListOfSubstrings(nPos, aSubStr)
		return This.InsertListOfSubstringsXT( nPos, aSubStr, [:Default] )

		#< @FunctionFluentForm

		def InsertListOfSubstringsQ(nPos, aSubStr)
			This.InsertListOfSubstrings(nPos, aSubStr)
			return This

		#>

		#< @FunctionAlternativeForm

		def InsertListOfSubstringsBeforePositions(nPos, aSubStr)
			This.InsertListOfSubstrings(nPos, aSubStr)

			def InsertListOfSubstringsBeforePositionsQ(nPos, aSubStr)
				This.InsertListOfSubstringsBeforePositions(nPos, aSubStr)
				return This

		#>
			
	   #-----------------------------------------------#
	  #    INSERTING A NEW SUBSTRING BEFORE NTH       #
	 #    OCCURRENCEOF AN EXISTANT SUBSTRING         #
	#-----------------------------------------------#

	def InsertBeforeNthOccurrence(n, pcSubStr, pcNewSubStr)
		This.InsertBeforePosition( This.FindNthOccurrence(n, pcSubStr), pcNewSubStr )

	def InsertBeforeFirstOccurrence(pcSubStr, pcNewSubStr)
		This.InsertBeforeNthOccurrence(1, pcSubStr, pcNewSubStr)

	def InsertBeforeLastOccurrence(pcSubStr, pcNewSubStr)
		This.InsertBeforeNthOccurrence(This.NumberOfOccurrence(pcSubStr), pcSubStr, pcNewSubStr)

	def InsertBeforeSubstring(pcSubStr, pcNewSubStr)

		nLenSubStr = Q(pcSubStr).NumberOfChars()
		anPos = StzListOfNumbersQ( This.FindAll(cSubStr) ).AddToEachQ(nLenSubStr).Content()
		aParts = This.SplitBeforePositions(anPos)
	
		cResult = StzPairOfListsQ( aParts, ListOfNTimes(len(aParts)-1, pcNewSubStr) ).AlternateQ().ToStzListOfStrings().Concatenate()
		
		This.Update( cResult )

		#< @FunctionAlternativeForms

		def InsertBeforeEachOccurrenceOfSubstring(pcSubStr, pcNewSubStr)
			This.InsertBeforeSubstring(pcSubStr, pcNewSubStr)

		def InsertBeforeEachOccurrence(pcSubStr, pcNewSubStr)
			This.InsertBeforeSubstring(pcSubStr, pcNewSubStr)

		#>

		#< @FunctionFluentForm

		def InsertBeforeSubstringQ(pcSubStr, pcNewSubStr)
			This.InsertBeforeSubstring(pcSubStr, pcNewSubStr)
			return This
	
		#>

	   #-----------------------------------------------#
	  #    INSERTING A NEW SUBSTRING AFTER NTH        #
	 #    OCCURRENCEOF AN EXISTANT SUBSTRING         #
	#-----------------------------------------------#

	def InsertAfterNthOccurrence(n, pcSubStr, pcNewSubStr)
		This.InsertAfterPosition( This.FindNthOccurrence(n, pcSubStr) )

	def InsertAfterFirstOccurrence(pcSubStr, pcNewSubStr)
		This.InsertAfterNthOccurrence(1, pcSubStr, pcNewSubStr)

	def InsertAfterLastOccurrence(pcSubStr, pcNewSubStr)
		This.InsertBeforeNthOccurrence(This.NumberOfChars(), pcSubStr, pcNewSubStr)

	def InsertAfterSubstring(pcSubStr, pcNewSubStr)
		acParts = This.Split(pcSubStr)
		cResult = ""

		for i = 1 to len(acParts)-1
			cResult += (acParts[i] + pcSubStr + pcNewSubStr)
		next

		This.Update( cResult + acParts[ len(acParts) ] )

		#< @FunctionFluentForm

		def InsertAfterSubstringQ(pcSubStr, pcNewSubStr)
			This.InsertAfterSubstring(pcSubStr, pcNewSubStr)
			return This	
	
		#>
	
	  #=================================================#
	 #     REPLACING ALL OCCURRENCES OF A SUBSTRING    #
	#=================================================#
	
	def ReplaceAllCS(pcSubStr, pcNewSubStr, pCaseSensitive)
		#< @MotherFunction = YES | @QtBased #>

		/* Example 1:
	
		StzStringQ( "Tunis is the holder of my memories. Tunis is my dream!") {
			ReplaceAllCS("tunis", "Regueb", :CS = FALSE )
			? Content()
		}
	
		--> "Regueb is the holder of my memories. Regueb is my dream!"
	
		Example 2:
	
		StzStringQ( "Tunis is the holder of my memories. Tunis is my dream!") {
			ReplaceAllCS("tunis", :EachChar = "*", :CS = FALSE )
			? Content()
		}
	
		--> "***** is the holder of my memories. ***** is my dream!"
		*/

		# Checking the correctness of pcSubStr param

		if NOT isString(pcSubstr)
			stzRaise("Incorrect param typs! pcSubstr must be a string.")
		ok

		# Checking the correctness of pcNewSubStr param

		bWellFormed = FALSE

		if isString(pcNewSubStr)
			bWellFormed = TRUE

		but isList(pcNewSubStr) and StzListQ(pcNewSubStr).IsWithOrByNamedParam()
			
			if isString(pcNewSubStr[2])
				bWellFormed = TRUE
				# Detecting the case where a conditonal value is provided
				# via the :With@ or :By@ keywords

				if Q(pcNewSubStr[1]).IsOneOfThese([ :With@, :By@ ])
					pcNewSubStr = pcNewSubStr[2]
	
					This.ReplaceSubStringCS@(pcSubStr, pcNewSubStr, pCaseSensitive)
					return
	
				else
					pcNewSubStr = pcNewSubStr[2]
				ok

			ok

		ok

		# Checking the correctness of pCaseSensitive param

		if isList(pCaseSensitive) and Q(pCaseSensitive).IsCaseSensitiveNamedParam()
			pCaseSensitive = pCaseSensitive[2]
			bWellFormed = TRUE

		else
			if isBoolean(pCaseSensitive)
				bWellFormed = TRUE
			ok
		ok

		if NOT bWellFormed
			stzRaise("Incorrect param types!")
		ok

		# Doing the job

		@oQString.replace_2(pcSubStr, pcNewSubStr, pCaseSensitive)

	
		#< @FunctionFluentForm
		
		def ReplaceAllCSQ(pcSubStr, pcNewSubStr, pCaseSensitive)
			This.ReplaceAllCS(pcSubStr, pcNewSubStr, pCaseSensitive)
			return This
		
		#>

		#< @FunctionAlternativeForms

		def ReplaceCS(pcSubStr, pcNewSubStr, pCaseSensitive)
			This.ReplaceAllCS(pcSubStr, pcNewSubStr, pCaseSensitive)

			def ReplaceCSQ(pcSubStr, pcNewSubStr, pCaseSensitive)
				This.ReplaceCS(pcSubStr, pcNewSubStr, pCaseSensitive)
				return This

		def ReplaceSubstringCS(pcSubStr, pcNewSubStr, pCaseSensitive)
			This.ReplaceAllCS(pcSubStr, pcNewSubStr, pCaseSensitive)

			def ReplaceSubstringCSQ(pcSubStr, pcNewSubStr, pCaseSensitive)
				This.ReplaceSubstringCS(pcSubStr, pcNewSubStr, pCaseSensitive)
				return This

		def ReplaceAllOccurrencesCS(pcSubStr, pcNewSubStr, pCaseSensitive)
			if isList(pcSubStr) and Q(pcSubStr).IsOfNamedParam()
				pcSubStr = pcSubStr[2]
			ok

			This.ReplaceAllCS(pcSubStr, pcNewSubStr, pCaseSensitive)

			def ReplaceAllOccurrencesCSQ(pcSubStr, pcNewSubStr, pCaseSensitive)
				This.ReplaceAllOccurrencesCS(pcSubStr, pcNewSubStr, pCaseSensitive)
				return This

		def ReplaceAllOccurrencesOfSubstringCS(pcSubStr, pcNewSubStr, pCaseSensitive)
			This.ReplaceAllCS(pcSubStr, pcNewSubStr, pCaseSensitive)

			def ReplaceAllOccurrencesOfSubstringCSQ(pcSubStr, pcNewSubStr, pCaseSensitive)
				This.ReplaceAllOccurrencesOfSubstringCS(pcSubStr, pcNewSubStr, pCaseSensitive)
				return This		
		
		#>

	#---

	def ReplaceAll(pcSubStr, pcNewSubStr)
		This.ReplaceAllCS(pcSubStr, pcNewSubStr, :CaseSensitive = TRUE)
		
		def ReplaceAllQ(pcSubStr, pcNewSubStr)
			This.ReplaceAll(pcSubStr, pcNewSubStr)
			return This

		def Replace(pcSubStr, pcNewSubStr)
			This.ReplaceAll(pcSubStr, pcNewSubStr)

			def ReplaceQ(pcSubStr, pcNewSubStr)
				This.Replace(pcSubStr, pcNewSubStr)
				return This

		def ReplaceSubstring(pcSubStr, pcNewSubStr)
			This.ReplaceAll(pcSubStr, pcNewSubStr)

			def ReplaceSubstringQ(pcSubStr, pcNewSubStr)
				This.ReplaceSubstring(pcSubStr, pcNewSubStr)
				return This

		def ReplaceAllOccurrences(pcSubStr, pcNewSubStr)
			if isList(pcSubStr) and Q(pcSubStr).IsOfNamedParam()
				pcSubStr = pcSubStr[2]
			ok

			This.ReplaceAllCS(pcSubStr, pcNewSubStr)

			def ReplaceAllOccurrencesQ(pcSubStr, pcNewSubStr)
				This.ReplaceAllOccurrences(pcSubStr, pcNewSubStr)
				return This

		def ReplaceAllOccurrencesOfSubstring(pcSubStr, pcNewSubStr)
			This.ReplaceAll(pcSubStr, pcNewSubStr)

			def ReplaceAllOccurrencesOfSubstringQ(pcSubStr, pcNewSubStr)
				This.ReplaceAllOccurrencesOfSubstringCS(pcSubStr, pcNewSubStr)
				return This		
		
		#>

	  #-------------------------------------------#
	 #     REPLACING MANY SUBSTRINGS AT ONCE     #
	#-------------------------------------------#

	def ReplaceManyCS(pacSubstr, pNewSubstr, pCaseSensitive)
		/* Example 1:
	
		o1 = new stzString( "a + b - c / d = 0")
		 o1.ReplaceManyCS( ["+", "-", "=", "/" ], "*", :CaseSensitive = FALSE )
		 ? o1.Content()
	
		--> Gives: "a * b * c * d = 0"
	
		Example 2:
	
		o1 = new stzString( "Tunis is my town. Tunisa is my nation!")
		o1.ReplaceManyCS( [ "Tunis", "Tunisia" ], :EachChar = "*" )
		? o1.Content()
	
		*/

		for str in pacSubstr
			This.ReplaceAllCS( str, pNewSubStr, pCaseSensitive )
		next
	
		#< @FunctionFluentForm
	
		def ReplaceManyCSQ(pacSubstr, pNewSubstr, pCaseSensitive)
			This.ReplaceManyCS(pacSubstr, pNewSubstr, pCaseSensitive)
			return This
		
		#>

		def ReplaceAllOfTheseCS(pacSubstr, pNewSubstr, pCaseSensitive)
			This.ReplaceManyCS(pacSubstr, pNewSubstr, pCaseSensitive)

			def ReplaceAllOfTheseCSQ(pacSubstr, pNewSubstr, pCaseSensitive)
				This.ReplaceAllOfTheseCS(pacSubstr, pNewSubstr, pCaseSensitive)
				return This

		def ReplaceManySubstringsCS(pacSubstr, pNewSubstr, pCaseSensitive)
			This.ReplaceManyCS(pacSubstr, pNewSubstr, pCaseSensitive)

			def ReplaceManySubstringsCSQ(pacSubstr, pNewSubstr, pCaseSensitive)
				This.ReplaceManySubstringsCS(pacSubstr, pNewSubstr, pCaseSensitive)
				return This
		#>

	def ManySubstringsReplacedCS(pacSubstr, pNewSubstr, pCaseSensitive)
		acResult = This.Copy().ReplaceManySubstringsCSQ(pacSubstr, pNewSubstr, pCaseSensitive).Content()
		return acResult

		def ManyReplacedCS(pacSubstr, pNewSubstr, pCaseSensitive)
			return This.ManySubstringsReplacedCS(pacSubstr, pNewSubstr, pCaseSensitive)

	#---

	def ReplaceMany(pacSubstr, pcNewSubstr)
		This.ReplaceManyCS( pacSubstr, pcNewSubstr, :CaseSensitive = TRUE )

		#< @FunctionFluentFormn

		def ReplaceManyQ(pacSubStr, pcNewSubStr)
			This.ReplaceMany(pacSubstr, pcNewSubstr)
			return This
		#>

		#< @FunctionAlternativeForm
	
		def ReplaceAllOfThese(pacSubStr, pcNewSubStr)
			This.ReplaceMany(pacSubstr, pcNewSubstr)

			def ReplaceAllOfTheseQ(pacSubStr, pcNewSubStr)
				This.ReplaceAllOfThese(pacSubStr, pcNewSubStr)
				return This

		def ReplaceManySubstrings(pacSubstr, pNewSubstr)
			This.ReplaceMany(pacSubstr, pNewSubstr)

			def ReplaceManySubstringsQ(pacSubstr, pNewSubstr)
				This.ReplaceManySubstrings(pacSubstr, pNewSubstr)
				return This

		#>

	def ManySubstringsReplaced(pacSubstr, pNewSubstr)
		acResult = This.Copy().ReplaceManySubstringsQ(pacSubstr, pNewSubstr).Content()
		return acResult

		def ManyReplaced(pacSubstr, pNewSubstr)
			return This.ManySubstringsReplaced(pacSubstr, pNewSubstr)

	  #--------------------------------------------#
	 #  REPLACING A SUBSTRING BY MANY SUBSTRINGS  #
	#--------------------------------------------#

	def ReplaceByManyCS(pcSubStr, pacNewSubStrings, pCaseSensitive)

		/* EXAMPLE

		o1 = new stzString("ring php ruby ring python ring")
		o1.ReplaceByMany("ring", :By = [ "♥", "♥♥", "♥♥♥" ])
	
		? o1.Content() #--> "♥ php ruby ♥♥ python ♥♥♥"

		*/

		if isList(pacNewSubStrings) and Q(pacNewSubStrings).IsWithOrByNamedParam()
			pacNewSubStrings = pacNewSubStrings[2]
		ok

		if NOT Q(pacNewSubStrings).IsListOfStrings()
			stzRaise("Incorrect param! pacNewSubStrings must be a list of strings.")
		ok

		anPositions = This.FindCS(pcSubStr, pCaseSensitive)
		nMin = Min( len(anPositions), len(pacNewSubStrings) )
	
		for i = nMin to 1 step -1
			n = anPositions[i]
			cNewSubStr = pacNewSubStrings[i]
			This.ReplaceSubStringAtPositionNCS(n, pcSubStr, cNewSubStr, pCaseSensitive)
		next

	#-- WITHOUT CASESENSITIVITY

	def ReplaceByMany(pcSubStr, pacNewSubStrings)
		This.ReplaceByManyCS(pcSubStr, pacNewSubStrings, :CaseSensitive = TRUE)

	  #--------------------------------------------------------------------------#
	 #  REPLACING A SUBSTRING BY MANY SUBSTRINGS -- EXTENDED (RETURN TO FIRST)  #
	#--------------------------------------------------------------------------#

	def ReplaceByManyCSXT(pcSubStr, pacNewSubStrings, pCaseSensitive)

		/* EXAMPLE

		o1 = new stzString("ring php ring ruby ring python ring")
		o1.ReplaceByManyXT("ring", :By = [ "#1", "#2" ])

		? o1.Content() #--> "#1 php #2 ruby #1 python #2"

		*/

		if isList(pacNewSubStrings) and Q(pacNewSubStrings).IsWithOrByNamedParam()
			pacNewSubStrings = pacNewSubStrings[2]
		ok

		if NOT Q(pacNewSubStrings).IsListOfStrings()
			stzRaise("Incorrect param! pacNewSubStrings must be a list of strings.")
		ok

		anPositions = This.FindCSQ(pcSubStr, pCaseSensitive).SortedInDescending()
		acNewSubStrings = StzListQ(pacNewSubStrings).SortedInDescending()
		
		i = 0
		for n in anPositions
			i++
			if i > len(acNewSubStrings)
				i = 1
			ok

			cNewSubStr = acNewSubStrings[i]
			This.ReplaceSubStringAtPositionNCS(n, pcSubStr, cNewSubStr, pCaseSensitive)
			
		next

	#-- WITHOUT CASESENSITIVITY

	def ReplaceByManyXT(pcSubStr, pacNewSubStrings)
		This.ReplaceByManyCSXT(pcSubStr, pacNewSubStrings, :CaseSensitive = TRUE)

	  #------------------------------------------------------#
	 #  REPLACING MANY SUBSTRINGS BY MANY OTHER SUBSTRINGS  #
	#------------------------------------------------------#

	def ReplaceManyByManyCS(pacSubStrings, pacNewSubStrings, pCaseSensitive)
		/* EXAMPLE

		o1 = new stzString("ring qt softanza pyhton kandaji csharp ring")
		o1.ReplaceManyByMany([ "ring", "softanza", "kandaji" ], :By = [ "♥", "♥♥", "♥♥♥" ])

		? o1.Content() #--> "♥ qt ♥♥ pyhton ♥♥♥ csharp ♥"
		*/

		if isList(pacNewSubStrings) and Q(pacNewSubStrings).IsWithOrByNamedParam()
			pacNewSubStrings = pacNewSubStrings[2]
		ok

		if NOT Q(pacNewSubStrings).IsListOfStrings()
			stzRaise("Incorrect param! pacNewSubStrings must be a list of strings.")
		ok	

		i = 0
		for cSubStr in pacSubStrings
			cNewSubStr = NULL
			i++
			if i <= len(pacNewSubStrings)
				cNewSubStr = pacNewSubStrings[i]
			ok

			if cNewSubStr != NULL
				This.ReplaceCS(cSubStr, cNewSubStr, pCaseSensitive)
			ok

		next

	#-- WITHOUT CASESENSITIVITY

	def ReplaceManyByMany(pacSubStrings, pacNewSubStrings)
		This.ReplaceManyByManyCS(pacSubStrings, pacNewSubStrings, :CaseSensitive = TRUE)

	  #-------------------------------------------------------------------#
	 #  REPLACING SOME OCCURRENCES OF A SUBSTRING BY AN OTHER SUBSTRING  #
	#-------------------------------------------------------------------#

	def ReplaceOccurrencesCS(panOccurrences, pcSubStr, pcNewSubStr, pCaseSensitive)
		/* EXAMPLE

		o1 = new stzString("ring php ring ruby ring python ring csharp ring")
		o1.ReplaceOccurrences([ 1, 5], "ring", :By = "♥♥♥")
	
		? o1.Content() #--> "♥♥♥ php ring ruby ring python ring csharp ♥♥♥"
		*/

		anAllPositions = This.FindAllCS(pcSubStr, pCaseSensitive)

		anPositions = []

		for n in panOccurrences
			anPositions + anAllPositions[n]
		next

		anPositions = StzListQ(anPositions).SortedInDescending()

		for n in anPositions
			This.ReplaceSubStringAtPositionNCS(n, pcSubStr, pcNewSubStr, pCaseSensitive)
		next

		#< @FuntionFluentForm

		def ReplaceOccurrencesCSQ(panOccurrences, pcSubStr, pcNewSubStr, pCaseSensitive)
			This.ReplaceOccurrencesCS(panOccurrences, pcSubStr, pcNewSubStr, pCaseSensitive)
			return This
		#>

		#< @FunctionAlternativeForms

		def ReplaceSomeOccurrencesCS(panOccurrences, pcSubStr, pcNewSubStr, pCaseSensitive)
			This.ReplaceOccurrencesCS(panOccurrences, pcSubStr, pcNewSubStr, pCaseSensitive)

		def ReplaceOccurrrencesOfSubStringCS(panOccurrences, pcSubStr, pcNewSubStr, pCaseSensitive)
			This.ReplaceOccurrencesCS(panOccurrences, pcSubStr, pcNewSubStr, pCaseSensitive)

		def ReplaceSomeOccurrencesOfSubStringCS(panOccurrences, pcSubStr, pcNewSubStr, pCaseSensitive)
			This.ReplaceOccurrencesCS(panOccurrences, pcSubStr, pcNewSubStr, pCaseSensitive)

		def ReplaceSomeCS(panOccurrences, pcSubStr, pcNewSubStr, pCaseSensitive)
			This.ReplaceOccurrencesCS(panOccurrences, pcSubStr, pcNewSubStr, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def ReplaceOccurrences(panOccurrencess, pcSubStr, pcNewSubStr)
		This.ReplaceSomeOccurrencesCS(panOccurrencess, pcSubStr, pcNewSubStr, :CaseSensitive = TRUE)

		#< @FuntionFluentForm

		def ReplaceOccurrencesQ(panOccurrences, pcSubStr, pcNewSubStr)
			This.ReplaceOccurrences(panOccurrences, pcSubStr, pcNewSubStr)
			return This
		#>

		#< @FunctionAlternativeForms

		def ReplaceSomeOccurrences(panOccurrences, pcSubStr, pcNewSubStr)
			This.ReplaceOccurrences(panOccurrences, pcSubStr, pcNewSubStr)

		def ReplaceOccurrrencesOfSubString(panOccurrences, pcSubStr, pcNewSubStr)
			This.ReplaceOccurrences(panOccurrences, pcSubStr, pcNewSubStr)

		def ReplaceSomeOccurrencesOfSubString(panOccurrences, pcSubStr, pcNewSubStr)
			This.ReplaceOccurrences(panOccurrences, pcSubStr, pcNewSubStr)

		def ReplaceSome(panOccurrences, pcSubStr, pcNewSubStr)
			This.ReplaceOccurrences(panOccurrences, pcSubStr, pcNewSubStr)

		#>

	  #----------------------------------------------------------------------#
	 #  REPLACING SOME OCCURRENCES OF A SUBSTRING BY MANY OTHER SUBSTRINGS  #
	#----------------------------------------------------------------------#

	def ReplaceOccurrencesByManyCS(panOccurrences, pcSubStr, pacNewSubStrings, pCaseSensitive)
		/* EXAMPLE

		o1 = new stzString("ring php ring ruby ring python ring csharp ring")
		o1.ReplaceOccurrencesByMany([ 1, 3, 5], "ring", :By = [ "#1", "#3", "#5" ])
	
		? o1.Content() #--> "#1 php ring ruby #3 python ring csharp #5"
		*/

		if isList(pacNewSubStrings) and Q(pacNewSubStrings).IsWithOrByNamedParam()
			pacNewSubStrings = pacNewSubStrings[2]
		ok

		if NOT Q(pacNewSubStrings).IsListOfStrings()
			stzRaise("Incorrect param! pacNewSubStrings must be a list of strings.")
		ok	

		nMin = Min( len(panOccurrences), len(pacNewSubStrings) )
		anOccurrences = StzListQ(panOccurrences).SortedInDescending()
		acNewSubStrings = StzListQ(pacNewSubStrings).SortedInDescending()

		for i = 1 to nMin
			n = anOccurrences[i]
			cNewSubStr = acNewSubStrings[i]

			This.ReplaceNthOccurrenceCS(n, pcSubStr, cNewSubStr, pCaseSensitive)
			
		next

		#< @FuntionFluentForm

		def ReplaceOccurrencesByManyCSQ(panOccurrences, pcSubStr, pacNewSubStrings, pCaseSensitive)
			This.ReplaceOccurrencesByManyCS(panOccurrences, pcSubStr, pacNewSubStrings, pCaseSensitive)
			return This
		#>

		#< @FunctionAlternativeForms

		def ReplaceSomeOccurrencesByMznyCS(panOccurrences, pcSubStr, pacNewSubStrings, pCaseSensitive)
			This.ReplaceOccurrencesByManyCS(panOccurrences, pcSubStr, pacNewSubStrings, pCaseSensitive)

		def ReplaceOccurrrencesOfSubStringByManyCS(panOccurrences, pcSubStr, pacNewSubStrings, pCaseSensitive)
			This.ReplaceOccurrencesByManyCS(panOccurrences, pcSubStr, pacNewSubStrings, pCaseSensitive)

		def ReplaceSomeOccurrencesOfSubStringByManyCS(panOccurrences, pcSubStr, pacNewSubStrings, pCaseSensitive)
			This.ReplaceOccurrencesByManyCS(panOccurrences, pcSubStr, pacNewSubStrings, pCaseSensitive)

		def ReplaceSomeByManyCS(panOccurrences, pcSubStr, pacNewSubStrings, pCaseSensitive)
			This.ReplaceOccurrencesByManyCS(panOccurrences, pcSubStr, pacNewSubStrings, pCaseSensitive)

		#>
			
	#-- WITHOUT CASESENSITIVITY

	def ReplaceOcuurencesByMany(panOccurrences, pcSubStr, pacNewSubStrings)
		This.ReplaceOccurrencedByManyCS(panOccurrences, pcSubStr, pacNewSubStrings, :CaseSensitive = TRUE)

		#< @FuntionFluentForm

		def ReplaceOccurrencesByManyQ(panOccurrences, pcSubStr, pacNewSubStrings)
			This.ReplaceOccurrencesByMany(panOccurrences, pcSubStr, pacNewSubStrings)
			return This
		#>

		#< @FunctionAlternativeForms

		def ReplaceSomeOccurrencesByMzny(panOccurrences, pcSubStr, pacNewSubStrings)
			This.ReplaceOccurrencesByMany(panOccurrences, pcSubStr, pacNewSubStrings)

		def ReplaceOccurrrencesOfSubStringByMany(panOccurrences, pcSubStr, pacNewSubStrings)
			This.ReplaceOccurrencesByMany(panOccurrences, pcSubStr, pacNewSubStrings)

		def ReplaceSomeOccurrencesOfSubStringByMany(panOccurrences, pcSubStr, pacNewSubStrings)
			This.ReplaceOccurrencesByMany(panOccurrences, pcSubStr, pacNewSubStrings)

		def ReplaceSomeByMany(panOccurrences, pcSubStr, pacNewSubStrings)
			This.ReplaceOccurrencesByMany(panOccurrences, pcSubStr, pacNewSubStrings)

		#>

	  #------------------------------------------#
	 #     REPLACING SUBSTRING AT POSITION N    #
	#------------------------------------------#

	def ReplaceSubStringAtPositionNCS(n, pcSubStr, pcNewSubStr, pCaseSensitive)
		nLen = StzStringQ(pcSubStr).NumberOfChars()

		if This.RangeQ(n, nLen ).IsEqualToCS(pcSubStr, pCaseSensitive)
			This.ReplaceRange(n, nLen, pcNewSubStr)
		ok

		def ReplaceSubStringAtPositionNCSQ(n, pcSubStr, pcNewSubStr, pCaseSensitive)
			This.ReplaceSubStringAtPositionNCS(n, pcSubStr, pcNewSubStr, pCaseSensitive)
			return This

		def ReplaceSubStringAtPositionCS(n, pcSubStr, pcNewSubStr, pCaseSensitive)
			This.ReplaceSubStringAtPositionNCS(n, pcSubStr, pcNewSubStr, pCaseSensitive)

			def ReplaceSubStringAtPositionCSQ(n, pcSubStr, pcNewSubStr, pCaseSensitive)
				This.ReplaceSubStringAtPositionCS(n, pcSubStr, pcNewSubStr, pCaseSensitive)
				return This

	def SubStringAtPositionNReplacedCS(n, pcSubStr, pcNewSubStr, pCaseSensitive)
		cResult = This.Copy().ReplaceSubStringAtPositionNCSQ(n, pcSubStr, pcNewSubStr, pCaseSensitive)
		return cResult

		def SubStringAtPositionReplacedCS(n, pcSubStr, pcNewSubStr, pCaseSensitive)
			return This.SubStringAtPositionNReplacedCS(n, pcSubStr, pcNewSubStr, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def ReplaceSubStringAtPositionN(n, pcSubStr, pcNewSubStr)
		This.ReplaceSubStringAtPositionNCS(n, pcSubStr, pcNewSubStr, :CaseSensitive = TRUE)

		def ReplaceSubStringAtPositionNQ(n, pcSubStr, pcNewSubStr)
			This.ReplaceSubStringAtPositionN(n, pcSubStr, pcNewSubStr)
			return This

		def ReplaceSubStringAtPosition(n, pcSubStr, pcNewSubStr)
			This.ReplaceSubStringAtPositionN(n, pcSubStr, pcNewSubStr)

			def ReplaceSubStringAtPositionQ(n, pcSubStr, pcNewSubStr)
				This.ReplaceSubStringAtPosition(n, pcSubStr, pcNewSubStr)
				return This

	def SubStringAtPositionNReplaced(n, pcSubStr, pcNewSubStr)
		cResult = This.Copy().ReplaceSubStringAtPositionNQ(n, pcSubStr, pcNewSubStr)
		return cResult

	  #----------------------------------------------------------------------------#
	 #   REPALCING A SUBSTRING AT A SOME GIVEN POSITIONS BY AN OTHER SUBSTRING    #
	#----------------------------------------------------------------------------#

	def ReplaceSubStringAtPositionsCS(panPositions, pcSubStr, pcNewSubStr, pCaseSensitive)

		/* EXAMPLE
		o1 = new stzString("ring ruby ring php ring")
		o1.ReplaceSubstringAtPositions([ 1, 20], "ring", :By = "♥♥♥")

		? o1.Content() #--> "♥♥♥ ruby ring php ♥♥♥"
		*/

		anPositions = StzListQ(panPositions).SortedInDescending()

		for n in anPositions
			This.ReplaceSubStringAtPositionNCS(n, pcSubStr, pcNewSubStr, pCaseSensitive)
		next

	#-- WITHOUT CASESENSITIVITY

	def ReplaceSubStringAtPositions(panPositions, pcSubStr, pcNewSubStr)
		This.ReplaceSubStringAtPositionsCS(panPositions, pcSubStr, pcNewSubStr, :CaseSensitive = TRUE)

	  #-------------------------------------------------------------------------------#
	 #   REPALCING A SUBSTRING AT A SOME GIVEN POSITIONS BY MANY OTHER SUBSTRINGS    #
	#-------------------------------------------------------------------------------#

	def ReplaceSubStringAtPositionsByManyCS(panPositions, pcSubStr, pacNewSubStrings, pCaseSensitive)

		/* EXAMPLE
		o1 = new stzString("ring php ring ruby ring python ring csharp ring")
		o1.ReplaceSubstringAtPositionsByMany([ 10, 20, 32], "ring", :By = [ "♥", "♥♥", "♥♥♥" ])

		? o1.Content() #--> "ring php ♥ ruby ♥♥ python ♥♥♥ csharp ring"
		*/

		if isList(pacNewSubStrings) and Q(pacNewSubStrings).IsWithOrByNamedParam()
			pacNewSubStrings = pacNewSubStrings[2]
		ok

		if NOT (isList(pacNewSubStrings) and Q(pacNewSubStrings).IsListOfStrings() )
			stzRaise("Incorrect param! pacNewSubStrings must be a list of strings.")
		ok	

		# Keeping only the adequate number of positsions and new substrings
		# --> Avoids incorrect results when the number of provided positions is
		#     different from the number of provided new substrings

		nMin = Min( len(panPositions), len(pacNewSubStrings) )

		anPositions 	= Q(panPositions).SectionQ(1, nMin).SortedInDescending()
		acNewSubStrings	= Q(pacNewSubStrings).SectionQ(1, nMin).SortedInDescending()

		# Doing the job

		for i = 1 to nMin
			n = anPositions[i]
			cNewSubStr = acNewSubStrings[i]

			This.ReplaceSubStringAtPositionNCS(n, pcSubStr, cNewSubStr, pCaseSensitive)
		next

		def ReplaceSubStringAtPositionsByManyCSQ(panPositions, pcSubStr, pacNewSubStrings, pCaseSensitive)
			This.ReplaceSubStringAtPositionsByManyCS(panPositions, pcSubStr, pacNewSubStrings, pCaseSensitive)
			return This

	def SubStringAtThesePositionsReplacedByManyCS(panPositions, pcSubStr, pacNewSubStrings, pCaseSensitive)
		cResult = This.Copy().ReplaceSubStringAtPositionsByManyCSQ(panPositions, pcSubStr, pacNewSubStrings, pCaseSensitive).Content()
		return cResult

	#-- WITHOUT CASESENSITIVITY

	def ReplaceSubStringAtPositionsByMany(panPositions, pcSubStr, pacNewSubStrings)
		This.ReplaceSubStringAtPositionsByManyCS(panPositions, pcSubStr, pacNewSubStrings, :CaseSensitive = TRUE)

		def ReplaceSubStringAtPositionsByManyQ(panPositions, pcSubStr, pacNewSubStrings)
			This.ReplaceSubStringAtPositionsByMany(panPositions, pcSubStr, pacNewSubStrings)
			return This

	def SubStringAtThesePositionsReplacedByMany(panPositions, pcSubStr, pacNewSubStrings)
		cResult = This.Copy().ReplaceSubStringAtPositionsByManyQ(panPositions, pcSubStr, pacNewSubStrings).Content()
		return cResult

	  #----------------------------------------------------------------------#
	 #   REPLACING A SUBSTRING WITH A DYNAMIC VALUE (using With@ or :By@)   #
	#----------------------------------------------------------------------#

	def ReplaceSubStringCS@(pcSubStr, pcDynamicStr, pCaseSensitive)
		/* EXAMPLE

		o1 = new stzString("ring php ring ruby ring pyhton ring")
		o1.ReplaceSubString@( "ring", :By@ = '{ "#" + @Occurrence }' )

		? o1.Content() #--> "#1 php #2 ruby #3 pyhton #4"

		*/

		if isList(pcDynamicStr) and Q(pcDynamicStr).IsWithOrByNamedParam()
			pcDynamicStr = pcDynamicStr[2]
		ok

		if NOT isString(pcDynamicStr)
			stzRaise("Incorrect param! pacNewSubStrings must be a list of strings.")
		ok	

		anPositions = This.FindAllCSQ(pcSubStr, pCaseSensitive).SortedInDescending()


		@SubString = pcSubStr

		@NumberOfOccurrences = len(anPositions)
		@NumberOfOccurrence  = @NumberOfOccurrences
		@NumberOfSubStrings  = @NumberOfOccurrences
		@NumberOfSubStrings  = @NumberOfOccurrence

		i = 0
		@CurrentPosition = 0
		@PreviousPosition = 0
		@NextPosition = 0

		acNewSubStr = []

		for @Position in anPositions

			@CurrentPosition = @Position

			i++
			@Occurrence = i
			@CurrentOccurrence = i

			if i > 1
				@PreviousPosition = anPositions[i - 1]
				@PreviousOccurrence = i - 1
			ok

			if i < @NumberOfOccurrence
				@NextPosition = anPositions[i + 1]
				@NextOccurrence = i + 1
			ok
			
			cDynamicStr = StzStringQ(pcDynamicStr).
					SimplifyQ().
					RemoveBoundsQ("{", "}").
					Content()

			cCode = 'cTempStr = ( ' + cDynamicStr + ' )'
			eval(cCode)

			acNewSubStr + cTempStr

		next

		acNewSubStr = StzListQ(acNewSubStr).SortedInDescending()
	
		i = 0
		for @Position in anPositions
			i++
			cNewSubStr = acNewSubStr[i]
			This.ReplaceSubStringAtPositionNCS(@Position, pcSubStr, cNewSubStr, pCaseSensitive)
		next

		def ReplaceSubStringCS@Q(pcSubStr, pcDynamicStr, pCaseSensitive)
			This.ReplaceSubStringCS@(pcSubStr, pcDynamicStr, pCaseSensitive)
			return This

	#-- WITHOUT CASESENSITIVITY

	def ReplaceSubString@(pcSubStr, pcDynamicStr)
		This.ReplaceSubStringCS@(pcSubStr, pcDynamicStr, :CaseSensitive = TRUE)

		def ReplaceSubString@Q(pcSubStr, pcDynamicStr)
			This.ReplaceSubString@(pcSubStr, pcDynamicStr)
			return This

	  #---------------------------------------------------#
	 #   REPLACING A SUBSTRING UNDER A GIVEN CONDITION   #
	#---------------------------------------------------#

	def ReplaceSubStringWCS(pcSubStr, pcCondition, pcNewSubStr, pCaseSensitive)
		/* EXAMPLE

		o1 = new stzString("ring php ring ruby ring pyhton ring")
		o1.ReplaceSubStringW("ring", :Where = '{ Q(@Position).IsMultipleOf(10) }', :With = "♥♥♥")

		? o1.Content() #--> "ring php ♥♥♥ ruby ♥♥♥ pyhton ring"

		*/

		if isList(pcCondition) and Q(pcCondition).IsWhereNamedParam()
			pcCondition = pcCondition[2]
		ok

		if NOT isString(pcCondition)
			stzRaise("Incorrect param! pcCondition must be a string.")
		ok

		anPositions = This.FindAllCS(pcSubStr, pCaseSensitive)

		@SubString = pcSubStr

		@NumberOfOccurrences = ringlen(anPositions)
		@NumberOfOccurrence  = @NumberOfOccurrences
		@NumberOfSubStrings  = @NumberOfOccurrences
		@NumberOfSubStrings  = @NumberOfOccurrence

		i = 0
		@CurrentPosition = 0
		@PreviousPosition = 0
		@NextPosition = 0

		cCondition = StzStringQ(pcCondition).
				SimplifyQ().
				RemoveBoundsQ("{", "}").
				Content()

		anPositionsW = []


		i = 0
		for @Position in anPositions

			i++
			@CurrentPosition = @Position

			@Occurrence = i
			@CurrentOccurrence = i

			if i > 1
				@PreviousPosition = anPositions[i - 1]
				@PreviousOccurrence = i - 1
			ok

			if i < @NumberOfOccurrence
				@NextPosition = anPositions[i + 1]
				@NextOccurrence = i + 1
			ok

			cCode = "bOk = ( " + cCondition + " )"
			eval(cCode)

			if bOk
				anPositionsW + @Position
			ok

		next

		This.ReplaceSubStringAtPositionsCS(anPositionsW, pcSubStr, pcNewSubStr, pCaseSensitive)

		def ReplaceSubStringWCSQ(pcSubStr, pcCondition, pcNewSubStr, pCaseSensitive)
			This.ReplaceSubStringWCS(pcSubStr, pcCondition, pcNewSubStr, pCaseSensitive)
			return This

	#-- WITHOUT CASESENSITIVITY

	def ReplaceSubStringW(pcSubStr, pcCondition, pcNewSubStr)
		This.ReplaceSubStringWCS(pcSubStr, pcCondition, pcNewSubStr, :CaseSensitive = TRUE)

		def ReplaceSubStringWQ(pcSubStr, pcCondition, pcNewSubStr)
			This.ReplaceSubStringW(pcSubStr, pcCondition, pcNewSubStr)
			return This
		
	  #-------------------------------------------------------------------------#
	 #  REPLACING ALL OCCURRENCES OF A SUBSTRING BETWEEN TWO OTHER SUBSTRINGS  #
	#-------------------------------------------------------------------------#

	def ReplaceBetweenCS(pcSubStr, pcSubStr1, pcSubStr2, pcNewSubstr, pCaseSensitive)
		aSections = This.FindSectionsBetweenCS(pcSubStr, pcSubStr1, pcSubStr2, pCaseSensitive)
		This.ReplaceSections(aSections, pcNewSubStr)

		def ReplaceBetweenCSQ(pcSubStr, pcSubStr1, pcSubStr2, pcNewSubstr, pCaseSensitive)
			This.ReplaceBetweenCS(pcSubStr, pcSubStr1, pcSubStr2, pcNewSubstr, pCaseSensitive)
			return This

		def ReplaceSubStringBetweenCS(pcSubStr, pcSubStr1, pcSubStr2, pcNewSubstr, pCaseSensitive)
			This.ReplaceBetweenCS(pcSubStr, pcSubStr1, pcSubStr2, pcNewSubstr, pCaseSensitive)

			def ReplaceSubStringBetweenCSQ(pcSubStr, pcSubStr1, pcSubStr2, pcNewSubstr, pCaseSensitive)
				This.ReplaceSubStringBetweenCS(pcSubStr, pcSubStr1, pcSubStr2, pcNewSubstr, pCaseSensitive)
				return This

	def SubstringBetweenReplacedCS(pcSubStr, pcSubStr1, pcSubStr2, pcNewSubstr, pCaseSensitive)
		cResult = This.ReplaceBetweenCSQ(pcSubStr, pcSubStr1, pcSubStr2, pcNewSubstr, pCaseSensitive).Content()
		return cResult

	#--- WITHOUT CASESENSITIVITY

	def ReplaceBetween(pcSubStr, pcSubStr1, pcSubStr2, pcNewSubstr)
		This.ReplaceBetweenCS(pcSubStr, pcSubStr1, pcSubStr2, pcNewSubstr, :CaseSensitive = TRUE)
		
		def ReplaceBetweenQ(pcSubStr, pcSubStr1, pcSubStr2, pcNewSubstr)
			This.ReplaceBetween(pcSubStr, pcSubStr1, pcSubStr2, pcNewSubstr)
			return This

		def ReplaceSubStringBetween(pcSubStr, pcSubStr1, pcSubStr2, pcNewSubstr)
			This.ReplaceBetween(pcSubStr, pcSubStr1, pcSubStr2, pcNewSubstr)

			def ReplaceSubStringBetweenQ(pcSubStr, pcSubStr1, pcSubStr2, pcNewSubstr)
				This.ReplaceSubStringBetween(pcSubStr, pcSubStr1, pcSubStr2, pcNewSubstr)
				return This

	def SubstringBetweenReplaced(pcSubStr, pcSubStr1, pcSubStr2, pcNewSubstr)
		cResult = This.ReplaceBetweenQ(pcSubStr, pcSubStr1, pcSubStr2, pcNewSubstr).Content()
		return cResult

	  #--------------------------------------------------------#
	 #  REPLACING ANY SUBSTRING BETWEEN TWO OTHER SUBSTRINGS  #
	#--------------------------------------------------------#

	def ReplaceAnyBetweenCS(pcSubStr1, pcSubStr2, pcNewSubstr, pCaseSensitive)
		aSections = This.FindAnySectionsBetweenCS(pcSubStr1, pcSubStr2, pCaseSensitive)
		This.ReplaceManySections(aSections, pcNewSubStr)

		def ReplaceAnyBetweenCSQ(pcSubStr1, pcSubStr2, pcNewSubstr, pCaseSensitive)
			This.ReplaceAnyBetweenCS(pcSubStr1, pcSubStr2, pcNewSubstr, pCaseSensitive)
			return This

		def ReplaceAnySubStringBetweenCS(pcSubStr1, pcSubStr2, pcNewSubstr, pCaseSensitive)
			This.ReplaceAnyBetweenCS(pcSubStr1, pcSubStr2, pcNewSubstr, pCaseSensitive)

			def ReplaceAnySubStringBetweenCSQ(pcSubStr1, pcSubStr2, pcNewSubstr, pCaseSensitive)
				This.ReplaceSubStringBetweenCS(pcSubStr1, pcSubStr2, pcNewSubstr, pCaseSensitive)
				return This

	def AnySubstringBetweenReplacedCS(pcSubStr1, pcSubStr2, pcNewSubstr, pCaseSensitive)
		cResult = This.ReplaceAnyBetweenCSQ(pcSubStr1, pcSubStr2, pcNewSubstr, pCaseSensitive).Content()
		return cResult

	#--- WITHOUT CASESENSITIVITY

	def ReplaceAnyBetween(pcSubStr1, pcSubStr2, pcNewSubstr)
		This.ReplaceAnyBetweenCS(pcSubStr1, pcSubStr2, pcNewSubstr, :CaseSensitive = TRUE)
		
		def ReplaceAnyBetweenQ(pcSubStr1, pcSubStr2, pcNewSubstr)
			This.ReplaceAnyBetween(pcSubStr1, pcSubStr2, pcNewSubstr)
			return This

		def ReplaceAnySubStringBetween(pcSubStr1, pcSubStr2, pcNewSubstr)
			This.ReplaceAnyBetween(pcSubStr1, pcSubStr2, pcNewSubstr)

			def ReplaceAnySubStringBetweenQ(pcSubStr1, pcSubStr2, pcNewSubstr)
				This.ReplaceSubStringBetween(pcSubStr1, pcSubStr2, pcNewSubstr)
				return This

	def AnySubstringBetweenReplaced(pcSubStr1, pcSubStr2, pcNewSubstr)
		cResult = This.ReplaceAnyBetweenQ(pcSubStr1, pcSubStr2, pcNewSubstr).Content()
		return cResult

	  #==========================================#
	 #   REPLACING A CHAR AT A GIVEN POSITION   #
	#==========================================#

	def ReplaceCharAtPosition(n, pcNewSubStr)
		#< @MotherFunction = This.ReplaceSection() > @QtBased = TRUE #>

		This.ReplaceSection(n, n, pcNewSubStr)

		def ReplaceCharAtPositionQ(n, pcNewSubStr)
			This.ReplaceCharAtPosition(n, pcNewSubStr)
			return This

		def ReplaceCharAt(n, pcNewSubStr)
			This.ReplaceCharAtPosition(n, pcNewSubStr)

			def ReplaceCharAtQ(n, pcNewSubStr)
				This.ReplaceCharAt(n, pcNewSubStr)
				return This

		def ReplaceCharAtPositionN(n, pcNewSubStr)
			This.ReplaceCharAtPosition(n, pcNewSubStr)

			def ReplaceCharAtPositionNQ(n, pcNewSubStr)
				This.ReplaceCharAtPositionN(n, pcNewSubStr)
				return This

		def ReplaceCharAtThisPosition(n, pcNewSubStr)
			This.ReplaceCharAtPosition(n, pcNewSubStr)

			def ReplaceCharAtThisPositionQ(n, pcNewSubStr)
				This.ReplaceCharAtThisPosition(n, pcNewSubStr)
				return This

	def CharReplacedAtPsoition(n, pcNewSubStr)
		#< @MotherFunction = This.ReplaceSection() > @QtBased = TRUE #>

		cResult = This.Copy().ReplaceCharAtPositionQ(n, pcNewSubStr).Content()
		return cResult

		def CharReplacedAtThisPsoition(n, pcNewSubStr)
			return This.CharReplacedAtPsoition(n, pcNewSubStr)

		def CharAtPositionNReplaced(n, pcNewSubStr)
			return This.CharReplacedAtPsoition(n, pcNewSubStr)

	  #-------------------------------------------------------------#
	 #   REPLACING CHARS AT GIVEN POSITIONS BY A GIVEN SUBSTRING   #
	#-------------------------------------------------------------#

	def ReplaceCharsAtPositions(panPositions, pcNewSubStr)

		#< @MotherFunction = This.ReplaceSection() > @QtBased = TRUE #>

		# Checking the correctness of panPositions param

		if NOT ( isList(panPositions) and Q(panPositions).IsListOfNumbers() )

			stzRaise("Incorrect param! panPositions must be list of numbers.")
		ok

		anPositions = Q(panPositions).SortedInDescending()

		for n in anPositions
			This.ReplaceCharAtPositionN(n, pcNewSubStr)
		next

		#< @FunctionFluentForm

		def ReplaceCharsAtPositionsQ(panPositions, pcNewSubStr)
			This.ReplaceCharsAtPositions(panPositions, pcNewSubStr)
			return This
		#>

		#< @FunctionAlternativeForms

		def ReplaceCharsAt(panPositions, pcNewSubStr)
			This.ReplaceCharsAtPositions(panPositions, pcNewSubStr)

		def ReplaceCharsAtThesePositions(panPositions, pcNewSubStr)
			This.ReplaceCharsAtPositions(panPositions, pcNewSubStr)

		#>

	def CharsReplacedAtPsoitions(panPositions, pcNewSubStr)
		cResult = This.Copy().ReplaceCharsAtPositionsQ(panPositions, pcNewSubStr).Content()
		return cResult

		def CharsReplacedAtThesePsoitions(panPositions, pcNewSubStr)
			return This.CharsReplacedAtPsoitions(panPositions, pcNewSubStr)

		def CharsAtThesePositionsReplaced(panPositions, pcNewSubStr)
			return This.CharsReplacedAtPsoitions(panPositions, pcNewSubStr)

	  #-----------------------------------------------------------#
	 #   REPLACING CHARS AT GIVEN POSITIONS BY MANY SUBSTRINGS   #
	#-----------------------------------------------------------#

	def ReplaceCharsAtPositionsByMany(panPositions, pacNewSubStrings)
		/* EXAMPLE
		o1 = new stzString("ab3de6gh9")
		o1.ReplaceCharsAtPositionsByMany([3, 6, 9], [ "c", "f", "i" ])

		? o1.Content() #--> "abcdefghi"
		*/

		anPositions = StzListOfNumbersQ(panPositions).SortedInDescending()

		nMin = Min( len(anPositions), len(pacNewSubStrings) )
		anPositions = StzListQ(anPositions).SectionQ(1, nMin).SortedInDescending()
		acNewSubStrings = StzListQ(pacNewSubStrings).SectionQ(1, nMin).SortedInDescending()

		i = 0
		for n in anPositions
			i++
			This.ReplaceCharAtPosition(n, acNewSubStrings[i])
		next

		#< @FunctionFluentForm

		def ReplaceCharsAtPositionsByManyQ(panPositions, pacNewSubStrings)
			This.ReplaceCharsAtPositionsByMany(panPositions, pacNewSubStrings)
			return This
		#>

		#< @FunctionAlternativeForms

		def ReplaceCharsAtByMany(panPositions, pacNewSubStrings)
			This.ReplaceCharsAtPositionsByMany(panPositions, pacNewSubStrings)

		def ReplaceCharsAtThesePositionsByMany(panPositions, pacNewSubStrings)
			This.ReplaceCharsAtPositionsByMany(panPositions, pacNewSubStrings)

		#>

	def CharsReplacedAtPsoitionsByMany(panPositions, pacNewSubStrings)
		cResult = This.Copy().ReplaceCharsAtPositionsByManyQ(panPositions, pacNewSubStrings).Content()
		return cResult

		def CharsReplacedAtThesePsoitionsByMany(panPositions, pacNewSubStrings)
			return This.CharsReplacedAtPsoitionsByMany(panPositions, pacNewSubStrings)

		def CharsAtThesePositionsReplacedByMany(panPositions, pacNewSubStrings)
			return This.CharsReplacedAtPsoitionsByMany(panPositions, pacNewSubStrings)

	  #--------------------------------------------------------------------#
	 #     REPLACING ALL CHARS WITH A SUBSTRING UNDER A GIVEN CONDITION   #
	#--------------------------------------------------------------------#

	def ReplaceAllCharsW(pcCondition, pcNewSubStr)
		#< @MotherFunctions:
		#	This.FindAllCharsW()  > @RingBased
		#	This.ReplaceSection() > @QtBased
		#>

		/*
		Example:

		StzStringQ( "Text processing with Ring" ) {

			ReplaceAllCharsW(
				:Where = '{ @char = "i" }',
				:With = "*"
			)

			? Content()
		}

		--> Returns: "Text process*ng w*th R*ng"
		*/

		# Checking the correctness of the pcCondition param
			# --> Not necessary! It will be done by the
			# mother function FindAllCharsW()

		# Checking the correctness of the pcNewSubStr param
			# --> Not necceary! It will be done by the
			# called function ReplaceCharsAtPositions()

		# Doing the job

		anPositions = This.FindCharsW(pcCondition)

		This.ReplaceCharsAtPositions(anPositions, pcNewSubStr)


		#< @FunctionFluentForm

		def ReplaceAllCharsWQ(pCondition, pcNewSubStr)
			This.ReplaceAllCharsWhere(pCondition, pcNewSubStr)
			return This

		#>

		#< @FunctionAlternativeForms

		def ReplaceAllWhere(pCondition, pcNewSubStr)
			This.ReplaceAllCharsW(pCondition, pcNewSubStr)

			def ReplaceAllWhereQ(pCondition, pcNewSubStr)
				This.ReplaceAllWhere(pCondition, pcNewSubStr)
				return This

		def ReplaceAllCharsWhere(pCondition, pcNewSubStr)
			This.ReplaceAllCharsW(pCondition, pcNewSubStr)

			def ReplaceAllCharsWhereQ(pCondition, pcNewSubStr)
				This.ReplaceAllCharsWhere(pCondition, pcNewSubStr)
				return This

		def ReplaceCharsW(pCondition, pcNewSubStr)
			This.ReplaceAllCharsW(pCondition, pcNewSubStr)

			def ReplaceCharsWQ(pCondition, pcNewSubStr)
				This.ReplaceCharsW(pCondition, pcNewSubStr)
				return This

		def ReplaceCharsWhere(pCondition, pcNewSubStr)
			This.ReplaceAllCharsW(pCondition, pcNewSubStr)

			def ReplaceCharsWhereQ(pCondition, pcNewSubStr)
				This.ReplaceCharsWhere(pCondition, pcNewSubStr)
				return This

		def ReplaceW(pCondition, pcNewSubStr)
			This.ReplaceAllCharsW(pCondition, pcNewSubStr)

			def ReplaceWQ(pCondition, pcNewSubStr)
				This.ReplaceW(pCondition, pcNewSubStr)
				return This

		#>

	  #----------------------------------------------------#
	 #     REPLACING THE NTH OCCURRENCE OF A SUBSTRING    #
	#----------------------------------------------------#

	def ReplaceNthOccurrenceCS(n, pcSubStr, pcNewSubStr, pCaseSensitive)
		#< @MotherFunction = This.ReplaceSection() > @QtBased = TRUE #>
		
		if isList(pcSubStr) and StzListQ(pcSubStr).IsOfNamedParam()
			pcSubStr = pcSubStr[2]
		ok

		if isList(pcNewSubStr) and StzListQ(pcNewSubStr).IsWithNamedParam()
			pcNewSubStr = pcNewSubStr[2]
		ok
	
		if n = :First
			n = 1
	
		but n = :Last
			n = This.NumberOfOccurrenceCS(pcSubStr, pCaseSensitive)
	
		ok
	
		n = This.FindNthOccurrenceCS(n, pcSubStr, pCaseSensitive)
	
		if n > 0
			oSubStr = new stzString(pcSubStr)
			This.ReplaceSection( n, n + oSubStr.NumberOfChars()-1, pcNewSubStr)
		ok
	
		#< @FunctionFluentForm
	
		def ReplaceNthOccurrenceCSQ(n, pcSubStr, pcNewSubStr, pCaseSensitive)
			This.ReplaceNthOccurrenceCS(n, pcSubStr, pcNewSubStr, pCaseSensitive)
			return This
		
		#>

		def ReplaceNthCS(n, pcSubStr, pcNewSubStr, pCaseSensitive)
			This.ReplaceNthOccurrenceCS(n, pcSubStr, pcNewSubStr, pCaseSensitive)

			def ReplaceNthCSQ(n, pcSubStr, pcNewSubStr, pCaseSensitive)
				This.ReplaceNthCS(n, pcSubStr, pcNewSubStr, pCaseSensitive)
				return This

	def NthOccurrenceReplacedCS(n, pcSubStr, pcNewSubStr, pCaseSensitive)
		return This.Copy().ReplaceNthOccurrenceCSQ(n, pcSubStr, pcNewSubStr, pCaseSensitive).Content()


	#-- WITHOUT CASESENSITIVITY

	def ReplaceNthOccurrence(n, pcSubStr, pcNewSubStr)
		This.ReplaceNthOccurrenceCS(n, pcSubStr, pcNewSubStr, :Casesensitive = TRUE)

		#< @FunctionFluentForm

		def ReplaceNthOccurrenceQ(n, pcSubStr, pcNewSubStr)
			This.ReplaceNthOccurrence(n, pcSubStr, pcNewSubStr)
			return This
	
		#>

		def ReplaceNth(n, pcSubStr, pcNewSubStr)
			This.ReplaceNthOccurrence(n, pcSubStr, pcNewSubStr)

			def ReplaceNthQ(n, pcSubStr, pcNewSubStr)
				This.ReplaceNth(n, pcSubStr, pcNewSubStr)
				return This

	def NthOccurrenceReplaced(n, pcSubStr, pcNewSubStr)
		return This.Copy().ReplaceNthOccurrenceCSQ(n, pcSubStr, pcNewSubStr).Content()

	  #-------------------------------------------------#
	 #    REPLACING FIRST OCCURRENCE OF A SUBSTRING    #
	#-------------------------------------------------#

	def ReplaceFirstOccurrenceCS(pcSubStr, pcNewSubStr, pCaseSensitive)
		This.ReplaceNthOccurrenceCS(1, pcSubStr, pcNewSubStr, pCaseSensitive)
	
		#< @FunctionFluentForm
	
		def ReplaceFirstOccurrenceCSQ(pcSubStr, pcNewSubStr, pCaseSensitive)
			This.ReplaceFirstOccurrenceCS(pcSubStr, pcNewSubStr, pCaseSensitive)
			return This
		
		#>

	def FirtOccurrenceReplacedCS(pcSubStr, pcNewSubStr, pCaseSensitive)
		return This.Copy().ReplaceFirstOccurrenceCSQ(pcSubStr, pcNewSubStr, pCaseSensitive).Content()

	#-- WITHOUT CASESENSITIVITY

	def ReplaceFirstOccurrence(pcSubStr, pcNewSubStr)
		This.ReplaceFirstOccurrenceCS(pcSubStr, pcNewSubStr, :Casesensitive = TRUE)

		#< @FunctionFluentForm

		def ReplaceFirstOccurrenceQ(pcSubStr, pcNewSubStr)
			This.ReplaceFirstOccurrence(pcSubStr, pcNewSubStr)
			return This
	
		#>

		def ReplaceFirst(pcSubStr, pcNewSubStr)
			This.ReplaceFirstOccurrence(pcSubStr, pcNewSubStr)

			def ReplaceFirstQ(pcSubStr, pcNewSubStr)
				This.ReplaceFirst(pcSubStr, pcNewSubStr)
				return This

	def FirtOccurrenceReplaced(pcSubStr, pcNewSubStr)
		return This.Copy().ReplaceFirstOccurrenceQ(pcSubStr, pcNewSubStr).Content()

	  #--------------------------------------------------#
	 #     REPLACING LAST OCCURRENCE OF A SUBSTRING     #
	#--------------------------------------------------#

	def ReplaceLastOccurrenceCS(pcSubStr, pcNewSubStr, pCaseSensitive)
		This.ReplaceNthOccurrenceCS(:Last, pcSubStr, pcNewSubStr, pCaseSensitive)
	
		#< @FunctionFluentForm
	
		def ReplaceLastOccurrenceCSQ(pcSubStr, pcNewSubStr, pCaseSensitive)
			This.ReplaceLastOccurrenceCS(pcSubStr, pcNewSubStr, pCaseSensitive)
			return This
		
		#>

	def LastOccurrenceReplacedCS(pcSubStr, pcNewSubStr, pCaseSensitive)
		return This.Copy().ReplaceLastOccurrenceCSQ(pcSubStr, pcNewSubStr, pCaseSensitive).Content()

	#-- WITHOUT CASESENSITIVITY

	def ReplaceLastOccurrence(pcSubStr, pcNewSubStr)
		This.ReplaceLastOccurrenceCS(pcSubStr, pcNewSubStr, :Casesensitive = TRUE)

		#< @FunctionFluentForm

		def ReplaceLastOccurrenceQ(pcSubStr, pcNewSubStr)
			This.ReplaceLastOccurrence(pcSubStr, pcNewSubStr)
			return This
	
		#>

		def ReplaceLast(pcSubStr, pcNewSubStr)
			This.ReplaceLastOccurrence(pcSubStr, pcNewSubStr)

			def ReplaceLastQ(pcSubStr, pcNewSubStr)
				This.ReplaceLast()
				return This

	def LastOccurrenceReplaced(pcSubStr, pcNewSubStr)
		return This.Copy().ReplaceLastOccurrenceQ(pcSubStr, pcNewSubStr).Content()

	   #----------------------------------------------------#
	  #    REPLACING NEXT NTH OCCURRENCE OF A SUBSTRING    # 
	 #    STARTING AT A GIVEN POSITION                    #
	#----------------------------------------------------#

	def ReplaceNextNthOccurrenceCS(n, pcSubStr, nStart, pcNewSubStr, pCaseSensitive)
		
		if isList(pcSubStr) and StzListQ(pcSubStr).IsOfNamedParam()
			pcSubStr = pcSubStr[2]
		ok

		if NOT isString(pcSubStr)
			stzRaise("Incorrect param! pcSubStr must be a string.")
		ok

		if isList(pcNewSubStr) and StzListQ(pcNewSubStr).IsWithNamedParam()
			pcNewSubStr = pcNewSubStr[2]
		ok

		if isList(nStart) and StzListQ(nStart).IsStartingAtNamedParam()
			if Q(nStart[1]).IsOneOfThese([ :StartingAt, :StartingAtPosition ])
				nStart = nStart[2]

			but nStart[1] = :StartingAtOccurrence

				nStart = This.FindNthOccurrenceCS(nStart[2] + 1, pcSubStr, pCaseSensitive)
			ok
			
		ok

		if isString(nStart)
			switch nStart
			on :First or :FirstOccurrence
				nStart = This.FindFirstOccurrenceCS(pcSubStr, pCaseSensitive)

			on :FirstPosition or :FirstChar
				nStart = 1

			off
		ok

		cPart1 = This.Section(1, nStart - 1)

		oPart2 = This.SectionQ(nStart, :LastChar)
		cPart2 = oPart2.ReplaceNthOccurrenceCSQ(n, pcSubStr, pcNewSubStr, pCaseSensitive).Content()

		cResult = cPart1 + cPart2
		This.Update( cResult )

		def ReplaceNextNthOccurrenceCSQ(n, pcSubStr, nStart, pcNewSubStr, pCaseSensitive)
			This.ReplaceNextNthOccurrenceCS(n, pcSubStr, nStart, pcNewSubStr, pCaseSensitive)
			return This

		def ReplaceNthNextOccurrenceCS(n, pcSubStr, nStart, pcNewSubStr, pCaseSensitive)
			This.ReplaceNextNthOccurrenceCS(n, pcSubStr, nStart, pcNewSubStr, pCaseSensitive)

			def ReplaceNthNextOccurrenceCSQ(n, pcSubStr, nStart, pcNewSubStr, pCaseSensitive)
				This.ReplaceNthNextOccurrenceCS(n, pcSubStr, nStart, pcNewSubStr, pCaseSensitive)
				return This

	def NextNthOccurrenceReplacedCS(n, pcSubStr, nStart, pcNewSubStr, pCaseSensitive)
		return This.Copy().ReplaceNextNthOccurrenceCSQ(n, pcSubStr, nStart, pcNewSubStr, pCaseSensitive).Content()

	#-- WITHOUT CASESENSITIVITY

	def ReplaceNextNthOccurrence(n, pcSubStr, nStart, pcNewSubStr)
		This.ReplaceNextNthOccurrenceCS(n, pcSubStr, nStart, pcNewSubStr, :CaseSensitive = TRUE)

		def ReplaceNextNthOccurrenceQ(n, pcSubStr, nStart, pcNewSubStr)
			This.ReplaceNextNthOccurrence(n, pcSubStr, nStart, pcNewSubStr)
			return This

		def ReplaceNthNextOccurrence(n, pcSubStr, nStart, pcNewSubStr)
			This.ReplaceNextNthOccurrence(n, pcSubStr, nStart, pcNewSubStr)

			def ReplaceNthNextOccurrenceQ(n, pcSubStr, nStart, pcNewSubStr)
				return This.ReplaceNthNextOccurrence(n, pcSubStr, nStart, pcNewSubStr)

	def NextNthOccurrenceReplaced(n, pcSubStr, nStart, pcNewSubStr)
		return This.Copy().ReplaceNextNthOccurrenceQ(n, pcSubStr, nStart, pcNewSubStr).Content()

	   #------------------------------------------------#
	  #    REPLACING NEXT OCCURRENCE OF A SUBSTRING    # 
	 #    STARTING AT A GIVEN POSITION                #
	#------------------------------------------------#

	def ReplaceNextOccurrenceCS(pcSubStr, nStart, pcNewSubStr, pCaseSensitive)
		This.ReplaceNextNthOccurrenceCS(1, pcSubStr, nStart, pcNewSubStr, pCaseSensitive)

		def ReplaceNextOccurrenceCSQ(pcSubStr, nStart, pcNewSubStr, pCaseSensitive)
			This.ReplaceNextOccurrenceCS(pcSubStr, nStart, pcNewSubStr, pCaseSensitive)
			return This

	def NextOccurenceReplacedCS(pcSubStr, nStart, pcNewSubStr, pCaseSensitive)
		return This.Copy().ReplaceNextOccurrenceCSQ(pcSubStr, nStart, pcNewSubStr, pCaseSensitive).Content()

	#-- WITHOUT CASESENSITIVITY

	def ReplaceNextOccurrence(pcSubStr, nStart, pcNewSubStr)
		This.ReplaceNextNthOccurrenceCS(1, pcSubStr, nStart, pcNewSubStr, :CaseSensitive = TRUE)

		def ReplaceNextOccurrenceQ(pcSubStr, nStart, pcNewSubStr)
			This.ReplaceNextOccurrence(pcSubStr, nStart, pcNewSubStr)
			return This

	def NextOccurenceReplaced(pcSubStr, nStart, pcNewSubStr)
		return This.Copy().ReplaceNextOccurrenceQ(pcSubStr, nStart, pcNewSubStr).Content()

	   #--------------------------------------------------------#
	  #    REPLACING PREVIOUS NTH OCCURRENCE OF A SUBSTRING    # 
	 #    STARTING AT A GIVEN POSITION                        #
	#--------------------------------------------------------#

	def ReplacePreviousNthOccurrenceCS(n, pcSubStr, nStart, pcNewSubStr, pCaseSensitive)
		/* EXAMPLE

		o1 = new stzString("ring php ring ruby ring python ring")
		o1.ReplacePreviousNthOccurrence(2, :Of = "ring", :StartingAtOccurrence = 3, :By = "♥♥♥")
		
		? o1.Content() #--> ♥♥♥ php ring ruby ring python ring
		*/

		if isList(pcSubStr) and StzListQ(pcSubStr).IsOfNamedParam()
			pcSubStr = pcSubStr[2]
		ok

		if NOT isString(pcSubStr)
			stzRaise("Incorrect param! pcSubStr must be a string.")
		ok

		if isList(pcNewSubStr) and StzListQ(pcNewSubStr).IsWithNamedParam()
			pcNewSubStr = pcNewSubStr[2]
		ok

		if isList(nStart) and StzListQ(nStart).IsStartingAtNamedParam()
			if Q(nStart[1]).IsOneOfThese([ :StartingAt, :StartingAtPosition ])
				nStart = nStart[2]

			but nStart[1] = :StartingAtOccurrence

				nStart = This.FindNthOccurrenceCS(nStart[2], pcSubStr, pCaseSensitive)
			ok
			
		ok

		if isString(nStart)
			switch nStart
			on :Last or :LastOccurrence
				nStart = This.FindLastOccurrenceCS(pcSubStr, pCaseSensitive)

			on :LastPosition or :LastChar
				nStart = This.NumberOfChars()

			off
		ok

		oPart1 = This.SectionQ(1, nStart - 1)
		n = oPart1.NumberOfOccurrenceCS(pcSubStr, pCaseSensitive) - n + 1
		cPart1 = oPart1.ReplaceNthOccurrenceCSQ(n, pcSubStr, pcNewSubStr, pCaseSensitive).Content()

		cPart2 = This.Section(nStart, :LastChar)

		cResult = cPart1 + cPart2
		This.Update( cResult )

		def ReplacePreviousNthOccurrenceCSQ(n, pcSubStr, nStart, pcNewSubStr, pCaseSensitive)
			This.ReplacePreviousNthOccurrenceCS(n, pcSubStr, nStart, pcNewSubStr, pCaseSensitive)
			return This

		def ReplaceNthPreviousOccurrenceCS(n, pcSubStr, nStart, pcNewSubStr, pCaseSensitive)
			This.ReplacePreviousNthOccurrenceCS(n, pcSubStr, nStart, pcNewSubStr, pCaseSensitive)

			def ReplaceNthPreviousOccurrenceCSQ(n, pcSubStr, nStart, pcNewSubStr, pCaseSensitive)
				This.ReplaceNthPreviousOccurrenceCS(n, pcSubStr, nStart, pcNewSubStr, pCaseSensitive)
				return This

	def PreviousNthOccurrenceReplacedCS(n, pcSubStr, nStart, pcNewSubStr, pCaseSensitive)
		return This.Copy().ReplacePreviousNthOccurrenceCSQ(n, pcSubStr, nStart, pcNewSubStr, pCaseSensitive).Content()

	#-- WITHOUT CASESENSITIVITY

	def ReplacePreviousNthOccurrence(n, pcSubStr, nStart, pcNewSubStr)
		This.ReplacePreviousNthOccurrenceCS(n, pcSubStr, nStart, pcNewSubStr, :CaseSensitive = TRUE)

		def ReplacePreviousNthOccurrenceQ(n, pcSubStr, nStart, pcNewSubStr)
			This.ReplacePreviousNthOccurrence(n, pcSubStr, nStart, pcNewSubStr)
			return This

		def ReplaceNthPreviousOccurrence(n, pcSubStr, nStart, pcNewSubStr)
			This.ReplacePreviousNthOccurrence(n, pcSubStr, nStart, pcNewSubStr)

			def ReplaceNthPreviousOccurrenceQ(n, pcSubStr, nStart, pcNewSubStr)
				This.ReplaceNthPreviousOccurrence(n, pcSubStr, nStart, pcNewSubStr)
				return This

	def PreviousNthOccurrenceReplaced(n, pcSubStr, nStart, pcNewSubStr)
		return This.Copy().ReplacePreviousNthOccurrenceQ(n, pcSubStr, nStart, pcNewSubStr).Content()

	   #----------------------------------------------------#
	  #    REPLACING PREVIOUS OCCURRENCE OF A SUBSTRING    # 
	 #    STARTING AT A GIVEN POSITION                    #
	#----------------------------------------------------#

	def ReplacePreviousOccurrenceCS(pcSubStr, nStart, pcNewSubStr, pCaseSensitive)
		This.ReplacePreviousNthOccurrenceCS(1, pcSubStr, nStart, pcNewSubStr, pCaseSensitive)

		def ReplacePreviousOccurrenceCSQ(pcSubStr, nStart, pcNewSubStr, pCaseSensitive)
			This.ReplacePreviousOccurrenceCS(pcSubStr, nStart, pcNewSubStr, pCaseSensitive)
			return This

	def PreviousOccurrenceReplacedCS(pcSubStr, nStart, pcNewSubStr, pCaseSensitive)
		return This.Copy().ReplacePreviousOccurrenceCSQ(pcSubStr, nStart, pcNewSubStr, pCaseSensitive).Content()

	#-- WITHOUT CASESENSITIVITY

	def ReplacePreviousOccurrence(pcSubStr, nStart, pcNewSubStr)
		This.ReplacePreviousNthOccurrenceCS(1, pcSubStr, nStart, pcNewSubStr, :CaseSensitive = TRUE)

		def ReplacePreviousOccurrenceQ(pcSubStr, nStart, pcNewSubStr)
			This.ReplacePreviousOccurrence(pcSubStr, nStart, pcNewSubStr)
			return This

	def PreviousOccurrenceReplaced(pcSubStr, nStart, pcNewSubStr)
		return This.Copy().ReplacePreviousOccurrenceQ(pcSubStr, nStart, pcNewSubStr).Content()

	  #----------------------------------------------------#
	 #  REPLACING THE FIRST N OCCURRENCES OF A SUBSTRING  #
	#----------------------------------------------------#

	def ReplaceFirstNOccurrencesCS(n, pcSubStr, pcNewSubStr, pCaseSensitive)
		anPos = This.FindFirstNOccurrencesCS(n, pcSubStr, pCaseSensitive)
		This.ReplaceSubStringAtPositionsCS(anPos, pcSubStr, pcNewSubStr, pCaseSensitive)

		def ReplaceFirstNOccurrencesCSQ(n, pcSubStr, pcNewSubStr, pCaseSensitive)
			This.ReplaceFirstNOccurrencesCS(n, pcSubStr, pcNewSubStr, pCaseSensitive)
			return This

		def ReplaceNFirstOccurrencesCS(n, pcSubStr, pcNewSubStr, pCaseSensitive)
			This.ReplaceFirstNOccurrencesCS(n, pcSubStr, pcNewSubStr, pCaseSensitive)

			def ReplaceNFirstOccurrencesCSQ(n, pcSubStr, pcNewSubStr, pCaseSensitive)
				This.ReplaceNFirstOccurrencesCS(n, pcSubStr, pcNewSubStr, pCaseSensitive)
				return This

	def FirstNOccurrencesReplacedCS(n, pcSubStr, pcNewSubStr, pCaseSensitive)
		return This.Copy().ReplaceFirstNOccurrencesCSQ(n, pcNewSubStr, pcSubStr, pCaseSensitive).Content()

		def NFirstOccurrencesReplacedCS(n, pcSubStr, pcNewSubStr, pCaseSensitive)
			return This.FirstNOccurrencesReplacedCS(n, pcSubStr, pcNewSubStr, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def ReplaceFirstNOccurrences(n, pcSubStr, pcNewSubStr)
		This.ReplaceFirstNOccurrencesCS(n, pcSubStr, pcNewSubStr, :CaseSensitive = TRUE)

		def ReplaceFirstNOccurrencesQ(n, pcSubStr, pcNewSubStr)
			This.ReplaceFirstNOccurrences(n, pcSubStr, pcNewSubStr)
			return This

		def ReplaceNFirstOccurrences(n, pcSubStr, pcNewSubStr)
			This.ReplaceFirstNOccurrences(n, pcSubStr, pcNewSubStr)

			def ReplaceNFirstOccurrencesQ(n, pcSubStr, pcNewSubStr)
				This.ReplaceNFirstOccurrences(n, pcSubStr, pcNewSubStr)
				return This

	def FirstNOccurrencesReplaced(n, pcSubStr, pcNewSubStr)
		return This.Copy().ReplaceFirstNOccurrencesQ(n, pcSubStr, pcNewSubStr).Content()

		def NFirstOccurrencesReplaced(n, pcSubStr, pcNewSubStr)
			return This.FirstNOccurrencesReplaced(n, pcSubStr, pcNewSubStr)

	  #-------------------------#
	 #    REPLACING NTH CHAR   # 
	#-------------------------#

	def ReplaceNthChar(n, pSubStr)
		#< @MotherFunction = This.ReplaceSection() > @QtBased = TRUE #>

		if n = :LastChar or n = :EndOfString
			n = This.NumberOfChars()

		but n = :FirstChar or n = :StartOfString
			n = 1
		ok

		if isList(pSubStr) and
		   len(pSubStr) = 2 and
		   StzListQ(pSubStr).IsPairOfStrings()

			if pSubStr[1] = :With
				pSubStr = pSubStr[2]

			but pSubStr[1] = :With@
				cCode = 'pSubStr = ' + StzStringQ(pSubStr[2]).TrimQ().RemoveBoundsQ("{","}").Content()
				eval(cCode)
			ok
		ok

		This.ReplaceSection(n, n , pSubStr)

		#< @FunctionFluentForm

		def ReplaceNthCharQ(n, pcSubStr)
			This.ReplaceNthChar(n, pcSubStr)
			return This

		#>

	def NthCharReplaced(n, pValue)
		cResult = This.Copy().ReplaceNthCharQ(n, pValue).Content()
		return cResult

	  #---------------------------#
	 #    REPLACING FIRST CHAR   # 
	#---------------------------#

	def ReplaceFirstChar(pSubStr)
		This.ReplaceNthChar(1, pSubStr)

		#< @FunctionFluentForm

		def ReplaceFirstCharQ(pcSubStr)
			This.ReplaceFirstChar(pcSubStr)
			return This

		#>

	def FirstCharReplaced(n, pValue)
		cResult = This.Copy().ReplaceFirstCharQ(n, pValue).Content()
		return cResult

	  #---------------------------#
	 #    REPLACING LAST CHAR    # 
	#---------------------------#

	def ReplaceLastChar(pSubStr)
		This.ReplaceNthChar(:Last, pSubStr)

		#< @FunctionFluentForm

		def ReplaceLastCharQ(pcSubStr)
			This.ReplaceLastChar(pcSubStr)
			return This

		#>

	def LastCharReplaced(n, pValue)
		cResult = This.Copy().ReplaceLastCharQ(n, pValue).Content()
		return cResult

	  #--------------------------#
	 #    REPLACING ALL CHARS   # 
	#--------------------------#

	def ReplaceAllChars(pcSubStr)

		if isList(pcSubStr) and _@(pcSubStr).IsWithNamedParam()
			pcSubStr = pcSubStr[2]
		ok

		cResult = ""
		for i = 1 to This.NumberOfChars()
			cResult += pcSubStr
		next

		This.Update( cResult )

		#< @FunctionFluentForm

		def ReplaceAllCharsQ(pcSubStr)
			This.ReplaceAllChars(pcSubStr)
			return This

		#>

	def AllCharsReplaced(pcSubStr)
		cResult = This.Copy().ReplaceAllCharsQ(pcSubStr).Content()
		return cResult

	  #--------------------------------#
	 #    INTERPOLATING THE STRING    # 
	#--------------------------------#

	def Interpolate()
		/*
		@lang = "Ring"
		? StzStringQ('My best programming language is @lang!').Interpolate()

		# --> My best programming language is Ring!
		*/
		if This.ContainsVars()
			acVars = This.ExtractVars()
			aValues = []

			for var in acVars
				// TODO
			next

			
		ok

	def ContainsVars()
		
		acVars = variables()

		for cVar in acVars
			cVar = " " + cVar + " "
		next

		cString = " " + This.String() + " "

		This.FindMany(acVars)
		// TODO

	def InterpolateUsing(paValues)
		/*
		? StzString('My kids are #1, #2, and #3!').InterpolateUsing([ "Teeba", "Haneen", "Hussein" ])

		#--> My kids are Teeba, Heneen, and Hussein!
		*/

		if This.ContainsMarkers()
			acMarkers = This.ExtractMarkers()
			// TODO
		ok

	def ContainsMarkers()
		/*
		? StzString('My kids are #1, #2, and #3!').ContainsMarkers() --> TRUE
		*/

		if This.NumberOfMarkers() > 0
			return TRUE
		else
			return FALSE
		ok

	def ExtractMarkers()
		/*
		? StzString('My kids are #1, #2, and #3!').ExtractMarkers()

		# --> [ "#1", "#2", "#3" ]
		*/

		return StzHashListQ( This.ExtractMarkersXT() ).Keys()

	def NumberOfMarkers()
		return len( This.ExtractMarkers() )

	def ExtractMarkersPositions()
		/*
		? StzString('My kids are #1, #2, and #3!').ExtractMarkersXT()

		# --> [ 13, 16, 23 ]
		*/

		return StzHashListQ( This.ExtractMarkersXT() ).Values()

	def ExtractMarkersXT()
		/*
		? StzString('My kids are #1, #2, and #3!').ExtractMarkersXT()

		# --> [ "#1" = 13, "#2" = 16, "#3" = 23 ]
		*/

		def ExtractMArkersAndTheirPositions()
			return This.ExtractMarkersXT()

	  #---------------------------------------------#
	 #    CHECKING IF THE STRING IS A RING CODE    # 
	#---------------------------------------------#

	def IsValidRingCode()

		try
			eval(This.Copy().Content())
			return TRUE
		catch
			return FALSE
		done

		def IsEvaluableRingCode()
			return This.IsValidRingCode()

		def IsRingCode()
			return This.IsValidRingCode()

	  #------------------------------------------------#
	 #    EXECUTING RING CODE HOSTED IN THE STRING    # 
	#------------------------------------------------#

	def Execute()
		if This.IsValidRingCode()
			eval(This.String())
		ok

		def Run()
			This.Execute()

	def ExecuteAndReturn()
		if This.StartsWithCS("return ", :CS = FALSE)
			eval(This.String())
		else
			cCode = "return " + This.String()
			eval(cCode)
		ok

		def RunAndReturn()
			This.ExecuteAndReturn()

	  #----------------------------#
	 #     CLEARING THE STRING    #
	#----------------------------#

	// Clears the string (text becomes "")
	def Clear()
		This.Update("")

		#< @FunctionFluentForm

		// Clears the string and return it as a StzObject
		// to take other actions on it
		def ClearQ()
			This.Clear()
			return This

		#>

	// Verifies if the string text is empty (null, in Ring terms)
	def IsEmpty()
		return This.Content() = ""

	  #---------------------------------------#
	 #      RESIZING, FILLING & UPDATING     #
	#---------------------------------------#

	// Resizes the string and fills the new Chars with cChar
	def Fill(n, cChar)
		// TODO

		#< @FunctionFluentForm

		def FillQ(n, cChar)
			This.Fill(n, cChar)
			return This

		#>
		
	// Sets the size of the string to n Chars
	def Resize(n)
		cResult = NULL

		if n <= NumberOfChars()
			cResult = This.FirstNChars(n)
		else
			cResult = This.ExtendToNChars(n, :Using = " ")
		ok

		This.Update(cResult)
		
		#< @FunctionFluentForm

		def ResizeQ(n)
			This.Resize(n)
			return This
	
		#>

	def ExtendToNChars(n, pcUsingChar)
		if isList(pcUsingChar) and Q(pcUsingChar).IsUsingNamedParam()
			pcUsingChar = pcUsingChar[2]
		ok

		if NOT ( isString(pcUsingChar) and Q(pcUsingChar).IsChar() )
			StzRaise("Incorrect param type! pcUsingChar must be a char.")
		ok

		if n > This.NumberOfChars()
			This.AddSubString( Q(pcUsingChar).RepeatedNTimes(n) )
		ok

	def AddSubString(pcSubStr)
		This.Update( :With = This.Content() + pcSubStr )

	def AddChar(c)
		if isString(c) and Q(c).IsChar()
			This.AddSubString(c)
		else
			stzRaise("Incorrect param type! c must be a char.")
		ok

	// Updates the string with a new text
	def Update(pcNewText)
		if isList(pcNewText) and
		   ( StzListQ(pcNewText).IsWithNamedParam() or StzListQ(pcNewText).IsUsingNamedParam() )

			pcNewText = pcNewText[2]

		ok
	
		@oQString.clear()
		@oQString.append(pcNewText)

		//This.VerifyConstraints()

		#< @FunctionAlternativeForms

		def UpdateWith(cNewText)
			This.Update(cNewText)

		#>

		#< @FunctionFluentForm	

		def UpdateQ(cNewText)
			This.Update()
			return This

			#< @FunctionAlternativeForms

			def UpdateWithQ(cNewText)
				This.UpdateWith(cNewText)
				return This		

			#>

		#>

	  #----------------------------------------#
	 #     CONTAINING ONLY SPACES & LETTERS   #
	#----------------------------------------#

	// Verifies if the string contains only spaces
	def ContainsOnlySpaces()
		if This.content() = ""
			return FALSE
		ok

		bResult = TRUE

		for i = 1 to This.NumberOfChars()
			c = This.NthChar(i)

			if c != " "
				bResult = FALSE
				exit
			ok
		next

		return bResult

	def ContainsOnlyLetters()
		bResult = TRUE

		for i = 1 to This.NumberOfChars()
			if NOT This.CharAtQ(i).IsLetter()
				bResult = FALSE
				exit
			ok
		next

		return bResult

	  #-----------------------------------------#
	 #      STARTS OR ENDS WITH A SUBSTRING    #
	#-----------------------------------------#

	// Verifies if the string begins with a given substring

	def StartsWithCS(pcSubStr, pCaseSensitive)

		if isList(pCaseSensitive) and StzListQ(pCaseSensitive).IsCaseSensitiveNamedParam()
			pCaseSensitive = pCaseSensitive[2]
		ok

		if NOT ( isNumber(pCaseSensitive) and
			( pCaseSensitive = 0 or pCaseSensitive = 1 ) )

			stzRaise("Invalid param. pCaseSensitive must be 0 or 1 (TRUE or FALSE).")

		else
			bResult = @oQString.startsWith(pcSubStr, pCaseSensitive)
			return bResult
		ok

		def BeginsWithCS(pcSubStr, pCaseSensitive)
			return This.StartsWithCS(pcSubStr, pCaseSensitive)

	def StartsWith(pcSubStr)
		return @oQString.startsWith(pcSubStr, 0)

		def BeginsWith(pcSubStr)
			return This.StartsWith(pcSubStr)

	def BeginsWithOneOfTheseCS(paSubStr, pCaseSensitive)
		bResult = FALSE

		for cSubStr in paSubStr
			if This.BeginsWithCS(cSubStr, pCaseSensitive)
				bResult = TRUE
				exit
			ok
		next

		return bResult

		def StartsWithOneOfTheseCS(paSubStr, pCaseSensitive)
			return This.BeginsWithOneOfTheseCS(paSubStr, pCaseSensitive)

	def BeginsWithOneOfThese(paSubStr)
		return This.BeginsWithOneOfTheseCS(paSubStr, :CaseSensitive = TRUE)

		def StartsWithOneOfThese(paSubStr)
			return This.BeginsWithOneOfThese(paSubStr)

	// Verifies if the string begins with a given substring
	def EndsWithCS(pcSubStr, pCaseSensitive)
		if isList(pCaseSensitive) and StzListQ(pCaseSensitive).IsCaseSensitiveNamedParam()
			pCaseSensitive = pCaseSensitive[2]
		ok

		if NOT ( isNumber(pCaseSensitive) and
			( pCaseSensitive = 0 or pCaseSensitive = 1 ) )

			stzRaise("Invalid param. pCaseSensitive must be TRUE or FALSE (0 or 1).")

		else

			bResult = @oQString.endsWith(pcSubStr, pCaseSensitive)
			return bResult
		ok

		def FinishsWithCS(pcSubStr, pCaseSensitive)
				return This.EndsWithCS(pcSubStr, pCaseSensitive)

	def EndsWith(pcSubStr)
		return @oQString.endsWith(pcSubStr, 0)

		def FinishsWith(pcSubStr)
			return This.EndsWith()

	def EndsWithOneOfTheseCS(paSubStr, pCaseSensitive)
		bResult = FALSE

		for cSubStr in paSubStr
			if This.EndsWithCS(cSubStr, pCaseSensitive)
				bResult = TRUE
				exit
			ok
		next

		return bResult

		def FinishsWithOneOfTheseCS(paSubStr, pCaseSensitive)
			return This.EndsWithOneOfTheseCS(paSubStr, pCaseSensitive)

	def endsWithOneOfThese(paSubStr)
		return This.BeginsWithOneOfTheseCS(paSubStr, :CaseSensitive = TRUE)

		def FinsihsWithOneOfThese(paSubStr)
			return This.EndsWithOneOfThese(paSubStr)

	  #----------------------------------------------------#
	 #  GETTING THE SUBSTRING OCCURRENCE BY ITS POSITION  #
	#----------------------------------------------------#

	def SubStringOccurrenceByPositionCS(nPos, pcSubStr, pCaseSensitive)
		/* EXAMPLE
		o1 = new stzString("ring __ ring __ ring __ ring")
		? o1.SubStringOccurrenceByPosition(9, "ring") #--> 2
		*/

		nResult = 0

		anPositions = This.FindSubStringCS(pcSubStr, pCaseSensitive)
		i = 0
		for n in anPositions
			i++
			if n = nPos
				nResult = i
				exit
			ok
		next

		return nResult

	#-- WITHOUT CASESENSITIVITY

	def SubStringOccurrenceByPosition(nPos, pcSubStr)
		return This.SubStringOccurrenceByPositionCS(nPos, pcSubStr, :CaseSensitive = TRUE)

	  #---------------------------------------------#
	 #   FINDING THE NTH OCCURRENCE OF SUBSTRING   #
	#---------------------------------------------#

	def NthOccurrenceCS(n, pcSubstr, pCaseSensitive) # --> Returns 0 if nothing found

		if isList(pcSubStr) and StzListQ(pcSubStr).IsOfNamedParam()
			pcSubStr = pcSubStr[2]
		ok

		if NOT isString(pcSubStr)
			stzRaise("Incorrect param type! pcSubStr must be as a string.")
		ok

		if isString(n)
			if Q(n).Lowercased() = "first"
				n = 1

			but Q(n).Lowercased() = "last"
				n = This.NumberOfOccurrenceCs(pcSubStr, pCaseSensitive)

			else
				n = 0
			ok
		ok

		nResult = 0

		nPos = 1
		for i = 1 to n
			nResult = This.FindFirstXTCS(pcSubStr, :StartingAt = nPos, pCaseSensitive)
			if nResult = 0
				exit
			ok

			nPos = nResult + 1
		next

		return nResult

		#< @FunctionAlternativeForm

		def FindNthOccurrenceCS(n, pcSubstr, pCaseSensitive)
			return This.NthOccurrenceCS(n, pcSubstr, pCaseSensitive)

		def PositionOfNthOccurrenceCS(n, pcSubstr, pCaseSensitive)
			return This.NthOccurrenceCS(n, pcSubstr, pCaseSensitive)

		def NthOccurrencePositionCS(n, pcSubstr, pCaseSensitive)
			return This.NthOccurrenceCS(n, pcSubstr, pCaseSensitive)

		def SubStringPositionByOccurrenceCS(n, pcSubStr, pCaseSensitive)
			return This.NthOccurrenceCS(n, pcSubstr, pCaseSensitive)

		def FindSubStringByOccurrenceCS(n, pcSubStr, pCaseSensitive)
			return This.NthOccurrenceCS(n, pcSubstr, pCaseSensitive)

		def NthCS(n, pcSubStr, pCaseSensitive)
			return This.NthOccurrenceCS(n, pcSubstr, pCaseSensitive)

		def FindNthCS(n, pcSubStr, pCaseSensitive)
			return This.NthOccurrenceCS(n, pcSubstr, pCaseSensitive)

		#>

	def NthOccurrence(n, pcSubstr)
		return This.NthOccurrenceCS(n, pcSubStr, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForm

		def FindNthOccurrence(n, pcSubstr)
			return This.NthOccurrence(n, pcSubStr)
	
		def PositionOfNthOccurrence(n, pcSubstr)
			return This.NthOccurrence(n, pcSubstr)

		def NthOccurrencePosition(n, pcSubstr)
			return This.NthOccurrence(n, pcSubstr)

		def SubStringPositionByOccurrence(n, pcSubStr)
			return This.NthOccurrence(n, pcSubstr)

		def FindSubStringByOccurrence(n, pcSubStr)
			return This.NthOccurrence(n, pcSubstr)

		def Nth(n, pcSubStr)
			return This.NthOccurrence(n, pcSubstr)

		def FindNth(n, pcSubStr)
			return This.NthOccurrence(n, pcSubstr)

		#>

	  #-----------------------------------------------------------------------#
	 # FINDING FIRST OCCURRENCE OF A SUBSTRING STARTING AT A GIVEN POSITION  #
	#-----------------------------------------------------------------------#

	def FindFirstOccurrenceXTCS(pcSubStr, pnStartingAt, pCaseSensitive)

		if isList(pcSubStr) and StzListQ(pcSubStr).IsOfNamedParam()
			pcSubStr = pcSubStr[2]
		ok

		if NOT isString(pcSubStr)
			stzRaise("Incorrect param type! pcSubStr must be a string.")
		ok

		if isList(pnStartingAt) and Q(pnStartingAt).IsStartingAtNamedParam()
			pnStartingAt = pnStartingAt[2]
		ok

		if NOT isNumber(pnStartingAt)
			stzRaise("Incorrect param type! pnStartingAt must be a number.")
		ok

		nPos = 0 
		aResult = []

		if isList(pCaseSensitive) and StzListQ(pCaseSensitive).IsCaseSensitiveNamedParam()
			pCaseSensitive = pCaseSensitive[2]
		ok

		if NOT 	isNumber(pCaseSensitive) and
			( pCaseSensitive = 0 or pCaseSensitive = 1 )

			stzRaise("Invalid param. pCaseSensitive must be TRUE or FALSE (0 or 1).")

		ok
				
		nResult = This.QStringObject().indexOf(pcSubStr, pnStartingAt - 1, pCaseSensitive) + 1
		return nResult

		#< @FunctionAlternativeForms

		def FindFirstXTCS(pcSubStr, pnStartingAt, pCaseSensitive)
			return This.FindFirstOccurrenceXTCS(pcSubStr, pnStartingAt, pCaseSensitive)

		def FirstOccurrenceXTCS(pcSubStr, pnStartingAt, pCaseSensitive)
			return This.FindFirstOccurrenceXTCS(pcSubStr, pnStartingAt, pCaseSensitive)

		def FindFirstSubStringCSXT(pcSubStr, pnStartingAt, pCaseSensitive)
			return This.FindFirstOccurrenceCSXT(pcSubStr, pnStartingAt, pCaseSensitive)

		def FirstSubStringCSXT(pcSubStr, pnStartingAt, pCaseSensitive)
			return This.FindFirstOccurrenceXTCS(pcSubStr, pnStartingAt, pCaseSensitive)

		#--

		def PositionOfFirstOccurrenceXTCS(pcSubStr, pnStartingAt, pCaseSensitive)
			return This.FindFirstOccurrenceXTCS(pcSubStr, pnStartingAt, pCaseSensitive)

		def FirstOccurrencePositionXTCS(pcSubStr, pnStartingAt, pCaseSensitive)
			return This.FindFirstOccurrenceXTCS(pcSubStr, pCaseSensitive)

		def PositionOfFirstXTCS(pcSubStr, pnStartingAt, pCaseSensitive)
			return This.FindFirstOccurrenceXTCS(pcSubStr, pnStartingAt, pCaseSensitive)

		def PositionOfFirstSubStringXTCS(pcSubStr, pnStartingAt, pCaseSensitive)
			return This.FindFirstOccurrenceXTCS(pcSubStr, pnStartingAt, pCaseSensitive)

		def FirstSubStringPositionXTCS(pcSubStr, pnStartingAt, pCaseSensitive)
			return This.FindFirstOccurrenceXTCS(pcSubStr, pnStartingAt, pCaseSensitive)

		def FirstXTCS(pcSubStr, pnStartingAt, pCaseSensitive)
			return This.FindFirstOccurrenceXTCS(pcSubStr, pnStartingAt, pCaseSensitive)
		#>

	#-- WITHOUT CASESENSITIVITY

	def FindFirstOccurrenceXT(pcSubstr, pnStartingAt)
		return This.FindFirstOccurrenceXTCS(pcSubstr, pnStartingAt, :CaseSensitive = TRUE)
	
		#< @FunctionAlternativeForms
	
		def FindFirstXT(pcSubStr, pnStartingAt)
			return This.FindFirstOccurrenceXT(pcSubStr, pnStartingAt)

		def FirstOccurrenceXT(pcSubStr, pnStartingAt)
			return This.FindFirstOccurrenceXT(pcSubStr, pnStartingAt)

		def FindFirstSubStringXT(pcSubStr, pnStartingAt)
			return This.FindFirstOccurrenceXT(pcSubStr, pnStartingAt)

		def FirstSubStringXT(pcSubStr, pnStartingAt)
			return This.FindFirstOccurrenceXT(pcSubStr, pnStartingAt)

		def FirstXT(pcSubStr, pnStartingAt)
			return This.FindFirstOccurrenceXT(pcSubStr, pnStartingAt)

		#--

		def PositionOfFirstOccurrenceXT(pcSubStr, pnStartingAt)
			return This.FindFirstOccurrenceXT(pcSubStr, pnStartingAt)

		def FirstOccurrencePositionXT(pcSubStr, pnStartingAt)
			return This.FindFirstOccurrenceXT(pcSubStr, pnStartingAt)

		def PositionOfFirstXT(pcSubStr, pnStartingAt)
			return This.FindFirstOccurrenceXT(pcSubStr, pnStartingAt)

		def PositionOfFirstSubStringXT(pcSubStr, pnStartingAt)
			return This.FindFirstOccurrenceXT(pcSubStr, pnStartingAt)

		def FirstSubStringPositionXT(pcSubStr, pnStartingAt)
			return This.FindFirstOccurrenceXT(pcSubStr, pnStartingAt)
	
		#>

	  #---------------------------------------------------#
	 #      FINDING FIRST OCCURRENCE OF A SUBSTRING      #
	#---------------------------------------------------#

	// Returns the position of the 1st occurrence of the substring inside the string
	// or returns 0 if nothing found

	def FindFirstOccurrenceCS(pcSubStr, pCaseSensitive)
		return This.FindFirstOccurrenceXTCS(pcSubStr, 1, pCaseSensitive)

		#< @FunctionAlternativeForms

		def FindFirstCS(pcSubStr, pCaseSensitive)
			return This.FindFirstOccurrenceCS(pcSubStr, pCaseSensitive)

		def FirstOccurrenceCS(pcSubStr, pCaseSensitive)
			return This.FindFirstOccurrenceCS(pcSubStr, pCaseSensitive)

		def FindFirstSubStringCS(pcSubStr, pCaseSensitive)
			return This.FindFirstOccurrenceCS(pcSubStr, pCaseSensitive)

		def FirstSubStringCS(pcSubStr, pCaseSensitive)
			return This.FindFirstOccurrenceCS(pcSubStr, pCaseSensitive)

		#--

		def PositionOfFirstOccurrenceCS(pcSubStr, pCaseSensitive)
			return This.FindFirstOccurrenceCS(pcSubStr, pCaseSensitive)

		def FirstOccurrencePositionCS(pcSubStr, pCaseSensitive)
			return This.FindFirstOccurrenceCS(pcSubStr, pCaseSensitive)

		def PositionOfFirstCS(pcSubStr, pCaseSensitive)
			return This.FindFirstOccurrenceCS(pcSubStr, pCaseSensitive)

		def PositionOfFirstSubStringCS(pcSubStr, pCaseSensitive)
			return This.FindFirstOccurrenceCS(pcSubStr, pCaseSensitive)

		def FirstSubStringPositionCS(pcSubStr, pCaseSensitive)
			return This.FindFirstOccurrenceCS(pcSubStr, pCaseSensitive)

		def FirstCS(pcSubStr)
			return This.FindFirstOccurrenceCS(pcSubStr, pCaseSensitive)
		#>

	#-- WITHOUT CASESENSITIVITY

	def FindFirstOccurrence(pcSubstr)
		return This.FindFirstOccurrenceCS(pcSubstr, :CaseSensitive = TRUE)
	
		#< @FunctionAlternativeForms
	
		def FindFirst(pcSubStr)
			return This.FindFirstOccurrence(pcSubStr)

		def FirstOccurrence(pcSubStr)
			return This.FindFirstOccurrence(pcSubStr)

		def FindFirstSubString(pcSubStr)
			return This.FindFirstOccurrence(pcSubStr)

		def FirstSubString(pcSubStr)
			return This.FindFirstOccurrence(pcSubStr)

		def First(pcSubStr)
			return This.FindFirstOccurrence(pcSubStr)

		#--

		def PositionOfFirstOccurrence(pcSubStr)
			return This.FindFirstOccurrence(pcSubStr)

		def FirstOccurrencePosition(pcSubStr)
			return This.FindFirstOccurrence(pcSubStr)

		def PositionOfFirst(pcSubStr)
			return This.FindFirstOccurrence(pcSubStr)

		def PositionOfFirstSubString(pcSubStr)
			return This.FindFirstOccurrence(pcSubStr)

		def FirstSubStringPosition(pcSubStr)
			return This.FindFirstOccurrence(pcSubStr)
	
		#>

	  #-------------------------------------------------#
	 #      FINDING LAST OCCURRENCE OF A SUBSTRING     #
	#-------------------------------------------------#

	def FindLastOccurrenceCS(pcSubstr, pCaseSensitive)
		if isList(pcSubStr) and StzListQ(pcSubStr).IsOfNamedParam()
			pcSubStr = pcSubStr[2]
		ok
	
		n = This.Copy().ReverseQ().FindFirstCS(pcSubStr, pCaseSensitive)
		if n = 0
			nResult = 0
		else
			nResult = This.NumberOfChars() - n + 1
		ok

		return nResult


		#< @FunctionAlternativeForm
	
		def FindLastCS(pcSubStr, pCaseSensitive)
			return This.FindLastOccurrenceCS(pcSubStr, pCaseSensitive)

		def LastOccurrenceCS(pcSubStr, pCaseSensitive)
			return This.FindFirstOccurrenceCS(pcSubStr, pCaseSensitive)

		def FindLastSubStringCS(pcSubStr, pCaseSensitive)
			return This.FindLastOccurrenceCS(pcSubStr, pCaseSensitive)

		def LastSubStringCS(pcSubStr, pCaseSensitive)
			return This.FindLastOccurrenceCS(pcSubStr, pCaseSensitive)
			
		def LastCS(pcSubStr, pCaseSensitive)
			return This.FindLastOccurrenceCS(pcSubStr, pCaseSensitive)

		#--

		def PositionOfLastOccurrenceCS(pcSubStr, pCaseSensitive)
			return This.FindLastOccurrenceCS(pcSubStr, pCaseSensitive)

		def LastOccurrencePositionCS(pcSubStr, pCaseSensitive)
			return This.FindLastOccurrenceCS(pcSubStr, pCaseSensitive)

		def PositionOfLastCS(pcSubStr, pCaseSensitive)
			return This.FindLastOccurrenceCS(pcSubStr, pCaseSensitive)

		def PositionOfLastSubStringCS(pcSubStr, pCaseSensitive)
			return This.FindLastOccurrenceCS(pcSubStr, pCaseSensitive)

		def LastSubStringPositionCS(pcSubStr, pCaseSensitive)
			return This.FindLastOccurrenceCS(pcSubStr, pCaseSensitive)

		#>

	def FindLastOccurrence(pcSubStr)
		return This.FindLastOccurrenceCS(pcSubStr, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def FindLast(pcSubStr)
			return This.FindLastOccurrence(pcSubStr)

		def LastOccurrence(pcSubStr)
			return This.FindLastOccurrence(pcSubStr)

		def FindLastSubString(pcSubStr)
			return This.FindLastOccurrence(pcSubStr)

		def LastSubString(pcSubStr)
			return This.FindLastOccurrence(pcSubStr)

		def Last(pcSubStr)
			return This.FindLastOccurrence(pcSubStr)

		#--

		def PositionOfLastOccurrence(pcSubStr)
			return This.FindLastOccurrence(pcSubStr)

		def LastOccurrencePosition(pcSubStr)
			return This.FindLastOccurrence(pcSubStr)

		def PositionOfLast(pcSubStr)
			return This.FindLastOccurrence(pcSubStr)

		def PositionOfLastSubString(pcSubStr)
			return This.FindLastOccurrence(pcSubStr)

		def LastSubStringPosition(pcSubStr)
			return This.FindLastOccurrence(pcSubStr)

		#>

	  #----------------------------------------------------#
	 #   FINDING THE FIRST N OCCURRENCES OF A SUBSTRING   #
	#----------------------------------------------------#

	def FindFirstNOccurrencesCS(n, pcSubStr, pCaseSensitive)
		if NOT isNumber(n)
			stzRaise("Incorrect param type! n must be a number.")
		ok

		if NOT n > 0
			stzRaise("Incorrect value! n must be a positive non null number.")
		ok

		anResult = []

		for i = 1 to n
			anResult + This.FindNthOccurrenceCS(i, pcSubStr, pCaseSensitive)
		next

		return anResult

		#< @FunctionAlternativeForms

		def FindNFirstOccurrencesCS(n, pcSubStr, pCaseSensitive)
			return This.FindFirstNOccurrencesCS(n, pcSubStr, pCaseSensitive)

		def PositionsOfFirstNOccurrencesCS(n, pcSubStr, pCaseSensitive)
			return This.FindFirstNOccurrencesCS(n, pcSubStr, pCaseSensitive)

		def PositionsOfNFirstOccurrencesCS(n, pcSubStr, pCaseSensitive)
			return This.FindFirstNOccurrencesCS(n, pcSubStr, pCaseSensitive)

		def FirstNthCS(n, pcSubStr, pCaseSensitive)
			return This.FindFirstNOccurrencesCS(n, pcSubStr, pCaseSensitive)

		def NthFirstCS(n, pcSubStr, pCaseSensitive)
			return This.FindFirstNOccurrencesCS(n, pcSubStr, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def FindFirstNOccurrences(n, pcSubStr)
		return This.FindFirstNOccurrencesCS(n, pcSubStr, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def FindNFirstOccurrences(n, pcSubStr)
			return This.FindFirstNOccurrences(n, pcSubStr)

		def PositionsOfFirstNOccurrences(n, pcSubStr)
			return This.FindFirstNOccurrences(n, pcSubStr)

		def PositionsOfNFirstOccurrences(n, pcSubStr)
			return This.FindFirstNOccurrences(n, pcSubStr)

		def FirstNth(n, pcSubStr)
			return This.FindFirstNOccurrences(n, pcSubStr)

		def NthFirst(n, pcSubStr)
			return This.FindFirstNOccurrences(n, pcSubStr)

		#>

	  #---------------------------------------------------#
	 #   FINDING THE LAST N OCCURRENCES OF A SUBSTRING   #
	#---------------------------------------------------#

	def FindLastNOccurrencesCS(n, pcSubStr, pCaseSensitive)

		anPos = This.Copy().ReverseQ().FindFirstNOccurrencesCS(n, pcSubStr, pCaseSensitive)

		nLen = This.NumberOfChars()
		for n in anPos
			n = nLen - n + 1
		next

		anResult = ring_reverse(anPos)
		return anResult

		def FindNLastOccurrencesCS(n, pcSubStr, pCaseSensitive)
			return This.FindLastNOccurrencesCS(n, pcSubStr, pCaseSensitive)

		def PositionsOfLastNOccurrencesCS(n, pcSubStr, pCaseSensitive)
			return This.FindLastNOccurrencesCS(n, pcSubStr, pCaseSensitive)

		def PositionsOfNLastOccurrencesCS(n, pcSubStr, pCaseSensitive)
			return This.FindLastNOccurrencesCS(n, pcSubStr, pCaseSensitive)

		def LastNthCS(n, pcSubStr)
			return This.FindLastNOccurrencesCS(n, pcSubStr, pCaseSensitive)

		def NthLastCS(n, pcSubStr)
			return This.FindLastNOccurrencesCS(n, pcSubStr, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def FindLastNOccurrences(n, pcSubStr)
		return This.FindLastNOccurrencesCS(n, pcSubStr, :CaseSensitive = TRUE)

		def FindNLastOccurrences(n, pcSubStr)
			return This.FindLastNOccurrences(n, pcSubStr)

		def PositionsOfLastNOccurrences(n, pcSubStr)
			return This.FindLastNOccurrences(n, pcSubStr)

		def PositionsOfNLastOccurrences(n, pcSubStr)
			return This.FindLastNOccurrences(n, pcSubStr)

		def LastNth(n)
			return This.FindLastNOccurrences(n, pcSubStr)

		def NthLast(n)
			return This.FindLastNOccurrences(n, pcSubStr)

	  #--------------------------------------------------------------------#
	 #   FINDING THE POSITIONS OF SOME OCCURRENCES OF A GIVEN SUBSTRING   #
	#--------------------------------------------------------------------#

	def FindOccurrencesCS(panOccurr, pcSubStr, pCaseSensitive)
		/* EXAMPLE
		o1 = new stzString("ring __ ring __ ring __ ring")
		? o1.FindOccurrences([ 2, 3 ], "ring") #--> [ 9, 17 ]
		*/

		anPositions = This.FindAllCS(pcSubStr, pCaseSensitive)
		anResult = Q(anPositions).ItemsAt(panOccurr)
		return anResult

		#< @FunctionFluentForms

		def FindOccurrencesCSQ(panOccurr, pcSubStr, pCaseSensitive)
				return This.FindOccurrencesCSQR(panOccurr, pcSubStr, :stzList, pCaseSensitive)
				
		def FindOccurrencesCSQR(panOccurr, pcSubStr, pcReturnType, pCaseSensitive)
			if isList(pcReturnType) and Q(pcReturnType).IsReturnedAs(pcReturnType)
				pcReturnType = pcReturnType[2]
			ok
		
			switch pcReturnType
			on :stzList
				return new stzList( This.FindOccurrencesCS(panOccurr, pcSubStr, pCaseSensitive) )
		
			on :stzListOfNumbers
				return new stzListOfNumbers( This.FindOccurrencesCS(panOccurr, pcSubStr, pCaseSensitive) )
		
			on :stzPair
				return new stzPair( This.FindOccurrencesCS(panOccurr, pcSubStr, pCaseSensitive) )
		
			on :stzPairOfNumbers
				return new stzPairOfNumbers( This.FindOccurrencesCS(panOccurr, pcSubStr, pCaseSensitive) )
		
			other
				stzRaise("Unsupported return type!")
			off

		#>

		#< @FunctionAlternativeForms

		def FindTheseOccurrencesCS(panOccurr, pcSubStr, pCaseSensitive)
			return This.FindOccurrencesCS(panOccurr, pcSubStr, pCaseSensitive)

			def FindTheseOccurrencesCSQ(panOccurr, pcSubStr, pCaseSensitive)
				return This.FindOccurrencesCSQR(panOccurr, pcSubStr, :stzList, pCaseSensitive)
					
			def FindTheseOccurrencesCSQR(panOccurr, pcSubStr, pcReturnType, pCaseSensitive)
				return  This.FindOccurrencesCSQR(panOccurr, pcSubStr, pcReturnType, pCaseSensitive)
	
		#>

	#-- WTHOUT CASESENSITIVITY

	def FindOccurrences(panOccurr, pcSubStr)
		return This.FindOccurrencesCS(panOccurr, pcSubStr, :CaseSensitive = TRUE)

		#< @FunctionFluentForms

		def FindOccurrencesQ(panOccurr, pcSubStr)
				return This.FindOccurrencesQR(panOccurr, pcSubStr, :stzList)
				
		def FindOccurrencesQR(panOccurr, pcSubStr, pcReturnType)

		#>

		#< @FunctionAlternativeForms

		def FindTheseOccurrences(panOccurr, pcSubStr)
			return This.FindOccurrences(panOccurr, pcSubStr)

			def FindTheseOccurrencesQ(panOccurr, pcSubStr)
				return This.FindOccurrencesQR(panOccurr, pcSubStr, :stzList)
					
			def FindTheseOccurrencesQR(panOccurr, pcSubStr, pcReturnType)
				return  This.FindOccurrencesCSQR(panOccurr, pcSubStr, pcReturnType, pCaseSensitive)
	
		#>

	   #---------------------------------------------#
	  #   FINDING NEXT OCCURRENCES OF A SUBSTRING   #
	 #   STARTING AT A GIVEN POSITION              #
	#---------------------------------------------#

	def FindNextOccurrencesCS(pcSubStr, pnStartingAt, pCaseSensitive)
		if isList(pnStartingAt) and StzListQ(pnStartingAt).IsStartingAtNamedParam()
			pnStartingAt = pnStartingAt[2]
		ok

		oSection = This.SectionQ(pnStartingAt, :LastChar)

		anPositions = oSection.FindAllCS(pcSubStr, pCaseSensitive)
		
		anResult = StzListOfNumbersQ(anPositions).AddToEachQ(pnStartingAt).Content()

		return anResult

		#< @FunctionAlternativeForms

		def NextOccurrencesCS(pcSubStr, pnStartingAt, pCaseSensitive)
			return This.FindNextOccurrencesCS(pcSubStr, pnStartingAt, pCaseSensitive)

		def NextPositionsCS(pcSubStr, pnStartingAt, pCaseSensitive)
			return This.FindNextOccurrencesCS(pcSubStr, pnStartingAt, pCaseSensitive)

		def FindNextOccurrencesOfSubStringCS(pcSubStr, pnStartingAt, pCaseSensitive)
			return This.FindNextOccurrencesCS(pcSubStr, pnStartingAt, pCaseSensitive)

		def NextPositionsOfSubStringCS(pcSubStr, pnStartingAt, pCaseSensitive)
			return This.FindNextOccurrencesCS(pcSubStr, pnStartingAt, pCaseSensitive)

		#>
		
	def FindNextOccurrences(pcSubStr, pnStartingAt)
		aResult = This.FindNextOccurrencesCS(pcSubStr, pnStartingAt, :CaseSensitive = TRUE)
		return aResult

		#< @FunctionAlternativeForms

		def NextOccurrences(pcSubStr, pnStartingAt)
			return This.FindNextOccurrences(pcSubStr, pnStartingAt)

		def NextPositions(pcSubStr, pnStartingAt)
			return This.FindNextOccurrences(pcSubStr, pnStartingAt)

		def FindNextOccurrencesOfSubString(pcSubStr, pnStartingAt)
			return This.FindNextOccurrences(pcSubStr, pnStartingAt)

		def NextPositionsOfSubString(pcSubStr, pnStartingAt)
			return This.FindNextOccurrences(pcSubStr, pnStartingAt)

		#>

	   #-------------------------------------------------#
	  #   FINDING PREVIOUS OCCURRENCES OF A SUBSTRING   #
	 #   STARTING AT A GIVEN POSITION                  #
	#-------------------------------------------------#

	def FindPreviousOccurrencesCS(pcSubStr, pnStartingAt, pCaseSensitive)
		if isList(pnStartingAt) and StzListQ(pnStartingAt).IsStartingAtNamedParam()
			pnStartingAt = pnStartingAt[2]
		ok

		oSection = This.SectionQ(1, pnStartingAt)

		anPositions = oSection.FindAllCS(pcSubStr, pCaseSensitive)
		
		return anPositions

		#< @FunctionAlternativeForms

		def PreviousOccurrencesCS(pcSubStr, pnStartingAt, pCaseSensitive)
			return This.FindPreviousOccurrencesCS(pcSubStr, pnStartingAt, pCaseSensitive)

		def PreviousPositionsCS(pcSubStr, pnStartingAt, pCaseSensitive)
			return This.FindPreviousOccurrencesCS(pcSubStr, pnStartingAt, pCaseSensitive)

		def FindPreviousOccurrencesOfSubStringCS(pcSubStr, pnStartingAt, pCaseSensitive)
			return This.FindPreviousOccurrencesCS(pcSubStr, pnStartingAt, pCaseSensitive)

		def PreviousPositionsOfSubStringCS(pcSubStr, pnStartingAt, pCaseSensitive)
			return This.FindPreviousOccurrencesCS(pcSubStr, pnStartingAt, pCaseSensitive)

		#>

	def FindPreviousOccurrences(pcSubStr, pnStartingAt)
		aResult = This.FindPreviousOccurrencesCS(pcSubStr, pnStartingAt, :CaseSensitive = TRUE)
		return aResult

		#< @FunctionAlternativeForms

		def PreviousOccurrences(pcSubStr, pnStartingAt)
			return This.FindPreviousOccurrences(pcSubStr, pnStartingAt)

		def PreviousPositionsC(pcSubStr, pnStartingAt)
			return This.FindPreviousOccurrences(pcSubStr, pnStartingAt)

		def FindPreviousOccurrencesOfSubString(pcSubStr, pnStartingAt)
			return This.FindPreviousOccurrences(pcSubStr, pnStartingAt)

		def PreviousPositionsOfSubString(pcSubStr, pnStartingAt)
			return This.FindPreviousOccurrencesC(pcSubStr, pnStartingAt)

		#>

	   #-----------------------------------------------------#
	  #      FINDING NTH NEXT OCCURRENCE OF A SUBSTRING     #
	 #      STARTING AT A GIVEN POSITION                   #
	#-----------------------------------------------------#

	def FindNthNextOccurrenceCS( n, pcSubStr, nStart, pCaseSensitive )
		if isList(pcSubStr) and StzListQ(pcSubStr).IsOfNamedParam()
			pcSubStr = pcSubStr[2]
		ok

		if isList(nStart) and StzListQ(nStart).IsStartingAtNamedParam()
			nStart = nStart[2]
		ok

		oString = This.SectionQ(nStart, :LastChar)

		nNumberOfOccurrences = oString.NumberOfOccurrenceCS( pcSubStr, pCaseSensitive )

		if n > 0 and n <= nNumberOfOccurrences and
		   nStart > 0 and nStart <= This.NumberOfChars()

			nResult = oString.FindNthOccurrenceCS(n, pcSubStr, pCaseSensitive) + nStart - 1
			return nResult

		else
			return 0
		ok

		def FindNextNthOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)
			return This.FindNthNextOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)

		def FindNextNthCS(n, pcSubStr, nStart, pCaseSensitive)
			return This.FindNthNextOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)

		def FindNthNextCS(n, pcSubStr, nStart, pCaseSensitive)
			return This.FindNthNextOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)

		def PositionOfNthNextOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)
			return This.FindNthNextOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)

		def PositionOfNextNthOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)
			return This.FindNthNextOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)

		def PositionOfNextNthCS(n, pcSubStr, nStart, pCaseSensitive)
			return This.FindNthNextOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)

		def PositionOfNthNextCS(n, pcSubStr, nStart, pCaseSensitive)
			return This.FindNthNextOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)

		def NthNextOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)
			return This.FindNthNextOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)

		def NextNthOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)
			return This.FindNthNextOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)

	def FindNthNextOccurrence(n, pcSubStr, nStart)
		return This.FindNthNextOccurrenceCS(n, pcSubStr, nStart, :CaseSensitive = TRUE)

		def FindNextNthOccurrence(n, pcSubStr, nStart)
			return This.FindNthNextOccurrence(n, pcSubStr, nStart)

		def FindNextNth(n, pcSubStr, nStart)
			return This.FindNthNextOccurrence(n, pcSubStr, nStart)

		def FindNthNext(n, pcSubStr, nStart)
			return This.FindNthNextOccurrence(n, pcSubStr, nStart)

		def PositionOfNthNextOccurrence(n, pcSubStr, nStart)
			return This.FindNthNextOccurrence(n, pcSubStr, nStart)

		def PositionOfNextNthOccurrence(n, pcSubStr, nStart)
			return This.FindNthNextOccurrence(n, pcSubStr, nStart)

		def PositionOfNextNth(n, pcSubStr, nStart)
			return This.FindNthNextOccurrence(n, pcSubStr, nStart)

		def PositionOfNthNext(n, pcSubStr, nStart)
			return This.FindNthNextOccurrence(n, pcSubStr, nStart)

		def NthNextOccurrence(n, pcSubStr, nStart)
			return This.FindNthNextOccurrence(n, pcSubStr, nStart)

		def NextNthOccurrence(n, pcSubStr, nStart)
			return This.FindNthNextOccurrence(n, pcSubStr, nStart)

	   #---------------------------------------------------------#
	  #      FINDING NTH PREVIOUS OCCURRENCE OF A SUBSTRING     #
	 #      STARTING AT A GIVEN POSITION                       #
	#---------------------------------------------------------#

	def FindNthPreviousOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)

		if isList(pcSubStr) and StzListQ(pcSubStr).IsOfNamedParam()
			pcSubStr = pcSubStr[2]
		ok

		if isList(nStart) and StzListQ(nStart).IsStartingAtNamedParam()
			nStart = nStart[2]
		ok

		oString = This.SectionQ(1, nStart)

		anPositions = oString.FindAllCS(pcSubStr, pCaseSensitive)
		nNumberOfOccurrences = len(anPositions)

		if nNumberOfOccurrences = 0 or n > nNumberOfOccurrences
			return 0
		else
			return anPositions[ nNumberOfOccurrences - n + 1 ]
		ok

		#< @FunctionAlternativeForms

		def FindPreviousNthOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)
			return This.FindNthPreviousOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)

		def FindPreviousNthCS(n, pcSubStr, nStart, pCaseSensitive)
			return This.FindNthPreviousOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)

		def FindNthPreviousCS(n, pcSubStr, nStart, pCaseSensitive)
			return This.FindNthPreviousOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)

		def PositionOfNthPreviousOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)
			return This.FindNthPreviousOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)

		def PositionOfPreviousNthOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)
			return This.FindNthPreviousOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)

		def PositionOfPreviousNthCS(n, pcSubStr, nStart, pCaseSensitive)
			return This.FindNthPreviousOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)

		def PositionOfNthPreviousCS(n, pcSubStr, nStart, pCaseSensitive)
			return This.FindNthPreviousOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)

		def NthPreviousOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)
			return This.FindNthPreviousOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)

		def PreviousNthOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)
			return This.FindNthPreviousOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)

	def FindNthPreviousOccurrence(n, pcSubStr, nStart)
		return This.FindNthPreviousOccurrenceCS(n, pcSubStr, nStart, :CaseSensitive = TRUE)

		def FindPreviousNthOccurrence(n, pcSubStr, nStart)
			return This.FindNthPreviousOccurrence(n, pcSubStr, nStart)

		def FindPreviousNth(n, pcSubStr, nStart)
			return This.FindNthPreviousOccurrence(n, pcSubStr, nStart)

		def FindNthPrevious(n, pcSubStr, nStart)
			return This.FindNthPreviousOccurrence(n, pcSubStr, nStart)

		def PositionOfNthPreviousOccurrence(n, pcSubStr, nStart)
			return This.FindNthPreviousOccurrence(n, pcSubStr, nStart)

		def PositionOfPreviousNthOccurrence(n, pcSubStr, nStart)
			return This.FindNthPreviousOccurrence(n, pcSubStr, nStart)

		def PositionOfPreviousNth(n, pcSubStr, nStart)
			return This.FindNthPreviousOccurrence(n, pcSubStr, nStart)

		def PositionOfNthPrevious(n, pcSubStr, nStart)
			return This.FindNthPreviousOccurrence(n, pcSubStr, nStart)

		def NthPreviousOccurrence(n, pcSubStr, nStart)
			return This.FindNthPreviousOccurrence(n, pcSubStr, nStart)

		def PreviousNthOccurrence(n, pcSubStr, nStart)
			return This.FindNthPreviousOccurrence(n, pcSubStr, nStart)

	   #-------------------------------------------------#
	  #      FINDING NEXT OCCURRENCE OF A SUBSTRING     #
	 #      STARTING AT A GIVEN POSITION               #
	#-------------------------------------------------#

	def FindNextOccurrenceCS(pcSubStr, nStart, pCaseSensitive)
		return This.FindNextNthOccurrenceCS(1, pcSubStr, nStart, pCaseSensitive)
	
		def FindNextCS(pcSubStr, nStart, pCaseSensitive)
			return This.FindNextOccurrenceCS(pcSubStr, nStart, pCaseSensitive)

		def FindNextFirstCS()
			return This.FindNextOccurrenceCS(pcSubStr, nStart, pCaseSensitive)

		def FindFirstNextCS()
			return This.FindNextOccurrenceCS(pcSubStr, nStart, pCaseSensitive)

		def PositionOfNextFirstCS()
			return This.FindNextOccurrenceCS(pcSubStr, nStart, pCaseSensitive)

		def PositionOfFirstNextCS()
			return This.FindNextOccurrenceCS(pcSubStr, nStart, pCaseSensitive)

		def NextOccurrenceCS(pcSubStr, nStart, pCaseSensitive)
			return This.FindNextOccurrenceCS(pcSubStr, nStart, pCaseSensitive)

		def NextFirstOccurrenceCS()
			return This.FindNextOccurrenceCS(pcSubStr, nStart, pCaseSensitive)

		def FirstNextOccurrenceCS()
			return This.FindNextOccurrenceCS(pcSubStr, nStart, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def FindNextOccurrence(pcSubStr, nStart)
		return This.FindNextOccurrenceCS(pcSubStr, nStart, :CaseSensitive = TRUE)
	
		def FindNext(pcSubStr, nStart)
			return This.FindNextOccurrence(pcSubStr, nStart)

		def FindNextFirst()
			return This.FindNextOccurrenceCS(pcSubStr, nStart)

		def FindFirstNext()
			return This.FindNextOccurrence(pcSubStr, nStart)

		def PositionOfNextFirst()
			return This.FindNextOccurrenceC(pcSubStr, nStart)

		def PositionOfFirstNext()
			return This.FindNextOccurrence(pcSubStr, nStart)

		def NextOccurrence(pcSubStr, nStart)
			return This.FindNextOccurrence(pcSubStr, nStart)

		def NextFirstOccurrence()
			return This.FindNextOccurrenceCS(pcSubStr, nStart)

		def FirstNextOccurrence()
			return This.FindNextOccurrenceCS(pcSubStr, nStart)

	   #-----------------------------------------------------#
	  #      FINDING PREVIOUS OCCURRENCE OF A SUBSTRING     #
	 #      STARTING FROM A GIVEN POSITION N               #
	#-----------------------------------------------------#

	def FindPreviousOccurrenceCS(pcSubStr, nStart, pCaseSensitive)
		return This.FindPreviousNthOccurrenceCS(1, pcSubStr, nStart, pCaseSensitive)
	
		def FindPreviousCS(pcSubStr, nStart, pCaseSensitive)
			return This.FindPreviousOccurrenceCS(pcSubStr, nStart, pCaseSensitive)

		def FindPreviousFirstCS()
			return This.FindPreviousOccurrenceCS(pcSubStr, nStart, pCaseSensitive)

		def FindFirstPreviousCS()
			return This.FindPreviousOccurrenceCS(pcSubStr, nStart, pCaseSensitive)

		def PositionOfPreviousFirstCS()
			return This.FindPreviousOccurrenceCS(pcSubStr, nStart, pCaseSensitive)

		def PositionOfFirstPreviousCS()
			return This.FindPreviousOccurrenceCS(pcSubStr, nStart, pCaseSensitive)

		def PreviousOccurrenceCS(pcSubStr, nStart, pCaseSensitive)
			return This.FindPreviousOccurrenceCS(pcSubStr, nStart, pCaseSensitive)

		def PreviousFirstOccurrenceCS()
			return This.FindPreviousOccurrenceCS(pcSubStr, nStart, pCaseSensitive)

		def FirstPreviousOccurrenceCS()
			return This.FindPreviousOccurrenceCS(pcSubStr, nStart, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def FindPreviousOccurrence(pcSubStr, nStart)
		return This.FindPreviousOccurrenceCS(pcSubStr, nStart, :CaseSensitive = TRUE)
	
		def FindPrevious(pcSubStr, nStart)
			return This.FindPreviousOccurrence(pcSubStr, nStart)

		def FindPreviousFirst()
			return This.FindPreviousOccurrenceCS(pcSubStr, nStart)

		def FindFirstPrevious()
			return This.FindPreviousOccurrence(pcSubStr, nStart)

		def PositionOfPreviousFirst()
			return This.FindPreviousOccurrenceC(pcSubStr, nStart)

		def PositionOfFirstPrevious()
			return This.FindPreviousOccurrence(pcSubStr, nStart)

		def PreviousOccurrence(pcSubStr, nStart)
			return This.FindPreviousOccurrence(pcSubStr, nStart)

		def PreviousFirstOccurrence()
			return This.FindPreviousOccurrenceCS(pcSubStr, nStart)

		def FirstPreviousOccurrence()
			return This.FindPreviousOccurrenceCS(pcSubStr, nStart)

	  #-------------------------------------------------#
	 #      FINDING ALL OCCURRENCES OF A SUBSTRING     #
	#-------------------------------------------------#

	def FindAllOccurrencesCS(pcSubStr, pCaseSensitive)

		if isList(pcSubStr) and
			( Q(pcSubStr).IsOfNamedParam() or
			  Q(pcSubStr).IsOfSubStringNamedParam() )

			pcSubStr = pcSubStr[2]
		ok

		nLenString = This.NumberOfChars()
		nLenSubStr = Q(pcSubStr).NumberOfChars()

		if nLenString < nLenSubStr
			return []
		ok

		#-- Doing the job

		anResult = []

		bContinue = TRUE
		nPos = 0

		while bContinue
			nPos = This.FindFirstXTCS(pcSubStr, :StartingAt = nPos + 1, pCaseSensitive)
			if nPos = 0
				bContinue = FALSE
			else
				anResult + nPos
			ok
		end

		return anResult

		#< @FunctionFluentForm

		def FindAllOccurrencesCSQ(pcSubStr, pCaseSensitive)
				return This.FindAllOccurrencesCSQR(pcSubStr, :stzList, pCaseSensitive)
			
		def FindAllOccurrencesCSQR(pcSubStr, pcReturnType, pCaseSensitive)
			if isList(pcReturnType) and Q(pcReturnType).IsReturnedAs(pcReturnType)
				pcReturnType = pcReturnType[2]
			ok
	
			switch pcReturnType
			on :stzList
				return new stzList( This.FindAllOccurrencesCS(pcSubStr, pCaseSensitive) )
	
			on :stzListOfNumbers
				return new stzListOfNumbers( This.FindAllOccurrencesCS(pcSubStr, pCaseSensitive) )
	
			on :stzPair
				return new stzPair( This.FindAllOccurrencesCS(pcSubStr, pCaseSensitive) )
	
			on :stzPairOfNumbers
				return new stzPairOfNumbers( This.FindAllOccurrencesCS(pcSubStr, pCaseSensitive) )
	
			other
				stzRaise("Unsupported return type!")
			off
		#>

		#< @FunctionAlternativeForms

		def FindCS(pcSubStr, pCaseSensitive)
			return This.FindAllOccurrencesCS(pcSubStr, pCaseSensitive)

			def FindCSQ(pcSubStr, pCaseSensitive)
					return This.FindCSQR(pcSubStr, :stzList, pCaseSensitive)
				
			def FindCSQR(pcSubStr, pcReturnType, pCaseSensitive)
				return This.FindAllOccurrencesCSQR(pcSubStr, pcReturnType, pCaseSensitive)

		def FindAllCS(pcSubStr, pCaseSensitive)
			return This.FindAllOccurrencesCS(pcSubStr, pCaseSensitive)

			def FindAllCSQ(pcSubStr, pCaseSensitive)
					return This.FindAllCSQR(pcSubStr, :stzList, pCaseSensitive)
				
			def FindAllCSQR(pcSubStr, pcReturnType, pCaseSensitive)
				return This.FindAllOccurrencesCSQR(pcSubStr, pcReturnType, pCaseSensitive)

		def FindSubstringCS(pcSubStr, pCaseSensitive)
			return This.FindAllOccurrencesCS(pcSubStr, pCaseSensitive)

			def FindSubstringCSQ(pcSubStr, pCaseSensitive)
					return This.FindSubstringCSQR(pcSubStr, :stzList, pCaseSensitive)
				
			def FindSubstringCSQR(pcSubStr, pcReturnType, pCaseSensitive)
				return This.FindAllOccurrencesCSQR(pcSubStr, pcReturnType, pCaseSensitive)

		def OccurrencesCS(pcSubStr, pCaseSensitive)
			return This.FindAllOccurrencesCS(pcSubStr, pCaseSensitive)

			def OccurrencesCSQ(pcSubStr, pCaseSensitive)
					return This.OccurrencesCSQR(pcSubStr, :stzList, pCaseSensitive)
				
			def OccurrencesCSQR(pcSubStr, pcReturnType, pCaseSensitive)
				return This.FindAllOccurrencesCSQR(pcSubStr, pcReturnType, pCaseSensitive)

		def PositionsCS(pcSubStr, pCaseSensitive)
			return This.FindAllOccurrencesCS(pcSubStr, pCaseSensitive)

			def PositionsCSQ(pcSubStr, pCaseSensitive)
					return This.PositionsCSQR(pcSubStr, :stzList, pCaseSensitive)
				
			def PositionsCSQR(pcSubStr, pcReturnType, pCaseSensitive)
				return This.FindAllOccurrencesCSQR(pcSubStr, pcReturnType, pCaseSensitive)

		def PositionsOfSubStringCS(pcSubStr, pCaseSensitive)
			return This.FindAllOccurrencesCS(pcSubStr, pCaseSensitive)

			def PositionsOfSubStringCSQ(pcSubStr, pCaseSensitive)
					return This.PositionsOfSubStringCSQR(pcSubStr, :stzList, pCaseSensitive)
				
			def PositionsOfSubStringCSQR(pcSubStr, pcReturnType, pCaseSensitive)
				return This.FindAllOccurrencesCSQR(pcSubStr, pcReturnType, pCaseSensitive)

		def FindPositionsCS(pcSubStr, pCaseSensitive)
			return This.FindAllOccurrencesCS(pcSubStr, pCaseSensitive)

			def FindPositionsCSQ(pcSubStr, pCaseSensitive)
					return This.FindPositionsCSQR(pcSubStr, :stzList, pCaseSensitive)
				
			def FindPositionsCSQR(pcSubStr, pcReturnType, pCaseSensitive)
				return This.FindAllOccurrencesCSQR(pcSubStr, pcReturnType, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def FindAllOccurrences(pcSubStr)
		return This.FindAllOccurrencesCS(pcSubStr, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def FindAllOccurrencesQ(pcSubStr)
			return This.FindAllOccurrencesQR(pcSubStr, :stzList)
		
		def FindAllOccurrencesQR(pcSubStr, pcReturnType)
				return This.FindAllOccurrencesCSQR(pcSubStr, pcReturnType, :CaseSensitive = TRUE)

		#>

		#< @FunctionAlternativeForms

		def FindAll(pcSubStr)
			return This.FindAllOccurrences(pcSubStr)

			def FindAllQ(pcSubStr)
				return This.FindAllQR(pcSubStr, :stzList)
			
			def FindAllQR(pcSubStr, pcReturnType)
				return This.FindAllOccurrencesQR(pcSubStr, pcReturnType)

		def FindSubString(pcSubStr)
			return This.FindAllOccurrences(pcSubStr)

			def FindSubStringQ(pcSubStr)
				return This.FindSubStringQR(pcSubStr, :stzList)
			
			def FindSubStringQR(pcSubStr, pcReturnType)
				return This.FindAllOccurrencesQR(pcSubStr, pcReturnType)

		def Occurrences(pcSubStr)
			return This.FindAllOccurrences(pcSubStr)

			def OccurrencesQ(pcSubStr)
				return This.OccurrencesQR(pcSubStr, :stzList)
			
			def OccurrencesQR(pcSubStr, pcReturnType)
				return This.FindAllOccurrencesQR(pcSubStr, pcReturnType)

		def Positions(pcSubStr)
			return This.FindAllOccurrences(pcSubStr)

			def PositionsQ(pcSubStr)
				return This.PositionsQR(pcSubStr, :stzList)
			
			def PositionsQR(pcSubStr, pcReturnType)
				return This.FindAllOccurrencesQR(pcSubStr, pcReturnType)

		def PositionsOfSubString(pcSubStr)
			return This.FindAllOccurrences(pcSubStr)

			def PositionsOfSubStringQ(pcSubStr)
				return This.PositionsOfSubStringQR(pcSubStr, :stzList)
			
			def PositionsOfSubStringQR(pcSubStr, pcReturnType)
				return This.FindAllOccurrencesQR(pcSubStr, pcReturnType)

		def FindPositions(pcSubStr)
			return This.FindAllOccurrences(pcSubStr)

			def FindPositionsQ(pcSubStr)
				return This.FindPositionsQR(pcSubStr, :stzList)
			
			def FindPositionsQR(pcSubStr, pcReturnType)
				return This.FindAllOccurrencesQR(pcSubStr, pcReturnType)

		def Find(pcSubStr)
			if isList(pcSubStr) and Q(pcSubStr).IsSubStringNamedParam()
				pcSubStr = pcSubStr[2]
			ok

			return This.FindAllOccurrences(pcSubStr)

			def FindQ(pcSubStr)
				return This.FindQR(pcSubStr, :stzList)
			
			def FindQR(pcSubStr, pcReturnType)
				return This.FindAllQR(pcSubStr, pcReturnType)

		#>

	  #----------------------------------------------------------------------#
	 #  FINDING ALL OCCURRENCES OF A SUBSTRING VERIFYING A GIVEN CONDITION  #
	#----------------------------------------------------------------------#

	def FindSubStringW(pcCondition)
		if isList(pcCondition) and Q(pccondition).IsWhereNamedParam()
			pcCondition = pcCondition[2]
		ok

		if NOT isString(pcCondition)
			StzRaise("Incorrect param type! pcCondition must be a string.")
		ok

		cCondition = StzCCodeQ(pcCondition).UnifiedFor(:stzString)
		oCondition = Q(cCondition).TrimQ().RemoveBoundsQ(["{","}"])

		if NOT oCondition.ContainsCS("@SubString", :CS = FALSE)
			StzRaise("Syntax error! pcCondition must contain keyword @SubString")
		ok

		oCopy = oCondition
		oCopy.RemoveAllSpacesQ()

		aResult = []

		if oCopy.StartsWithCS('@SubString="', :CS = FALSE) and
		   oCopy.EndsWith('"')

			n1 = oCondition.FirstOccurrence('"') + 1
			n2 = oCondition.NumberOfChars()-1
			cSubStr = oCondition.Section( n1,  n2)

			aResult = This.FindAll(cSubStr)

		else

			cCondition = oCondition.
					ReplaceCSQ("@SubString", :With = "@String", :CS = TRUE).
					Content()

			acSubStrings = This.SubStringsQR(:stzListOfStrings).
					StringsWQ(cCondition).Content()

			for cSubStr in acSubStrings
				aResult + [ cSubStr, This.FindAll(cSubStr) ]
			next
		ok

		return aResult

		def FindSubStringsW(pcCondition)
			return This.FindSubStringW(pcCondition)

	def FindAllW(pcCondition)
		#< @MotherFunction = YES | @RingBased #>

		if isList(pcCondition) and StzListQ(pcCondition).IsWhereNamedParam()
			pcCondition = pcCondition[2]
		ok

		if isString(pcCondition)
			if Q(pcCondition).ContainsOneOfTheseCS([ "@Char", "@NextChar", "@PreviousChar" ], :CS = FALSE) and
			   Q(pcCondition).ContainsNoOneOfTheseCS([ "@SubString", "@NextSubString", "@PreviousSubString" ], :CS = FALSE)

				return This.FindAllCharsW(pcCondition)

			but Q(pcCondition).ContainsOneOfTheseCS([ "@Char", "@NextChar", "@PreviousChar" ], :CS = FALSE) and
			   Q(pcCondition).ContainsOneOfTheseCS([ "@SubString", "@NextSubString", "@PreviousSubString" ], :CS = FALSE)

				StzRaise("Incorrect condition! Condition can't contains chars and substrings keywords.")
			ok
		else
			StzRaise("Incorrect param type! pcCondition must be a string.")
		ok

		if NOT Q(pcCondition).ContainsOneOfTheseCS([ "@SubString", "@NextSubString", "@PreviousSubString" ], :CS = FALSE)
			stzRaise("Incorrect param type! pcCondition must be a string containing keword @SubString.")
		ok

		cCondition = StzCCodeQ(pcCondition).UnifiedFor(:stzString)

		cCode = "bOk = ( " + cCondition + " )"
		oCode = new stzString(cCode)

		acSubStrings = This.SubStrings()
		nLen = len(acSubStrings)
		anResult = []

		for @i = 1 to nLen
			@SubString = acSubStrings[@i]
			bEval = TRUE

			if @i = nLen and
			   oCode.Copy().RemoveSpacesQ().ContainsCS( "This[@i+1]", :CS = FALSE )

				bEval = FALSE
			ok

			if @i = 1 and
			   oCode.Copy().RemoveSpacesQ().ContainsCS( "This[@i-1]", :CS = FALSE )

				bEval = FALSE
			ok

			if bEval

				eval(cCode)

				if bOk
					anResult + @i
				ok
			ok

		next

		return anResult

		#< @FunctionFluentForm

		def FindAllWQ(pcCondition)
			return This.FindAllWQR(pcCondition, :stzList)

		def FindAllWQR(pcCondition, pcReturnType)
			switch pcReturnType
			on :stzList
				return new stzList( This.FindAllW(pcCondition) )

			on :stzListOfNumbers
				return new stzListOfNumbers( This.FindAllW(pcCondition) )

			other
				return stzRaise("Unsupported return type!")
			off

		#>

		#< @FunctionAlternativeForms

		def FindAllWhere(pcCondition)
			return This.FindAllW(pcCondition)

			def FindAllWhereQ(pcCondition)
				return This.FindAllWhereQR(pcCondition, :stzList)
	
			def FindAllWhereQR(pcCondition, pcReturnType)
				switch pcReturnType
				on :stzList
					return new stzList( This.FindAllWhere(pcCondition) )
	
				on :stzListOfNumbers
					return new stzListOfNumbers( This.FindAllWhere(pcCondition) )
	
				other
					return stzRaise("Unsupported return type!")
				off

		def FindW(pcCondition)
			return This.FindAllW(pcCondition)

			def FindWQ(pcCondition)
				return This.FindWQR(pcCondition, :stzList)
	
			def FindWQR(pcCondition, pcReturnType)
				switch pcReturnType
				on :stzList
					return new stzList( This.FindW(pcCondition) )
	
				on :stzListOfNumbers
					return new stzListOfNumbers( This.FindW(pcCondition) )
	
				other
					return stzRaise("Unsupported return type!")
				off

		def FindWhere(pcCondition)
			return This.FindW(pcCondition)

			def FindWhereQ(pcCondition)
				return This.FindWhereQR(pcCondition, :stzList)
	
			def FindWhereQR(pcCondition, pcReturnType)
				switch pcReturnType
				on :stzList
					return new stzList( This.FindWhere(pcCondition) )
	
				on :stzListOfNumbers
					return new stzListOfNumbers( This.FindWhere(pcCondition) )
	
				other
					return stzRaise("Unsupported return type!")
				off

		def SubStringsPositionsW(pCondition)
			return This.FindAllW(pcCondition)

			def SubStringsPositionsWQ(pcCondition)
				return This.SubStringsPositionsWQR(pcCondition, :stzList)
	
			def SubStringsPositionsWQR(pcCondition, pcReturnType)
				switch pcReturnType
				on :stzList
					return new stzList( This.SubStringsPositionsW(pcCondition) )
	
				on :stzListOfNumbers
					return new stzListOfNumbers( This.SubStringsPositionsW(pcCondition) )
	
				other
					return stzRaise("Unsupported return type!")
				off

		def SubStringsPositionsWhere(pCondition)
			return This.FindAllW(pcCondition)

			def SubStringsPositionsWhereQ(pcCondition)
				return This.SubStringsPositionsWhereQR(pcCondition, :stzList)
	
			def SubStringsPositionsWhereQR(pcCondition, pcReturnType)
				switch pcReturnType
				on :stzList
					return new stzList( This.SubStringsPositionsWhere(pcCondition) )
	
				on :stzListOfNumbers
					return new stzListOfNumbers( This.SubStringsPositionsWhere(pcCondition) )
	
				other
					return stzRaise("Unsupported return type!")
				off

		def FindSubStringsPositionsW(pcCondition)
			return This.FindAllSubStringsW(pcCondition)

			def FindSubStringsPositionsWQ(pcCondition)
				return This.FindSubStringsPositionsWQR(pcCondition, :stzList)
	
			def FindSubStringsPositionsWQR(pcCondition, pcReturnType)
				switch pcReturnType
				on :stzList
					return new stzList( This.FindSubStringsPositionsW(pcCondition) )
	
				on :stzListOfNumbers
					return new stzListOfNumbers( This.FindSubStringsPositionsW(pcCondition) )
	
				other
					return stzRaise("Unsupported return type!")
				off

		def FindSubStringsPositionsWhere(pcCondition)
			return This.FindAllSubStringsW(pcCondition)

			def FindSubStringsPositionsWhereQ(pcCondition)
				return This.FindSubStringsPositionsWhereQR(pcCondition, :stzList)
	
			def FindSubStringsPositionsWhereQR(pcCondition, pcReturnType)
				switch pcReturnType
				on :stzList
					return new stzList( This.FindSubStringsPositionsWhere(pcCondition) )
	
				on :stzListOfNumbers
					return new stzListOfNumbers( This.FindSubStringsPositionsWhere(pcCondition) )
	
				other
					return stzRaise("Unsupported return type!")
				off
			
		#>

	def FindNthSubStringW(n, pcCondition)

		anPos = This.FindSubStringsW(pcCondition)
		nLen  = len(anPos)

		if isString(n)
			if n = :FirstChar or n = :First
				n = 1
			but n = :LastChar or n = :Last
				n = nLen
			ok
		ok

		if NOT isNumber(n)
			StzRaise("Incorrect param type! n must be a number.")
		ok

		nResult = anPos[n]
		return nResult

	def FindFirstSubStringW(pcCondition)
		return This.FindNthSubStringW(1, pcCondition)

	def FindLastSubStringW(pcCondition)
		return This.FindNthCharW(:LastChar, pcCondition)

	  #-----------------------------------------------------------------#
	 #  FINDING ALL OCCURRENCES OF A CHAR VERIFYING A GIVEN CONDITION  #
	#-----------------------------------------------------------------#

	def FindAllCharsW(pcCondition)
		#< @MotherFunction = YES | @RingBased #>

		if isList(pcCondition) and StzListQ(pcCondition).IsWhereNamedParam()
			pcCondition = pcCondition[2]
		ok

		if NOT isString(pcCondition)
			stzRaise("Incorrect param type! pcCondition must be a string.")
		ok

		cCondition = StzCCodeQ(pcCondition).UnifiedFor(:stzString)

		cCode = "bOk = ( " + cCondition + " )"
		oCode = new stzString(cCode)

		anResult = []

		for @i = 1 to This.NumberOfChars()
			@char = This[@i]
			bEval = TRUE

			if @i = This.NumberOfChars() and
			   oCode.Copy().RemoveSpacesQ().ContainsCS( "This[@i+1]", :CS = FALSE )

				bEval = FALSE
			ok

			if @i = 1 and
			   oCode.Copy().RemoveSpacesQ().ContainsCS( "This[@i-1]", :CS = FALSE )

				bEval = FALSE
			ok

			if bEval

				eval(cCode)

				if bOk
					anResult + @i
				ok
			ok

		next

		return anResult

		#< @FunctionFluentForm

		def FindAllCharsWQ(pcCondition)
			return This.FindAllCharsWQR(pcCondition, :stzList)

		def FindAllCharsWQR(pcCondition, pcReturnType)
			switch pcReturnType
			on :stzList
				return new stzList( This.FindAllCharsW(pcCondition) )

			on :stzListOfNumbers
				return new stzListOfNumbers( This.FindAllCharsW(pcCondition) )

			other
				return stzRaise("Unsupported return type!")
			off

		#>

		#< @FunctionAlternativeForms

		def FindAllCharsWhere(pcCondition)
			return This.FindAllCharsW(pcCondition)

			def FindAllCharsWhereQ(pcCondition)
				return This.FindAllCharsWhereQR(pcCondition, :stzList)
	
			def FindAllCharsWhereQR(pcCondition, pcReturnType)
				switch pcReturnType
				on :stzList
					return new stzList( This.FindAllCharsWhere(pcCondition) )
	
				on :stzListOfNumbers
					return new stzListOfNumbers( This.FindAllCharsWhere(pcCondition) )
	
				other
					return stzRaise("Unsupported return type!")
				off

		def FindCharsW(pcCondition)
			return This.FindAllCharsW(pcCondition)

			def FindCharsWQ(pcCondition)
				return This.FindCharsWQR(pcCondition, :stzList)
	
			def FindCharsWQR(pcCondition, pcReturnType)
				switch pcReturnType
				on :stzList
					return new stzList( This.FindCharsW(pcCondition) )
	
				on :stzListOfNumbers
					return new stzListOfNumbers( This.FindCharsW(pcCondition) )
	
				other
					return stzRaise("Unsupported return type!")
				off

		def FindCharsWhere(pcCondition)
			return This.FindCharsW(pcCondition)

			def FindCharsWhereQ(pcCondition)
				return This.FindCharsWhereQR(pcCondition, :stzList)
	
			def FindCharsWhereQR(pcCondition, pcReturnType)
				switch pcReturnType
				on :stzList
					return new stzList( This.FindCharsWhere(pcCondition) )
	
				on :stzListOfNumbers
					return new stzListOfNumbers( This.FindCharsWhere(pcCondition) )
	
				other
					return stzRaise("Unsupported return type!")
				off

		def CharsPositionsW(pCondition)
			return This.FindAllCharsW(pcCondition)

			def CharsPositionsWQ(pcCondition)
				return This.CharsPositionsWQR(pcCondition, :stzList)
	
			def CharsPositionsWQR(pcCondition, pcReturnType)
				switch pcReturnType
				on :stzList
					return new stzList( This.CharsPositionsW(pcCondition) )
	
				on :stzListOfNumbers
					return new stzListOfNumbers( This.CharsPositionsW(pcCondition) )
	
				other
					return stzRaise("Unsupported return type!")
				off

		def CharsPositionsWhere(pCondition)
			return This.FindAllCharsW(pcCondition)

			def CharsPositionsWhereQ(pcCondition)
				return This.CharsPositionsWhereQR(pcCondition, :stzList)
	
			def CharsPositionsWhereQR(pcCondition, pcReturnType)
				switch pcReturnType
				on :stzList
					return new stzList( This.CharsPositionsWhere(pcCondition) )
	
				on :stzListOfNumbers
					return new stzListOfNumbers( This.CharsPositionsWhere(pcCondition) )
	
				other
					return stzRaise("Unsupported return type!")
				off

		def FindCharsPositionsW(pcCondition)
			return This.FindAllCharsW(pcCondition)

			def FindCharsPositionsWQ(pcCondition)
				return This.FindCharsPositionsWQR(pcCondition, :stzList)
	
			def FindCharsPositionsWQR(pcCondition, pcReturnType)
				switch pcReturnType
				on :stzList
					return new stzList( This.FindCharsPositionsW(pcCondition) )
	
				on :stzListOfNumbers
					return new stzListOfNumbers( This.FindCharsPositionsW(pcCondition) )
	
				other
					return stzRaise("Unsupported return type!")
				off

		def FindCharsPositionsWhere(pcCondition)
			return This.FindAllCharsW(pcCondition)

			def FindCharsPositionsWhereQ(pcCondition)
				return This.FindCharsPositionsWhereQR(pcCondition, :stzList)
	
			def FindCharsPositionsWhereQR(pcCondition, pcReturnType)
				switch pcReturnType
				on :stzList
					return new stzList( This.FindCharsPositionsWhere(pcCondition) )
	
				on :stzListOfNumbers
					return new stzListOfNumbers( This.FindCharsPositionsWhere(pcCondition) )
	
				other
					return stzRaise("Unsupported return type!")
				off
			
		#>

	def FindNthCharW(n, pcCondition)

		anPos = This.FindCharsW(pcCondition)
		nLen  = len(anPos)

		if isString(n)
			if n = :FirstChar or n = :First
				n = 1
			but n = :LastChar or n = :Last
				n = nLen
			ok
		ok

		if NOT isNumber(n)
			StzRaise("Incorrect param type! n must be a number.")
		ok

		nResult = anPos[n]
		return nResult

	def FindFirstCharW(pcCondition)
		return This.FindNthCharW(1, pcCondition)

	def FindLastCharW(pcCondition)
		return This.FindNthCharW(:LastChar, pcCondition)

	  #--------------------------------------------------#
	 #      FINDING MANY SYBSTRINGS IN THE SAME TIME    # 
	#--------------------------------------------------#

	def FindManyCS(pacSubStr, pCaseSensitive)
		/*
		o1 = new stzString("My name is Mansour. What's your name please?")
		? o1.FindManyCS( [ "name", "your", "please" ], :CS = TRUE )

		# --> [ [ 4, 33 ], [ 28 ], [ 38 ] ]

		*/

		aResult = []

		for str in pacSubStr
			aResult + This.FindAllCS(str, pCaseSensitive)
		next

		return aResult

		#< @FunctionFluentForm

		def FindManyCSQ(pacSubStr, pCaseSensitive)
			return This.FindManyCSQR(pacSubStr, pCaseSensitive, :stzList)
	
		def FindManyCSQR(pacSubStr, pCaseSensitive, pcReturnType)

			switch pcReturnType
			on :stzList
				return new stzList( This.FindManyCS(pacSubStr, pCaseSensitive) )
	
			on :stzListOfNumbers
				return new stzListOfNumbers( This.FindManyCS(pacSubStr, pCaseSensitive) )
	
			other
				return stzRaise("Unsupported return type!")
			off
		#>

		#< @FunctionAlternativeForm

		def FindManySubStringsCS(pacSubStr, pCaseSensitive)
			return This.FindManyCS(pacSubStr, pCaseSensitive)

			def FindManySubStringsCSQ(pacSubStr, pCaseSensitive)
				return This.FindManySubStringsCSQR(pacSubStr, pCaseSensitive, :stzList)
		
			def FindManySubStringsCSQR(pacSubStr, pCaseSensitive, pcReturnType)
	
				switch pcReturnType
				on :stzList
					return new stzList( This.FindManySubStringsCS(pacSubStr, pCaseSensitive) )
		
				on :stzListOfNumbers
					return new stzListOfNumbers( This.FindManySubStringsCS(pacSubStr, pCaseSensitive) )
		
				other
					return stzRaise("Unsupported return type!")
				off

		#>

	#-- WITHOUT CASESENSITIVITY

	def FindMany(pacSubStr)
		/*
		o1 = new stzString("My name is Mansour. What's your name please?")
		? o1.FindMany( [ "name", "your", "please" ] )

		# --> [ [ 4, 33 ], [ 28 ], [ 38 ] ]

		*/

		return This.FindManyCS(pacSubStr, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def FindManyQ(pacSubStr)
			return This.FindManyQR(pacSubStr, :stzList)
	
		def FindManyQR(pacSubStr, pcReturnType)

			switch pcReturnType
			on :stzList
				return new stzList( This.FindMany(pacSubStr) )
	
			on :stzListOfNumbers
				return new stzListOfNumbers( This.FindMany(pacSubStr) )
	
			other
				return stzRaise("Unsupported return type!")
			off
		#>

		#< @FunctionAlternativeForm

		def FindManySubStrings(pacSubStr)
			return This.FindMany(pacSubStr)

			def FindManySubStringsQ(pacSubStr)
				return This.FindManySubStringsQR(pacSubStr, :stzList)
		
			def FindManySubStringsQR(pacSubStr, pcReturnType)
	
				switch pcReturnType
				on :stzList
					return new stzList( This.FindManySubStrings(pacSubStr) )
		
				on :stzListOfNumbers
					return new stzListOfNumbers( This.FindManySubStrings(pacSubStr) )
		
				other
					return stzRaise("Unsupported return type!")
				off
		#>

	  #------------------------------------------------------------#
	 #    FINDING MANY SYBSTRINGS IN THE SAME TIME -- EXTENDED    # 
	#------------------------------------------------------------#

	def FindManyXT(pacSubStr, paOptions)
		/*
		o1 = new stzString("My name is Mansour. What's your name please?")
		? o1.FindManyXT( [ "name", "your", "please" ], [ :CS = TRUE ] )

		--> [ "name" = [ 4, 33 ], "your" = [ 28 ], "please" = [ 38 ] ]

		*/

		# Checking params correctness

		if NOT ( isList(pacSubStr) and Q(pacSubStr).IsListOfStrings() )
			stzRaise("Incorrect param! pacSubStr must be a list of strings.")
		ok

		if NOT ( isList(paOptions) and Q(paOptions).IsHashList() )
			stzRaise("Incorrect param! paOptions must be a hashlist.")
		ok

		if NOT StzHashListQ(paOptions).KeysQ().IsMadeOfSome([
				:CaseSensitive, :CS,
				:RemoveEmpty
			])
			
			stzRaise("Unavailable options! Only :CaseSensitive and :RemoveEmpty are available.")
		ok

		if StzHashListQ(paOptions).KeysQR(:stzListOfStrings).ContainsBothCS(
			:CaseSensitive, :CS, :CS = FALSE )

			stzRaise("Incorrect values! :CaseSensitive and :CS are the same, they can't be used both.")
		ok

		# Reading options

		bCaseSensitive = TRUE
		if StzHashListQ(paOptions).ContainsKey(:CaseSensitive) and
			IsBoolean(paOptions[:CaseSensitive])

			bCaseSensitive = paOptions[:CaseSensitive]

		but StzHashListQ(paOptions).ContainsKey(:CS) and
			IsBoolean(paOptions[:CS])

			bCaseSensitive = paOptions[:CS]
		ok

		bRemoveEmpty = FALSE
		if StzHashListQ(paOptions).ContainsKey(:RemoveEmpty) and
			IsBoolean(paOptions[:RemoveEmpty])

			bRemoveEmpty = paOptions[:RemoveEmpty]
		ok

		# Doing the job

		aResult = []

		for str in pacSubStr
			anPositions = This.FindAllCS(str, bCaseSensitive)

			if len(anPositions) > 0
				aResult + [ str, anPositions ]

			else
				if bRemoveEmpty = FALSE
					aResult + [ str, anPositions ]
				ok
			ok
		next
		
		return aResult

		#< @FunctionFluentForm

		def FindManyXTQ(pacSubStr, paOptions)
			return This.FindManyXTQR(pacSubStr, paOptions, :stzList)
	
		def FindManyXTQR(pacSubStr, paOptions, pcReturnType)

			switch pcReturnType
			on :stzList
				return new stzList( This.FindManyXT(pacSubStr, paOptions) )
	
			on :stzListOfNumbers
				return new stzListOfNumbers( This.FindManyXT(pacSubStr, paOptions) )
	
			other
				return stzRaise("Unsupported return type!")
			off
		#>

		#< @FunctionAlternativeForm

		def FindManySubstringsCSXT(pacSubStr, pCaseSensitive)
			return This.FindManyCSXT(pacSubStr, pCaseSensitive)

			def FindManySubstringsCSXTQ(pacSubStr)
				return This.FindManySubstringsCSXTQR(pacSubStr, pCaseSensitive, :stzList)
		
			def FindManySubstringsCSXTQR(pacSubStr, pCaseSensitive, pcReturnType)
	
				switch pcReturnType
				on :stzList
					return new stzList( This.FindManySubstringsCSXT(pacSubStr, pCaseSensitive) )
		
				on :stzListOfNumbers
					return new stzListOfNumbers( This.FindManySubstringsCSXT(pacSubStr, pCaseSensitive) )
		
				other
					return stzRaise("Unsupported return type!")
				off

		#>

	   #=====================================================#
	  #   CHECKING IF STRING OCCURES BEFORE/AFTER A GIVEN   #
	 #   SUBSTRINGING AN OTHER STRING OR LIST              #
	#=====================================================#

	def OccursCS( pcBeforeOrAfter, pIn, pCaseSensitive )
		# TODO: Generalise this fuction so pcIn can also be a list
		# TODO: Implement the same function in all other types

		/* EXAMPLE

		o1 = new stzString("ONE")

		? o1.Occurs( :Before = "TWO", :In = "***ONE***TWO***")	#--> TRUE
		? o1.Occurs( :After = "TWO", :In = "***ONE***TWO***")	#--> FALSE

		? o1.Occurs( :Before = "two", :In = [ "***", "ONE", "***", "TWO", "***" ])
		#--> TRUE
		? o1.Occurs( :After = "TWO", :In = [ "***", "ONE", "***", "TWO", "***" ])
		#--> FALSE

		*/
		cBeforeOrAfter = ""

		if isList(pcBeforeOrAfter) and Q(pcBeforeOrAfter).IsBeforeOrAfterNamedParam()
			cTemp = pcBeforeOrAfter[1]

			pcBeforeOrAfter = pcBeforeOrAfter[2]
		ok

		if NOT isString(pcBeforeOrAfter)
			StzRaise("Incorrect param type! pcSubStr must be a string.")
		ok

		if isList(pIn) and Q(pIn).IsInNamedParam()
			pIn = pIn[2]
		ok

		if NOT ( isString(pIn) or isList(pIn) )
			StzRaise("Incorrect param type! pcIn must be a string or list.")
		ok
	

		if isString(pIn)
			oStr = new stzString(pIn)
	
			nThis  = oStr.FindFirstCS( This.Content(), pCaseSensitive )
			nOther = oStr.FindFirstCS( pcBeforeOrAfter, pCaseSensitive )

		but isList(pIn)
			if Q(pIn).IsListOfStrings()
				oListStr = new stzListOfStrings(pIn)

				nThis  = oListStr.FindFirstCS( This.Content(), pCaseSensitive )
				nOther = oListStr.FindFirstCS( pcBeforeOrAfter, pCaseSensitive )
			else
				if pCaseSensitive[2] = TRUE
					oList = new stzList(pIn)
	
					nThis  = oList.FindFirst( This.Content() )
					nOther = oList.FindFirst( pcBeforeOrAfter )
						
				else
					oList = new stzList(pIn)
					oList.Lowercase()

					nThis  = oList.FindFirst( This.ContentQ().Lowercased() )
					nOther = oList.FindFirst( pcBeforeOrAfter )

				ok
			ok

		ok

		bResult = FALSE

		if cTemp = :After
			bResult = nThis > nOther

		but cTemp = :Before
			bResult = nThis < nOther
		ok

		return bResult

	#-- WITHOUT CASESENSITIVTY

	def Occurs(pcBeforeOrAfter, pIn)
		return This.OccursCS(pcBeforeOrAfter, pIn, :CaseSensitive = TRUE)

	   #-----------------------------------------------#
	  #   CHECKING IF STRING OCCURES BEFORE A GIVEN   #
	 #   SUBSTRINGING AN OTHER STRING OR LIST        #
	#-----------------------------------------------#

	def OccursBeforeCS( pcSubStr, pIn, pCaseSensitive )
		return This.OccursCS( :Before = pcSubStr, pIn, pCaseSensitive)

	#-- WITHOUT CASESENSITIVTY

	def OccursBefore(pcSubStr, pIn)
		return This.OccursBeforeCS( pcSubStr, pIn, :CaseSensitive = TRUE )

	   #----------------------------------------------#
	  #   CHECKING IF STRING OCCURES AFTER A GIVEN   #
	 #   SUBSTRINGING AN OTHER STRING OR LIST       #
	#----------------------------------------------#

	def OccursAfterCS( pcSubStr, pIn, pCaseSensitive )
		return This.OccursCS( :After = pcSubStr, pIn, pCaseSensitive)

	#-- WITHOUT CASESENSITIVTY

	def OccursAfter(pcSubStr, pIn)
		return This.OccursAfterCS( pcSubStr, pIn, :CaseSensitive = TRUE )

	  #-------------------------------------------------------------------#
	 #   CHECKING IF STRING OCCURES N TIMES IN AN OTHER STRING OR LIST   #
	#-------------------------------------------------------------------#

	def OccursNTimesCS( n, pIn, pCaseSensitive )

		if isList(pIn) and Q(pIn).IsInNamedParam()
			pIn = pIn[2]
		ok

		if NOT ( isString(pIn) or isList(pIn) )
			StzRaise("Incorrect param type! pcIn must be a string or list.")
		ok
	
		nOccurrence = 0

		if isString(pIn)
			oStr = new stzString(pIn)
			nOccurrence  = oStr.NumberOfOccurrenceCS( This.Content(), pCaseSensitive )

		but isList(pIn)
			if Q(pIn).IsListOfStrings()
				oListStr = new stzListOfStrings(pIn)
				nOccurrence  = oListStr.NumberOfOccurrenceCS( This.Content(), pCaseSensitive )

			else
				if pCaseSensitive[2] = TRUE
					oList = new stzList(pIn)
					nOccurrence  = oList.NumberOfOccurrence( This.Content() )
		
				else
					oList = new stzList(pIn)
					oList.Lowercase()

					nThis  = oList.FindFirst( This.ContentQ().Lowercased() )
					nOccurrence  = oList.NumberOfOccurrence( This.Content() )
		
				ok
			ok

		ok

		bResult = FALSE

		if nOccurrence = n
			bResult = TRUE
		ok

		return bResult

	#-- WITHOUT CASESENSITIVITY

	def OccursNTimes( n, pIn )
		return This.OccursNTimesCS( n, pIn, :CaseSensitive = TRUE )

	   #----------------------------------------------------#
	  #  CHECKING IF STRING OCCURS FOR THE NTH TIME,       #
	 #  IN AN OTHER STRING OR LIST, AT A GIVEN POSITION   #
	#----------------------------------------------------#

	def OccursForTheNthTimeCS(n, pIn, pnAt, pCaseSensitive)
		/* EXAMPLE

		? Q("*").OccursForTheNthTime( 1, :In = "a*b*c*d", :AtPosition = 2 )
		#--> TRUE

		? Q("*").OccursForTheNthTime( 3, :In = "a*b*c*d", :AtPosition = 6 )
		#--> TRUE

		*/

		if isList(pIn) and Q(pIn).IsInNamedParam()
			pIn = pIn[2]
		ok

		if NOT ( isString(pIn) or isList(pIn) )
			StzRaise("Incorrect param type! pcIn must be a string or list.")
		ok

		if isList(pnAt) and Q(pnAt).IsAtOrAtPositionNamedParam()
			pnAt = pnAt[2]
		ok
	
		if NOT isNumber(pnAt)
			StzRaise("Incorrect param type! pAt must be a number.")
		ok

		nNthOccurrence = 0

		if isString(pIn)
			oStr = new stzString(pIn)
			nNthOccurrence = oStr.NthOccurrenceCS( n, This.String(), pCaseSensitive)
	
		but isList(pIn)
			if Q(pIn).IsListOfStrings()
				oListStr = new stzListOfStrings(pIn)
				nNthOccurrence  = oListStr.NthOccurrenceCS( n, This.String(), pCaseSensitive)

			else
				if pCaseSensitive[2] = TRUE
					oList = new stzList(pIn)
					nNthOccurrence  = oList.NthOccurrence( n, This.String() )
		
				else
					oList = new stzList(pIn)
					oList.Lowercase()

					nNthOccurrence  = oList.NthOccurrence( n, This.String() )
		
				ok
			ok

		ok


		if nNthOccurrence = pnAt
			return TRUE

		else
			return FALSE
		ok

	#-- WITHOUT CASESENSITIVITY

	def OccursForTheNthTime(n, pIn, pnAt)
		return This.OccursForTheNthTimeCS(n, pIn, pnAt, :CaseSensitive = TRUE)

	   #----------------------------------------------------#
	  #  CHECKING IF STRING OCCURS FOR THE FIRST TIME,     #
	 #  IN AN OTHER STRING OR LIST, AT A GIVEN POSITION   #
	#----------------------------------------------------#

	def OccursForTheFirstTimeCS(pIn, pnAt, pCaseSensitive)
		return This.OccursForTheNthTimeCS(1, pIn, pnAt, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def OccursForTheFirstTime(pIn, pnAt)
		return This.OccursForTheFirstTimeCS(pIn, pnAt, :CaseSensitive = TRUE)

	   #----------------------------------------------------#
	  #  CHECKING IF STRING OCCURS FOR THE LAST TIME,      #
	 #  IN AN OTHER STRING OR LIST, AT A GIVEN POSITION   #
	#----------------------------------------------------#

	def OccursForTheLastTimeCS(pIn, pnAt, pCaseSensitive)
		return This.OccursForTheNthTimeCS(:Last, pIn, pnAt, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def OccursForTheLastTime(pIn, pnAt)
		return This.OccursForTheLastTimeCS(pIn, pnAt, :CaseSensitive = TRUE)

	  #===================================================#
	 #   FINDING BY PATTERN (AN ALTERNATIVE TO REGEXP)   # TODO (FUTURE
	#===================================================#

	// Finds all the occurrences of a given substring in the string depending on the provided format
	def FindPattern(paFormat)



	def FindInside(pcTemplate) // TODO
		/*
		o1 = new stzString("opsus amcKLMbmi findus")
		o1.FindInside("KLM", 'amc@bmi') # --> 10

		o1.FindInside("KLM", lower("AMC") + '@' + lower("BMI") # -->

		*/

	def FindInsideW(pcTemplate, pcCondition) # TODO
		/*
		o1 = new stzString("opsus amcKLMbmi findus")
		o1.FindInsideW("KLM", :Where = [
			'{ _(3).CharsBefore = "amc" }',
			'{ _(3).CharsAfter = "bmi" }'
		])
		*/

	  #====================================#
	 #   FINDING SECTIONS OF A SUBSTRING  #
	#====================================#

	def FindSectionsCS(pcSubStr, pCaseSensitive)
		/* EXAMPLE

		o1 = new stzString("hello ring what a nice ring!"
		? o1.FindSections( :of = "ring" )
		#--> [ [7, 10], [24, 27] ]

		*/

		if isList(pcSubStr) and
			( Q(pcSubStr).IsOfNamedParam() or
			  Q(pcSubStr).IsOfSubStringNamedParam() )

			pcSubStr = pcSubStr[2]
		ok

		anFirstPositions = This.FindAllCS(pcSubStr, pCaseSensitive)

		nLen = StzStringQ(pcSubStr).NumberOfChars()

		anLastPositions = StzListOfNumbersQ(anFirstPositions).AddToEachQ(nLen-1).Content()

		aResult = StzListQ(anFirstPositions).AssociatedWith(anLastPositions)

		return aResult

		#< @FunctionFlunentForm

		def FindSectionsCSQ(pcSubStr, pCaseSensitive)
			return This.FindSectionsCSQR(pcSubStr, pCaseSensitive, :stzList)

		def FindSectionsCSQR(pcSubStr, pCaseSensitive, pcReturnType)
			if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			# TODO: Generalize this check

			if NOT isString(pcReturnType)
				stzRaise("Incorrect param! pcReturnType must be a string.")
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.FindSectionsCS(pcSubStr, pCaseSensitive) )

			on :stzListOfLists
				return new stzListOfLists( This.FindSectionsCS(pcSubStr, pCaseSensitive) )

			on :stzListOfPairs
				return new stzListOfPairs( This.FindSectionsCS(pcSubStr, pCaseSensitive) )

			other
				stzRaise("Unsupported return type!")
			off

		#>

	#-- WITHOUT CASESENSITIVITY

	def FindSections(pcSubStr)
		return This.FindSectionsCS(pcSubStr, :CaseSensitive = TRUE)

		def FindSectionsQ(pcSubStr)
			return This.FindSectionsQR(pcSubStr, :stzList)

		def FindSectionsQR(pcSubStr, pcReturnType)
			return This.FindSectionsCSQR(pcSubStr, :CaseSensitive = TRUE, pcReturnType)

		#< @FunctionAlternativeForms

		def FindSubStringSections(pcSubStr)
			return This.FindSections(pcSubStr)

			def FindSubStringSectionsQ(pcSubStr)
				return This.FindSectionsQ(pcSubStr)

			def FindSubStringSectionsQR(pcSubStr, pcReturnType)
				return This.FindSectionsQR(pcSubStr, pcReturnType)

		#>

	  #----------------------------------------#
	 #   FINDING NTH SECTION OF A SUBSTRING   #
	#----------------------------------------#

	def FindNthSectionCS(n, pcSubStr, pCaseSensitive)
		if n = :First or n = :FirstSection
			n = 1
		but n = :Last or n = :LastSection
			n = This.NumberOfOccurrencesCS(pcSubStr, pCaseSensitive)
		ok

		return This.FindSectionsCS(pcSubStr, pCaseSensitive)[n]

		def FindNthSectionCSQ(n, pcSubStr, pCaseSensitive)
			return This.FindNthSectionCSQR(n, pcSubStr, pCaseSensitive, :stzList)

		def FindNthSectionCSQR(n, pcSubStr, pCaseSensitive, pcReturnType)
			if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			# TODO: Generalize this check

			if NOT isString(pcReturnType)
				stzRaise("Incorrect param! pcReturnType must be a string.")
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.FindNthSectionCS(n, pcSubStr, pCaseSensitive) )

			on :stzListOfNumbers
				return new stzListOfNumbers( This.FindNthSectionCS(n, pcSubStr, pCaseSensitive) )

			on :stzPair
				return new stzPair( This.FindNthSectionCS(n, pcSubStr, pCaseSensitive) )

			on :stzPairOfNumbers
				return new stzPairOfNumbers( This.FindNthSectionCS(n, pcSubStr, pCaseSensitive) )

			other
				stzRaise("Unsupported return type!")
			off

	#-- WITHOUT CASESENSITIVITY

	def FindNthSection(n, pcSubStr)
		return This.FindNthSectionCS(n, pcSubStr, :CaseSensitive = TRUE)

		def FindNthSectionQ(n, pcSubStr)
			return This.FindNthSectionQR(n, pcSubStr, pcReturnType)

		def FindNthSectionQR(n, pcSubStr, pcReturnType)
			return This.FindNthSectionCSQR(n, pcSubStr, :CaseSensitive = TRUE, pcReturnType)

	  #------------------------------------------#
	 #   FINDING FIRST SECTION OF A SUBSTRING   #
	#------------------------------------------#

	def FindFirstSectionCS(pcSubStr, pCaseSensitive)
		return This.FindNthSectionCS(1, pcSubStr, pCaseSensitive)

		def FindFirstSectionCSQ(pcSubStr, pCaseSensitive)
			return This.FindFirstSectionCSQR(pcSubStr, pCaseSensitive, :stzList)

		def FindFirstSectionCSQR(pcSubStr, pCaseSensitive, pcReturnType)
			if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			# TODO: Generalize this check

			if NOT isString(pcReturnType)
				stzRaise("Incorrect param! pcReturnType must be a string.")
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.FindFirstSectionCS(pcSubStr, pCaseSensitive) )

			on :stzListOfNumbers
				return new stzListOfNumbers( This.FindFirstSectionCS(n, pcSubStr, pCaseSensitive) )

			on :stzPair
				return new stzPair( This.FindFirstSectionCS(n, pcSubStr, pCaseSensitive) )

			on :stzPairOfNumbers
				return new stzPairOfNumbers( This.FindFirstSectionCS(n, pcSubStr, pCaseSensitive) )

			other
				stzRaise("Unsupported return type!")
			off

	#-- WITHOUT CASESENSITIVITY

	def FindFirstSection(pcSubStr)
		return This.FindFirstSectionCS(pcSubStr, :CaseSensitive = TRUE)

		def FindFirstSectionQ(pcSubStr)
			return This.FindFirstSectionQR(pcSubStr, pcReturnType)

		def FindFirstSectionQR(pcSubStr, pcReturnType)
			return This.FindFirstSectionCSQR(pcSubStr, :CaseSensitive = TRUE, pcReturnType)

	  #------------------------------------------#
	 #   FINDING LAST SECTION OF A SUBSTRING   #
	#------------------------------------------#

	def FindLastSectionCS(pcSubStr, pCaseSensitive)
		return This.FindNthSectionCS(:Last, pcSubStr, pCaseSensitive)

		def FindLastSectionCSQ(pcSubStr, pCaseSensitive)
			return This.FindLastSectionCSQR(pcSubStr, pCaseSensitive, :stzList)

		def FindLastSectionCSQR(pcSubStr, pCaseSensitive, pcReturnType)
			if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			# TODO: Generalize this check

			if NOT isString(pcReturnType)
				stzRaise("Incorrect param! pcReturnType must be a string.")
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.FindLastSectionCS(pcSubStr, pCaseSensitive) )

			on :stzListOfNumbers
				return new stzListOfNumbers( This.FindLastSectionCS(n, pcSubStr, pCaseSensitive) )

			on :stzPair
				return new stzPair( This.FindLastSectionCS(n, pcSubStr, pCaseSensitive) )

			on :stzPairOfNumbers
				return new stzPairOfNumbers( This.FindLastSectionCS(n, pcSubStr, pCaseSensitive) )

			other
				stzRaise("Unsupported return type!")
			off

	#-- WITHOUT CASESENSITIVITY

	def FindLastSection(pcSubStr)
		return This.FindLastSectionCS(pcSubStr, :CaseSensitive = TRUE)

		def FindLastSectionQ(pcSubStr)
			return This.FindLastSectionQR(pcSubStr, pcReturnType)

		def FindLastSectionQR(pcSubStr, pcReturnType)
			return This.FindLastSectionCSQR(pcSubStr, :CaseSensitive = TRUE, pcReturnType)

	  #=========================================================================#
	 #   FINDING ALL OCCURRENCES OF A SUBSTRING BETWEEN TWO OTHER SUBSTRINGS   #
	#=========================================================================#

	def FindBetweenCS(pcSubStr, pcBound1, pcBound2, pCaseSensitive)
		/* EXAMPLE
		o1 = new stzString("bla bla <<word>> bla bla <<noword>> bla <<word>>")
		? o1.FindBetweenCS("word", "<<", ">>", :CaseSensitive = FALSE)
		
		(we used here the simple form of the function)

		#--> [ 9, 41 ]
		*/

		aSections = This.FindSubStringSectionsBetweenCS(pcSubStr, pcBound1, pcBound2, pCaseSensitive)
			
		anResult = []

		for aPair in aSections
			anResult + aPair[1]
		next

		return anResult

		#< @FunctionFluentForm

		def FindBetweenCSQ(pcSubStr, pcBound1, pcBound2, pCaseSensitive)
			return This.FindBetweenCSQR(pcSubStr, pcBound1, pcBound2, pCaseSensitive, :stzList)

			def FindBetweenCSQR(pcSubStr, pcBound1, pcBound2, pCaseSensitive, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.FindBetweenCS(pcSubStr, pcBound1, pcBound2, pCaseSensitive) )
	
				on :stzListOfStrings
					return new stzListOfStrings( This.FindBetweenCS(pcSubStr, pcBound1, pcBound2, pCaseSensitive) )
	
				other
					stzRaise("Unsupported return type!")
				off
	
		#>

		#< @FunctionAlternativeForms

		def FindSubstringBetweenCS(pcSubStr, pcBound1, pcBound2, pCaseSensitive)
			return This.FindBetweenCS(pcSubStr, pcBound1, pcBound2, pCaseSensitive)

			def FindSubstringBetweenCSQ(pcSubStr, pcBound1, pcBound2, pCaseSensitive)
				return This.FindSubstringBetweenCSQR(pcSubStr, pcBound1, pcBound2, pCaseSensitive, :stzList)

			def FindSubstringBetweenCSQR(pcSubStr, pcBound1, pcBound2, pCaseSensitive, pcReturnType)
				return This.FindBetweenCSQR(pcSubStr, pcBound1, pcBound2, :CaseSensitive = TRUE, pcReturnType)			

		#>

	#-- WITHOUT CASESENSITIVITY

	def FindBetween(pcSubStr, pcBound1, pcBound2)
		return This.FindBetweenCS(pcSubStr, pcBound1, pcBound2, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def FindBetweenQ(pcSubStr, pcBound1, pcBound2)
			return This.FindBetweenQR(pcSubStr, pcBound1, pcBound2, :stzList)

			def FindBetweenQR(pcSubStr, pcBound1, pcBound2, pcReturnType)
				return This.FindBetweenCSQR(pcSubStr, pcBound1, pcBound2, :CaseSensitive = TRUE, pcReturnType)

		#>

		#< @FunctionAlternativeForms

		def FindSubstringBetween(pcSubStr, pcBound1, pcBound2)
			return This.FindBetween(pcSubStr, pcBound1, pcBound2)

			def FindSubstringBetweenQ(pcSubStr, pcBound1, pcBound2)
				return This.FindSubstringBetweenQR(pcSubStr, pcBound1, pcBound2, :stzList)

			def FindSubstringBetweenQR(pcSubStr, pcBound1, pcBound2, pcReturnType)
				return This.FindBetweenQR(pcSubStr, pcBound1, pcBound2, pcReturnType)			

		#>

	  #------------------------------------------------------------------#
	 #   FINDING SUBSTRING BETWEEN TWO GIVEN SUBSTRINGS -- SIMPLIFIED   #
	#------------------------------------------------------------------#

	def FindSubStringXTCS(pcSubStr, paBetween, pCaseSensitive)
		/* EXAMPLE

		o1 = new stzString("bla bla <<word>> bla bla <<noword>> bla <<word>>")
		? o1.FindSubStringXT("word", :Between = ["<<", ">>"])
		#--> [ 11, 43 ]

		Simpified alternative of:
		? o1.FindSubStringBetween("word", "<<", ">>")
			
		*/

		if isList(paBetween) and Q(paBetween).IsBetweenNamedParam()
			paBetween = paBetween[2]
		ok

		if isList(paBetween) and Q(paBetween).IsPairOfStrings()
			pcBound1 = paBetween[1]
			pcBound2 = paBetween[2]
		ok

		if NOT BothAreStrings(pcBound1, pcBound2)
			stzRaise("Syntax error! paBetween must be a pair of strings.")
		ok

		anResult = This.FindSubStringBetweenCS(pcSubStr, pcBound1, pcBound2, pCaseSensitive)
		return anResult


		def FindSubStringCSXT(pcSubStr, paBetween, pCaseSensitive)
			return This.FindSubStringXTCS(pcSubStr, paBetween, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def FindSubStringXT(pcSubStr, paBetween)
		return This.FindSubStringXTCS(pcSubStr, paBetween, :CaseSensitive = TRUE)

	  #------------------------------------------------------------------------------#
	 #   FINDING SECTIONS OF SUBSTRING BETWEEN TWO GIVEN SUBSTRINGS -- SIMPLIFIED   #
	#------------------------------------------------------------------------------#

	def FindSectionsXTCS(pcWord, paBetween, pCaseSensitive)
		/* EXAMPLE

		o1 = new stzString("bla bla <<word>> bla bla <<noword>> bla <<word>>")
		? o1.FindSectionsXT( :Of = "word", :Between = ["<<", ">>"] )
		#--> [ [ 11, 14 ], [ 43, 46 ] ]

		Simplified alternative of:
		? o1.FindSectionsBetween("word", "<<", ">>")
		*/

		if isList(pcWord) and Q(pcWord).IsOfNamedParam()
			pcWord = pcWord[2]
		ok

		if isList(paBetween) and Q(paBetween).IsBetweenNamedParam()
			paBetween = paBetween[2]
		ok

		if isList(paBetween) and Q(paBetween).IsPairOfStrings()
			pcBound1 = paBetween[1]
			pcBound2 = paBetween[2]
		ok

		if NOT BothAreStrings(pcBound1, pcBound2)
			stzRaise("Syntax error! paBetween must be a pair of strings.")
		ok

		aSections = This.FindSectionsBetweenCS(pcWord, pcBound1, pcBound2, pCaseSensitive)
		return aSections

		def FindSectionsCSXT(pcWord, paBetween, pCaseSensitive)
			return This.FindSectionsXTCS(pcWord, paBetween, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def FindSectionsXT(pcWord, paBetween)
		return This.FindSectionsXTCS(pcWord, paBetween, :CaseSensitive = TRUE)

	  #--------------------------------------------------------#
	 #   FINDING NTH SUBSTRING BETWEEN TWO GIVEN SUBSTRINGS   #
	#--------------------------------------------------------#

	def FindNthBetweenCS(n, pcSubStr, pcBound1, pcBound2, pCaseSensitive)
		if n = :First or n = :FirstSubString
			n = 1
		but n = :Last or n = :LastSubString
			n = This.NumberOfOccurrenceBetweenCS(pcSubStr, pcBound1, pcBound2, pCaseSensitive)
		ok

		anPositions = This.FindBetweenCS(pcSubStr, pcBound1, pcBound2, pCaseSensitive)
		nResult = anPositions[n]
		return nResult

		def FindNthSubStringBetweenCS(pcSubStr, pcBound1, pcBound2, pCaseSensitive)
			return This.FindNthBetweenCS(pcSubStr, pcBound1, pcBound2, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def FindNthBetween(n, pcSubStr, pcBound1, pcBound2)
		return This.FindNthBetweenCS(n, pcSubStr, pcBound1, pcBound2, :CaseSensitive = TRUE)

		def FindNthSubStringBetween(n, pcSubStr, pcBound1, pcBound2)
			return This.FindNthBetween(n, pcSubStr, pcBound1, pcBound2)

	  #----------------------------------------------------------#
	 #   FINDING FIRST SUBSTRING BETWEEN TWO GIVEN SUBSTRINGS   #
	#----------------------------------------------------------#

	def FindFirstBetweenCS(pcSubStr, pcBound1, pcBound2, pCaseSensitive)
		nResult = This.FindNthBetweenCS(1, pcSubStr, pcBound1, pcBound2, pCaseSensitive)
		return nResult

		def FindFirstSubStringBetweenCS(pcSubStr, pcBound1, pcBound2, pCaseSensitive)
			return This.FindFirstBetweenCS(pcSubStr, pcBound1, pcBound2, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def FindFirstBetween(pcSubStr, pcBound1, pcBound2)
		return This.FindFirstBetweenCS(pcSubStr, pcBound1, pcBound2, :CaseSensitive = TRUE)

		def FindFirstSubStringBetween(pcSubStr, pcBound1, pcBound2)
			return This.FindFirstBetween(pcSubStr, pcBound1, pcBound2)

	  #----------------------------------------------------------#
	 #   FINDING LAST SUBSTRING BETWEEN TWO GIVEN SUBSTRINGS   #
	#----------------------------------------------------------#

	def FindLastBetweenCS(pcSubStr, pcBound1, pcBound2, pCaseSensitive)
		nResult = This.FindNthBetweenCS(:Last, pcSubStr, pcBound1, pcBound2, pCaseSensitive)
		return nResult

		def FindLastSubStringBetweenCS(pcSubStr, pcBound1, pcBound2, pCaseSensitive)
			return This.FindLastBetweenCS(pcSubStr, pcBound1, pcBound2, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def FindLastBetween(pcSubStr, pcBound1, pcBound2)
		return This.FindLastBetweenCS(pcSubStr, pcBound1, pcBound2, :CaseSensitive = TRUE)

		def FindLastSubStringBetween(pcSubStr, pcBound1, pcBound2)
			return This.FindLastBetween(pcSubStr, pcBound1, pcBound2)

	  #----------------------------------------------------------------------#
	 #   FINDING NTH SUBSTRING BETWEEN TWO GIVEN SUBSTRINGS -- SIMPLIFIED   #
	#----------------------------------------------------------------------#
"ici"
	   #-------------------------------------------------------------#
	  #   FINDING ALL OCCURRENCES OF A SUBSTRING BETWEEN            #
	 #   TWO OTHER SUBSTRINGS AND RETURN THEIR RELATIVE SECTIONS   #
	#-------------------------------------------------------------#

	def FindSubstringSectionsBetweenCS(pcSubStr, pcBound1, pcbound2, pCaseSensitive)
		/* EXAMPLE
		o1 = new stzString("bla bla <<word>> bla bla <<noword>> bla <<word>>")
		? o1.FindSubstringSectionsBetweenCS("word", "<<", ">>", :CaseSensitive = FALSE)
		
		(we used here the simple form of the function)

		#--> [ [11, 14], [28, 31], [41, 44] ]
		*/

		# Getting all the occurrences of pcSubStr in the string

		aSections = This.FindSectionsCS(pcSubStr, pCaseSensitive)
		#--> [ [ 11, 14 ], [ 32, 35 ], [ 43, 47 ] ]

		# Checking the ones that are bounded by pcSubStr1 (<<) and pcSubStr2 (>>)

		nLen1 = StzStringQ(pcBound1).NumberOfChars()
		nLen2 = StzStringQ(pcBound2).NumberOfChars()

		anResult = []

		for aPair in aSections
			cStr = This.Section(aPair[1] - nLen1, aPair[2] + nLen2 )

			if StzStringQ(cStr).IsBoundedByCS([pcBound1, pcBound2], pCaseSensitive)
				anResult + aPair
			ok
		next

		return anResult

		#< @FunctionFluentForm

		def FindSubStringSectionsBetweenCSQ(pcSubStr, pcBound1, pcbound2, pCaseSensitive)
			return This.FindSubstringSectionsBetweenCSQR(pcSubStr, pcBound1, pcbound2, pCaseSensitive, :stzList)

			def FindSubstringSectionsBetweenCSQR(pcSubStr, pcBound1, pcbound2, pCaseSensitive, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.FindSubstringSectionsBetweenCS(pcSubStr, pcBound1, pcbound2, pCaseSensitive) )
	
				on :stzListOfStrings
					return new stzListOfStrings( This.FindSubstringSectionsBetweenCS(pcSubStr, pcBound1, pcbound2, pCaseSensitive) )
	
				other
					stzRaise("Unsupported return type!")
				off
		#>

		#< @FunctionAlternativeForm

		def FindSectionsBetweenCS(pcSubStr, pcBound1, pcBound2, pCaseSensitive)
			return This.FindSubstringSectionsBetweenCS(pcSubStr, pcBound1, pcbound2, pCaseSensitive)
		
			def FindSectionsBetweenCSQ(pcSubStr, pcBound1, pcBound2, pCaseSensitive)
				return This.FindSubstringSectionsBetweenCSQ(pcSubStr, pcBound1, pcbound2, pCaseSensitive)
		
			def FindSectionsBetweenCSQR(pcSubStr, pcBound1, pcBound2, pCaseSensitive, pcReturnType)
				return This.FindSubstringSectionsBetweenCSQR(pcSubStr, pcBound1, pcbound2, pCaseSensitive, pcReturnType)

		#>

	#-- WITHOUT CASESENSITIVITY

	def FindSubstringSectionsBetween(pcSubStr, pcBound1, pcbound2)
		return This.FindSubstringSectionsBetweenCS(pcSubStr, pcBound1, pcbound2, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def FindSubstringSectionsBetweenQ(pcSubStr, pcBound1, pcbound2)
			return This.FindSubstringSectionsBetweenQR(pcSubStr, pcBound1, pcbound2, :stzList)

			def FindSubstringSectionsBetweenQR(pcSubStr, pcBound1, pcbound2, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.FindSubstringSectionsBetween(pcSubStr, pcBound1, pcbound2) )
	
				on :stzListOfStrings
					return new stzListOfStrings( This.FindSubstringSectionsBetween(pcSubStr, pcBound1, pcbound2) )
	
				other
					stzRaise("Unsupported return type!")
				off
	
		#>

		#< @FunctionAlternativeForm

		def FindSectionsBetween(pcSubStr, pcBound1, pcBound2)
			return This.FindSubstringSectionsBetweenCS(pcSubStr, pcBound1, pcbound2, :CaseSensitive = TRUE)
		
			def FindSectionsBetweenQ(pcSubStr, pcBound1, pcBound2)
				return This.FindSubstringSectionsBetweenQ(pcSubStr, pcBound1, pcbound2)
		
			def FindSectionsBetweenQR(pcSubStr, pcBound1, pcBound2, pcReturnType)
				return This.FindSubstringSectionsBetweenQR(pcSubStr, pcBound1, pcbound2, pcReturnType)

		#>

	  #--------------------------------------------------------------------#
	 #  NUMBER OF OCCURRENCE OF A SUBSTRING BETWEEN TWO OTHER SUBSTRINGS  #
	#--------------------------------------------------------------------#

	def NumberOfOccurrenceBetweenCS(pcSubStr, pcBound1, pcBound2, pCaseSensitive)
		anResult = len( This.FindBetweenCS(pcSubStr, pcBound1, pcBound2, pCaseSensitive) )
		return anResult

		def NumberOfOccurrencesBetweenCS(pcSubStr, pcBound1, pcBound2, pCaseSensitive)
			return This.NumberOfOccurrenceBetweenCS(pcSubStr, pcBound1, pcBound2, pCaseSensitive)

		def NumberOfSectionsBetweenCS(pcSubStr, pcBound1, pcBound2, pCaseSensitive)
			return This.NumberOfOccurrenceBetweenCS(pcSubStr, pcBound1, pcBound2, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def NumberOfOccurrenceBetween(pcSubStr, pcBound1, pcBound2)
		return This.NumberOfOccurrenceBetweenCS(pcSubStr, pcBound1, pcBound2, :CaseSensitive = TRUE)

		def NumberOfSectionsBetween(pcSubStr, pcBound1, pcBound2)
			return This.NumberOfOccurrenceBetween(pcSubStr, pcBound1, pcBound2)

	  #-----------------------------------------------------------------------#
	 #  NUMBER OF OCCURRENCE OF A SUBSTRING BOUNDED BY TWO OTHER SUBSTRINGS  #
	#-----------------------------------------------------------------------#

	def NumberOfOccurrenceCSXT(pcSubStr, pacBetween, pCaseSensitive)
		/* EXAMPLE
		
		o1 = new stzString("How many <<many>> are there in (many <<many>>): so <<many>>!")
		? o1.NumberOfOccurrenceXT(
			:OfSubString = "many",
			:BetweenSubStrings = ["<<", :and = ">>"]
			# or :BoundedBy = ["<<", :and = ">>"]
		)
		#--> 

		*/

		if isList(pcSubStr) and ( Q(pcSubStr).IsOfNamedParam() or Q(pcSubStr).IsOfSubStringNamedParam() )
			pcSubStr = pcSubStr[2]
		ok

		if isList(pacBetween) and
			( Q(pacBetween).IsBetweenNamedParam() or
			Q(pacBetween).IsBetweenSubstringsNamedParam() or
			Q(pacBetween).IsBoundedByNamedParam() or
			Q(pacBetween).IsBoundedBySubStringsNamedParam() )

			pacBetween = pacBetween[2]
		ok

		if isList(pacBetween) and
			isList(pacBetween[2]) and
			Q(pacBetween[2]).IsAndNamedParam()

				pacBetween[2] = pacBetween[2][2]
		ok

		if NOT ( Q(pacBetween).IsPairOfStrings() or
			
			( isString(pacBetween[1]) and
			   	isList(pacBetween[2]) and
			  	 Q(pacBetween[2]).IsAndNamedParam() and
			   	 isString(pacBetween[2][2])
			)
		      )

			stzRaise("Incorrect param! pacBetween must be a pair of strings.")
		ok

		nResult = This.NumberOfOccurrenceBetweenCS(pcSubStr, pacBetween[1], pacBetween[2], pCaseSensitive)
		return nResult

		def NumberOfOccurrenceXTCS(pcSubStr, pacBetween, pCaseSensitive)
			return This.NumberOfOccurrenceCSXT(pcSubStr, pacBetween, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def NumberOfOccurrenceXT(pcSubStr, pacBetween)
		return This.NumberOfOccurrenceCSXT(pcSubStr, pacBetween, :CaseSensitive = TRUE)

	   #-------------------------------------------------------------#
	  #   FINDING NTH OCCURRENCE OF A SUBSTRING BETWEEN            #
	 #   TWO OTHER SUBSTRINGS AND RETURN THEIR RELATIVE SECTION   #
	#------------------------------------------------------------#

	def FindNthSectionBetweenCS(n, pcSubStr, pcBound1, pcbound2, pCaseSensitive)
		/* EXAMPLE
		o1 = new stzString("bla bla <<word>> bla bla <<noword>> bla <<word>>")
		? o1.FindNthSectionBetweenCS(2, "word", "<<", ">>", :CaseSensitive = FALSE)

		(we used here the simple form of the function)

		#--> [ 28, 31 ]
		*/

		# Getting all the occurrences of pcSubStr in the string

		if n = :First or n = :FirstSection
			n = 1

		but n = :Last or n = :LastSection
			n = This.NumberOfOccurrenceBetweenCS(pcSubStr, pcBound1, pcBound2, pCaseSensitive)

		ok

		anResult = This.FindSectionsBetweenCS(pcSubStr, pcBound1, pcBound2, pCaseSensitive)[n]

		return anResult

		#< @FunctionFluentForm

		def FindNthSectionBetweenCSQ(n, pcSubStr, pcBound1, pcbound2, pCaseSensitive)
			return This.FindNthSectionBetweenCSQR(n, pcSubStr, pcBound1, pcbound2, pCaseSensitive, :stzList)

			def FindNthSectionBetweenCSQR(n, pcSubStr, pcBound1, pcbound2, pCaseSensitive, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.FindNthSectionBetweenCS(n, pcSubStr, pcBound1, pcbound2, pCaseSensitive) )
	
				on :stzListOfStrings
					return new stzListOfStrings( This.FindNthSectionBetweenCS(n, pcSubStr, pcBound1, pcbound2, pCaseSensitive) )
	
				other
					stzRaise("Unsupported return type!")
				off
	
		#>

	#-- WITHOUT CASESENSITIVITY

	def FindNthSectionBetween(n, pcSubStr, pcBound1, pcbound2)
		return This.FindNthSectionBetweenCS(n, pcSubStr, pcBound1, pcbound2, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def FindNthSectionBetweenQ(n, pcSubStr, pcBound1, pcbound2)
			return This.FindNthSectionBetweenQR(n, pcSubStr, pcBound1, pcbound2, :stzList)

			def FindNthSectionBetweenQR(n, pcSubStr, pcBound1, pcbound2, pcReturnType)
				return This.FindNthSectionBetweenCSQR(n, pcSubStr, pcBound1, pcbound2, :CaseSensitive = TRUE, pcReturnType)
	
		#>

	   #---------------------------------------------------------------#
	  #   FINDING FIRST OCCURRENCE OF A SUBSTRING BETWEEN TWO OTHER   #
	 #   SUBSTRINGS AND RETURN THE RESULT AS A SECTION		 #
	#---------------------------------------------------------------#

	def FindFirstSectionBetweenCS(pcSubStr, pcBound1, pcbound2, pCaseSensitive)
		anResult = This.FindNthSectionBetweenCS(1, pcSubStr, pcBound1, pcbound2, pCaseSensitive)

		return anResult

		#< @FunctionFluentForm

		def FindFirstSectionBetweenCSQ(pcSubStr, pcBound1, pcbound2, pCaseSensitive)
			return This.FindFirstSectionBetweenCSQR(n, pcSubStr, pcBound1, pcbound2, pCaseSensitive, :stzList)

			def FindFirstSectionBetweenCSQR(pcSubStr, pcBound1, pcbound2, pCaseSensitive, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.FindFirstSectionBetweenCS(n, pcSubStr, pcBound1, pcbound2, pCaseSensitive) )
	
				on :stzListOfStrings
					return new stzListOfStrings( This.FindFirstSectionBetweenCS(n, pcSubStr, pcBound1, pcbound2, pCaseSensitive) )
	
				other
					stzRaise("Unsupported return type!")
				off
	
		#>

	#-- WITHOUT CASESENSITIVITY

	def FindFirstSectionBetween(pcSubStr, pcBound1, pcbound2)
		return This.FindFirstSectionBetweenCS(pcSubStr, pcBound1, pcbound2, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def FindFirstSectionBetweenQ(pcSubStr, pcBound1, pcbound2)
			return This.FindFirstSectionBetweenQR(pcSubStr, pcBound1, pcbound2, :stzList)

			def FindFirstSectionBetweenQR(pcSubStr, pcBound1, pcbound2, pcReturnType)
				return This.FindFirstSectionBetweenCSQR(pcSubStr, pcBound1, pcbound2, :CaseSensitive = TRUE, pcReturnType)
	
		#>

	   #---------------------------------------------------------------#
	  #   FINDING LAST OCCURRENCE OF A SUBSTRING BETWEEN TWO OTHER    #
	 #   SUBSTRINGS AND RETURN THE RESULT AS A SECTION		 #
	#---------------------------------------------------------------#

	def FindLastSectionBetweenCS(pcSubStr, pcBound1, pcbound2, pCaseSensitive)
		anResult = This.
			FindNthSectionBetweenCS(
				:LastSection, pcSubStr, pcBound1, pcbound2, pCaseSensitive
			)

		return anResult

		#< @FunctionFluentForm

		def FindLastSectionBetweenCSQ(pcSubStr, pcBound1, pcbound2, pCaseSensitive)
			return This.FindLastSectionBetweenCSQR(n, pcSubStr, pcBound1, pcbound2, pCaseSensitive, :stzList)

			def FindLastSectionBetweenCSQR(pcSubStr, pcBound1, pcbound2, pCaseSensitive, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.FindLastSectionBetweenCS(n, pcSubStr, pcBound1, pcbound2, pCaseSensitive) )
	
				on :stzListOfStrings
					return new stzListOfStrings( This.FindLastSectionBetweenCS(n, pcSubStr, pcBound1, pcbound2, pCaseSensitive) )
	
				other
					stzRaise("Unsupported return type!")
				off
	
		#>

	#-- WITHOUT CASESENSITIVITY

	def FindLastSectionBetween(pcSubStr, pcBound1, pcbound2)
		return This.FindLastSectionBetweenCS(pcSubStr, pcBound1, pcbound2, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def FindLastSectionBetweenQ(pcSubStr, pcBound1, pcbound2)
			return This.FindLastSectionBetweenQR(pcSubStr, pcBound1, pcbound2, :stzList)

			def FindLastSectionBetweenQR(pcSubStr, pcBound1, pcbound2, pcReturnType)
				return This.FindLastSectionBetweenCSQR(pcSubStr, pcBound1, pcbound2, :CaseSensitive = TRUE, pcReturnType)
	
		#>

	  #-----------------------------------------------------------------------#
	 #   FINDING OCCURRENCES OF ANY SUBSTRING BETWEEN TWO OTHER SUBSTRINGS   #
	#-----------------------------------------------------------------------#

	def FindAnyBetweenCS(pcSubStr1, pcSubStr2, pCaseSensitive)
		/* EXAMPLE

		o1 = new stzString("blabla bla <<word1>> bla bla <<word2>>")
		? o1.FindAnyBetween( "<<", ">>" )
		#--> [ 14, 32 ]

		? o1.FindAnyBetweenXT( [ "word1", 14 ], [ "word2", 32 ] ] ) // TODO

		*/

		if isList(pcSubStr1) and Q(pcSubStr1).IsSubStringNamedParam()
			pcSubStr1 = pcSubStr1[2]
		ok

		if isList(pcSubStr2) and
			( Q(pcSubStr2).IsAndNamedParam() or
			  Q(pcSubStr2).IsAndSubStringNamedParam() )

			pcSubStr2 = pcSubStr2[2]
		ok

		aResult = []

		n1 = 1
		n2 = 1

		nLen1 = StzStringQ(pcSubStr1).NumberOfChars()
		nLen2 = StzStringQ(pcSubstr2).NumberOfChars()

		i = 0
		while TRUE
			i++
			if i > This.NumberOfChars() { exit }

			n1 = This.FindNextCS(pcSubStr1, :StartingAt = n1, pCaseSensitive)

			if n1 = 0
				exit
			ok

			n2 = This.FindNextCS(pcSubStr2, :StartingAt = n1 + nLen1, pCaseSensitive)

			if n2 = 0 or n2 > This.NumberOfChars()
				exit
			ok

			aResult + ( n1 + nLen1 )

			n1 = n2 + nLen2

		end

		return aResult

		#< @FunctionFluentForm

		def FindAnyBetweenCSQ(pcSubStr1, pcSubStr2, pCaseSensitive)
			return This.FindAnyBetweenCSQR(pcSubStr1, pcSubStr2, pCaseSensitive, :stzList)

			def FindAnyBetweenCSQR(pcSubStr1, pcSubStr2, pCaseSensitive, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.FindAnyBetweenCS(pcSubStr1, pcSubStr2, pCaseSensitive) )
	
				on :stzListOfStrings
					return new stzListOfStrings( This.FindAnyBetweenCS(pcSubStr1, pcSubStr2, pCaseSensitive) )
	
				other
					stzRaise("Unsupported return type!")
				off
	
		#>

		#< @FunctionAlternativeForms

		def FindSubstringsBetweenCS(pcSubStr1, pcSubStr2, pCaseSensitive)
			return This.FindAnyBetweenCS(pcSubStr1, pcSubStr2, pCaseSensitive)

			def FindSubstringsBetweenCSQ(pcSubStr1, pcSubStr2, pCaseSensitive)
				return This.FindSubstringsBetweenCSQR(pcSubStr1, pcSubStr2, pCaseSensitive, :stzList)

			def FindSubstringsBetweenCSQR(pcSubStr1, pcSubStr2, pCaseSensitive, pcReturnType)
				return This.FindAnyBetweenCSQR(pcSubStr1, pcSubStr2, :CaseSensitive = TRUE, pcReturnType)				

		def FindAnySubstringBetweenCS(pcSubStr1, pcSubStr2, pCaseSensitive)
			return This.FindAnyBetweenCS(pcSubStr1, pcSubStr2, pCaseSensitive)

			def FindAnySubstringBetweenCSQ(pcSubStr1, pcSubStr2, pCaseSensitive)
				return This.FindSubstringsBetweenCSQR(pcSubStr1, pcSubStr2, pCaseSensitive, :stzList)

			def FindAnySubstringBetweenCSQR(pcSubStr1, pcSubStr2, pCaseSensitive, pcReturnType)
				return This.FindAnyBetweenCSQR(pcSubStr1, pcSubStr2, :CaseSensitive = TRUE, pcReturnType)				

		def FindAnySubstringsBetweenCS(pcSubStr1, pcSubStr2, pCaseSensitive)
			return This.FindAnyBetweenCS(pcSubStr1, pcSubStr2, pCaseSensitive)

			def FindAnySubstringsBetweenCSQ(pcSubStr1, pcSubStr2, pCaseSensitive)
				return This.FindSubstringsBetweenCSQR(pcSubStr1, pcSubStr2, pCaseSensitive, :stzList)

			def FindAnySubstringsBetweenCSQR(pcSubStr1, pcSubStr2, pCaseSensitive, pcReturnType)
				return This.FindAnyBetweenCSQR(pcSubStr1, pcSubStr2, :CaseSensitive = TRUE, pcReturnType)				

		#>

	#-- WITHOUT CASESENSITIVITY

	def FindAnyBetween(pcSubStr1, pcSubStr2)
		return This.FindAnyBetweenCS(pcSubStr1, pcSubStr2, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def FindAnyBetweenQ(pcSubStr1, pcSubStr2)
			return This.FindAnyBetweenQR(pcSubStr1, pcSubStr2, :stzList)

			def FindAnyBetweenQR(pcSubStr1, pcSubStr2, pcReturnType)
				return This.FindAnyBetweenCSQR(pcSubStr1, pcSubStr2, :CaseSensitive = TRUE, pcReturnType)
	
		#>

		#< @FunctionAlternativeForms

		def FindSubstringsBetween(pcSubStr1, pcSubStr2)
			return This.FindAnyBetween(pcSubStr1, pcSubStr2)

			def FindSubstringsBetweenQ(pcSubStr1, pcSubStr2)
				return This.FindSubstringsBetweenQR(pcSubStr1, pcSubStr2, :stzList)

			def FindSubstringsBetweenQR(pcSubStr1, pcSubStr2, pcReturnType)
				return This.FindAnyBetweenQR(pcSubStr1, pcSubStr2, pcReturnType)				

		def FindAnySubstringBetween(pcSubStr1, pcSubStr2)
			return This.FindAnyBetween(pcSubStr1, pcSubStr2)

			def FindAnySubstringBetweenQ(pcSubStr1, pcSubStr2)
				return This.FindSubstringsBetweenQR(pcSubStr1, pcSubStr2, :stzList)

			def FindAnySubstringBetweenQR(pcSubStr1, pcSubStr2, pcReturnType)
				return This.FindAnyBetweenQR(pcSubStr1, pcSubStr2, pcReturnType)				

		def FindAnySubstringsBetween(pcSubStr1, pcSubStr2)
			return This.FindAnyBetween(pcSubStr1, pcSubStr2)

			def FindAnySubstringsBetweenQ(pcSubStr1, pcSubStr2)
				return This.FindSubstringsBetweenQR(pcSubStr1, pcSubStr2, :stzList)

			def FindAnySubstringsBetweenQR(pcSubStr1, pcSubStr2, pcReturnType)
				return This.FindAnyBetweenQR(pcSubStr1, pcSubStr2, pcReturnType)				

		#>

	def FindAnySectionsBetweenCS(pcSubStr1, pcSubStr2, pCaseSensitive)
		/*

		? o1.FindAnyBetweenXT("<<", ">>")
		#--> [ [11, "word1"], [29, "word2"], [43, "word2"] ]
		*/

		aBetweenXT = This.FindAnyBetweenXTCS(pcSubStr1, pcSubStr2, pCaseSensitive)

		aResult = []
		for aPair in aBetweenXT
			n1 = aPair[1]
			nLen = Q(aPair[2]).NumberOfChars()
			n2 = n1 + nLen - 1
			aResult + [ n1, n2 ]
		next

		return aResult

		#< @FunctionFluentForm

		def FindAnySectionsBetweenCSQ(pcSubStr1, pcSubStr2, pCaseSensitive)
			return This.FindAnySectionsBetweenCSQR(pcSubStr1, pcSubStr2, pCaseSensitive, :stzList)

		def FindAnySectionsBetweenCSQR(pcSubStr1, pcSubStr2, pCaseSensitive, pcReturnType)
			if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			# TODO: Generalize this check

			if NOT isString(pcReturnType)
				stzRaise("Incorrect param! pcReturnType must be a string.")
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.FindAnySectionsBetweenCS(pcSubStr1, pcSubStr2, pCaseSensitive) )

			on :stzListOfLists
				return new stzListOfLists( This.FindAnySectionsBetweenCS(pcSubStr1, pcSubStr2, pCaseSensitive) )

			on :stzListOfPairs
				return new stzListOfPairs( This.FindAnySectionsBetweenCS(pcSubStr1, pcSubStr2, pCaseSensitive) )

			other
				stzRaise("Unsupported return type!")
			off

		#>

	#-- WITHOUT CASESENSiTiVITY

	def FindAnySectionsBetween(pcSubStr1, pcSubStr2)
		return This.FindAnySectionsBetweenCS(pcSubStr1, pcSubStr2, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def FindAnySectionsBetweenQ(pcSubStr1, pcSubStr2)
			return This.FindAnySectionsBetweenQR(pcSubStr1, pcSubStr2, :stzList)

		def FindAnySectionsBetweenQR(pcSubStr1, pcSubStr2, pcReturnType)
			return This.FindAnySectionsBetweenCSQR(pcSubStr1, pcSubStr2, :CaseSensitive = TRUE, pcReturnType)

		#>

	  #----------------------------------------------------------------------------------#
	 #   FINDING OCCURRENCES OF ANY SUBSTRING BETWEEN TWO OTHER SUBSTRINGS -- EXTENDED  #
	#----------------------------------------------------------------------------------#

	def FindSubStringsBetweenCSXT(pcSubStr1, pcSubStr2, pCaseSensitive)
		aResult = []
		anPositions  = This.FindSubstringsBetweenCS(pcSubStr1, pcSubStr2, pCaseSensitive)
		acSubStrings = This.SubstringsBetweenCS(pcSubStr1, pcSubStr2, pCaseSensitive)

		for i = 1 to len(anPositions)
			aResult + [ anPositions[i], acSubStrings[i] ]
		next

		return aResult

		#< @FunctionAlternativeForms

		def FindSubstringsBetweenXTCS(pcSubStr1, pcSubStr2, pCaseSensitive)
			return This.FindSubstringsBetweenCSXT(pcSubStr1, pcSubStr2, pCaseSensitive)

		def FindAnyBetweenXTCS(pcSubStr1, pcSubStr2, pCaseSensitive)
			return This.FindSubstringsBetweenCSXT(pcSubStr1, pcSubStr2, pCaseSensitive)

		def FindAnyBetweenCSXT(pcSubStr1, pcSubStr2, pCaseSensitive)
			return This.FindSubstringsBetweenCSXT(pcSubStr1, pcSubStr2, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def FindSubstringsBetweenXT(pcSubStr1, pcSubStr2)
		return This.FindSubstringsBetweenCSXT(pcSubStr1, pcSubStr2, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForm

		def FindAnyBetweenXT(pcSubStr1, pcSubStr2)
			return This.FindSubstringsBetweenXT(pcSubStr1, pcSubStr2)

		#>

	  #---------------------------------------------------------#
	 #   FINDING SECTIONS BETWEEN TWO SUBSTRINGS -- EXTENDED   #
	#---------------------------------------------------------#

	def FindAnySectionsBetweenXTCS(pcSubStr1, pcSubStr2, pCaseSensitive)
		/* EXAMPLE
		o1 = new stzString("blabla bla <<word1>> bla bla <<word2>>")
		? o1.FindAnySectionsBetweenXT("<<", ">>")
		#--> [ [ "word1", [14,18] ], [ "word2", [32,36] ] ]
		*/

		acBetweenXT = This.FindSubstringsBetweenXTCS(pcSubStr1, pcSubStr2, pCaseSensitive)
		#--> [ [ 14, "word1" ], [ 32, "word2" ] ]

		aResult = []
		for aPair in acBetweenXT
			n1 = aPair[1]
			n2 = n1 + Q(aPair[2]).NumberOfChars() - 1
			aResult + [ aPair[2], [ n1, n2 ] ]
		next

		return aResult

		def FindAnySectionsBteweenCSXT(pcSubStr1, pcSubStr2, pCaseSensitive)
			return This.FindAnySectionsBetweenXTCS(pcSubStr1, pcSubStr2, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def FindAnySectionsBetweenXT(pcSubStr1, pcSubStr2)
		return This.FindAnySectionsBetweenXTCS(pcSubStr1, pcSubStr2, :CaseSensitive = TRUE)

	  #------------------------------------------------------------------#
	 #   EXTRACTING SUBSTRINGS ENCLOSED BETWEEN TWO OTHER SUBSTRINGS    # 
	#------------------------------------------------------------------#

	def SubstringsBetweenCS(pcSubStr1, pcSubStr2, pCaseSensitive)
		/* EXAMPLE

		o1 = new stzString("blabla bla <<word1>> bla bla <<word2>>")
		? o1.SubstringsBetween("<<", ">>", :CS = FALSE)

		# --> [ "word1", "word2" ]
		*/

		if isList(pcSubStr2) and Q(pcSubStr2).IsAndNamedParam()
			pcSubStr2 = pcSubStr2[2]
		ok

		aResult = []

		n1 = 1
		n2 = 1

		nLen1 = StzStringQ(pcSubStr1).NumberOfChars()
		nLen2 = StzStringQ(pcSubstr2).NumberOfChars()

		while TRUE

			n1 = This.FindNextCS(pcSubStr1, :StartingAt = n1, pCaseSensitive)

			if n1 = 0 or n1 > This.NumberOfChars()
				exit
			ok

			n2 = This.FindNextCS(pcSubStr2, :StartingAt = n1 + nLen1, pCaseSensitive)

			if n2 = 0 or n2 > This.NumberOfChars()
				exit
			ok

			aResult + This.Section(n1 + nLen1, n2 - 1)

			n1 = n2 + nLen2

		end

		return aResult

		#< @FunctionFluentForm

		def SubstringsBetweenCSQ(pcSubStr1, pcSubStr2, pCaseSensitive)
			return This.SubstringsBetweenCSQR(pcSubStr1, pcSubStr2, pCaseSensitive, :stzList)

		def SubstringsBetweenCSQR(pcSubStr1, pcSubStr2, pCaseSensitive, pcReturnType)
			if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.SubstringsBetweenCS(pcSubStr1, pcSubStr2, pCaseSensitive) )

			on :stzListOfStrings
				return new stzListOfStrings( This.SubstringsBetweenCS(pcSubStr1, pcSubStr2, pCaseSensitive) )

			other
				stzRaise("Unsupported return type!")
			off
			
		#>

		#< @FunctionAlternativeForms

		def AnySubStringBetweenCS(pcSubStr1, pcSubStr2, pCaseSensitive)
			return This.SubStringsBetweenCS(pcSubStr1, pcSubStr2, pCaseSensitive)

			def AnySubStringBetweenCSQ(pcSubStr1, pcSubStr2, pCaseSensitive)
				return This.SubStringsBetweenQCS(pcSubStr1, pcSubStr2, pCaseSensitive)

			def AnySubStringBetweenCSQR(pcSubStr1, pcSubStr2, pCaseSensitive, pcReturnType)
				return This.SubStringsBetweenQR(pcSubStr1, pcSubStr2, pCaseSensitive, pcReturnType)

		def AnySubStringsBetweenCS(pcSubStr1, pcSubStr2, pCaseSensitive)
			return This.SubStringsBetweenCS(pcSubStr1, pcSubStr2, pCaseSensitive)

			def AnySubStringsBetweenCSQ(pcSubStr1, pcSubStr2, pCaseSensitive)
				return This.SubStringsBetweenQCS(pcSubStr1, pcSubStr2, pCaseSensitive)

			def AnySubStringsBetweenCSQR(pcSubStr1, pcSubStr2, pCaseSensitive, pcReturnType)
				return This.SubStringsBetweenQR(pcSubStr1, pcSubStr2, pCaseSensitive, pcReturnType)

		#>

	#-- WITHOUT CASESENSITIVITY

	def SubstringsBetween(pcSubStr1, pcSubStr2)
		return This.SubstringsBetweenCS(pcSubStr1, pcSubStr2, :CaseSensitive = TRUE)

		#< @FunctionFluentForm

		def SubstringsBetweenQ(pcSubStr1, pcSubStr2)
			return This.SubstringsBetweenQR(pcSubStr1, pcSubStr2, pCaseSensitive, :stzList)

		def SubstringsBetweenQR(pcSubStr1, pcSubStr2, pcReturnType)
			return This.SubstringsBetweenCSQR(pcSubStr1, pcSubStr2, :CaseSensitive = TRUE, pcReturnType)
			
		#>

		#< @FunctionAlternativeForms

		def AnySubStringBetween(pcSubStr1, pcSubStr2)
			return This.SubStringsBetween(pcSubStr1, pcSubStr2)

			def AnySubStringBetweenQ(pcSubStr1, pcSubStr2)
				return This.SubStringsBetweenQ(pcSubStr1, pcSubStr2)

			def AnySubStringBetweenQR(pcSubStr1, pcSubStr2, pcReturnType)
				return This.SubStringsBetweenQR(pcSubStr1, pcSubStr2, pcReturnType)

		def AnySubStringsBetween(pcSubStr1, pcSubStr2)
			return This.SubStringsBetween(pcSubStr1, pcSubStr2)

			def AnySubStringsBetweenQ(pcSubStr1, pcSubStr2)
				return This.SubStringsBetweenQ(pcSubStr1, pcSubStr2)

			def AnySubStringsBetweenQR(pcSubStr1, pcSubStr2, pcReturnType)
				return This.SubStringsBetweenQR(pcSubStr1, pcSubStr2, pcReturnType)

		#>

	  #----------------------------------------------------------------------------#
	 #   EXTRACTING SUBSTRINGS ENCLOSED BETWEEN TWO OTHER SUBSTRINGS -- EXTENDED  #
	#----------------------------------------------------------------------------#

	def SubStringsBetweenXTCS(pcSubStr1, pcSubStr2, pCaseSensitive)
		aResult = []

		acSubStrings = This.SubStringsBetweenCS(pcSubStr1, pcSubStr2, pCaseSensitive)
		aSections    = This.FindAnySectionsBetweenCS(pcSubStr1, pcSubStr2, pCaseSensitive)

		for i = 1 to len(acSubStrings)
			aResult + [ acSubStrings[i], aSections[i] ]
		next

		return aResult

		#< @FunctionAlternativeForms

		def SubStringsBetweenCSXT(pcSubStr1, pcSubStr2, pCaseSensitive)
			return This.SubStringsBetweenXTCS(pcSubStr1, pcSubStr2, pCaseSensitive)

		def AnySubStringsBetweenXTCS(pcSubStr1, pcSubStr2, pCaseSensitive)
			return This.SubStringsBetweenXTCS(pcSubStr1, pcSubStr2, pCaseSensitive)

		def AnySubStringsBetweenCSXT(pcSubStr1, pcSubStr2, pCaseSensitive)
			return This.SubStringsBetweenXTCS(pcSubStr1, pcSubStr2, pCaseSensitive)
 
		#>


	#-- WITHOUT CASESENSITIVITY

	def SubStringsBetweenXT(pcSubStr1, pcSubStr2)
		return This.SubStringsBetweenXTCS(pcSubStr1, pcSubStr2, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForm

		def AnySubStringsBetweenXT(pcSubStr1, pcSubStr2)
			return This.SubStringsBetweenXT(pcSubStr1, pcSubStr2)

		#>

	  #========================================#
	 #  VISUALLY FINDING CHARS IN THE STRING  #
	#========================================#

	def VizFindChar(c)
		if IsStzChar(c)
			c = c.Content()
		ok

		if NOT ( isString(c) and StringIsChar(c) )
			return NULL
		ok

		cResult = @@( This.Content() )
		anPositions = This.FindAll( c )

		nLen = StzString(cRrsult).NumberOfChars()

		cViz = " "
		for i = 1 to nLen - 2
			
			if StzNumberQ(i).IsOneOfThese(anPositions)
				cViz += "^"
			else
				cViz += "-"
			ok

		next

		cResult += (NL + cViz)

		return cResult

		#< @FunctionFluentForm

		def VizFindCharQ(pItem)
			return new stzString( This.VizFindChar(pItem) )

		#>

	  #-----------------------------------------#
	 #      VISUALLY FINDING A SUBSTRING       #
	#-----------------------------------------#

	def VizFindXT(pcSubStr, paOptions)

		/* THE LOGIC ADOPTED IN CHECKING FUNCTION CORRECNESS
		   -------------------------------------------------

		   1. Checking the correctness of the TYPES of the params

		   2. Reading the VALUES of the params provided and giving
		      default values to them if necessary

		   3. Checking the correctness of those values

		   4. Doing the required job

		TODO --> This logic should be generalized everywhere
		in the library to keep code consistent and knowledgable!

		FUTURE --> Replace all these checks with declarative Constraints.

		*/

		# STEP 1: Checking params TYPES
		
		if NOT isString(pcSubStr)
			stzRaise("Incorrect param type! pcSubStr must be a string.")
		ok

		if NOT ( isList(paOptions) and
			 Q(paOptions).IsHashList() and

			 StzHashListQ(paOptions).KeysQ().IsMadeOfSome([
				:CaseSensitive, :CS, :PositionSign,
				:BlankSign, :Numbered, :Spacified,
				:Boxed, :BoxOptions ]) )
			 
			stzRaise("Incorrect param type! paOptions must be a wellformed hashlist.")
		ok

		# At this level, we are sure pcSubStr is a string and
		# paOptions is a hashlist made of some of the allowed keys for boxing

		# Before going further, Delegate the work to VizFindBoxedXT()
		# when boxing is required

		if StzHashListQ(paOptions).ContainsKey(:Boxed) and
		   IsBoolean(paOptions[ :Boxed ]) and paOptions[ :Boxed ] = TRUE

			return This.VizFindBoxedXT(pcSubStr, paOptions)
		ok

		if StzHashListQ(paOptions).KeysQ().ContainsBoth(:CaseSensitive, :CS)
			stzRaise("Incorrect options! :CaseSensitive and its short form :CS must not be used both.")
		ok

		# Unfying the :CaseSensitive / :CS keyword

		n = StzHashListQ(paOptions).FindKey(:CS)
		if n > 0
			paOptions[n][1] = :CaseSensitive
		ok

		# STEP 2: Reading params values

		bCaseSensitive = TRUE
		if ( isString(paOptions[:CaseSensitive]) and paOptions[:CaseSensitive] != NULL ) or
		   ( isNumber(paOptions[:CaseSensitive]) and IsBoolean(paOptions[:CaseSensitive])  )

			bCaseSensitive = paOptions[:CaseSensitive]
		ok

		cPositionSign = "^"
		if isString(paOptions[:PositionSign]) and paOptions[:PositionSign] != NULL
			cPositionSign = paOptions[:PositionSign]
		ok

		cBlankSign = "-"
		if isString(paOptions[:BlankSign]) and paOptions[:BlankSign] != NULL
			cBlankSign = paOptions[:BlankSign]
		ok

		bNumbered = FALSE
		if ( isString(paOptions[:Numbered]) and paOptions[:Numbered] != NULL ) or
		   ( isNumber(paOptions[:Numbered]) and IsBoolean(paOptions[:Numbered])  )

			bNumbered = paOptions[:Numbered]
		ok

		bSpacified = FALSE
		if ( isString(paOptions[:Spacified]) and paOptions[:Spacified] != NULL ) or
		   ( isNumber(paOptions[:Spacified]) and IsBoolean(paOptions[:Spacified])  )

			bSpacified = paOptions[:Spacified]
		ok

		# STEP 3: Checking the correctness of the provided values

		bCorrect = TRUE
		acWhy = [] # Will host the reasons of the errors

		If NOT IsBoolean(bCaseSensitive)

			bCorrect = FALSE
			acWhy + ":CaseSensitive option must be a boalean"
		ok

		if NOT ( isString(cPositionSign) and StringIsChar(cPositionSign) )

			bCorrect = FALSE
			acWhy + ":PositionSign option must be a char"
		ok

		if NOT ( isString(cBlankSign) and StringIsChar(cBlankSign) )

			bCorrect = FALSE
			acWhy + ":BlankSign option must be char"
		ok

		if NOT cPositionSign != cBlankSign

			bCorrect = FALSE
			acWhy + ":PositionSign and :BlankSign options must be different"
		ok

		If NOT IsBoolean(bNumbered)

			bCorrect = FALSE
			acWhy + ":Numbered option must be a boalean"
		ok

		If NOT IsBoolean(bSpacified)

			bCorrect = FALSE
			acWhy + ":Spacified option must be a boalean"
		ok

		if NOT bCorrect
			stzRaise([
				:Where	= "stzString.ring > vizFindXT()",
				:What	= StzListOfStringsQ(acWhy).ConcatenatedUsing(", ") + "."
			])
		ok

		# At this level, we are sur the params are well formed
		# --> Let's do the job!

		if bSpacified
			cString= @@( This.Spacified() )
		else
			cString = @@( This.Content() )
		ok

		oString = new stzString(cString)

		anPositions = oString.FindAllCS( pcSubStr, :CS = bCaseSensitive )

		anVizPositions = StzListOfNumbersQ(anPositions).
				 SubstractFromEachQ(1).Content()

		nLen = oString.NumberOfChars()

		cVizLine = " "
		for i = 1 to nLen - 2
			
			if StzNumberQ(i).IsOneOfThese(anVizPositions)
				cVizLine += cPositionSign
			else
				cVizLine += cBlankSign
			ok

		next

		cResult = oString.Content() + NL + cVizLine

		if bNumbered

			oVizLine = new stzString(cVizLine)

			oVizLine {
	
				Replace(cBlankSign, " ")

				cCondition = '@char = ' + @@(cPositionSign)

				if NOT bSpacified

					cReplacement@ = '{ Q( ""+ ( This.FindAll(' +
						 @@(cPositionSign) +
						 ')[@i] - 1 ) ).LastChar() }'

				else

					cReplacement@ = '{ Q( ""+ ( This.FindAll(' +
						 @@(cPositionSign) +
						 ')[@i] / 2 ) ).LastChar() }'
					
				ok

				ReplaceW( :Where = cCondition, :With@ = cReplacement@ )

			}

			cResult += NL + oVizLine.TrailingSpacesRemoved()

		ok

		return cResult

		#< @FunctionFluentForm

		def VizFindXTQ(pcSubStr, paOptions)
			return new stzString( This.VizFindXT(pcSubStr, paOptions) )

		#>

	def VizFind(pcSubStr)
		return This.VizFindXT(pcSubStr, [] )

	def VizFindCS(pcSubStr, pCaseSensitive)
		return This.VizFindXT(pcSubStr, [ pCaseSensitive ])
		
	  #----------------------------------------------------#
	 #      VISUALLY FINDING AND BOXING A SUBSTRING       # TODO: Review this
	#----------------------------------------------------#

	def VizFindBoxedXT(pcSubstr, paOptions) # TODO
		/* EXAMLPE

		*/

		if NOT ( isString(pcSubStr) or
		  	sList(paOptions) and StzListQ(paOptions).IsBoxOptionsNamedParam() )

			stzRaise("Incorrect params!")
		ok

		


/*
	
			if paOptions[ :Casesensitive ] = TRUE or
			   paOptions[ :CS ] = TRUE
	
				paOptions + [ :Hilighted, 
					      This.FindAllCS(pcSubStr, :CS = TRUE)
					    ]
			else
				paOptions + [ :Hilighted, 
					      This.FindAllCS(pcSubStr, :CS = FALSE)
					    ]
			ok
	
			StzHashListQ(paOptions) {
				RemovePairByKeyQ(:Casesensitive)
				RemovePairByKeyQ(:CS)
				paOptions = Content()
			}
	
			oStzListOfChars = new stzListOfChars(This.String())
			return oStzListOfChars.BoxedXT(paOptions)
	*/

	  #======================================#
	 #   CONTAINMENT OF A GIVEN SUBSTRING   #
	#======================================#

	def ContainsCS(cSubStr, pCaseSensitive) # :CaseSensitive = TRUE or :CaseSensitive = FALSE
	
		if isList(cSubStr)
			return This.ContainsManyCS(cSubStr, pCaseSensitive)
		ok

		if NOT isString(cSubStr)
			stzRaise("Incorrect param type! cSubStr must be a STRING, while you are providing a " + ring_type(cSubStr) + ".")
		ok

		if isList(pCaseSensitive) and StzListQ(pCaseSensitive).IsCaseSensitiveNamedParam()
			pCaseSensitive = pCaseSensitive[2]
		ok

		if isNumber(pCaseSensitive) and
			  (pCaseSensitive = 0 or pCaseSensitive = 1)

			return QStringObject().contains(cSubStr, pCaseSensitive)

		else
			stzRaise("Error in param value! pCaseSensitive must be 0 or 1 (TRUE or FALSE).")
	
		ok

		#< @FunctionAlternativeForm

		def ContainsSubStringCS(pcSubStr, pCaseSensitive)
			return This.ContainsCS(cSubStr, pCaseSensitive)
		#>

		#< @FunctionNegativeForm
	
		def ContainsNoCS(cSubStr, pCaseSensitive)
			return NOT This.ContainsCS(cSubStr, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def Contains(cSubStr)
		return This.ContainsCS(cSubstr, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForm

		def ContainsSubString(pcSubStr)
			return This.Contains(pcSubStr)
		#>

		#< @FunctionNegativeForm

		def ContainsNo(cSubStr)
			return NOT This.Contains(cSubStr)

		#>

	  #----------------------------------------------------------#
	 #   CONTAINING A SUBSTRING BOUNDED BY A GIVEN SUBSTRING    #
	#----------------------------------------------------------#

	def ContainsSubstringBoundedByCS(pcSubStr, pcBound, pCaseSensitive) # :CaseSensitive = TRUE or :CaseSensitive = FALSE
		
		bResult = FALSE

		n = This.FindFirstSubStringCS(pcSubStr, pCaseSensitive)

		if n > 0

			nLenSubstr = StzStringQ(pcSubStr).NumberOfChars()
			nLenBound  = StzStringQ(pcBound).NumberOfChars()
	
			cBefore    = This.Section( n - nLenBound, n - 1)
			cAfter     = This.Section( n + nLenSubStr, n + nLenSubStr + nLenBound - 1)

			if StzStringQ(cBefore).IsEqualToCS(pcBound, pCaseSensitive) and
			   StzStringQ(cAfter).IsEqualToCS(pcBound, pCaseSensitive)

				bResult = TRUE

			ok
		ok

		return bResult

	#-- WITHOUT CASESENSITIVITY

	def ContainsSubStringBoundedBy(pcSubStr, pcBound)
		return This.ContainsSubstringBoundedByCS(pcSubStr, pcBound, :CaseSensitive = TRUE)

	  #----------------------------------------------#
	 #    CONTAINING ONE OF THE GIVEN SUBSTRINGS    #
	#----------------------------------------------#

	def ContainsOneOfTheseCS(paSubStr, pCaseSensitive)
		bResult = FALSE

		for str in paSubStr
			if This.ContainsCS( str,  pCaseSensitive)
				bResult = TRUE
				exit
			ok
		next

		return bResult

		def ContainsNoOneOfTheseCS(paSubStr, pCaseSensitive)
			bResult = NOT This.ContainsOneOfTheseCS(paSubStr, pCaseSensitive)
			return bResult

	#-- WITHOUT CASESENSITIVITY

	def ContainsOneOfThese(paSubStr)
		return This.ContainsOneOfTheseCS(paSubStr, :Casesensitive = TRUE)

		def ContainsNoOneOfThese(paSubStr)
			return This.ContainsNoOneOfTheseCS(paSubStr, :Casesensitive = TRUE)

	  #-------------------------#
	 #    CONTAINING SPACES    #
	#-------------------------#

	def ContainsSpaces()
		return This.Contains(" ")

	def ContainsNoSpaces()
		return NOT This.ContainsSpaces()

	  #---------------------------------------------------#
	 #    CONTAINING EACH ONE OF THE GIVEN SUBSTRINGS    #
	#---------------------------------------------------#

	def ContainsEachCS(paSubStr, pCaseSensitive)
		bContainsThemAll = TRUE
		for str in paSubStr
			bContainsThemAll = This.ContainsCS(str, pCaseSensitive)
			if bContainsThemAll = FALSE
				exit
			ok
		next
		return bContainsThemAll

	def ContainsEach(paSubStr)
		return This.ContainsEachCS(paSubStr, :CaseSensitive = TRUE)

	  #------------------------------------------------#
	 #    CONTAINING BOTH OF THE GIVEN SUBSTRINGS     #
	#------------------------------------------------#

	def ContainsBothCS(pcStr1, pcStr2, pCaseSensitive)
		return This.ContainsEachCS( [pcStr1, pcStr2], pCaseSensitive )

	def ContainsBoth(pcStr1, pcStr2)
		return This.ContainsBothCS(pcStr1, pcStr2, :CaseSensitive = TRUE)

//////////////////////////////////////////////////////////////////////////////////////////////	
	  #----------------------------------------------#
	 #   REMOVING A SUBSTRING AT A GIVEN POSITION   #
	#----------------------------------------------#

	def RemoveSubStringAtPositionCS(n, pcSubStr, pCaseSensitive)

		if This.ContainsSubStringAtPositionCS(n, pcSubStr, pCaseSensitive)

			nRange = StzStringQ(pcSubStr).NumberOfChars()

			This.RemoveRange(n, nRange)
		ok

		def RemoveSubStringAtPositionCSQ(n, pcSubStr, pCaseSensitive)
			This.RemoveSubStringAtPositionCS(n, pcSubStr, pCaseSensitive)
			return This

		def RemoveSubStringAtCS(n, pcSubStr, pCaseSensitive)
			This.RemoveSubStringAtPositionCS(n, pcSubStr, pCaseSensitive)

			def RemoveSubStringAtCSQ(n, pcSubStr, pCaseSensitive)
				This.RemoveSubStringAtCS(n, pcSubStr, pCaseSensitive)
				return This

		def RemoveAtCS(n, pcSubStr, pCaseSensitive)
			This.RemoveSubStringAtPositionCS(n, pcSubStr, pCaseSensitive)

			def RemoveAtCSQ(n, pcSubStr, pCaseSensitive)
				This.RemoveAtCS(n, pcSubStr, pCaseSensitive)
				return This

	#-- WITHOUT CASESENSITIVITY

	def RemoveSubStringAtPosition(n, pcSubStr)
		This.RemoveSubStringAtPositionCS(n, pcSubStr, :CaseSensitive = TRUE)

		def RemoveSubStringAtPositionQ(n, pcSubStr)
			This.RemoveSubStringAtPosition(n, pcSubStr)
			return This

		def RemoveSubStringAt(n, pcSubStr)
			This.RemoveSubStringAtPosition(n, pcSubStr)

			def RemoveSubStringAtQ(n, pcSubStr)
				This.RemoveSubStringAt(n, pcSubStr)
				return This

	  #----------------------------------------------------------#
	 #   REMOVING A SUBSTRING AT A GIVEN POSITION -- EXTENDED   #
	#----------------------------------------------------------#

	def RemoveSubStringAtPositionXT(n, pcSubStr, paOptions)

		/* EXAMPLE

		o1 = new stzString("123x567x901")
	
		o1.RemoveSubStringAtXT(5, "567",
			[ :RemoveNCharsBefore = 1, :RemoveNCharsAfter = 1 ] )
	
		#--> 123901
	
		# Or if you want:
	
		o1 = new stzString("123x567x901")
	
		o1.RemoveSubStringAtXT(5, "567",
			[ :RemoveThisSubStringBefore = "X", :RemoveThisSubStringAfter = "X", :CS = FALSE ] )
	
		#--> 123901

		*/

		if NOT ( isList(paOptions) and
			( len(paOptions) = 0 or Q(paOptions).IsRemoveAtOptionsNamedParam() ) )

			stzRaise("Incorrect param! paOptions must be a valid RemoveAt options list.")
		ok

		# Reading :CaseSensitive option

		cCSParamName = :CaseSensitive
		if StzHashListQ(paOptions).ContainsKey(:CS)
			cCSParamName = :CS
		ok

		bCaseSensitive = paOptions[ cCSParamName ]

		if isString(bCaseSensitive) and bCaseSensitive = NULL
			bCaseSensitive = TRUE
		ok

		# Doing the job (3 possible cases)

		if StzHashListQ(paOptions).
			KeysQR(:stzListOfStrings).
			IsEqualToCS([ :RemoveNCharsBefore, :RemoveNCharsAfter, :CaseSensitive, :CS ], :CS = FALSE)

			# Reading :RemoveNCHarsBefore option
	
			nRemoveNCharsBefore = paOptions[ :RemoveNCharsBefore ]
			if isString(nRemoveNCharsBefore) and nRemoveNCharsBefore = NULL
				nRemoveNCharsBefore = 0
			ok
	
			# Reading :RemoveNCHarsAfter option
	
			nRemoveNCharsAfter = paOptions[ :RemoveNcHarsAfter ]
			if isString(nRemoveNCharsAfter) and nRemoveNCharsAfter = NULL
				nRemoveNCharsAfter = 0
			ok
	
			# Removing n chars after and before

			n1 = n - nRemoveNCharsBefore
			n2 = n + StzStringQ(pcSubStr).NumberOfChars() + nRemoveNCharsAfter - 1

			This.RemoveSection( n1, n2)

		but StzHashListQ(paOptions).KeysQ().
			IsMadeOfSome([ :RemoveThisSubStringBefore, :RemoveThisSubStringAfter, :CaseSensitive, :CS ])

			# Reading :RemoveThisSubStringBefore option
	
			cBefore = paOptions[ :RemoveThisSubStringBefore ]
			if isString(cBefore) and cBefore = NULL
				cBefore = NULL
			ok
	
			# Reading :RemoveThisSubStringAfter option
	
			cAfter = paOptions[ :RemoveThisSubStringAfter ]
			if isString(cAfter) and cAfter = NULL
				cAfter = NULL
			ok

			# Removing

			n1 = n - StzStringQ(cBefore).NumberOfChars()
			n2 = n + StzStringQ(pcSubStr).NumberOfChars() + StzStringQ(cAfter).NumberOfChars() - 1

			if StzStringQ(cBefore + pcSubStr + cAfter).
			   IsEqualToCS( This.Section(n1, n2), bCaseSensitive)

				This.RemoveSection(n1, n2)
			ok

		but StzHashListQ(paOptions).
			KeysQR(:stzListOfStrings).
			IsEqualToCS([ :RemoveThisBound, :CaseSensitive, :CS ], :CS = FALSE) or

		    StzHashListQ(paOptions).
			KeysQR(:stzListOfStrings).
			IsEqualToCS([ :RemoveThisBound, :CS ], :CS = FALSE)

			# Reading :RemoveThisBound option
	
			cBoundParamName = :RemoveThisBound
			if StzHashListQ(paOptions).ContainsKey(:RemoveThisBoundingSubString)
				cBoundParamName = :RemoveThisBound
			ok
	
			cBound = paOptions[ cBoundParamName ]

			# Removing the bound

			n1 = n - StzStringQ(cBound).NumberOfChars()
			n2 = n + StzStringQ(pcSubStr).NumberOfChars() + StzStringQ(cBound).NumberOfChars() - 1

			if StzStringQ(cBound + pcSubStr + cBound).
			   IsEqualToCS( This.Section(n1, n2), bCaseSensitive)

				This.RemoveSection(n1, n2)
			 
			ok

		ok

		#< @FunctionFluentForm

		def RemoveSubStringAtPositionXTQ(n, pcSubStr, paOptions)
			This.RemoveSubStringAtPositionXT(n, pcSubStr, paOptions)
			return This
		#>

		#< @FunctionAlternativeForms

		def RemoveSubStringAtXT(n, pcSubStr, paOptions)
			This.RemoveSubStringAtPositionXT(n, pcSubStr, paOptions)

			def RemoveSubStringAtXTQ(n, pcSubStr, paOptions)
				This.RemoveSubStringAtXT(n, pcSubStr, paOptions)
				return This

		def RemoveAtXT(n, pcSubStr, paOptions)
			This.RemoveSubStringAtPositionXT(n, pcSubStr, paOptions)

			def RemoveAtXTQ(n, pcSubStr, paOptions)
				This.RemoveAtXT(n, pcSubStr, paOptions)
				return This

		#>

//////////////////////////////////////////////////////////////////////////////////////////////

	  #------------------------------------------------#
	 #   CONTAINING A SUBSTRING AT A GIVEN POSITION   #
	#------------------------------------------------#

	/* TODO: Add these functions

	ReplaceSubStringAt(n, pcSubStr)
	RemoveSubStringQt(n, pcSubStr)

	*/

	def ContainsSubStringAtPositionCS(n, pcSubStr, pCaseSensitive)
		if NOT isNumber(n)
			stzRaise("Incorrect param type! n must be a number.")
		ok

		if NOT isString(pcSubStr)
			stzRaise("Incorrect param type! pcSubStr must be a string.")
		ok

		nLen = StzStringQ(pcSubStr).NumberOfChars()
		bResult = This.RangeQ(n, nLen).IsEqualToCS(pcSubStr, pCaseSensitive)

		return bResult

		def ContainsSubStringAtCS(n, pcSubStr, pCaseSensitive)
			return This.ContainsSubStringAtPositionCS(n, pcSubStr, pCaseSensitive)

		def ContainsAtCS(n, pcSubStr, pCaseSensitive)
			return This.ContainsSubStringAtPositionCS(n, pcSubStr, pCaseSensitive)

		def SubStringExistsAtPositionCS(n, pcSubStr, pCaseSensitive)
			return This.ContainsSubStringAtPositionCS(n, pcSubStr, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def ContainsSubStringAtPosition(n, pcSubStr)
		return This.ContainsSubStringAtPositionCS(n, pcSubStr, :CaseSensitive = TRUE)

		def ContainsSubStringAt(n, pcSubStr)
			return This.ContainsSubStringAtPosition(n, pcSubStr)

		def ContainsAt(n, pcSubStr)
			return This.ContainsSubStringAtPosition(n, pcSubStr)

		def SubStringExistsAtPosition(n, pcSubStr)
			return This.ContainsSubStringAtPosition(n, pcSubStr)

	  #------------------------------------------------#
	 #   CONTAINING A SUBSTRING AT GIVEN POSITIONS    #
	#------------------------------------------------#

	def ContainsSubStringAtPositionsCS(panPositions, pcSubStr, pCaseSensitive)

		if NOT ( isList(panPositions) and Q(panPositions).IsListOfNumbers() )

			stzRaise("Incorrect param type! panPositions must be a list of numbers.")
		ok

		bResult = TRUE

		for n in panPositions
			if NOT This.ContainsSubStringAtPositionCS(n, pcSubStr, pCaseSensitive)
				bResult = FALSE
				exit
			ok
		next

		return bResult

		def ContainsSubStringAtThesePositionsCS(panPositions, pcSubStr, pCaseSensitive)
			return This.ContainsSubStringAtPositionsCS(panPositions, pcSubStr, pCaseSensitive)

		def ContainsAtPositionsCS(panPositions, pcSubStr, pCaseSensitive)
			return This.ContainsSubStringAtPositionsCS(panPositions, pcSubStr, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def ContainsSubStringAtPositions(panPositions, pcSubStr)
		return This.ContainsSubStringAtPositionsCS(panPositions, pcSubStr, :CaseSensitive = TRUE)

		def ContainsSubStringAtThesePositions(panPositions, pcSubStr)
			return This.ContainsSubStringAtPositions(panPositions, pcSubStr)

		def ContainsAtPositions(panPositions, pcSubStr)
			return This.ContainsSubStringAtPositions(panPositions, pcSubStr)

	  #-----------------------------------------------#
	 #   CONTAINING SUBSTRINGS AT GIVEN POSITIONS    #
	#-----------------------------------------------#

	def ContainsSubStringsAtPositionsCS(panPositions, pacSubStr, pCaseSensitive)

		if NOT ( isList(panPositions) and Q(panPositions).IsListOFNumbers() )

			stzRaise("Incorrect param type! panPositions must be a list of numbers.")
		ok

		if NOT ( isList(pacSubStr) and Q(pacSubStr).IsListOfStrings() )

			stzRaise("Incorrect param type! pacSubStr must be a list of strings.")
		ok

		if NOT ( len(panPositions) = len(pacSubStr) )
			stzRaise("Incorrect values! panPositions and pacSubStr lists must have same number of items.")
		ok

		bResult = TRUE

		i = 0
		for n in panPositions
			i++
			if NOT This.ContainsSubStringAtPosition(n, pacSubStr[i])
				bResult = FALSE
				exit
			ok
		next

		return bResult

		def ContainsSubStringsAtThesePositionsCS(panPositions, pacSubStr, pCaseSensitive)
			return This.ContainsSubStringsAtPositionsCS(panPositions, pacSubStr, pCaseSensitive)

		def ContainsSubStringsAtCS(panPositions, pacSubStr, pCaseSensitive)
			return This.ContainsSubStringsAtPositionsCS(panPositions, pacSubStr, pCaseSensitive)

		def ContainsManyAtCS(panPositions, pacSubStr, pCaseSensitive)
			return This.ContainsSubStringsAtPositionsCS(panPositions, pacSubStr, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def ContainsSubStringsAtPositions(panPositions, pacSubStr)
		return This.ContainsSubStringsAtPositionsCS(panPositions, pacSubStr, :CaseSensitive = TRUE)

		def ContainsSubStringsAtThesePositions(n, pacSubStr)
			return This.ContainsSubStringsAtPositions(panPositions, pacSubStr)

		def ContainsSubStringsAt(panPositions, pacSubStr)
			return This.ContainsSubStringsAtPositions(panPositions, pacSubStr)

		def ContainsManyAt(panPositions, pacSubStr)
			return This.ContainsSubStringsAtPositions(panPositions, pacSubStr)

	  #----------------------------------------------#
	 #   CONTAINING SOME (ONE OR MORE) SUBSTRINGS   #
	#----------------------------------------------#

	def ContainsOneOrMoreCS(paSubStr, pCaseSensitive)
		bResult = FALSE
		for cSubStr in paSubStr
			if This.ContainsCS(cSubStr, pCaseSensitive)
				bResult = TRUE
			ok
		next

		return bResult

		def ContainsOneOrMoreOfTheseCS(paSubStr, pCaseSensitive)
			return This.ContainsOneOrMoreCS(paSubStr, pCaseSensitive)

		def ContainsSomeCS(paSubStr, pCaseSensitive)
			return This.ContainsOneOrMoreCS(paSubStr, pCaseSensitive)
		
	#-- WITHOUT CASESENSITIVITY

	def ContainsOneOrMore(paSubStr)
		return This.ContainsOneOrMoreCS(paSubStr, :CS = TRUE)

		def ContainsOneOrMoreOfThese(paSubStr)
			return This.ContainsOneOrMore(paSubStr)

		def ContainsSome(paSubStr)
			return This.ContainsOneOrMore(paSubStr)

	  #------------------------------------------------#
	 #    CONTAINING N OCCURRENCES OF A SUBSTRING     #
	#------------------------------------------------#

	def ContainsNTimesCS(n, pcSubstr, pCaseSensitive)
		return This.NumberOfOccurrencesCS(pcSubStr, pCaseSensitive) = n

		def ContainsNTimesTheSubstringCS(n, pcSubstr, pCaseSensitive)
			return This.ContainsNTimesCS(n, pcSubstr, pCaseSensitive)


	#-- WITHOUT CASESENSITIVITY

	def ContainsNTimes(n, pcSubStr)
		return This.ContainsNTimesCS(n, pcSubstr, :CaseSensitive = TRUE)

		def ContainsNTimesTheSubstring(n, pcSubstr)
			return This.ContainsNTimes(n, pcSubstr)

	  #-------------------------------------------#
	 #    CONTAINING N OCCURRENCES OF A CHAR     #
	#-------------------------------------------#

	def ContainsNTimesTheChar(n, pcChar)
		if NOT IsChar(pcChar)
			return FALSE
		ok
		
		return This.ContainsNTimesCS(n, pcChar, :CaseSensitive = FALSE)

	  #-------------------------------------------------#
	 #    CONTAINING ONE OCCURRENCE OF A SUBSTRING     #
	#-------------------------------------------------#

	def ContainsOneOccurrenceCS(pcSubStr, pCaseSensitive)
		return This.ContainsNTimesCS(1, pcSubStr, pCaseSensitive)
	
		#< @FunctionAlternativeForms

		def ContainsOnlyOneCS(pcSubStr, pCaseSensitive)
			return This.ContainsOneOccurrenceCS(pcSubStr, pCaseSensitive)

		def ContainsOneCS(pcSubStr, pCaseSensitive)
			return This.ContainsOneOccurrenceCS(pcSubStr, pCaseSensitive)

		#>

	#-- WITHOUT CASESENSITIVITY

	def ContainsOneOccurrence(pcSubStr)
		return This.ContainsOneOccurrenceCS(pcSubstr, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def ContainsOnlyOne(pcSubStr)
			return This.ContainsOneOccurrence(pcSubStr)

		def ContainsOne(pcSubStr)
			return This.ContainsOneOccurrence(pcSubStr)

		#>
	  #---------------------------------------------------------------------------#
	 #  CHECKING IF THE STRING CONTAINS MORE THAN ONE OCCURRENCE OF A SUBSTRING  #
	#---------------------------------------------------------------------------#

	def ContainsMoreThanOneOccurrenceCS(pcSubstr, pCaseSensitive)
		return This.ContainsMoreThanNOccurrencesCS(1, pcSubStr, pCaseSensitive)

		#< @FunctionAlternativeForms

		def ContainsManyOccurrencesCS(pcSubstr, pCaseSensitive)
			return This.ContainsMoreThanOneOccurrenceCS(pcSubstr, pCaseSensitive)
		
		def ContainsManyCS(pcSubStr, pCaseSensitive)
			return This.ContainsMoreThanOneOccurrenceCS(pcSubstr, pCaseSensitive)
		
		def ContainsSomeOccurrencesCS(pcSubstr, pCaseSensitive)
			return This.ContainsMoreThanOneOccurrenceCS(pcSubstr, pCaseSensitive)
				
		def ContainsMoreThenOneCS(pcSubStr, pCaseSensitive)
			return This.ContainsMoreThanOneOccurrenceCS(pcSubstr, pCaseSensitive)
		
		#>

	#-- WITHOUT CASESENSITIVITY

	def ContainsMoreThanOneOccurrence(pcSubstr)
		return This.ContainsMoreThanOneOccurrenceCS(pcSubstr, :CaseSensitive = TRUE)

		#< @FunctionAlternativeForms

		def ContainsManyOccurrences(pcSubstr)
			return This.ContainsMoreThanOneOccurrence(pcSubstr)
		
		def ContainsMany(pcSubStr)
			return This.ContainsMoreThanOneOccurrence(pcSubstr)
		
		def ContainsSomeOccurrences(pcSubstr)
			return This.ContainsMoreThanOneOccurrence(pcSubstr)
				
		def ContainsMoreThenOne(pcSubStr)
			return This.ContainsMoreThanOneOccurrence(pcSubstr)

		#>
			
	  #--------------------------------------------------------------------------#
	 #  CHECKING IF THE STRING CONTAINS MORE THAN N OCCURRENCES OF A SUBSTRING  #
	#--------------------------------------------------------------------------#

	def ContainsMoreThanNOccurrencesCS(n, pcSubstr, pCaseSensitive)

		bResult = FALSE

		bContinue = TRUE
		i = 0
		nPos = 0

		while bContinue
	
			nPos = This.FindFirstXTCS(pcSubStr, :StartingAt = nPos + 1, pCaseSensitive)
			if nPos = 0
				bContinue = FALSE
			else
				i++
				if i > n
					bResult   = TRUE
					bContinue = FALSE
				ok
			ok
		end

		return bResult

		def ContainsMoreThenNCS(n, pcSubStr, pCaseSensitive)
			return This.ContainsMoreThanNOccurrencesCS(n, pcSubstr, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def ContainsMoreThanNOccurrences(n, pcSubstr)
		return This.ContainsMoreThanNOccurrencesCS(n, pcSubstr, :CaseSensitive = TRUE)

		def ContainsMoreThenN(n, pcSubStr)
			return This.ContainsMoreThanNOccurrences(n, pcSubstr)

	  #------------------------------------------------------------------------#
	 #  CHECKING IF THE STRING CONTAINS N OR MORE OCCURRENCES OF A SUBSTRING  #
	#------------------------------------------------------------------------#

	def ContainsNOrMoreOccurrencesCS(n, pcSubstr, pCaseSensitive)
		bResult = This.ContainsMoreThenNOccurrencesCS(n - 1, pcSubStr, pCaseSensitive)
		return bResult

		def ContainsNOrMoreCS(n, pcSubstr, pCaseSensitive)
			return This.ContainsNOrMoreOccurrencesCS(n, pcSubstr, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def ContainsNOrMoreOccurrences(n, pcSubstr)
		return This.ContainsNOrMoreOccurrencesCS(n, pcSubstr, :CaseSensitive = TRUE)
	
		def ContainsNOrMore(n, pcSubStr)
			return This.ContainsNOrMoreOccurrences(n, pcSubstr)

	  #-----------------------------------------#
	 #    CONTAINING CHARS IN A GIVEN SCRIPT   #
	#-----------------------------------------#

	def ContainsCharsInScript(pcScript)
		return This.ToStzText().ContainsScript(pcScript)

		#< @FunctionNegativeForm

		def ContainsNocharsInScript(pcScript)
			return NOT This.ContainsCharsInScript(pcScript)

		#>

	  #---------------------------#
	 #    CONTAINING LETTERS     #
	#---------------------------#

	def ContainsLetters()
		bResult = FALSE
		for i = 1 to This.NumberOfChars()
			if StzCharQ( This[i] ).IsLetter()
				bResult = TRUE
				exit
			ok
		next
		return bResult

		#< @FunctionNegativeForm

		def ContainsNoLetters()
			return NOT This.ContainsNumbers()

		#>

	def ContainsTheLetters(pacLetters)
		if ListIsListOfLetters(pacLetters)
			bResult = TRUE
			oStr = This.UppercaseQ()

			pacLetters = StzListOfCharsQ(pacLetters).Uppercased()
			for cLetter in pacLetters
				if oStr.ContainsNo(cLetter)
					bResult = FALSE
					exit
				ok
			next

			return bResult
		ok

	def ContainsArabicLetters()
		bResult = FALSE
		for i = 1 to This.NumberOfChars()
			if StzCharQ( This[i] ).IsArabicLetter()
				bResult = TRUE
				exit
			ok
		next
		return bResult

		#< @FunctionNegativeForm

		def ContainsNoArabicLetters()
			return NOT This.ContainsArabicNumbers()

		#>

	def ContainsLatinLetters()
		bResult = FALSE
		for i = 1 to This.NumberOfChars()
			if StzCharQ( This[i] ).IsLatinLetter()
				bResult = TRUE
				exit
			ok
		next
		return bResult

		#< @FunctionNegativeForm

		def ContainsNoLatinLetters()
			return NOT This.ContainsLatinNumbers()

		#>

	def ContainsLettersInScript(pcScript)
		bResult = FALSE
		for i = 1 to This.NumberOfChars()
			if StzCharQ( This[i] ).IsLetterInScript(pcScript)
				bResult = TRUE
				exit
			ok
		next
		return bResult

		#< @FunctionNegativeForm

		def ContainsNoLettersInScript(pcScript)
			return NOT This.ContainsNumbers(pcScript)

		#>

	  #=====================================#
	 #   SPLITTING: THE GENERAL FUNCTION   #
	#=====================================#

	def Split(p)
		if isList(p) and Q(p).IsUsingNamedParam()
			p = p[2]
		ok

		if NOT isString(p)
			stzRaise("Incorrect param type! p must be a string.")
		ok

		oQStrList = This.QStringObject().split(p, 0, 0)
		aResult = QStringListToList(oQStrList)
		return aResult

		def Splitted(p)
			return This.Split(p)

	  #===================================#
	 #   SPLITTING AT A GIVEN POSITION   #
	#===================================#

	def SplitAt(n)

		aSections = StzSplitterQ( This.NumberOfChars() ).
				SplitAt(n)

		aResult = This.Sections(aSections)

		return aResult

		#< @FunctionAlternativeForm

		def SplitAtPosition(n)
			return This.SplitAt(n)

		#>

	  #---------------------------------#
	 #   SPLITTING AT MANY POSITIONS   #
	#---------------------------------#

	def SplitAtPositions(anPos)
		aSections = StzSplitterQ( This.NumberOfChars() ).SplitAtPositions(anPos)
		aResult = This.Sections(aSections)

		return aResult

	  #=======================================#
	 #   SPLITTING BEFORE A GIVEN POSITION   #
	#=======================================#

	def SplitBefore(n)
		aSections = StzSplitterQ( This.NumberOfChars() ).SplitBefore(n)
		aResult = This.Sections(aSections)

		return aResult

		def SplitBeforePosition(n)
			return This.SplitBefore(n)

	  #-------------------------------------#
	 #   SPLITTING BEFORE MANY POSITIONS   #
	#-------------------------------------#

	def SplitBeforePositions(panPositions)
		aSections = StzSplitterQ( This.NumberOfChars() ).
				SplitBeforePositions(panPositions)

		aResult = This.Sections(aSections)

		return aResult
	
	  #=======================================#
	 #    SPLITTING AFTER A GIVEN POSITION   #
	#=======================================#

	def SplitAfter(n)
		aSections = StzSplitterQ( This.NumberOfChars() ).SplitAfter(n)
		aResult = This.Sections(aSections)

		return aResult

		def SplitAfterPosition(n)
			return This.SplitAfter(n)

	  #------------------------------------#
	 #   SPLITTING AFTER MANY POSITIONS   #
	#------------------------------------#

	def SplitAfterPositions(panPositions)
		aSections = StzSplitterQ( This.NumberOfChars() ).
				SplitAfterPositions(panPositions)

		aResult = This.Sections(aSections)

		return aResult

	  #============================#
	 #    SPLITTING TO N PARTS    #
	#============================#

	def SplitToNParts(n)
		aSections = StzSplitterQ( This.NumberOfChars() ).
				SplitToNParts(n)

		aResult = This.Sections(aSections)

		return aResult

	  #===================================#
	 #   SPLITTING TO PARTS OF N ITEMS   #
	#===================================#

	def SplitToPartsOfNChars(n)
		aSections = StzSplitterQ( This.NumberOfChars() ).
				SplitToPartsOfNPositions(n)

		aResult = This.Sections(aSections)

		return aResult

	def SplitToPartsOfExactlyNChars(n)
		aSections = StzSplitterQ( This.NumberOfChars() ).
				SplitToPartsOfExactlyNPositions(n)

		aResult = This.Sections( aSections )
		return aResult

	  #=======================================#
	 #    SPLITTING UNDER A GIVEN CONDTION   #
	#=======================================#

	def SplitW(pcCondition)
		/*
		? StzSplitterQ(1:5).SplitW('Q(@item).IsMultipleOf(2)')
		*/

		if isList(pcCondition)

			if Q(pcCondition).IsWhereNamedParam()
				return This.SplitAtW(pcCondition[2])

			but Q(pcCondition).IsAtNamedParam()
				return This.SplitAtW(pcCondition[2])

			but Q(pcCondition).IsBeforeNamedParam()
				return This.SplitBeforeW(pcCondition[2])

			but Q(pcCondition).IsAfterNamedParam()
				return This.SplitAfterW(pcCondition[2])

			ok
		
		else
			return This.SplitAtW(pcCondition)
		ok

	  #------------------------------------#
	 #    SPLITTING AT A GIVEN CONDTION   #
	#------------------------------------#

	def SplitAtW(pcCondition)
		anPositions = This.FindAllW(pcCondition)

		aResult = This.SplitAtPositions(anPositions)

		return aResult

	  #----------------------------------------#
	 #    SPLITTING BEFORE A GIVEN CONDTION   #
	#----------------------------------------#

	def SplitBeforeW(pcCondition)
		anPositions = This.FindAllW(pcCondition)
		aResult = This.SplitBeforePositions(anPositions)

		return aResult

	  #---------------------------------------#
	 #    SPLITTING AFTER A GIVEN CONDTION   #
	#---------------------------------------#

	def SplitAfterW(pcCondition)
		anPositions = This.FindAllW(pcCondition)
		aResult = This.SplitAfterPositions(anPositions)

		return aResult

	   #=====================================#
	  #    NTH SUBSTRING AFTER SPLITTING    #
	 #    STRING USING A GIVEN SEPARATOR   #
	#=====================================#

	def NthSubstring(n, acSep)
		if isNumber(n) and
		   ListIsListOfStrings(acSep) and
		   len(acSep) = 2 and
		   acSep[1] = :AfterSplittingStringUsing

			return This.NthSubstringAfterSplittingStringUsing(n, acSep[2])
		else
			stzRaise("Incorrect param types!")
		ok

		#< @FunctionFluentForm

		def NthSubstringQ(n, acSep)
			return new stzStrings( This.NthSubstring(n, acSep) )

		#>

	def NthSubstringAfterSplittingStringUsing(n, cSep)
		return This.Split(cSep)[n]

	  #---------------------#
	 #     STRING PARTS    #
	#---------------------#

	/* Note:

	This method analyzes the string, by sequentially partitioning
	its content, using a given "partition expression", pr "partionner,
	for short. Hence, it serves in answering this kind of question:

	How is the string composed in term of some char criteria
	(beeing, for example, lowercase or uppercase, or left-oriented
	or right-oriented).

	The partionner is what we should provide to the method in
	a param as a conditional code containing the @char keyword.

	For example:

	o1 = new stzString("TUNIS gafsa NABEUL beja")
	? o1.Parts(:Using = 'Q(@char).CharCase()' ) # NOTE: Parts() is the simple
						    # form of PartsAsSubstrings()

	Uses the CharCase() method in stzChar as a partionner.	

	And because this method returns a string equal to :Uppercase or
	:Lowercase or NULL, then the classification done will return:

	[
		"TUNIS" = :Uppercase,
		" " = NULL,
		"gafsa" = :Lowercase,
		" " = NULL,
		"NABEUL" = :Uppercase,
		" " = NULL,
		"beja" = :Lowercase
	]

	*/

	def PartsAsSubstrings(pcPartionner)
		/*
		Example:

		o1 = new stzString("Abc285XY&من")

		? o1.PartsAsSubstrings( :Using = 'Q(@char).IsLetter()' )
		--> Gives:
		[ "Abc" = TRUE, "285" = FALSE, "XY" = TRUE, "&" = FALSE, "من" = TRUE ]

		? o1.PartsAsSubstrings( :Using = 'Q(@char).Orientation()' )
		--> Gives:
		[ "Abc285XY&" = :LeftToRight, "من" = :RightToLeft ]

		? o1.PartsAsSubstrings( :Using = 'Q(@char).IsUppercase()' )
		--> Gives:
		[ "A" = TRUE, "bc285" = FALSE, "XY" = TRUE, "&من" = FALSE ]

		? o1.PartsAsSubstrings(:Using = 'Q(@char).CharCase()' )
		--> Gives:
		[ "A" = :Uppercase, "bc" = :Lowercase, "285" = NULL, "XY" = :Uppercase, "&من" = NULL ]

		*/


		if isList(pcPartionner) and StzListQ(pcPartionner).IsUsingNamedParam()

			pcPartionner = pcPartionner[2]

			if NOT isString(pcPartionner)
				stzRaise("Incorrect param type!")
			ok
		ok

		cCode = StzStringQ(pcPartionner).
				SimplifyQ().
				RemoveBoundsQ("{","}").
				ReplaceCSQ("@item", "@char", :CaseSensitive = FALSE).
				Content()

		cCode = "cPartionner = ( '' + " + cCode + " )"

		if This.NumberOfChars() = 1
			@char = This[1]
			eval(cCode)
			aResult = [ @char, cPartionner ]

			return aResult
		ok

		cPart = This.FirstChar()
		aParts = []

		@char = This[1]
		eval(cCode)
		cPrevious = cPartionner

		for i = 2 to This.NumberOfChars()
			

			oCurrentChar = new stzChar(This[i])
			@char = oCurrentChar.Content()

			eval(cCode)
			cCurrent = cPartionner

			oPreviousChar = new stzChar(This[i-1])
			@char = oPreviousChar.Content()
			eval(cCode)
			cPrevious = cPartionner

			if cCurrent = cPrevious
				cPart += This[i]

			else
				aParts + [ cPart, cPrevious ]
				cPart = This[i]
			ok

		end

		oLastChar = This.LastCharQ()
		@char = oLastChar.Content()
		eval(cCode)
		aParts + [ cPart, cPartionner ]

		return aParts

		#< @FunctionFluentForm

		def PartsAsSubstringsQ(pcPractionner)
			return PartsAsSubstringsQ(pcPractionner, :stzList)

		def PartsAsSubstringsQR(pcPartionner, pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnTyp).IsUsingNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.PartsAsSubstrings(pcPartionner) )

			on :stzHashList
				return new stzHashList( This.PartsAsSubStrings(pcPartionner) )

			other
				stzRaise("Unsupported return type!")
			off
	
		#>

		#< @FunctionAlternativeForm

		def Parts(pcPartionner)
			return This.PartsAsSubstrings(pcPartionner)

			def PartsQ(pcPartionner)
				return new stzList( This.Parts(pcPartionner) )

		#>

	def PartsAsSections(pcPartionner)
		/*
		o1 = new stzString("TUNIS1250XT")
		? o1.PartsAsSections( :Using = :IsNumber )
		--> Gives
			[
				[ [ 1,  5], FALSE ],
				[ [ 6,  9], TRUE  ],
				[ [10, 11], FALSE ]
			]
		*/

		aParts = This.PartsAsSubstrings(pcPartionner)
	
		aResult = []
		n1 = 1
		n2 = 1
		aSection = []
	
		i = 0
		for aPair in aParts
			i++
			cPart = aPair[1]
			nLenPart = StzStringQ(cPart).NumberOfChars()

			n2 = n1 + nLenPart - 1
			aSection = [n1, n2]
	
			aResult + [ aSection, aPair[2] ]
			n1 += nLenPart
	
		next
	
		return aResult

		def PartsAsSectionsQ(pcPractionner)
			return PartsAsSectionsQ(pcPractionner, :stzList)

		def PartsAsSectionsQR(pcPartionner, pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnTyp).IsUsingNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.PartsAsSections(pcPartionner) )

			on :stzHashList
				return new stzHashList( This.PartsAsSections(pcPartionner) )

			on :stzHashList@C
				return new stzHashList( This.PartsAsSections@C(pcPartionner) )

			other
				stzRaise("Unsupported return type!")
			off

	def PartsAsSections@C(pcPartionner)
		oPartsAsSections = This.PartsAsSectionsQ(:stzHashlList)
		aResult = oPartsAsSections.Classify@C(pcPartionner)

		return aResult

		def PartsAsSections@CQ(pcPractionner)
			return PartsAsSections@CQR(pcPractionner, :stzList)

		def PartsAsSections@CQR(pcPartionner, pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnTyp).IsUsingNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.PartsAsSections@C(pcPartionner) )

			on :stzHashList
				return new stzHashList( This.PartsAsSections@C(pcPartionner) )

			other
				stzRaise("Unsupported return type!")
			off

	#--

	def PartsAsSubstringsAndSections(pcPartionner)
		aSubstrings = This.PartsAsSubstrings(pcPartionner)
		aSections   = This.PartsAsSections(pcPartionner)

		aResult = []

		for i = 1 to len(aSubstrings)
			aResult + [ aSubstrings[i][1], aSections[i][1], aSections[i][2] ]
		next

		return aResult

	def PartsAsSectionsAndSubstrings(pcPartionner)
		aSubstrings = This.PartsAsSubstrings(pcPartionner)
		aSections   = This.PartsAsSections(pcPartionner)

		aResult = []

		for i = 1 to len(aSubstrings)
			aResult + [ aSections[i][1], aSubstrings[i][1], aSubstrings[i][2] ]
		next

		return aResult

	  #------------------------------------#
	 #     UNIQUE PARTS OF THE STRING     #
	#------------------------------------#

	def UniqueParts(pcPartionner)
		aResult = This.PartsQ(pcPartionner).DuplicatesRemoved()
		return aResult

		def UniquePartsQ(pcPartionner)
			return This.UniquePartsQR(pcPartionner, :stzList)

		def UniquePartsQR(pcPartionner, pcReturnType)
			switch pcReturnType
			on :stzList
				return new stzList(This.UniqueParts(pcPartionner))

			on :stzListOfStrings
				return new stzListOfStrings(This.UniqueParts(pcPartionner))

			other
				stzRaise("Unsupported return type!")
			off


	  #---------------------------------------#
	 #     PARTS OF THE STRING CLASSIFIED    #
	#---------------------------------------#

	def PartsAsSubstringsClassified(pcPartionner)
		// TODO

	def PartsAsSectionsClassified(pcPartionner)
		// TODO

	def PartsAsSubStringsAndSectionsClassified(pcPartionner)
		// TODO

	def PartsAsSectionsAndSubstringsClassified(pcPartionner)
		// TODO

	  #-----------------------------#
	 #     DIVIDING THE STRING     #
	#-----------------------------#

	def DivideBy(pDividor) 	# TODO: should by be included in the param
				# and function become simply Divide()?
		
		switch ring_type(pDividor)

		on "NUMBER"
			This.SplitToNParts(n)

		on "STRING"
			n = This.NumberOfOccurrence(pDividor)
			oTempStr = StzStringQ(pDividor) * n
			
			if oTempStr.IsEqualTo(This.String())
				return n
			else
				oTempStr = ( This.Copy() - oTempStr.Content() )
				nLen = oTempStr.NumberOfChars()
				if oTempStr.IsEqualTo( This.Section(1, n) )
					nResult = n + nLen / StzStringQ(pDividor).NumberOfChars()
					return nResult
				else
					return n
				ok
			ok
		off

	  #-------------------------------------#
	 #   SORTING THE CHARS OF THE STRING   #
	#-------------------------------------#

	def CharsSortingOrder()
		cResult = :Unsorted

		if This.CharsAreSorted()
			if This.CharsAreSortedInAscending()
				cResult = :Ascending
			else
				cResult = :Descending
			ok
		ok

		return cResult

		def SortingOrder()
			return This.CharsSortingOrder()
			

	def HasSameCharsSortingOrderAs(pcOtherStr)

		oTemp = new stzString(pcOtherStr)
		if oTemp.CharsSortingOrder() = This.CharsSortingOrder()
			return TRUE
		else
			return FALSE
		ok

		def HasSameCharsOrderAs(pcOtherStr)
			return This.HasSameCharsSortingOrderAs(pcOtherStr)

		def HasSameSortingOrderAs(pcOtherStr)
			return This.HasSameCharsSortingOrderAs(pcOtherStr)

	def CharsAreSorted()
		if This.CharsAreSortedInAscending() or
		   This.CharsAreSortedInDescending()
			return TRUE
		else
			return FALSE
		ok

		def IsSorted()
			return This.CharsAreSorted()

	def CharsAreSortedInAscending()
		/*
		The idea is to sort a copy of the string in ascending order
		and then compare the copy to the original string...
		If they are identical, then the string is sorted in ascending order!
		*/

		oSortedInAscending = This.Copy().SortCharsInAscendingQ()

		for i = 1 to This.NumberOfChars()
			if NOT AreEqual([ oSortedInAscending[i] , This[i] ])
				return FALSE
			ok
		next

		return TRUE

		def IsSortedInAscending()
			return This.CharsAreSortedInAscending()

	def CharsAreSortedInDescending()
		/*
		The idea is to reverse the string, and check if its reversed
		copy is sorted in ASCENDING order. If so, then the string itself
		is actually sorted in DESCENDING order!
		*/
		oTemp = new stzString( This.CharsReversed() )
		if oTemp.CharsAreSortedInAscending()
			return TRUE
		else
			return FALSE
		ok

		def IsSortedInDescending()
			return This.CharsAreSortedInDescending()

	def SortCharsInAscending()
		
		aResult = This.CharsQ().SortInAscendingQ().ToStzListOfStrings().Concatenated()

		This.Update( aResult )

		def SortCharsInAscendingQ()
			This.SortCharsInAscending()
			return This

		def SortInAscending()
			This.SortCharsInAscending()

			def SortInAscendingQ()
				This.SortInAscending()
				return This
			
	def StringWithCharsSortedInAscending()
		cResult = This.Copy().SortCharsInAscendingQ().Content()
		return cResult

		def SortedInAscending()
			return This.StringWithCharsSortedInAscending()

		def Sorted()
			return This.SortedInAscending()

	def SortCharsInDescending()
		aReversed = ListReverse( This.SortCharsInAscendingQ().Chars() )
		cResult = StzListOfStringsQ(aReversed).Concatenated()

		This.Update( cResult )

		def SortCharsInDescendingQ()
			This.SortCharsInDescending()
			return This

		def SortInDescending()
			This.SortCharsInDescending()

			def SortInDescendingQ()
				This.SortInDescending()
				return This
			
	def StringWithCharsSortedInDescending()
		cResult = This.Copy().SortCharsInDescendingQ().Content()
		return cResult

		def SortedInDescending()
			return This.StringWithCharsSortedInDescending()

	  #------------------------------------------------------------#
	 #     COMPARING THE STRING TO OTHER STRINGS USING UNICODE    #
	#------------------------------------------------------------#
	# TODO: add Casesensitivity support

	// Compares the main string with an other string (base on the unicode code table)
	// --> Use this for internal string comparisons and sorting
	// --> For lists presented to the user, use SystemLocaleCompare()

	def UnicodeCompareWithCS(pcOtherStr, pCaseSensitive)
		# pCaseSensitive -> :CaseSensitive = TRUE or FALSE

		if isList(pCaseSensitive) and StzListQ(pCaseSensitive).IsCaseSensitiveNamedParam()
			pCaseSensitive = pCaseSensitive[2]
		ok

		if isNumber(pCaseSensitive) and
		   ( pCaseSensitive = 0 or pCaseSensitive = 1 )

			nQtResult = @oQString.compare(pcOtherStr, pCaseSensitive)

		else
			stzRaise("Incorrect value of pCaseSensitive! Should be 0 or 1 (TRUE or FALSE).")
		ok
	
		if  nQtResult = 0
			return :Equal	# Be careful :Equal is "equal" and not "Equal" with capital "E"

		but nQtResult < 0
			return :Less

		but  nQtResult > 0
			return :Greater
		ok
		/*
		Returns :Equal, :Less, or :Greater:

		:Equal   --> The 2 strings are equal
		:Less    --> The main string is "less" then the substring
		:Greater --> The main string is "greater" then the substring
		
		"less" and "greater" should be understood at the sense
		provided to them by Qt. Read this:
	
		https://doc.qt.io/qt-5/qstring.html#comparing-strings
		*/

	def UnicodeCompareWith(pcOtherStr)
		return CompareWithCS(pcOtherStr, :CaseSensitive = TRUE)

	def UnicodeCompareWithInSystemLocale(pcOtherStr)
		nQtResult = @oQString.localeAwareCompare(pcOtherStr)

		if nQtResult = 0
			return :equal
		but nQtResult < 0
			return :less
		but nQtResult > 0
			return :greater
		ok
		/*
		From Qt documentation:
	
		The comparison is performed in a locale- and also
		platform-dependent manner. Use this function to present
		sorted lists of strings to the user.

		NOTE:
		This works only for the current system locale.

		To compare for a defined locale, softanza should rely on
		the QCollator class in RingQt (which is not implemented yet)

		--> TODO: Add QCollator class to RingQt and make CompareWithInLocale()
		*/

	def UnicodeCompareWithInLocale(pcOtherStr, pLocale) # TODO
		// Needs the implementation of QCollator class in RingQt (read comment
		// in SystemLocaleCompareWith() methof above

	def IsUnicodeEqualTo(pcOtherStr)
		return This.UnicodeCompareWith(pcOtherNumber) = :Equal

		def IsUnicodeDifferentFrom(pcOtherStr)
			return NOT This.IsUnicodeEqualTo(pcOtherStr)

		def IsNotUnicodeEqualTo(pcOtherStr)
			return NOT This.IsUnicodeEqualTo(pcOtherStr)

	def IsUnicodeEqualToInLocale(pcOtherStr, pLocale)
		return This.UnicodeCompareWithInLocale(pcOtherNumber, pLocale) = :Equal

		def IsUnicodeDifferentFromInLocale(pcOtherStr, pLocale)
			return NOT This.IsUnicodeEqualToInLocale(pcOtherStr, pLocale)

		def IsNotUnicodeEqualToInLocale(pcOtherStr, pLocale)
			return NOT This.IsUnicodeEqualToInLocale(pcOtherStr, pLocale)

	def IsUnicodeLessThan(pcOtherStr)
		return This.UnicodeCompareWith(pcOtherNumber) = :Less

		def IsUnicodeLessThanInLocale(pcOtherStr, pLocale)
			return This.UnicodeCompareWithInLocale(pcOtherNumber, pLocale) = :Less
	
	def IsUnicodeGreaterThan(pcOtherStr)
		return This.UnicodeCompareWith(pcOtherNumber) = :Greater

		def IsUnicodeGreaterThanInLocale(pcOtherStr, pLocale)
			return This.UnicodeCompareWithInLocale(pcOtherNumber, pLocale) = :Greater

	  #-----------------------------------------------#
	 #     COMPARING THE STRING TO OTHER STRINGS     #
	#-----------------------------------------------#

	def IsEqualToCS(pcOtherStr, pCaseSensitive)

		if NOT isString(pcOtherStr)
			return FALSE
		ok

		if isList(pCaseSensitive) and StzListQ(pCaseSensitive).IsCaseSensitiveNamedParam()
			pCaseSensitive = pCaseSensitive[2]
		ok

		if pCaseSensitive = TRUE

			return This.String() = pcOtherStr

		but pCaseSensitive = FALSE
			return This.Lowercased() = StzStringQ(pcOtherStr).Lowercased()
		ok
		
		#< @FunctionNegativeForm

		def IsNotEqualToCS(pcOtherStr, pCaseSensitive)
			return NOT This.IsEqualToCS(pcOtherStr, pCaseSensitive)

			def IsDifferentFromCS(pcOtherStr, pCaseSensitive)
				return This.IsNotEqualToCS(pcOtherStr, pCaseSensitive)
	
		#>

	def IsEqualTo(pcOtherStr)
		return This.IsEqualToCS(pcOtherStr, :CaseSensitive = TRUE)

		#< @FunctionNegativeForm

		def IsNotEqualTo(pcOtherStr)
			return NOT This.IsEqualTo(pcOtherStr)

			def IsDifferentFrom(pcOtherStr)
				return This.IsNotEqualTo(pcOtherStr)
	
		#>

	def IsStrictlyEqualToCS(pcOtherStr, pCaseSensitive)
		if This.IsEqualToCS(pcOtherStr, pCaseSensitive) and
		   This.HasSameSortingOrderAs(pcOtherStr)

			return TRUE

		else
			return FALSE
		ok

		#< @FunctionNegativeForm

		def IsNotStrictlyEqualToCS(pcOtherStr, pCaseSensitive)
			return NOT This.IsStrictlyEqualTo(pcOtherStr, pCaseSensitive)
	
		#>

	def IsStrictlyEqualTo(pcOtherStr)
		return This.IsStrictlyEqualToCS(pcOtherStr, :CaseSensitive = TRUE)

		def IsNotStrictlyEqualTo(pcOtherStr)
			return NOT This.IsStrictlyEqualTo(pcOtherStr)

	def IsEqualToOneOfTheseCS(pacOtherStr, pCaseSensitive)
		bResult = TRUE
		for str in pacOtherStr
			if NOT This.IsEqualToCS(str, pCaseSensitive)
				bResult = FALSE
				exit
			ok
		next
		return bResult

	def IsEqualToOneOfThese(pacOtherStr)
		return This.IsEqualToOneOfTheseCS(pacOtherStr, :CaseSensitive = TRUE)

	def IsLessThan(pcOtherStr)
		return This.IsIncludedIn(pcOtherStr)

		def IsStrictlyLessThan(pcOtherStr)
			return This.IsLessThan(pcOtherStr)

	def IsGreaterThan(pcOtherStr)
		return This.Contains(pcOtherStr)

		def IsStrictlyGreaterThan(pcOtherStr)
			return This.IsGreaterThan(pcOtherStr)

	def IsQuietEqualTo(pcOtherStr)
		# WARNING: Performance issue is caused by DiacriticsRemoved()

		cThisString = This.LowercaseQ().ToStzText().DiacriticsRemoved()

		cOtherString = StzStringQ(pcOtherStr).LowercaseQ().ToStzText().DiacriticsRemoved()

		if cThisString = cOtherString
			return TRUE
		ok

		nDif = abs(This.NumberOfChars() - StzStringQ(pcOtherStr).NumberOfChars())
		n = nDif / This.NumberOfChars()
		
		if n <= QuietEqualityRatio() # 0.09 by default, can be changed with SetQuietEqualityRatio(n)
			return TRUE
		ok

		return FALSE

	  #-------------------------------------------------#
	 #     STRING IS A MULTIPLE OF AN OTHER STRING     #
	#-------------------------------------------------#

	def IsMultipleOfCS(pcSubStr, pCaseSensitive)
		if NOT isString(pcSubStr)
			return FALSE
		ok

		n = This.NumberOfOccurrenceCS( pcSubStr, pCaseSensitive )

		oStr = StzStringQ(pcSubStr) * n

		return oStr.IsEqualToCS(This.String(), pCaseSensitive)

	def IsMultipleOf(pcSubStr)
		return This.IsMultipleOfCS(pcSubStr, :CaseSensitive = TRUE)

	def IsNTimesMultipleOfCS(n, pcSubStr, pCaseSensitive)
		if NOT isString(pcSubStr)
			return FALSE
		ok

		oStr = StzStringQ(pcSubStr) * n

		return oStr.IsEqualToCS(This.String(), pCaseSensitive)

	def IsNTimesMultipleOf(n, pcSubStr)
		return This.IsNTimesMultipleOfCS(n, pcSubStr, :CaseSensitive = TRUE)

	  #------------------------------------------------#
	 #     STRING IS A SPLITTER OF AN OTHER STRING    #
	#------------------------------------------------#

	def IsSplitterOfCS(pcOtherStr, pCaseSensitive)
		if Not isString(pcOtherStr)
			return FALSE
		ok

		bResult = StzStringQ(pcOtherStr).NumberOfOccurrenceCS( This.String(), pCaseSensitive ) > 1
		return bResult

	def IsSplitterOf(pcOtherStr)
		bResult = This.IsSplitterOfCS(pcOtherStr, :CaseSensitive = TRUE)
		return bResult

	  #---------------------------------------------------#
	 #     STRING IS SPLITTABLE USING AN OTHER STRING    #
	#---------------------------------------------------#

	def IsSplittableUsingCS(pcSubStr)
		if Not isString(pcOtherStr)
			return FALSE
		ok

		return Q(pcSubStr).IsSplitterOfCS( This.String(), pCaseSensitive )

	def IsSplittableUsing(pcSubStr)
		return This.IsSplittableUsingCS(pcSubStr, pCaseSensitive)

	  #==============================#
	 #    REMOVING ALL SUBSTRINGS   # 
	#==============================#

	def RemoveAllCS(pSubStr, pCaseSensitive)
		This.ReplaceAllCS(pSubstr, "", pCaseSensitive)

		def RemoveAllCSQ(pSubStr, pCaseSensitive)
			This.RemoveAllCS(pSubStr, pCaseSensitive)
			return This
	
		def RemoveCS(pSubStr, pCaseSensitive)
			This.RemoveAllCS(pSubStr, pCaseSensitive)

			def RemoveCSQ(pSubStr, pCaseSensitive)
				This.RemoveCS(pSubStr, pCaseSensitive)
				return This

		def RemoveSubstringCS(pcSubStr, pCaseSensitive)
			This.RemoveAllCS(pcSubStr, pCaseSensitive)

			def RemoveSubstringCSQ(pSubStr, pCaseSensitive)
				This.RemoveSubstringCS(pSubStr, pCaseSensitive)
				return This

		def RemoveAllOccurrencesOfSubstringCS(pcSubStr, pCaseSensitive)
			This.RemoveAllCS(pcSubStr, pCaseSensitive)

			def RemoveAllOccurrencesOfSubstringQ(pSubStr, pCaseSensitive)
				This.RemoveAllOccurrencesOfSubstring(pSubStr, pCaseSensitive)
				return This

	#---

	def RemoveAll(pcSubStr) # replace with @oQString.remove() when added to RingQt
		This.ReplaceAll(pcSubStr , "")

		def RemoveAllQ(pcSubStr)
			This.RemoveAll(pcSubStr)
			return This

		def Remove(pcSubStr)
			This.RemoveAll(pcSubStr)

			def RemoveQ(pcSubStr)
				This.Remove(pcSubStr)
				return This

		def RemoveSubstring(pcSubStr)
			This.RemoveAll(pcSubStr)


		def RemoveAllOccurrencesOfSubstring(pcSubStr)
			This.RemoveAll(pcSubStr)
	
	  #----------------------------------------------#
	 #   REMOVING SOME OCCURRENCES OF A SUBSTRING   #
	#----------------------------------------------#

	def RemoveOccurrencesCS(panOccurr, pcSubStr, pCaseSensitive)
		/*
		o1 = new stzString("ring __ ring __ ring __ ring")
		o1.RemoveOccurrences([2, 3], "ring")
		? o1.Content() #--> "ring __  __  __ ring"
		*/

		anPos = This.FindOccurrencesCS(panOccurr, pcSubStr, pCaseSensitive)
		This.RemoveSubStringAtPositionsCS(anPos, pcSubStr, pCaseSensitive)

		def RemoveOccurrencesCSQ(panOccurr, pcSubStr, pCaseSensitive)
			This.RemoveOccurrencesCS(panOccurr, pcSubStr, pCaseSensitive)
			return This

		def RemoveTheseOccurrencesCS(panOccurr, pcSubStr, pCaseSensitive)
			This.RemoveOccurrencesCS(panOccurr, pcSubStr, pCaseSensitive)

			def RemoveTheseOccurrencesCSQ(panOccurr, pcSubStr, pCaseSensitive)
				This.RemoveTheseOccurrencesCS(panOccurr, pcSubStr, pCaseSensitive)

	def TheseOccurrencesRemovedCS(panOccurr, pcSubStr, pCaseSensitive)
		return This.Copy().RemoveOccurrencesCSQ(panOccurr, pcSubStr, pCaseSensitive).Content()

	#-- WITHOUT CASESENSITIVITY

	def RemoveOccurrences(panOccurr, pcSubStr)
		This.RemoveOccurrencesCS(panOccurr, pcSubStr, :CaseSensitive = TRUE)

		def RemoveOccurrencesQ(panOccurr, pcSubStr)
			This.RemoveOccurrences(panOccurr, pcSubStr)
			return This

		def RemoveTheseOccurrences(panOccurr, pcSubStr)
			This.RemoveOccurrences(panOccurr, pcSubStr)

			def RemoveTheseOccurrencesQ(panOccurr, pcSubStr)
				This.RemoveTheseOccurrences(panOccurr, pcSubStr)

	def TheseOccurrencesRemoved(panOccurr, pcSubStr)
		return This.Copy().RemoveOccurrencesQ(panOccurr, pcSubStr, pCaseSensitive).Content()

	  #-------------------------------------------------#
	 #   REMOVING FIRST N OCCURRENCES OF A SUBSTRING   #
	#-------------------------------------------------#

	def RemoveFirstNOccurrencesCS(n, pcSubStr, pCaseSensitive)
		This.RemoveTheseOccurrencesCS( 1 : n, pcSubStr, pCaseSensitive )

		def RemoveFirstNOccurrencesCSQ(n, pcSubStr, pCaseSensitive)
			This.RemoveFirstNOccurrencesCSQ(n, pcSubStr, pCaseSensitive)
			return This

		def RemoveNFirstOccurrencesCS(n, pcSubStr, pCaseSensitive)
			This.RemoveFirstNOccurrencesCS(n, pcSubStr, pCaseSensitive)

			def RemoveNFirstOccurrencesCSQ(n, pcSubStr, pCaseSensitive)
				This.RemoveNFirstOccurrencesCS(n, pcSubStr, pCaseSensitive)

	def FirstNOccurrencesRemovedCS(n, pcSubStr, pCaseSensitive)
		return This.Copy().RemoveFirstNOccurrencesCSQ(n, pcSubStr, pCaseSensitive).Content()

		def NFirstOccurrencesRemovedCS(n, pcSubStr, pCaseSensitive)
			return This.FirstNOccurrencesRemovedCS(n, pcSubStr, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def RemoveFirstNOccurrences(n, pcSubStr)
		This.RemoveFirstNOccurrencesCS(n, pcSubStr, :CaseSensitive = TRUE)

		def RemoveFirstNOccurrencesQ(n, pcSubStr, pCaseSensitive)
			This.RemoveFirstNOccurrencesQ(n, pcSubStr, pCaseSensitive)
			return This

		def RemoveNFirstOccurrences(n, pcSubStr, pCaseSensitive)
			This.RemoveFirstNOccurrences(n, pcSubStr, pCaseSensitive)

			def RemoveNFirstOccurrencesQ(n, pcSubStr, pCaseSensitive)
				This.RemoveNFirstOccurrences(n, pcSubStr, pCaseSensitive)

	def FirstNOccurrencesRemoved(n, pcSubStr)
		return This.Copy().RemoveFirstNOccurrencesQ(n, pcSubStr, pCaseSensitive).Content()

		def NFirstOccurrencesRemoved(n, pcSubStr)
			return This.FirstNOccurrencesRemoved(n, pcSubStr)

	  #------------------------------------------------#
	 #   REMOVING LAST N OCCURRENCES OF A SUBSTRING   #
	#------------------------------------------------#

	def RemoveLastNOccurrencesCS(n, pcSubStr, pCaseSensitive)
		nNumberOfOccurr = This.NumberOfOccurrencesCS(pcSubStr, pCaseSensitive)
		n1 = nNumberOfOccurr - n + 1
		This.RemoveTheseOccurrencesCS( n1 : nNumberOfOccurr , pcSubStr, pCaseSensitive )

		def RemoveLastNOccurrencesCSQ(n, pcSubStr, pCaseSensitive)
			This.RemoveLastNOccurrencesCSQ(n, pcSubStr, pCaseSensitive)
			return This

		def RemoveNLastOccurrencesCS(n, pcSubStr, pCaseSensitive)
			This.RemoveLastNOccurrencesCS(n, pcSubStr, pCaseSensitive)

			def RemoveNLastOccurrencesCSQ(n, pcSubStr, pCaseSensitive)
				This.RemoveNLastOccurrencesCS(n, pcSubStr, pCaseSensitive)

	def LastNOccurrencesRemovedCS(n, pcSubStr, pCaseSensitive)
		return This.Copy().RemoveLastNOccurrencesCSQ(n, pcSubStr, pCaseSensitive).Content()

		def NLastOccurrencesRemovedCS(n, pcSubStr, pCaseSensitive)
			return This.LastNOccurrencesRemovedCS(n, pcSubStr, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def RemoveLastNOccurrences(n, pcSubStr)
		This.RemoveLastNOccurrencesCS(n, pcSubStr, :CaseSensitive = TRUE)

		def RemoveLastNOccurrencesQ(n, pcSubStr, pCaseSensitive)
			This.RemoveLastNOccurrencesQ(n, pcSubStr, pCaseSensitive)
			return This

		def RemoveNLastOccurrences(n, pcSubStr, pCaseSensitive)
			This.RemoveLastNOccurrences(n, pcSubStr, pCaseSensitive)

			def RemoveNLastOccurrencesQ(n, pcSubStr, pCaseSensitive)
				This.RemoveNLastOccurrences(n, pcSubStr, pCaseSensitive)

	def LastNOccurrencesRemoved(n, pcSubStr)
		return This.Copy().RemoveLastNOccurrencesQ(n, pcSubStr, pCaseSensitive).Content()

		def NLastOccurrencesRemoved(n, pcSubStr)
			return This.LastNOccurrencesRemoved(n, pcSubStr)

	  #----------------------------------------------#
	 #   REMOVING MANY SUBSTRING AT THE SAME TIME   #
	#----------------------------------------------#

	def RemoveManyCS(pacSubStr, pCaseSensitive)
		for cSubstr in paCsubstr
			This.RemoveAllCS(cSubstr, pCaseSensitive)
		next

		def RemoveManyCSQ(pacSubStr, pCaseSensitive, pCaseSensitive)
			This.RemoveManyCS(pacSubStr, pCaseSensitive)
			return This

		def RemoveAllOfTheseCS(pacSubStr, pCaseSensitive)
			This.RemoveMany(pacSubStr)

			def RemoveAllOfTheseCSQ(pacSubStr, pCaseSensitive)
				This.RemoveAllOfTheseCS(pacSubstr, pCaseSensitive)
				return This

		def RemoveManySubstringsCS(pcSubStr, pCaseSensitive)
			This.RemoveAllCS(pcSubStr, pCaseSensitive)

			def RemoveManySubstringsCSQ(pSubStr, pCaseSensitive)
				This.RemoveManySubstringsCS(pSubStr, pCaseSensitive)
				return This

	def ManySubstringsRemovedCS(pacSubStr, pCaseSensitive)
		return This.Copy().RemoveManySubstringsCS(pacSubStr, pCaseSensitive).Content()

		def SubstringsRemovedCS(pacSubStr, pCaseSensitive)
			return This. ManySubstringsRemovedCS(pacSubStr, pCaseSensitive)

	#-- CASEèSENSITIVE

	def RemoveMany(pacSubStr)
		for cSubstr in paCsubstr
			This.RemoveAll(cSubstr)
		next

		def RemoveManyQ(pacSubStr)
			This.RemoveMany(pacSubstr)
			return This

		def RemoveAllOfThese(pacSubstr)
			This.RemoveMany(pacSubStr)

			def RemoveAllOfTheseQ(pacSubstr)
				This.RemoveAllOfThese(pacSubstr)
				return This

		def RemoveManySubstrings(pcSubStr)
			This.RemoveMany(pacSubStr)

			def RemoveManySubstringsQ(pSubStr)
				This.RemoveManySubstrings(pSubStr, pCaseSensitive)
				return This

	def ManySubstringsRemoved(pacSubStr)
		return This.Copy().RemoveManySubstrings(pacSubStr).Content()

		def SubstringsRemoved(pacSubStr)
			return This. ManySubstringsRemoved(pacSubStr)

	  #-------------------------------------------------------------------------#
	 #  REMOVING ALL OCCURRENCES OF A SUBSTRING BETWEEN TWO OTHER SUBSTRINGS  #
	#-------------------------------------------------------------------------#

	def RemoveBetweenCS(pcSubStr, pcBound1, pcBound2, pCaseSensitive)

		aSections = This.FindSectionsBetweenCS(pcSubStr, pcBound1, pcBound2, pCaseSensitive)
		This.RemoveSections(aSections)

		def RemoveBetweenCSQ(pcSubStr,pcBound1, pcBound2, pCaseSensitive)
			This.RemoveBetweenCS(pcSubStr,pcBound1, pcBound2, pCaseSensitive)
			return This

		def RemoveSubStringBetweenCS(pcSubStr,pcBound1, pcBound2, pCaseSensitive)
			This.RemoveBetweenCS(pcSubStr,pcBound1, pcBound2, pCaseSensitive)

			def RemoveSubStringBetweenCSQ(pcSubStr,pcBound1, pcBound2, pCaseSensitive)
				This.RemoveSubStringBetweenCS(pcSubStr,pcBound1, pcBound2, pCaseSensitive)
				return This

	def SubstringBetweenRemovedCS(pcSubStr,pcBound1, pcBound2, pCaseSensitive)
		cResult = This.RemoveBetweenCSQ(pcSubStr,pcBound1, pcBound2, pCaseSensitive).Content()
		return cResult

	#---

	def RemoveBetween(pcSubStr,pcBound1, pcBound2)
		This.RemoveBetweenCS(pcSubStr,pcBound1, pcBound2, :CaseSensitive = TRUE)
		
		def RemoveBetweenQ(pcSubStr,pcBound1, pcBound2)
			This.RemoveBetween(pcSubStr,pcBound1, pcBound2)
			return This

		def RemoveSubStringBetween(pcSubStr,pcBound1, pcBound2)
			This.RemoveBetween(pcSubStr,pcBound1, pcBound2)

			def RemoveSubStringBetweenQ(pcSubStr,pcBound1, pcBound2)
				This.RemoveSubStringBetween(pcSubStr,pcBound1, pcBound2)
				return This

	def SubstringBetweenRemoved(pcSubStr,pcBound1, pcBound2)
		cResult = This.RemoveBetweenQ(pcSubStr,pcBound1, pcBound2).Content()
		return cResult

	  #-----------------------------------------------------#
	 #   REMOVING A SUBSTRING AT A SOME GIVEN POSITIONS    #
	#-----------------------------------------------------#

	def RemoveSubStringAtPositionsCS(panPositions, pcSubStr, pCaseSensitive)

		/* EXAMPLE
		o1 = new stzString("ring php ring ruby ring python rping cshar ring")
		o1.RemoveSubstringAtPositions([ 10, 20, 32, 44 ], "ring")

		? o1.Content() #--> "ring php ruby python csharp"
		*/

		if NOT isList(panPositions) and Q(panPositions).IsListOfNumbers()
			stzRaise("Incorrect param! panPositions must be a list of numbers.")
		ok

		anPositions = Q(panPositions).SortedInAscending()

		# Doing the job

		for i = len(anPositions) to 1 step -1
			n = anPositions[i]

			This.RemoveSubStringAtPositionCS(n, pcSubStr, pCaseSensitive)
		next

	#-- WITHOUT CASESENSITIVITY

	def RemoveSubStringAtPositions(panPositions, pcSubStr)
		This.RemoveSubStringAtPositionsCS(panPositions, pcSubStr, :CaseSensitive = TRUE)

	  #---------------------------------------#
	 #   REMOVING CHAR AT A GIVEN POSITION   #
	#---------------------------------------#

	def RemoveCharAtPosition(n)
		This.ReplaceNthChar(n, "")

		def RemoveCharAtPositionQ(n)
			This.RemoveCharAtPosition(n)
			return This

		def RemoveCharAt(n)
			This.RemoveCharAtPosition(n)

			def RemoveCharAtQ(n)
				This.RemoveCharAt(n)
				return This

		def RemoveNthChar(n)
			This.RemoveCharAtPosition(n)

			def RemoveNthCharQ(n)
				This.RemoveNthChar(n)
				return This

		def RemoveAt(n)
			This.RemoveCharAtPosition(n)

			def RemoveAtQ(n)
				This.RemoveAt(n)
				return This

	def CharAtPositionNRemoved(n)
		return This.Copy().RemoveCharAtPositionQ(n).Content()

		def CharAtNPositionRemoved(n)
			return This.CharAtPositionRemoved(n)

		def NthCharRemoved(n)
			return This.CharAtPositionRemoved(n)

	  #---------------------------------#
	 #   REMOVING FIRST & LAST CHARS   #
	#---------------------------------#

	def RemoveFirstChar()
		This.RemoveNthChar(1)

		def RemoveFirstCharQ()
			This.RemoveFirstChar()
			return This

	def FirstCharRemoved()
		return This.Copy().RemoveFirstCharQ().Content()

	#--

	def RemoveLastChar()
		This.RemoveNthChar(This.NumberOfChars())

		def RemoveLastCharQ()
			This.RemoveLastChar()
			return This

	def LastCharRemoved()
		return This.Copy().RemoveLastCharQ().Content()


	  #---------------------------------------------------------#
	 #   REMOVING FIRST & LAST CHARS UPAON A GIVEN CONDITION   #
	#---------------------------------------------------------#

	def RemoveFirstCharW(pcCondition)
		cCode = StzStringQ(pcCondition).RemoveSpacesQ().BoundsRemoved("{","}")
		cCode = 'bOk = ' + cCode
		eval(cCode)

		if bOk
			This.RemoveFirstChar()
		ok

		def RemoveFirstCharWQ(pcCondition)
			This.RemoveFirstCharW(pcCondition)
			return This

	def FirstCharRemovedW(pcCondition)
		return This.Copy().RemoveFirstCharWQ(pcCondition).Content()

	#--

	def RemoveLastCharW(pcCondition)
		@char = @@(This.LastChar())
		cCode = StzStringQ(pcCondition).RemoveSpacesQ().BoundsRemoved("{","}")
		cCode = 'bOk = (' + cCode + ')'

		eval(cCode)

		if bOk
			This.RemoveLastChar()
		ok

		def RemoveLastCharWQ(pcCondition)
			This.RemoveLastCharW(pcCondition)
			return This

	def LastCharRemovedW(pcCondition)
		return This.Copy().RemoveLastCharWQ(pcCondition).Content()

	  #---------------------------------#
	 #   REMOVING LEFT & RIGHT CHARS   #
	#---------------------------------#

	def RemoveLeftChar()
		This.RemoveNLeftChars(1)

		def RemoveLeftCharQ()
			This.RemoveLeftChar()
			return This

	def LeftCharRemoved()
		cResult = This.Copy().RemoveLeftCharQ().Content()
		return cResult

	def RemoveRightChar()
		This.RemoveNRightChars(1)

		def RemoveRightCharQ()
			This.RemoveRightChar()
			return This

	def RightCharRemoved()
		cResult = This.Copy().RemoveRightCharQ().Content()
		return cResult

	  #----------------------------#
	 #   REMOVING N FIRST CHARS   #
	#----------------------------#

	def RemoveNFirstChars(n)
		if This.IsRightToLeft()
			This.RemoveNRightChars(n)
		else
			This.RemoveNLeftChars(n)
		ok
		
		#< @FunctionFluentForm

		def RemoveNFirstCharsQ(n)
			This.RemoveNFirstChars(n)
			return This
	
		#>

		#< @FunctionAlternativeForm

		def RemoveFirstNChars(n)
			This.RemoveNFirstChars(n)

			#< @FuncFluentForm
	
			def RemoveFirstNCharsQ(n)
				This.RemoveNFirstCharsQ(n)
	
			#>

		#>
	
	def NFirstCharsRemoved(n)
		cResult = This.Copy().RemoveNFirstCharsQ(n).Content()
		return cResult

		def FirstNCharsRemoved(n)
			return This.NFirstCharsRemoved(n)

	  #---------------------------#
	 #   REMOVING N LAST CHARS   #
	#---------------------------#

	def RemoveNLastChars(n)

		if This.IsLeftToRight()
			This.RemoveNRightChars(n)
		else
			This.RemoveNLeftChars(n)
		ok	

		#< @FunctionFluentForm

		def RemoveNLastCharsQ(n)
			This.RemoveNLastChars(n)
			return This
	
		#>

		#< @FunctionAlternativeForm

		def RemoveLastNChars(n)
			This.RemoveNLastChars(n)

			#< @FuncFluentForm
	
			def RemoveLastNCharsQ(n)
				This.RemoveNLastCharsQ(n)
	
			#>

		#>
	
	def NLastCharsRemoved(n)
		cResult = This.Copy().RemoveNLastCharsQ(n).Content()
		return cResult

		def LastNCharsRemoved(n)
			return This.NLastCharsRemoved(n)

	  #---------------------------#
	 #   REMOVING N LEFT CHARS   #
	#---------------------------#

	def RemoveNLeftChars(n)
		if This.IsLeftToRight()
			This.RemoveSection( 1, n )

		else
			This.RemoveSection( This.NumberOfChars() - n + 1, :LastChar )
		ok

		#< @FunctionFluentForm

		def RemoveNLeftCharsQ(n)
			This.RemoveNLeftChars(n)
			return This
	
		#>

		#< @FunctionAlternativeForm

		def RemoveLeftNChars(n)
			This.RemoveNLeftChars(n)

			#< @FuncFluentForm
	
			def RemoveLeftNCharsQ(n)
				This.RemoveNLeftCharsQ(n)
	
			#>
		#>
	
	def NLeftCharsRemoved(n)
		cResult = This.Copy().RemoveNLeftCharsQ(n).Content()
		return cResult

		def LeftNCharsRemoved(n)
			return This.NLeftCharsRemoved(n)

	  #----------------------------#
	 #   REMOVING N RIGHT CHARS   #
	#----------------------------#

	def RemoveNRightChars(n)
		if This.IsRightToLeft()
			This.RemoveSection( 1, n)
		else
			This.RemoveSection( This.NumberOfChars() - n + 1, :LastChar )
		ok

		#< @FunctionFluentForm

		def RemoveNRightCharsQ(n)
			This.RemoveNRightChars(n)
			return This
	
		#>

		#< @FunctionAlternativeForm

		def RemoveRightNChars(n)
			This.RemoveNRightChars(n)

			#< @FuncFluentForm
	
			def RemoveRightNCharsQ(n)
				This.RemoveNRightCharsQ(n)
	
			#>
		#>
	
	def NRightCharsRemoved(n)
		cResult = This.Copy().RemoveNRightCharsQ(n).Content()
		return cResult

		def RightNCharsRemoved(n)
			return This.NRightCharsRemoved(n)

	  #---------------------------------------------#
	 #    REMOVING A GIVEN CHAR FROM THE STRING    # 
	#---------------------------------------------#

	def RemoveCharCS(pcChar, pCaseSensitive) # TODO (future): accept also stzChar objects
		if NOT StringIsChar(pcChar)
			stzRaise("Incorrect param type! You must provide a string containing char")
		ok

		This.RemoveCharsCSW('@char = ' + @@(pcChar), pCaseSensitive)

		def RemoveCharCSQ(pcChar, pCaseSensitive)
			This.RemoveCharCS(pcChar, pCaseSensitive)
			return This

	def CharRemovedCS(pcChar, pCaseSensitive)
		cResult = This.Copy().RemoveCharCSQ(pcChar, pCaseSensitive).Content()
		return cResult

	#---

	def RemoveChar(pcChar)
		if NOT StringIsChar(pcChar)
			stzRaise("Incorrect param type! You must provide a string containing char")
		ok

		This.RemoveCharsW('@char = ' + @@(pcChar))

		def RemoveCharQ(pcChar)
			This.RemoveChar(pcChar)
			return This

	def CharRemoved(pcChar)
		cResult = This.Copy().RemoveCharQ(pcChar).Content()
		return cResult

	  #----------------------------------#
	 #    REMOVING A SECTION OF CHARS   # 
	#----------------------------------#
	
	// Removes a portion of the string defined by its start and end positions
	def RemoveSection(n1, n2)
		#< @MotherFunction = This.ReplaceSection() > @QtBased = TRUE #>

		if n1 = :FirstChar or n1 = :StartOfString { n1 = 1 }
		if n2 = :LastChar  or n2 = :EndOfString { n2 = This.NumberOfChars() }

		This.ReplaceSection( n1, n2, "" )

		def RemoveSectionQ(n1, n2)
			This.RemoveSection(n1, n2)
			return This

	def SectionRemoved(n1, n2)
		cResult = This.Copy().RemoveSectionQ(n1, n2).Content()
		return cResult
	
	  #-------------------------------------------------------#
	 #    REMOVING MANY SECTIONS OF CHARS AT THE SAME TIME   # 
	#-------------------------------------------------------#

	def RemoveManySections(paListOfSections)

		if NOT ( isList(paListOfSections) and Q(paListOfSections).IsListOfPairsOfNumbers() )
			stzRaise([
				:Where = "stzString > RemoveManySections(paListOfSections)",
				:What  = "Can't remove many sections from the string.",
				:Why   = "The value is you provided (paListOfSections) is not a list of pairs of numbers."
			])
		ok

		/* EXAMPLE
		
		o1 = new stzString("**word1***word2**word3***")
		? o1.Sections([ [1,2], [8, 10], [16, 17], [23, 25] ])
		#--> [ "**", "***", "**", "***" ]
		
		o1.RemoveManySections([
			[1,2], [8, 10], [16, 17], [23, 25]
		])
		
		? o1.Content() # --> "blablablablabla"

		*/

		# For each section, remove the section, and then adjust the positions
		# inside the other sections that come after it, to reflect the
		# changed content of the string

		n = 0
		nNumberOfSections = len(paListOfSections)
		
		for aSection in paListOfSections
			nNumberOfCharsInSection = aSection[2] - aSection[1] + 1
			n++
			# Remove the section
			This.RemoveSection(aSection[1], aSection[2])

			# Adjust the positions of the remaing sections
			for i = n + 1 to nNumberOfSections
				# If this section comes to the right of the section
				# removed, then adjust the positions
				if paListOfSections[i][1] > aSection[2]
						paListOfSections[i][1] -= nNumberOfCharsInSection
						paListOfSections[i][2] -= nNumberOfCharsInSection
				ok
			next

		next

		def RemoveManySectionsQ(paListOfSections)
			This.RemoveManySections(paListOfSections)
			return This

		def RemoveSections(paListOfSections)
			This.RemoveManySections(paListOfSections)

			def RemoveSectionsQ(paListOfSections)
				This.RemoveSections(paListOfSections)
				return This

	def ManySectionsRemoved(paListOfSections)
		cResult = This.Copy().RemoveManySectionsQ(paListOfSections).Content()
		return This

		def SectionsRemoved(paListOfSections)
			return This.ManySectionsRemoved(paListOfSections)

	  #--------------------------------#
	 #    REMOVING A RANGE OF CHARS   # 
	#--------------------------------#

	// Removes a portion of the string defined by a start position and
	// a range of n chars

	def RemoveRange(nStart, nRange)

		if nStart = :FirstChar or nStart = :StartOfString { nStart = 1 }
		if nRange = :EndOfString { nRange = This.NumberOfChars() - nStart + 1 }

		This.RemoveSection(nStart, nStart + nRange - 1)

		def RemoveRangeQ(nStart, nRange)
			This.RemoveRange(nStart, nNumberOfChars)
			return This

	def RangeRemoved(nStart, nRange)
		cResult = This.RemoveRangeQ(nStart, nRange).Content()
		return cResult

	  #-----------------------------------------------------#
	 #    REMOVING MANY RANGES OF CHARS AT THE SAME TIME   # 
	#-----------------------------------------------------#

	def RemoveManyRanges(paListOfRanges)

		# Tranform ranges to sections and then use RemoveManySections()

		aSections = []
		for aRange in paListOfRanges
			n1 = aRange[1]
			n2 = aRange[1] + aRange[2] - 1

			aSections + [ n1, n2 ]
		next
		
		This.RemoveManySections(aSections)

		def RemoveManyRangesQ(paListOfRanges)
			This.RemoveManySections(paListOfRanges)

		def RemoveRanges(paListOfRanges)
			This.RemoveManyRanges(paListOfRanges)

			def RemoveRangesQ(paListOfRanges)
				This.RemoveRanges(paListOfRanges)
				return This

	def ManyRangesRemoved(paListOfRanges)
		cResult = This.Copy().RemoveManyRangesQ(paListOfRanges).Content()
		return This

		def RangedRemoved(paListOfRanges)
			return This.ManyRangesRemoved(paListOfRanges)

	  #-------------------------------------------------------------#
	 #    REMOVING SECTIONS OF CHARS VERIFYING A GIVEN CONDITION   # 
	#-------------------------------------------------------------#

	def RemoveSectionsW(paSections, pcCondition)

		/* EXAMPLE

		o1 = new stzString("..AA..aa..BB..bb")
		o1.RemoveSectionsW(
			[3, 4], [7,8], [11,12], [15,16],
			:Wehre = '{ Q(This(@section)).IsLowercase() }'
		)

		#--> "..AA....BB.."
		*/

		if isString(pcCondition)
			cCondition = pcCondition

		but isList(pcCondition) and StzListQ(pcCondition).IsWhereNamedParam()
			cCondition = pcCondition[2]

		else
			// TODO: add this check everywhere in the library!
			stzRaise("Incorrect condition format!")
		ok

		cCondition = StzStringQ(cCondition).
				SimplifyQ().
				RemoveBoundsQ(["{","}"]).
				Content()

		cCode = "bOk = ( " + cCondition + " )"

		aSubStrings = This.Sections(paSections)

		aSectionsToRemove = []
		for i = 1 to len( paSections )
			@n1 = paSections[i][1]
			@n2 = paSections[i][2]

			@section = aSubStrings[i]

			eval(cCode)

			if bOk
				aSectionsToRemove + [ @n1, @n2 ]
			ok
		next

		This.RemoveManySections(aSectionsToRemove)

		#< @FunctionFluentForm

		def RemoveSectionsWQ(paSections, pcCondition)
			This.RemoveSectionsW(paSections, pcCondition)
			return This

		def RemoveSectionsWhere(paSections, pcCondition)
			This.RemoveSectionsW(paSections, pcCondition)

			def RemoveSectionsWhereQ(paSections, pcCondition)
				This.RemoveSectionsWhere(paSections, pcCondition)
				return This

		def RemoveManySectionsW(paSections, pcCondition)
			This.RemoveSectionsW(paSections, pcCondition)
	
			def RemoveManySectionsWQ(paSections, pcCondition)
				This.RemoveManySectionsW(paSections, pcCondition)
				return This

		def RemoveManySectionsWhere(paSections, pcCondition)
			This.RemoveSectionsW(paSections, pcCondition)

			def RemoveManySectionsWhereQ(paSections, pcCondition)
				This.RemoveManySectionsWhere(paSections, pcCondition)
				return This

	def ManySectionsRemovedW(paSections, pcCondition)
		cResult = This.Copy().RemoveManySectionsQ(paSections, pcCondition).Content()
		return cResult

		def ManySectionsRemovedWhere(paSections, pcCondition)
			return This.ManySectionsRemovedW(paSections, pcCondition)

	  #----------------------------------------------------------------#
	 #    REMOVING MANY RANGES OF CHARS VERIFYING A GIVEN CONDITION   # 
	#----------------------------------------------------------------#

	def RemoveManyRangesW(paListOfRanges, pcCondition)

		# Tranform ranges to sections and then use RemoveManySectionsW()

		aSections = []
		for aRange in paListOfRanges
			n1 = aRange[1]
			n2 = aRange[1] + aRange[2] - 1

			aSections + [ n1, n2 ]
		next
	

	
		if isString(pcCondition)
			cCondition = pcCondition

		but isList(pcCondition) and Q(pcCondition).IsWhereNamedParam()
			cCondition = pcCondition[2]
		ok

		if NOT isString(cCondition)
			stzRaise("Incorrect param! pcCondition must be a string.")
		ok

		cCondition = StzStringQ(cCondition).
				ReplaceCSQ("@range", "@section", :CS = FALSE).
				Content()

		This.RemoveManySectionsW(aSections, cCondition)

		def RemoveManyRangesWQ(paListOfRanges, pcCondition)
			This.RemoveManyRangesW(paListOfRanges, pcCondition)

		def RemoveRangesW(paListOfRanges, pcCondition)
			This.RemoveManyRangesW(paListOfRanges, pcCondition)

			def RemoveRangesWQ(paListOfRanges, pcCondition)
				This.RemoveRangesW(paListOfRanges, pcCondition)
				return This

	def ManyRangesRemovedW(paListOfRanges, pcCondition)
		cResult = This.Copy().RemoveManyRangesWQ(paListOfRanges, pcCondition).Content()
		return cResult

		def RangedRemovedW(paListOfRanges, pcCondition)
			return This.ManyRangesRemovedW(paListOfRanges, pcCondition)

	  #-------------------------------------------------#
	 #    REMOVING CHARS VERIFYING A GIVEN CONDITION   # 
	#-------------------------------------------------#

	def RemoveCharsWhere(pcCondition)

		if isList(pcCondition) and stzListQ(pcCondition).IsWhereNamedParam()
			pcCondition = pcCondition[2]

			if NOT isString(pcCondition)
				stzRaise("Incorrect param type! pcCondition mus tbe a string.")
			ok
		ok

		anPositions = This.FindAllCharsWhereQ( pcCondition ).SortedInDescending()

		for for n in anPositions
			This.RemoveCharAtPosition(n)
		next

		#< @FunctionFluentForm

		def RemoveCharsWhereQ(pcCondition)
			This.RemoveCharsWhere(pcCondition)
			return This

		#>

		def RemoveCharsW(pcCondition)
			This.RemoveCharsWhere(pcCondition)

			def RemoveCharsWQ(pcCondition)
				This.RemoveCharsW(pcCondition)
				return This

		def RemoveAllcharsWhere(pcCondition)
			This.RemoveCharsWhere(pcCondition)

			def RemoveAllcharsWhereQ(pcCondition)
				This.RemoveAllcharsWhere(pcCondition)
				return This

		def RemoveAllcharsW(pcCondition)
			This.RemoveCharsWhere(pcCondition)

			def RemoveAllcharsWQ(pcCondition)
				This.RemoveAllCharsWhere(pcCondition)
				return This

		def RemoveW(pCondition)
			This.RemoveCharsWhere(pCondition)

			def RemoveWQ(pCondition)
				This.RemoveW(pCondition)
				return This

	  #-----------------------------------#
	 #    REPLACING A SECTION OF CHARS   # 
	#-----------------------------------#
	
	// Replaces a portion of the string defined by its start and end positions

	def ReplaceSection(n1, n2, pcNewSubStr)
		#< @MotherFunction = YES | @QtBased #>

		# Let's take a copy of pcNewSubStr and work on it locally
		# to avoid bugs when using conditional code (using :with@)
		# TODO: Generalize this!

		pcNewSubStrCopy = pcNewSubStr

		# Checking the correctness of n1 and n2 params

		if isList(n1) and Q(n1).IsFromNamedParam()
			n1 = n1[2]
		ok

		if isList(n2) and Q(n2).IsToNamedParam()
			n2 = n2[2]
		ok

		if isString(n1)
			if n1 = :First or n1 = :FirstChar or n1 = :StartOfString { n1 = 1 }
		ok

		if isString(n2)
			if n2 = :Last or n2 = :LastChar  or n2 = :EndOfString { n2 = This.NumberOfChars() }
		ok

		if NOT BothAreNumbers(n1, n2)
			stzRaise("Incorrect param types! n1 and n2 must be numbers.")
		ok

		# Checking the correctness of pcNewSubStr param


		if isList(pcNewSubStrCopy) and Q(pcNewSubStrCopy).IsWithOrByNamedParam()

			if pcNewSubStrCopy[1] = :With@ or pcNewSubStrCopy[1] = :By@

				cCode = StzStringQ(pcNewSubStrCopy[2]).
					TrimQ().
					RemoveBoundsQ([ "{","}" ]).
					Content()

				@section = This.Section(n1, n2)

				cCode = "pcNewSubStrCopy = " + cCode

				eval(cCode)
			else
				pcNewSubStrCopy = pcNewSubStrCopy[2]

			ok
		ok

		if NOT isString(pcNewSubStrCopy)
			stzRaise("Incorrect param type! pcNewSubStr must be a string.")
		ok

		# Doing the job

		QStringObject().replace(n1 - 1, n2 - n1 + 1, pcNewSubStrCopy)

		#< @FunctionFluentForm

		def ReplaceSectionQ(n1, n2, pcNewSubStr)
			This.ReplaceSection(n1, n2, pcNewSubStr)
			return This

		#>

	def SectionReplaced(n1, n2, pcNewSubStr)
		cResult = This.Copy().ReplaceSectionQ(n1, n2, pcNewSubStr).Content()
		return cResult
	
	  #--------------------------------------------------------#
	 #    REPLACING MANY SECTIONS OF CHARS AT THE SAME TIME   # 
	#--------------------------------------------------------#

	def ReplaceManySections(paListOfSections, pcNewSubStr)

		/* EXAMLE
		
		o1 = new stzString("**word1***word2**word3***")
		? o1.Sections([ [1,2], [8, 10], [16, 17], [23, 25] ])
		#--> [ "**", "***", "**", "***" ]
		
		o1.ReplaceManySections([ [1,2], [8, 10], [16, 17], [23, 25] ], "_" )
		
		? o1.Content() # --> "_word1_word2_word3_"
		*/

		if NOT( isList(paListOfSections) and Q(paListOfSections).IsListOfPairsOfNumbers() )

			stzRaise([
				:Where = "stzString > ReplaceManySections()",
				:What  = "Can't Replace many sections from the string.",
				:Why   = "The value you provided is not a list of sections.",
				:Todo  = "Provide a list of sections as pairs of numbers!"
			])
		ok

		aListOfSections = StzListOfPairsQ( paListOfSections ).SortedInAscending()

		n = 0
		nNumberOfSections = len(aListOfSections)
		
		for i = len(aListOfSections) to 1 step -1

			aSection = aListOfSections[i]

			n1 = aSection[1]
			n2 = aSection[2]

			This.ReplaceSection(n1, n2, pcNewSubStr)

		next

		def ReplaceManySectionsQ(paListOfSections, pcNewSubStr)
			This.ReplaceManySections(paListOfSections, pcNewSubStr)
			return This


		def ReplaceSections(paListOfSections, pcNewSubStr)
			This.ReplaceManySections(paListOfSections, pcNewSubStr)

			def ReplaceSectionsQ(paListOfSections, pcNewSubStr)
				This.ReplaceSections(paListOfSections, pcNewSubStr)
				return This

	def ManySectionsReplaced(paListOfSections, pcNewSubStr)
		cResult = This.Copy().ReplaceManySectionsQ(paListOfSections, pcNewSubStr).Content()
		return This

		def SectionsReplaced(paListOfSections, pcNewSubStr)
			return This.ManySectionsReplaced(paListOfSections, pcNewSubStr)

	  #---------------------------------#
	 #    REPLACING A RANGE OF CHARS   # 
	#---------------------------------#

	// Replaces a portion of the string defined by a start position and
	// a range of n chars
	def ReplaceRange(nStart, nNumberOfChars, pcNewSubStr)

		if nStart = :FirstChar or nStart = :StartOfString { nStart = 1 }
		if nNumberOfChars = :EndOfString { nNumberOfChars = This.NumberOfChars() - nStart + 1 }

		This.ReplaceSection(nStart, nStart + nNumberOfChars - 1, pcNewSubStr)

		def ReplaceRangeQ(nStart, nNumberOfChars, pcNewSubStr)
			This.ReplaceRange(nStart, nNumberOfChars, pcNewSubStr)
			return This

	def RangeReplaced(nStart, nNumberOfChars, pcNewSubStr)
		cResult = This.ReplaceRangeQ(nStart, nNumberOfChars, pcNewSubStr).Content()
		return cResult

	  #------------------------------------------------------#
	 #    REPLACING MANY RANGES OF CHARS AT THE SAME TIME   # 
	#------------------------------------------------------#

	def ReplaceManyRanges(paListOfRanges, pcNewSubStr)

		# Tranform ranges to sections and then use ReplaceManySections()

		aSections = []
		for aRange in paListOfRanges
			n1 = aRange[1]
			n2 = aRange[1] + aRange[2] - 1

			aSections + [ n1, n2 ]
		next
		
		This.ReplaceManySections(aSections, pcNewSubStr)

		def ReplaceManyRangesQ(paListOfRanges, pcNewSubStr)
			This.ReplaceManySections(paListOfRanges, pcNewSubStr)

		def ReplaceRanges(paListOfRanges, pcNewSubStr)
			This.ReplaceManyRanges(paListOfRanges, pcNewSubStr)

			def ReplaceRangesQ(paListOfRanges, pcNewSubStr)
				This.ReplaceRanges(paListOfRanges, pcNewSubStr)
				return This

	def ManyRangesReplaced(paListOfRanges, pcNewSubStr)
		cResult = This.Copy().ReplaceManyRangesQ(paListOfRanges, pcNewSubStr).Content()
		return This

		def RangedReplaced(paListOfRanges, pcNewSubStr)
			return This.ManyRangesReplaced(paListOfRanges, pcNewSubStr)

	  #--------------------------------------------------------------#
	 #    REPLACING SECTIONS OF CHARS VERIFYING A GIVEN CONDITION   # 
	#--------------------------------------------------------------#

	def ReplaceSectionsW(paSections, pcNewSubStr, pcCondition)
		/* EXAMPLE

		o1 = new stzString("..AA..aa..BB..bb")
		o1.ReplaceSectionsW(
			[3, 4], [7,8], [11,12], [15,16],
			:With = "_",
			:Wehre = '{ Q(This(@section)).IsLowercase() }'
		)

		#--> "..AA.._..BB.._"
		*/

		if isList(pcCondition) and StzListQ(pcCondition).IsWhereNamedParam()
			pcCondition = pcCondition[2]

		else
			// TODO: add this check everywhere in the library!
			stzRaise("Incorrect condition format!")
		ok

		pcCondition = StzStringQ(pcCondition).
				SimplifyQ().
				ReplaceBoundsQ("{","}").
				Content()

		cCode = "bOk = ( " + pcCondition + " )"

		aSubStrings = This.Sections(paSections)

		aSectionsToReplace = []
		for i = 1 to len( paSections )
			@n1 = paSections[i][1]
			@n2 = paSections[i][2]

			@range = aSubStrings[i]

			eval(cCode)

			if bOk
				aSectionsToReplace + [ @n1, @n2 ]
			ok
		next

		This.ReplaceManySections(aSectionsToReplace, pcNewSubStr)

		#< @FunctionFluentForm

		def ReplaceSectionsWQ(paSections, pcNewSubStr, pcCondition)
			This.ReplaceSectionsW(paSections, pcNewSubStr, pcCondition)
			return This

		def ReplaceSectionsWhere(paSections, pcNewSubStr, pcCondition)
			This.ReplaceSectionsW(paSections, pcNewSubStr, pcCondition)

			def ReplaceSectionsWhereQ(paSections, pcNewSubStr, pcCondition)
				This.ReplaceSectionsWhere(paSections, pcNewSubStr, pcCondition)
				return This

		def ReplaceManySectionsW(paSections, pcNewSubStr, pcCondition)
			This.ReplaceSectionsW(paSections, pcNewSubStr, pcCondition)
	
			def ReplaceManySectionsWQ(paSections, pcNewSubStr, pcCondition)
				This.ReplaceManySectionsW(paSections, pcNewSubStr, pcCondition)
				return This

		def ReplaceManySectionsWhere(paSections, pcNewSubStr, pcCondition)
			This.ReplaceSectionsW(paSections, pcNewSubStr, pcCondition)

			def ReplaceManySectionsWhereQ(paSections, pcNewSubStr, pcCondition)
				This.ReplaceManySectionsWhere(paSections, pcNewSubStr, pcCondition)
				return This

	def ManySectionsReplacedW(paSections, pcNewSubStr, pcCondition)
		cResult = This.Copy().ReplaceManySectionsWQ(paSections, pcNewSubStr, pcCondition).Content()
		return cResult

		def ManySectionsReplacedWhere(paSections, pcCondition)
			return This.ManySectionsReplacedW(paSections, pcCondition)

	  #-----------------------------------------------------------------#
	 #    REPLACING MANY RANGES OF CHARS VERIFYING A GIVEN CONDITION   # 
	#-----------------------------------------------------------------#

	def ReplaceManyRangesW(paListOfRanges, pcNewSubStr, pcCondition)

		# Tranform ranges to sections and then use ReplaceManySectionsW()

		aSections = []
		for aRange in paListOfRanges
			n1 = aRange[1]
			n2 = aRange[1] + aRange[2] - 1

			aSections + [ n1, n2 ]
		next
		
		This.ReplaceManySectionsW(aSections, pcNewSubStr, pcCondition)

		def ReplaceManyRangesWQ(paListOfRanges, pcNewSubStr, pcCondition)
			This.ReplaceManyRangesW(paListOfRanges, pcNewSubStr, pcCondition)

		def ReplaceRangesW(paListOfRanges, pcNewSubStr, pcCondition)
			This.ReplaceManyRangesW(paListOfRanges, pcNewSubStr, pcCondition)

			def ReplaceRangesWQ(paListOfRanges, pcNewSubStr, pcCondition)
				This.ReplaceRangesW(paListOfRanges, pcNewSubStr, pcCondition)
				return This

	def ManyRangesReplacedW(paListOfRanges, pcNewSubStr, pcCondition)
		cResult = This.Copy().ReplaceManyRangesWQ(paListOfRanges, pcNewSubStr, pcCondition).Content()
		return cResult

		def RangedReplacedW(paListOfRanges, pcNewSubStr, pcCondition)
			return This.ManyRangesReplacedW(paListOfRanges, pcNewSubStr, pcCondition)

	  #----------------------------------------#
	 #    REMOVING NUMBERS FROM THE STRING    # 
	#----------------------------------------#

	def RemoveNumbers()
		cResult = ""
	
		aStzChars = This.ToListOfStzChars()

		for oChar in aStzChars
			if NOT oChar.IsANumber()
				cResult += oChar.Content()
			ok
		next
	
		This.Update( cResult )

	
		def RemoveNumbersQ()
			This.RemoveNumbers()
			return This

	  #----------------------------------------------------#
	 #     REMOVING THE NTH OCCURRENCE OF A SUBSTRING     #
	#----------------------------------------------------#

	def RemoveNthOccurrenceCS(n, pcSubStr, pCaseSensitive)
		This.ReplaceNthOccurrenceCS(n, pcSubStr, "", pCaseSensitive)

		#< @FunctionFluentForm
	
		def RemoveNthOccurrenceCSQ(n, pcSubStr, pCaseSensitive)
			This.RemoveNthOccurrenceCS(n, pcSubStr, pCaseSensitive)
			return This
		
		#>

		def RemoveNthCS(n, pcSubStr, pCaseSensitive)
			This.RemoveNthOccurrenceCS(n, pcSubStr, pCaseSensitive)

			def RemoveNthCSQ(n, pcSubStr, pCaseSensitive)
				This.RemoveNthCS(n, pcSubStr, pCaseSensitive)
				return This

	def RemoveNthOccurrence(n, pcSubStr)
		This.RemoveNthOccurrenceCS(n, pcSubStr, :Casesensitive = TRUE)

		#< @FunctionFluentForm

		def RemoveNthOccurrenceQ(n, pcSubStr)
			This.RemoveNthOccurrence(n, pcSubStr)
			return This
	
		#>

		def RemoveNth(n, pcSubStr)
			This.RemoveNthOccurrence(n, pcSubStr)

			def RemoveNthQ(n, pcSubStr)
				This.RemoveNth(n, pcSubStr)
				return This

	  #------------------------------------------------#
	 #    REMOVING FIRST OCCURRENCE OF A SUBSTRING    #
	#------------------------------------------------#

	def RemoveFirstOccurrenceCS(pcSubStr, pCaseSensitive)
		This.ReplaceNthOccurrenceCS(1, pcSubStr, "", pCaseSensitive)
	
		#< @FunctionFluentForm
	
		def RemoveFirstOccurrenceCSQ(pcSubStr, pCaseSensitive)
			This.RemoveFirstOccurrenceCS(pcSubStr, pCaseSensitive)
			return This
		
		#>

		def RemoveFirstCS(pcSubStr, pCaseSensitive)
			This.RemoveFirstOccurrenceCS(pcSubStr, pCaseSensitive)

			def RemoveFirstCSQ(pcSubStr, pCaseSensitive)
				This.RemoveFirstCS(pcSubStr, pCaseSensitive)
				return This

	def RemoveFirstOccurrence(pcSubStr)
		This.RemoveFirstOccurrenceCS(pcSubStr, :Casesensitive = TRUE)

		#< @FunctionFluentForm

		def RemoveFirstOccurrenceQ(pcSubStr, pcNewSubStr)
			This.RemoveFirstOccurrence(pcSubStr)
			return This
	
		#>

		def RemoveFirst(pcSubStr)
			This.RemoveFirstOccurrence(pcSubStr)

			def RemoveFirstQ(pcSubStr)
				This.RemoveFirst(pcSubStr)
				return This

	  #--------------------------------------------------#
	 #     REMOVING LAST OCCURRENCE OF A SUBSTRING      #
	#--------------------------------------------------#

	def RemoveLastOccurrenceCS(pcSubStr, pCaseSensitive)
		This.ReplaceNthOccurrenceCS(:Last, pcSubStr, "", pCaseSensitive)
	
		#< @FunctionFluentForm
	
		def RemoveLastOccurrenceCSQ(pcSubStr, pCaseSensitive)
			This.RemoveLastOccurrenceCS(pcSubStr, pCaseSensitive)
			return This
		
		#>

		def RemoveLastCS(pcSubStr, pCaseSensitive)
			This.RemoveLastOccurrenceCS(pcSubStr, pCaseSensitive)

			def RemoveLastCSQ(pcSubStr, pCaseSensitive)
				This.RemoveLastCS(pcSubStr, pCaseSensitive)
				return This

	def RemoveLastOccurrence(pcSubStr)
		This.RemoveLastOccurrenceCS(pcSubStr, :Casesensitive = TRUE)

		#< @FunctionFluentForm

		def RemoveLastOccurrenceQ(pcSubStr)
			This.RemoveLastOccurrence(pcSubStr)
			return This
	
		#>

		def RemoveLast(pcSubStr)
			This.RemoveLastOccurrence(pcSubStr)

			def RemoveLastQ(pcSubStr)
				This.RemoveLast(pcSubStr)
				return This

	   #----------------------------------------------------#
	  #    REMOVING NEXT NTH OCCURRENCE OF A SUBSTRING    # 
	 #    STARTING AT A GIVEN POSITION                    #
	#----------------------------------------------------#

	def RemoveNextNthOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)
		
		if isList(nStart) and StzListQ(nStart).IsStartingAtNamedParam()
			nStart = nStart[2]
		ok

		if isList(pcSubStr) and StzListQ(pcSubStr).IsOfNamedParam()
			pcSubStr = pcSubStr[2]
		ok

		if isList(pcNewSubStr) and StzListQ(pcNewSubStr).IsWithNamedParam()
			pcNewSubStr = pcNewSubStr[2]
		ok

		cPart1 = This.Section(1, nStart - 1)

		oPart2 = This.SectionQ(nStart, :LastChar)
		cPart2 = oPart2.RemoveNthOccurrenceCSQ(n, pcSubStr, pCaseSensitive).Content()

		cResult = cPart1 + cPart2
		This.Update( cResult )

		def RemoveNextNthOccurrenceCSQ(n, pcSubStr, nStart, pCaseSensitive)
			This.RemoveNextNthOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)
			return This

		def RemoveNthNextOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)
			This.RemoveNextNthOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)

			def RemoveNthNextOccurrenceCSQ(n, pcSubStr, nStart, pCaseSensitive)
				This.RemoveNthNextOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)
				return This

	def RemoveNextNthOccurrence(n, pcSubStr, nStart, pcNewSubStr)
		This.RemoveNextNthOccurrenceCS(n, pcSubStr, nStart, :CaseSensitive = TRUE)

		def RemoveNextNthOccurrenceQ(n, pcSubStr, nStart, pcNewSubStr)
			This.RemoveNextNthOccurrence(n, pcSubStr, nStart, pcNewSubStr)
			return This

		def RemoveNthNextOccurrence(n, pcSubStr, nStart, pcNewSubStr)
			This.RemoveNextNthOccurrence(n, pcSubStr, nStart, pcNewSubStr)

			def RemoveNthNextOccurrenceQ(n, pcSubStr, nStart, pcNewSubStr)
				return This.RemoveNthNextOccurrence(n, pcSubStr, nStart, pcNewSubStr)

	   #------------------------------------------------#
	  #    REMOVING NEXT OCCURRENCE OF A SUBSTRING    # 
	 #    STARTING AT A GIVEN POSITION                #
	#------------------------------------------------#

	def RemoveNextOccurrenceCS(pcSubStr, nStart, pCaseSensitive)
		This.RemoveNextNthOccurrenceCS(1, pcSubStr, nStart, pCaseSensitive)

		def RemoveNextOccurrenceCSQ(pcSubStr, nStart, pCaseSensitive)
			This.RemoveNextOccurrenceCS(pcSubStr, nStart, pCaseSensitive)
			return This

	def RemoveNextOccurrence(pcSubStr, nStart, pcNewSubStr)
		This.RemoveNextNthOccurrenceCS(1, pcSubStr, nStart, :CaseSensitive = TRUE)

		def RemoveNextOccurrenceQ(pcSubStr, nStart, pcNewSubStr)
			This.RemoveNextOccurrence(pcSubStr, nStart, pcNewSubStr)
			return This

	   #--------------------------------------------------------#
	  #    REMOVING PREVIOUS NTH OCCURRENCE OF A SUBSTRING    # 
	 #    STARTING AT A GIVEN POSITION                        #
	#--------------------------------------------------------#

	def RemovePreviousNthOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)
		
		if isList(nStart) and Q(nStart).IsStartingAtNamedParam()
			nStart = nStart[2]
		ok

		if isList(pcSubStr) and Q(pcSubStr).IsOfNamedParam()
			pcSubStr = pcSubStr[2]
		ok

		if isList(pcNewSubStr) and Q(pcNewSubStr).IsWithNamedParam()
			pcNewSubStr = pcNewSubStr[2]
		ok

		oPart1 = This.SectionQ(1, nStart - 1)
		n = oPart1.NumberOfOccurrenceCS(pcSubStr, pCaseSensitive) - n + 1
		cPart1 = oPart1.RemoveNthOccurrenceCSQ(n, pcSubStr, pCaseSensitive).Content()

		cPart2 = This.Section(nStart, :LastChar)

		cResult = cPart1 + cPart2
		This.Update( cResult )

		def RemovePreviousNthOccurrenceCSQ(n, pcSubStr, nStart, pCaseSensitive)
			This.RemovePreviousNthOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)
			return This

		def RemoveNthPreviousOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)
			This.RemovePreviousNthOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)

			def RemoveNthPreviousOccurrenceCSQ(n, pcSubStr, nStart, pCaseSensitive)
				This.RemoveNthPreviousOccurrenceCS(n, pcSubStr, nStart, pCaseSensitive)
				return This

	def RemovePreviousNthOccurrence(n, pcSubStr, nStart, pcNewSubStr)
		This.RemovePreviousNthOccurrenceCS(n, pcSubStr, nStart, :CaseSensitive = TRUE)

		def RemovePreviousNthOccurrenceQ(n, pcSubStr, nStart, pcNewSubStr)
			This.RemovePreviousNthOccurrence(n, pcSubStr, nStart, pcNewSubStr)
			return This

		def RemoveNthPreviousOccurrence(n, pcSubStr, nStart, pcNewSubStr)
			This.RemovePreviousNthOccurrence(n, pcSubStr, nStart, pcNewSubStr)

			def RemoveNthPreviousOccurrenceQ(n, pcSubStr, nStart, pcNewSubStr)
				This.RemoveNthPreviousOccurrence(n, pcSubStr, nStart, pcNewSubStr)
				return This

	   #----------------------------------------------------#
	  #    REMOVING PREVIOUS OCCURRENCE OF A SUBSTRING     # 
	 #    STARTING AT A GIVEN POSITION                    #
	#----------------------------------------------------#

	def RemovePreviousOccurrenceCS(pcSubStr, nStart, pCaseSensitive)
		This.RemovePreviousNthOccurrenceCS(1, pcSubStr, nStart, pCaseSensitive)

		def RemovePreviousOccurrenceCSQ(pcSubStr, nStart, pCaseSensitive)
			This.RemovePreviousOccurrenceCS(pcSubStr, nStart, pCaseSensitive)
			return This

	def RemovePreviousOccurrence(pcSubStr, nStart, pcNewSubStr)
		This.RemovePreviousNthOccurrenceCS(1, pcSubStr, nStart, :CaseSensitive = TRUE)

		def RemovePreviousOccurrenceQ(pcSubStr, nStart, pcNewSubStr)
			This.RemovePreviousOccurrence(pcSubStr, nStart, pcNewSubStr)
			return This

	  #-----------------------------------------------#
	 #    REMOVING LEFT OCCURRENCE OF A SUBSTRING    # 
	#-----------------------------------------------#

	def RemoveLeftOccurrenceCS(pcSubStr, pCaseSensitive)
		if This.IsLeftToRight()
			This.RemoveNthOccurrenceCS(1, pcSubStr, pCaseSensitive)

		else # This.IsRightToLeft()
			n = This.NumberOfOccurrenceCS(pcSubStr, pCaseSensitive)
			This.RemoveNthOccurrenceCS( n, pcSubStr, pCaseSensitive)
		ok

		def RemoveLeftOccurrenceCSQ(pcSubStr, pCaseSensitive)
			This.RemoveLeftOccurrenceCS(pcSubStr, pCaseSensitive)
			return This

	#---

	def RemoveLeftOccurrence(pcSubStr)
		This.RemoveLeftOccurrenceCS(pcSubStr, :CaseSensitive = FALSE)

		def RemoveLeftOccurrenceQ(pcSubStr)
			This.RemoveLeftOccurrence(pcSubStr)
			return This

	  #---------------------------------------------#
	 #    REMOVING RIGHT OCCURRENCE OF SUBSTRING   # 
	#---------------------------------------------#

	def RemoveRightOccurrenceCS(pcSubStr, pCaseSensitive)
		if This.IsRightToLeft()
			This.RemoveNthOccurrenceCS(1, pcSubStr, pCaseSensitive)

		else # This.IsLeftToRight()

			n = This.NumberOfOccurrenceCS(pcSubStr, pCaseSensitive)
			This.RemoveNthOccurrenceCS( n, pcSubStr, pCaseSensitive)
		ok

		def RemoveRightOccurrenceCSQ(pcSubStr, pCaseSensitive)
			This.RemoveRightOccurrenceCS(pcSubStr, pCaseSensitive)
			return This

	def RemoveRightOccurrence(pcSubStr)
		This.RemoveRightOccurrenceCS(pcSubStr, :CaseSensitive = TRUE)

		def RemoveRightOccurrenceQ(pcSubStr)
			This.RemoveRightOccurrence(pcSubStr)
			return This

	  #-------------------------------------#
	 #   REMOVING A SUBSTRING FROM LEFT    #
	#-------------------------------------#

	def RemoveFromLeftCS(pcSubStr, pCaseSensitive)
		nLenSubStr = StzStringQ(pcSubStr).NumberOfChars()

		if This.NLeftCharsQ(nLenSubStr).IsEqualToCS(pcSubStr, pCaseSensitive)

			if This.IsLeftToRight()
				n1 = 1
				n2 = nLenSubStr

			else
				nLenStr = This.NumberOfChars()
				n1 = nLenStr - nLenSubStr + 1
				n2 = nLenStr
			ok

			This.RemoveSection(n1, n2)
		ok

		def RemoveFromLeftCSQ(pcSubStr, pCaseSensitive)
			This.RemoveFromLeftCS(pcSubStr, pCaseSensitive)
			return This

		def RemovSubStringFromLeftCS(pcSubStr, pCaseSensitive)
			This.RemoveFromLeftCS(pcSubStr, pCaseSensitive)

			def RemovSubStringFromLeftCSQ(pcSubStr, pCaseSensitive)
				This.RemovSubStringFromLeftCS(pcSubStr, pCaseSensitive)
				return This

	def RemovedFromLeftCS(pcSubStr, pCaseSensitive)
		cResult = This.Copy().RemoveFromLeftCSQ(pcSubStr, pCaseSensitive)
		return cResult

		def SubStringRemovedFromLeftCS(pcSubStr, pCaseSensitive)
			return This.RemovedFromLeftCS(pcSubStr, pCaseSensitive)

	#-- WITHOUT CASESENSITIVITY

	def RemoveFromLeft(pcSubStr)
		This.RemoveFromLeftCS(pcSubStr, :CaseSensitive = TRUE)

		def RemoveFromLeftQ(pcSubStr)
			This.RemoveFromLeft(pcSubStr)
			return This

		def RemovSubStringFromLeft(pcSubStr)
			This.RemoveFromLeft(pcSubStr)

			def RemovSubStringFromLeftQ(pcSubStr)
				This.RemovSubStringFromLeft(pcSubStr)
				return This

	def RemovedFromLeft(pcSubStr)
		cResult = This.Copy().RemoveFromLeftQ(pcSubStr)
		return cResult

		def SubStringRemovedFromLeft(pcSubStr)
			return This.RemovedFromLeft(pcSubStr)

	  #-------------------------------------#
	 #   REMOVING A SUBSTRING FROM RIGHT   #
	#-------------------------------------#

	def RemoveFromRightCS(pcSubStr, pCaseSensitive)
		nLenSubStr = StzStringQ(pcSubStr).NumberOfChars()

		if This.NRightCharsQ(nLenSubStr).IsEqualToCS(pcSubStr, pCaseSensitive)

			if This.IsRightToLeft()
				n1 = 1
				n2 = nLenSubStr

			else
				nLenStr = This.NumberOfChars()
				n1 = nLenStr - nLenSubStr + 1
				n2 = nLenStr
			ok

			This.RemoveSection(n1, n2)
		ok
/*
		if This.BeginsWithCS(pcSubStr, pCaseSensitive)
			nLen = StzStringQ(pcSubStr).NumberOfChars()
			n1 = This.NumberOfChars() - nLen + 1
			n2 = This.NumberOfChars()
			This.RemoveSection(n1, n2)
		ok
*/
		def RemoveFromRightCSQ(pcSubStr, pCaseSensitive)
			This.RemoveFromRightCS(pcSubStr, pCaseSensitive)
			return This

		def RemoveRightCS(pcSubStr, pCaseSensitive)
			This.RemoveFromRightCS(pcSubStr, pCaseSensitive)

			def RemoveRightCSQ(pcSubStr, pCaseSensitive)
				This.RemoveRightCS(pcSubStr, pCaseSensitive)
				return This

		def RemovSubStringFromRightCS(pcSubStr, pCaseSensitive)
			This.RemoveFromRightCS(pcSubStr, pCaseSensitive)

			def RemovSubStringFromRightCSQ(pcSubStr, pCaseSensitive)
				This.RemovSubStringFromRightCS(pcSubStr, pCaseSensitive)
				return This

	def RemovedFromRightCS(pcSubStr, pCaseSensitive)
		cResult = This.Copy().RemoveFromRightCSQ(pcSubStr, pCaseSensitive)
		return cResult

		def SubStringRemovedFromRightCS(pcSubStr, pCaseSensitive)
			return This.RemovedFromRightCS(pcSubStr, pCaseSensitive)

	#---

	def RemoveFromRight(pcSubStr)
		This.RemoveFromRightCS(pcSubStr, :CaseSensitive = TRUE)

		def RemoveFromRightQ(pcSubStr)
			This.RemoveFromRight(pcSubStr)
			return This

		def RemoveRight(pcSubStr)
			This.RemoveFromRight(pcSubStr)

			def RemoveRightQ(pcSubStr)
				This.RemoveRight(pcSubStr)
				return This

		def RemovSubStringFromRight(pcSubStr)
			This.RemoveFromRight(pcSubStr)

			def RemovSubStringFromRightQ(pcSubStr)
				This.RemovSubStringFromRight(pcSubStr)
				return This

	def RemovedFromRight(pcSubStr)
		cResult = This.Copy().RemoveFromRightQ(pcSubStr)
		return cResult

		def SubStringRemovedFromRight(pcSubStr)
			return This.RemovedFromRight(pcSubStr)	

	  #-------------------------------------#
	 #   REMOVING A SUBSTRING FROM START   #
	#-------------------------------------#

	def RemoveFromStartCS(pcSubStr, pCaseSensitive)
		if This.IsLeftToRight()
			This.RemoveFromLeftCS(pcSubStr, pCaseSensitive)
		else
			This.RemoveFromRightCS(pcSubStr, pCaseSensitive)
		ok

		def RemoveFromStartCSQ(pcSubStr, pCaseSensitive)
			This.RemoveFromStartCS(pcSubStr, pCaseSensitive)
			return This

		def RemovSubStringFromStartCS(pcSubStr, pCaseSensitive)
			This.RemoveFromStartCS(pcSubStr, pCaseSensitive)

			def RemovSubStringFromStartCSQ(pcSubStr, pCaseSensitive)
				This.RemovSubStringFromStartCS(pcSubStr, pCaseSensitive)
				return This

	def RemovedFromStartCS(pcSubStr, pCaseSensitive)
		cResult = This.Copy().RemoveFromStartCSQ(pcSubStr, pCaseSensitive)
		return cResult

		def SubStringRemovedFromStartCS(pcSubStr, pCaseSensitive)
			return This.RemovedFromStartCS(pcSubStr, pCaseSensitive)

	#---

	def RemoveFromStart(pcSubStr)
		This.RemoveFromStartCS(pcSubStr, :CaseSensitive = TRUE)

		def RemoveFromStartQ(pcSubStr)
			This.RemoveFromStart(pcSubStr)
			return This

		def RemovSubStringFromStart(pcSubStr)
			This.RemoveFromStart(pcSubStr)

			def RemovSubStringFromStartQ(pcSubStr)
				This.RemovSubStringFromStart(pcSubStr)
				return This

	def RemovedFromStart(pcSubStr)
		cResult = This.Copy().RemoveFromStartQ(pcSubStr)
		return cResult

		def SubStringRemovedFromStart(pcSubStr)
			return This.RemovedFromStart(pcSubStr)

	  #-----------------------------------#
	 #   REMOVING A SUBSTRING FROM END   #
	#-----------------------------------#

	def RemoveFromEndCS(pcSubStr, pCaseSensitive)
		if This.IsLeftToRight()
			This.RemoveFromRightCS(pcSubStr, pCaseSensitive)
		else
			This.RemoveFromLeftCS(pcSubStr, pCaseSensitive)
		ok

		def RemoveFromEndCSQ(pcSubStr, pCaseSensitive)
			This.RemoveFromEndCS(pcSubStr, pCaseSensitive)
			return This

		def RemovSubStringFromEndCS(pcSubStr, pCaseSensitive)
			This.RemoveFromEndCS(pcSubStr, pCaseSensitive)

			def RemovSubStringFromEndCSQ(pcSubStr, pCaseSensitive)
				This.RemovSubStringFromEndCS(pcSubStr, pCaseSensitive)
				return This

	def RemovedFromEndCS(pcSubStr, pCaseSensitive)
		cResult = This.Copy().RemoveFromEndCSQ(pcSubStr, pCaseSensitive)
		return cResult

		def SubStringRemovedFromEndCS(pcSubStr, pCaseSensitive)
			return This.RemovedFromEndCS(pcSubStr, pCaseSensitive)

	#---

	def RemoveFromEnd(pcSubStr)
		This.RemoveFromEndCS(pcSubStr, :CaseSensitive = TRUE)

		def RemoveFromEndQ(pcSubStr)
			This.RemoveFromEnd(pcSubStr)
			return This

		def RemovSubStringFromEnd(pcSubStr)
			This.RemoveFromEnd(pcSubStr)

			def RemovSubStringFromEndQ(pcSubStr)
				This.RemovSubStringFromEnd(pcSubStr)
				return This

	def RemovedFromEnd(pcSubStr)
		cResult = This.Copy().RemoveFromEndQ(pcSubStr)
		return cResult

		def SubStringRemovedFromEnd(pcSubStr)
			return This.RemovedFromEnd(pcSubStr)

	  #--------------------------------------------------------#
	 #    REMOVING CHARS FROM LEFT UNDER A GIVEN CONDITION    # 
	#--------------------------------------------------------#

	def RemoveCharsFromLeftW(pcCondition)
		if isList(pcCondition) and StzListQ(pcCondition).IsWhereNamedParam()
			pcCondition = pcCondition[2]
		ok

		if NOT isString(pcCondition)
			stzRaise("Incorrect param type! Condition should be in a string.")
		ok

		pcCondition = StzCCodeQ(pcCondition).UnifiedFor(:stzString)

		cCode = "bOk = ( " + pcCondition + " )"
		oCode = new stzString(cCode)

		cSubStrToRemove = ""

		for @i = 1 to This.NumberOfChars()
			@char = This[i]
			bEval = TRUE

			if @i = This.NumberOfChars() and
			   oCode.Copy().RemoveSpacesQ().ContainsCS( "This[@i+1]", :CS = FALSE )

				bEval = FALSE
			ok

			if @i = 1 and
			   oCode.Copy().RemoveSpacesQ().ContainsCS( "This[@i-1]", :CS = FALSE )

				bEval = FALSE
			ok
			
			if bEval
				eval(cCode)
				if bOk
					cSubStrToRemove += @charName
				ok
			ok
		next

		This.RemoveSubStringFromLeft(cSubStrToRemove)

		def RemoveCharsFromLeftWWQ(pcCondition)
			This.RemoveCharsFromLeftW(pcCondition)
			return This

		def RemoveFromLeftW(pcCondition)
			This.RemoveCharsFromLeftW(pcCondition)

			def RemoveFromLeftWQ(pcCondition)
				This.RemoveFromLeftW(pcCondition)
				return This

		def RemoveLeftW(pcCondition)
			This.RemoveFromLeftW(pcCondition)

			def RemoveLeftWQ(pcCondition)
				This.RemoveLeftW(pcCondition)
				return This

	def CharsRemovedFromLeft(pcCondition)
		cResult = This.Copy().RemoveCharsFromLeftWQ(pcCondition).Content()
		return cResult

	  #---------------------------------------------------------#
	 #    REMOVING CHARS FROM RIGHT UNDER A GIVEN CONDITION    # 
	#---------------------------------------------------------#

	def RemoveCharsFromRightW(pcCondition)
		if isList(pcCondition) and StzListQ(pcCondition).IsWhereNamedParam()
			pcCondition = pcCondition[2]
		ok

		if NOT isString(pcCondition)
			stzRaise("Incorrect param type! Condition should be in a string.")
		ok

		pcCondition = StzCCodeQ(pcCondition).UnifiedFor(:stzString)

		cCode = "bOk = ( " + pcCondition + " )"
		oCode = new stzString(cCode)

		cSubStrToRemove = ""

		for @i = 1 to This.NumberOfChars()
			@char = This[i]
			bEval = TRUE

			if @i = This.NumberOfChars() and
			   oCode.Copy().RemoveSpacesQ().ContainsCS( "This[@i+1]", :CS = FALSE )

				bEval = FALSE
			ok

			if @i = 1 and
			   oCode.Copy().RemoveSpacesQ().ContainsCS( "This[@i-1]", :CS = FALSE )

				bEval = FALSE
			ok
			
			if bEval
				eval(cCode)
				if bOk
					cSubStrToRemove += @charName
				ok
			ok
		next

		This.RemoveSubStringFromRight(cSubStrToRemove)

		def RemoveCharsFromRightWWQ(pcCondition)
			This.RemoveCharsFromRightW(pcCondition)
			return This

		def RemoveFromRightW(pcCondition)
			This.RemoveCharsFromRightW(pcCondition)

			def RemoveFromRightWQ(pcCondition)
				This.RemoveFromRightW(pcCondition)
				return This

		def RemoveRightW(pcCondition)
			This.RemoveFromRightW(pcCondition)

			def RemoveRightWQ(pcCondition)
				This.RemoveRightW(pcCondition)
				return This

	def CharsRemovedFromRight(pcCondition)
		cResult = This.Copy().RemoveCharsFromRightWQ(pcCondition).Content()
		return cResult

	  #---------------------------------------------------------#
	 #    REMOVING CHARS FROM START UNDER A GIVEN CONDITION    # 
	#---------------------------------------------------------#

	def RemoveCharsFromStartW(pcCondition)
		if This.IsLeftToRight()
			This.RemoveCharsFromLeftW(pcCondition)

		else
			This.RemoveCharsFromRightW(pcCondition)
		ok


		def RemoveCharsFromStartWWQ(pcCondition)
			This.RemoveCharsFromStartW(pcCondition)
			return This

		def RemoveFromStartW(pcCondition)
			This.RemoveCharsFromStartW(pcCondition)

			def RemoveFromStartWQ(pcCondition)
				This.RemoveFromStartW(pcCondition)
				return This

		def RemoveStartW(pcCondition)
			This.RemoveFromStartW(pcCondition)

			def RemoveStartWQ(pcCondition)
				This.RemoveStartW(pcCondition)
				return This

	def CharsRemovedFromStart(pcCondition)
		cResult = This.Copy().RemoveCharsFromStartWQ(pcCondition).Content()
		return cResult

	  #---------------------------------------------------------#
	 #    REMOVING CHARS FROM END UNDER A GIVEN CONDITION    # 
	#---------------------------------------------------------#

	def RemoveCharsFromEndW(pcCondition)
		if This.IsLeftToRight()
			This.RemoveCharsFromRighttW(pcCondition)

		else
			This.RemoveCharsFromLeftW(pcCondition)
		ok

		def RemoveCharsFromEndWWQ(pcCondition)
			This.RemoveCharsFromEndW(pcCondition)
			return This

		def RemoveFromEndW(pcCondition)
			This.RemoveCharsFromEndW(pcCondition)

			def RemoveFromEndWQ(pcCondition)
				This.RemoveFromEndW(pcCondition)
				return This

		def RemoveEndW(pcCondition)
			This.RemoveFromEndW(pcCondition)

			def RemoveEndWQ(pcCondition)
				This.RemoveEndW(pcCondition)
				return This

	def CharsRemovedFromEnd(pcCondition)
		cResult = This.Copy().RemoveCharsFromEndWQ(pcCondition).Content()
		return cResult

	  #----------------------------------#
	 #    TRIMMING & REMOVING SPACES    # 
	#----------------------------------#

	def Trim()
		This.Update( This.QStringObject().trimmed() )

		def TrimQ()
			This.Trim()
			return This

	def Trimmed()
		cResult = This.Copy().TrimQ().Content()
		return cResult

		def WithoutLeadingAndTrailingSpaces()
			return This.Trimmed()

	def TrimStart()
		if This.HasRepeatedLeadingChars()	
			This.RemoveThisRepeatedLeadingChar(" ")
		ok

		if This.FirstChar() = " "
			This.RemoveFirst(" ")
		ok

		def TrimStartQ()
			This.TrimStart()
			return This

		def RemoveLeadingSpaces()
			This.TrimStart()

			def RemoveLeadingSpacesQ()
				This.RemoveLeadingSpaces()
				return This

	def TrimmedFromStart()
		cResult = This.Copy().TrimStartQ().Content()
		return cResult

		def LeadingSpacesRemoved()
			return This.TrimmedFromStart()

		def WithoutLeadingSpaces()
			return This.TrimmedFromStart()

	def TrimEnd()

		This.RemoveThisRepeatedTrailingChar(" ")

		if This.LastChar() = " "
			This.RemoveLast(" ")
		ok

		def TrimEndQ()
			This.TrimEnd()
			return This

		def RemoveTrailingSpaces()
			This.TrimEnd()

			def RemoveTrailingSpacesQ()
				This.RemoveTrailingSpaces()
				return This
	
	def TrimmedFromEnd()
		cResult = This.Copy().TrimEndQ().Content()
		return cResult

		def TrailingSpacesRemoved()
			return This.TrimmedFromEnd()

		def WithoutTrailingSpaces()
			return This.TrimmedFromEnd()

	def TrimLeft()
		if This.IsLeftToRight()
			This.TrimStart()

		else # IsRightToLeft
			This.TrimEnd()
		ok

		def TrimLeftQ()
			This.TrimLeft()
			return This

		def RemoveLeftSpaces()
			This.TrimeLeft()

			def RemoveLeftSpacesQ()
				This.RemoveLeftSpaces()
				return This

	def TrimmedFromLeft()
		cResult = This.Copy().TrimLeftQ().Content()
		return cResult

		def LeftSpacesRemoved()
			return This.TrimmedFromLeft()

		def WithoutLeftSpaces()
			return This.TrimmedFromLeft()

	def TrimRight()
		if This.IsRightToLeft()
			This.TrimStart()

		else # IsLeftToRight
			This.TrimEnd()
		ok

		def TrimRightQ()
			This.TrimRight()
			return This

		def RemoveRightSpaces()
			This.TrimRight()

			def RemoveRightSpacesQ()
				This.RemoveRightSpaces()
				return This

	def TrimmedFromRight()
		cResult = This.Copy().TrimRightQ().Content()
		return cResult

		def RightSpacesRemoved()
			return This.TrimmedFromRight()

		def WithoutRightSpaces()
			return This.TrimmedFromRight()

	def RemoveSpaces()
		This.RemoveAll(" ")

		def RemoveSpacesQ()
			This.RemoveSpaces()
			return This

		def RemoveAllSpaces()
			This.RemoveSpaces()

			def RemoveAllspacesQ()
				This.RemoveSpaces()
				return This

	def SpacesRemoved()
		cResult = This.Copy().RemoveSpacesQ().Content()
		return cResult

		def WithoutSpaces()
			return This.SpacesRemoved()

	  #----------------------------------------------------------#
	 #   SIMPLIFYING THE STRING BY REMOVING DUPLICATED SPACES   #
	#----------------------------------------------------------#

	def Simplify()

		# t0 = clock() // Veryf fast, takes almost 0.01s

		This.Update( @oQString.simplified() )

		# ? ( clock() - t0 ) / clockspersecond()

		def SimplifyQ()
			This.Simplify()
			return This

	def Simplified()
		cResult = This.Copy().SimplifyQ().Content()
		return cResult

	  #-------------------------------------------------#
	 #   SIMPLIFYING THE STRING EXCEPT SOME SECTIONS   #
	#-------------------------------------------------#

	def SimplifyExcept(paSections)
		/* EXAMPLE

		o1 = new stzString(' this code:   txt1  = "    withspaces    "   and txt2="nospaces"  ')
		o1.SimplifyExcept( [ [], [] ] )

		#--> 'var txt = "    nice    "'

		*/

		acBetweenXT = This.

	  #----------------------------------------#
	 #   SPACIFYING THE CHARS OF THE STRING   #
	#----------------------------------------#

	def SpacifyNTimes(n)
		This.SpacifyCharsNTimes(n)

	def SpacifyCharsNTimes(n)
		This.SpacifyCharsNTimesUsing(n, " ")

	def SpacifyChars()
		/* EXAMPLE

		? StzStringQ("RINGORIALAND").Spacified()
		#--> R I N G O R I A L A N D

		*/

		This.NSpacifyChars(1)

		def SpacifyCharsQ()
			This.SpacifyChars()
			return This

		def Spacify()
			This.SpacifyChars()

			def SpacifyQ()
				This.Spacify()
				return This

	def CharsSpacified()
		cResult = This.Copy().SpacifyCharsQ().Content()
		return cResult

		def Spacified()
			return This.CharsSpacified()

	def NSpacifyChars(n)
		This.Simplify()

		cInterSpaces = ( Q(" ") * n ).Content()
		This.InsertAfterW('@i = @PreviousPosition + 1', cInterSpaces)
		

		def NSpacifyCharsQ(n)
			This.NSpacifyChars(n)
			return This

	def CharsSpacifiedN(n)
		return This.Copy().NSpacifyCharsQ(n).Content()

	  #----------------------------------------------------------------#
	 #   SPACIFYING THE CHARS OF THE STRING USING A GIVEN SEPARATOR   #
	#----------------------------------------------------------------#

	def SpacifyCharsUsing(pcSep)
		/* EXAMPLE

		? StzStringQ("RINGORIALAND").SpacifiedUsing("_")
		#--> R_I_N_G_O_R_I_A_L_A_N_D

		*/

		This.RemoveSpacesQ().InsertAfterWQ('@char', pcSep).RemoveFromEnd(pcSep)

		def SpacifyCharsUsingQ(pcSep)
			This.SpacifyCharsUsing(pcSep)
			return This

		def SpacifyUsing(pcSep)
			This.SpacifyCharsUsing(pcSep)

			def SpacifyUsingQ(pcSep)
				This.SpacifyUsing(pcSep)
				return This

	def CharsSpacifiedUsing(pcSep)
		cResult = This.Copy().SpacifyCharsUsingQ(pcSep).Content()
		return cResult

		def SpacifiedUsing(pcSep)
			return This.CharsSpacifiedUsing(pcSep)

	  #----------------------------------------------------#
	 #   SPACIFYING A GIVEN SUBSTRING INSIDE THE STRING   #
	#----------------------------------------------------#
	
	def SpacifySubstringCS(pcSubStr, pCaseSensitive)
		anSections = This.FindSectionsCSQ(pcSubStr, pCaseSensitive).Reversed()
	
		for aSection in anSections
			n1 = aSection[1]
			n2 = aSection[2]

			if n2 < This.NumberOfChars() and
			   This.CharAt(n2 + 1) != " "

				This.InsertAfter(n2, " ")
			ok

			if n1 > 1 and This.CharAt(n1 - 1) != " "
				This.InsertBefore(n1, " ")
			ok
		next

		def SpacifySubStringCSQ(pcSubStr, pCaseSensitive)
			This.SpacifySubStringCS(pcSubStr, pCaseSensitive)
			return This

		def SpacifyThisSubStringCS(pcSubStr, pCaseSensitive)
			This.SpacifySubstringCS(pcSubStr, pCaseSensitive)

			def SpacifyThisSubStringCSQ(pcSubStr, pCaseSensitive)
				This.SpacifyThisSubStringCS(pcSubStr, pCaseSensitive)
				return This

	def SubStringSpacifiedCS(pcSubStr, pCaseSensitive)
		return This.Copy().SpacifyThisSubStringCSQ(pcSubStr, pCaseSensitive).Content()

		def ThisSubStringSpacifiedCS(pcSubStr, pCaseSensitive)
			return This.SubStringSpacifiedCS(pcSubStr, pCaseSensitive)

	#-- CASE-SENSITIVE

	def SpacifySubstring(pcSubStr)
		This.SpacifySubstringCS(pcSubStr, :CaseSensitive = TRUE)

		def SpacifySubstringQ(pcSubStr)
			This.SpacifySubstring(pcSubStr)
			return This

		def SpacifyThisSubString(pcSubStr)
			This.SpacifySubstring(pcSubStr)

			def SpacifyThisSubStringQ(pcSubStr)
				This.SpacifyThisSubString(pcSubStr)
				return This

	def SubStringSpacified(pcSubStr)
		return This.Copy().SpacifyThisSubStringQ(pcSubStr).Content()

		def ThisSubStringSpacified(pcSubStr)
			return This.SubStringSpacified(pcSubStr)

	  #----------------------------------------------#
	 #   SPACIFYING SOME SUBSTRINGS IN THE STRING   #
	#----------------------------------------------#

	def SpacifySubStringsCS(pacSubStr, pCaseSensitive)
		if NOT ( isList(pacSubStr) and Q(pacSubStr).isListOfStrings() )
			stzRaise("Incorrect param! pacSubStr must be a list of strings.")
		ok

		for cSubStr in pacSubStr
			This.SpacifySubStringCS(cSubStr, pCaseSensitive)
		next

		def SpacifySubStringsCSQ(pacSubStr, pCaseSensitive)
			This.SpacifySubStringsCS(pacSubStr, pCaseSensitive)
			return This

		def SpacifyTheseSubStringsCS(pacSubStr, pCaseSensitive)
			This.SpacifySubStringsCS(pacSubStr, pCaseSensitive)

			def SpacifyTheseSubStringsCSQ(pacSubStr, pCaseSensitive)
				This.SpacifyTheseSubStringsCS(pacSubStr, pCaseSensitive)
				return This

	def SubStringsSpacifiedCS(pacSubStr, pCaseSensitive)
		return This.Copy().SpacifySubStringsCSQ(pacSubStr, pCaseSensitive).Content()

		def TheseSubStringsSpacifiedCS(pacSubStr, pCaseSensitive)
			return This.SubStringsSpacified(pacSubStr, pCaseSensitive)

	#---

	def SpacifySubStrings(pacSubStr)
		This.SpacifySubStringsCS(pacSubStr, :CaseSensitive = TRUE)

		def SpacifySubStringsQ(pacSubStr)
			This.SpacifySubStrings(pacSubStr)
			return This

		def SpacifyTheseSubStrings(pacSubStr)
			This.SpacifySubStrings(pacSubStr)

			def SpacifyTheseSubStringsQ(pacSubStr)
				This.SpacifyTheseSubStrings(pacSubStr)
				return This

	def SubStringsSpacified(pacSubStr)
		return This.Copy().SpacifySubStringsQ(pacSubStr).Content()

		def TheseSubStringsSpacified(pacSubStr)
			return This.SubStringsSpacified(pacSubStr)

	  #----------------------------------------------------------------------#
	 #   SPACIFYING SOME SUBSTRINGS IN THE STRING USING A GIVEN SEPARATOR   #
	#----------------------------------------------------------------------#

	def SpacifySubStringsUsingCS(pacSubStr, pcSep, pCaseSensitive)
		if NOT ( isList(pacSubStr) and Q(pacSubStr).isListOfStrings() )
			stzRaise("Incorrect param! pacSubStr must be a list of strings.")
		ok

		for cSubStr in pacSubStr
			This.SpacifySubStringCS(cSubStr, pCaseSensitive)
		next

		This.ReplaceAll(" ", pcSep)

		def SpacifySubStringsUsingCSQ(pacSubStr, pcSep, pCaseSensitive)
			This.SpacifySubStringsUsingCS(pacSubStr, pcSep, pCaseSensitive)
			return This

		def SpacifyTheseSubStringsUsingCS(pacSubStr, pcSep, pCaseSensitive)
			This.SpacifySubStringsUsingCS(pacSubStr, pcSep, pCaseSensitive)

			def SpacifyTheseSubStringsUsingCSQ(pacSubStr, pcSep, pCaseSensitive)
				This.SpacifyTheseSubStringsUsingCS(pacSubStr, pcSep, pCaseSensitive)
				return This

	def SubStringsSpacifiedUsingCS(pacSubStr, pcSep, pCaseSensitive)
		return This.Copy().SpacifySubStringsUsingCSQ(pacSubStr, pcSep, pCaseSensitive).Content()

		def TheseSubStringsSpacifiedUsingCS(pacSubStr, pcSep, pCaseSensitive)
			return This.SubStringsSpacifiedUsing(pacSubStr, pcSep, pCaseSensitive)

	#---

	def SpacifySubStringsUsing(pacSubStr, pcSep)
		This.SpacifySubStringsUsingCS(pacSubStr, pcSep, :CaseSensitive = TRUE)

		def SpacifySubStringsUsingQ(pacSubStr, pcSep)
			This.SpacifySubStringsUsing(pacSubStr, pcSep)
			return This

		def SpacifyTheseSubStringsUsing(pacSubStr, pcSep)
			This.SpacifySubStringsUsing(pacSubStr, pcSep)

			def SpacifyTheseSubStringsUsingQ(pacSubStr, pcSep)
				This.SpacifyTheseSubStringsUsing(pacSubStr, pcSep)
				return This

	def SubStringsSpacifiedUsing(pacSubStr, pcSep)
		return This.Copy().SpacifySubStringsUsingQ(pacSubStr, pcSep).Content()

		def TheseSubStringsSpacifiedUsing(pacSubStr, pcSep)
			return This.SubStringsSpacifiedUsing(pacSubStr, pcSep)

	  #------------------------------------------------#
	 #    GETTING POSITION AFTER A GIVEN SUBSTRING    #
	#------------------------------------------------#

	def PositionAfterCS(cSubStr, pCaseSensitive)
		return This.PositionAfterNthOccurrenceCS(1, cSubStr, pCaseSensitive)

	def PositionAfterNthOccurrenceCS(n, cSubStr, pCaseSensitive)
		n = This.FindNthOccurrenceCS(n, cSubStr, pCaseSensitive)
		oStr = new stzString(cSubStr)
		return n + oStr.NumberOfChars()

	def PositionAfter(cSubStr)
		return This.PositionAfterCS(cSubStr, :CaseSensitive = TRUE)

	def PositionAfterNthOccurrence(n, cSubStr)
		return This.PositionAfterNthOccurrenceCS(n, cSubStr, :CaseSensitive = TRUE)

	  #--------------------------------------------------#
	 #    GETTING POSITION BEFORE A GIVEN SUBSTRING     #
	#--------------------------------------------------#

	def PositionBeforeCS(cSubStr, pCaseSensitive)
		return This.PositionBeforeNthOccurrenceCS(1, cSubStr, pCaseSensitive)

	def PositionBeforeNthOccurrenceCS(n, cSubStr, pCaseSensitive)
		return This.FindNthOccurrenceCS(cSubStr, pCaseSensitive)
	
	def PositionBefore(cSubStr)
		return This.PositionBeforeCS(cSubStr, :CaseSensitve = FALSE)

	def PositionBeforeNthOccurrence(n, cSubStr)
		return This.PositionBeforeNthOccurrenceCS(n, cSubStr, pCaseSensitive)

	  #------------------------------#
	 #   FINDING THE CENTRAL CHAR   #
	#------------------------------#
	
	// Returns the position (if any) of the central Char in the string
	def FindCentralChar()
		nResult = 0

		oNumberOfChars = new stzNumber(This.NumberOfChars())
		if oNumberOfChars.IsOdd()
			nResult = ( This.NumberOfChars() + 1 ) / 2
		ok

		return nResult

		#< @FunctionAlternativeForms

		def FindMiddleChar()
			return This.FindCentralChar()

		def PositionOfCentralChar()
			return This.FindCentralChar()

		def CentralCharposition()
			return This.FindCentralChar()

		def PositionOfMiddleChar()
			return This.FindCentralChar()

		def MiddleCharposition()
			return This.FindCentralChar()


		#>

	  #------------------------------#
	 #   GETTING THE CENTRAL CHAR   #
	#------------------------------#

	def CentralChar()
		if This.CentralCharPosition() != NULL
			return This.NthChar( This.CentralCharPosition() )
		ok

		def CentralCharQ()
			return This.CentralCharQR(:stzChar)
	
		def CentralCharQR(pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzChar
				return new stzChar( This.CentralChar() )
			on :stzString
				return new stzString( This.CentralChar() )
			on :stzListOfBytes
				return new stzListOfBytes( This.CentralChar() )
			off

		def MiddleChar()
			return This.CentralChar()

	  #-----------------------------------------------#
	 #   DOES THE STRING CONTAIN ANY CENTRAL CHAR?   #
	#-----------------------------------------------#

	def ContainsCentralChar()
		return This.NumberOfCharsQ().IsNotEven()

		def ContainsMiddleChar()
			return This.ContainsCentralChar()

		def HasCentralChar()
			return This.ContainsCentralChar()

		def HasMiddleChar()
			return This.ContainsCentralChar()

	  #---------------------------------------------------#
	 #   DOES THE STRING CONTAIN A GIVEN CENTRAL CHAR?   #
	#---------------------------------------------------#

	def ContainsThisCharInTheCenter(c)
		return This.CentralChar() = c

		def ContainsThisCharInTheMiddle(c)
			return This.ContainsThisCharInTheCenter()

		def HasThisCharInTheCenter(c)
			return This.ContainsThisCharInTheCenter(c)

		def HasThisCharInTheMiddle(c)
			return This.ContainsThisCharInTheMiddle(c)

	  #----------------------------------------------------#
	 #    DOES THE STRING CONTAIN ANY MIDDLE SUBSTRING?    #
	#----------------------------------------------------#

	def ContainsMiddleSubstring()
		if This.NumberOfCharsQ().IsOdd()
			return TRUE

		else
			return FALSE
		ok

		def HasMiddleSubstring()
			return This.ContainsMiddleSubstring()

		def ContainsCentralSubString()
			return This.ContainsMiddleSubstring()

		def HasCentralSubString()
			return This.ContainsMiddleSubstring()

	  #---------------------------------------------------------#
	 #    DOES THE STRING CONTAIN A GIVEN MIDDLE SUBSTRING?    #
	#---------------------------------------------------------#

	def HasThisSubstringInTheMiddle(pcSubStr)
		if IsStzString(pcSubStr)
			pcSubStr = pcSubStr.Content()
		ok

		if This.MiddleSubstring() = pcSubStr
			return TRUE
		else
			return FALSE
		ok

		def ContainsThisSubstringInTheMiddle(c)
			return This.HasThisSubstringInTheMiddle(c)

		def HasThisSubstringInTheCenter(pcSubStr)
			return This.HasThisSubstringInTheMiddle(c)

		def ContainsThisSubstringInTheCenter(c)
			return This.HasThisSubstringInTheMiddle(c)

	  #---------------------------------------------------#
	 #    GETTING THE MIDDLE SUBSTRING UP TO N CHARS     #
	#---------------------------------------------------#

	def MiddleSubstringWithNChars(n)
		if NOT isNumber(n)
			stzRaise("Incorrect param type! n must be a number.")
		ok

		nNumberOfChars = This.NumberOfChars()

		if NOT n <= nNumberOfChars
			stzRaise("Out of range!")
		ok

		cResult = ""

		nNumberOfCharsWithoutmiddle = nNumberOfChars - n
		if StzNumberQ( nNumberOfCharsWithoutmiddle ).IsEven()

			nNumberOfCharsOfOnePart = nNumberOfCharsWithoutmiddle / 2
			n1 = nNumberOfCharsOfOnePart + 1
			n2 = nNumberOfChars - nNumberOfCharsOfOnePart

			cResult = This.Section( n1, n2 )
		ok

		return cResult

		#< @FunctionALternativeForms

		def CentralSubstringWithNChars(n)
			return This.MiddleSubstringWithNChars(n)

		def MiddleSubstringUpToNChars(n)
			return This.MiddleSubstringWithNChars(n)

		def MiddleSubstringN(n)
			return This.MiddleSubstringWithNChars(n)

		def CentralSubstringUpToNChars(n)
			return This.MiddleSubstringWithNChars(n)

		def CentralSubstringN(n)
			return This.MiddleSubstringWithNChars(n)


		#>

	  #---------------------------------------------------#
	 #    FINDING THE MIDDLE SUBSTRING UP TO N CHARS     #
	#---------------------------------------------------#

	def FindMiddleSubstringWithNChars(n)
		if NOT isNumber(n)
			stzRaise("Incorrect param type! n must be a number.")
		ok

		nNumberOfChars = This.NumberOfChars()

		if NOT n <= nNumberOfChars
			stzRaise("Out of range!")
		ok

		nResult = 0

		nNumberOfCharsWithoutmiddle = nNumberOfChars - n
		if StzNumberQ( nNumberOfCharsWithoutmiddle ).IsEven()

			nNumberOfCharsOfOnePart = nNumberOfCharsWithoutmiddle / 2
			nResult = nNumberOfCharsOfOnePart + 1
		ok

		return nResult

		#< @FunctionALternativeForms

		def FindCentralSubstringWithNChars(n)
			return This.FindMiddleSubstringWithNChars(n)

		def FindMiddleSubstringUpToNChars(n)
			return This.FindMiddleSubstringWithNChars(n)

		def FindMiddleSubstringN(n)
			return This.FindMiddleSubstringWithNChars(n)

		def FindCentralSubstringUpToNChars(n)
			return This.FindMiddleSubstringWithNChars(n)

		def FindCentralSubstringN(n)
			return This.FindMiddleSubstringWithNChars(n)

		#--

		def PositionOfMiddleSubstringWithNChars(n)
			return This.FindMiddleSubstringWithNChars(n)

		def PositionOfCentralSubstringWithNChars(n)
			return This.FindMiddleSubstringWithNChars(n)

		def PositionOfMiddleSubstringUpToNChars(n)
			return This.FindMiddleSubstringWithNChars(n)

		def PositionOfMiddleSubstringN(n)
			return This.FindMiddleSubstringWithNChars(n)

		def PositionOfCentralSubstringUpToNChars(n)
			return This.FindMiddleSubstringWithNChars(n)

		def PositionOfCentralSubstringN(n)
			return This.FindMiddleSubstringWithNChars(n)

		#>

	  #--------------------------------#
	 #   GETTING STRING ORIENTATION   #
	#--------------------------------#

	/*
	Note that we distinguish between string 'orientation', 
	char 'orientation', and char 'unicode direction'.

	The first says if a string is left-to-right or right-to-left oriented, and
	uses the Orientation() method, here, in stzString.

	The second says the same thing for the individual chars, and uses
	the Orientation() method on stzChar.

	While the third informs us about the technical direction of the char,
	in terms of UNICODE standard, and is returned using UnicodeDirection()
	method on stzChar.
	*/

	// Returns the orientation of the string (:RightToLeft OR :LeftToRight)
	def Orientation()
		if This.IsRightToLeft()
			return :RightToLeft
		else
			return :LeftToRight
		ok

	// Verifies if the string is right-to-left (like arabic) : SEE Orientation()
	def IsRightToleft()
		bResult = @oQString.isRightToleft()

		return bResult

	// Verifies if the string is left-to-right (like english)
	def IsLeftToRight()
		IF NOT This.IsRightToLeft()
			return TRUE
		else
			return FALSE

		ok

	// Checks if the text is hybrid (containing :RightToLeft AND :LeftToRight" texts)
	def ContainsHybridOrientation()
		aStzChars = This.ToListOfStzChars()

		bIsHybrid = FALSE
		cFlag = aStzChars[1].Orientation()

		for i=2 to len(aStzChars)
			if aStzChars[i].Orientation() != cFlag
				bIsHybrid = TRUE
				exit
			ok
		next

		return bIsHybrid

	// Transforms the string to a list of chars with indication of their orientation
	def CharsWithOrientation()
		aResult = []

		for i = 1 to This.NumberOfChars()
			oTempChar = new stzChar(This[i])
			aResult + [ This[i] , oTempChar.Orientation() ]
		next

		return aResult

	def CharsWithOrientationQ()
		return new stzList( This.CharsWithOrientation() )

	// Transforms the string to a list of letters with indication of their orientation
	def LettersWithOrientation()
		aResult = []

		for i = 1 to This.NumberOfChars()
			oTempChar = new stzChar(This[i])
			if oTempChar.isLetter()
				aResult + [ This[i] , oTempChar.Orientation() ]
			ok
		next

		return aResult

	def LettersWithOrientationQ()
		return new stzList( This.LettersWithOrientation() )

	  #----------------------#
	 #     ONLY NUMBERS     #
	#----------------------#
		
	/* Returns (as a string) only the numbers contained in the string

	   Note: if the string contains "㊱", for example, then it is returned
	   as the number 36 contained in a string ("36")!

	   To return just numbers formed from decimal digits from 0 to 9,
	   use OnlyDecimalDigits()
	*/

	def OnlyNumbers()
		cResult = ""

		for i = 1 to This.NumberOfChars()
			c = This.NthChar(i)

			oChar = new stzChar(c)
			if oChar.IsANumber()
				cResult += c
			ok
		next
		return cResult

		def OnlyNumbersQ()
			return new stzString( This.OnlyNumbers() )

	def OnlyDecimalDigits()
		cResult = NULL

		for i = 1 to This.NumberOfChars()
			c = This.NthChar(i)

			oChar = new stzChar(c)
			if oChar.IsDecimalDigit()
				cResult += c
			ok
		next
		return cResult

	def OnlyDecimalDigitsQ()
		return new stzList( This.OnlyDecimalDigits() )

	  #------------------------------------------#
	 #     ONLY LETTERS AND SPACES ANS CHARS    #
	#------------------------------------------#

	// Returns (as a string) only the letters contained in the string
	def OnlyLetters()
		cResult = NULL

		for i = 1 to This.NumberOfChars()
			c = This.NthChar(i)

			oChar = new stzChar(c)
			if oChar.isLetter()
				cResult += c
			ok
		next
		return cResult

	def OnlyLettersQ()
		return new stzList(This.OnlyLetters())

	#----

	def OnlyLettersAndSpaces()
		cResult = ""

		for i = 1 to This.NumberOfChars()
			c = This.NthChar(i)

			if StzCharQ( c ).IsLetterOrSpace()

				cResult += c
			ok
		next

		return cResult

	def OnlyLettersAndSpacesQ()
		return new stzString( This.OnlyLettersAndSpaces() )

	#----

	def OnlyLettersAndSpacesAndChar(pcChar)

		# t0 = clock() # Takes almost 0.62s

		cResult = ""

		for i = 1 to This.NumberOfChars()
			c = This.NthChar(i)
			oChar = new stzChar( c )

			if oChar.IsLetterOrSpaceOrChar(pcChar)
				cResult += c
			ok
		next

		# ? ( clock() - t0 ) / clockspersecond()

		return cResult

		def OnlyLettersAndSpacesAndThisChar(pcChar)
			return This.OnlyLettersAndSpacesAndChar(pcChar)

	def OnlyLettersAndSpacesAndCharQ(pcChar)
		return new stzString( This.OnlyLettersAndSpacesAndChar(pcChar) )

		def OnlyLettersAndSpacesAndThisCharQ(pcChar)
			return OnlyLettersAndSpacesAndCharQ(pcChar)

	#----

	def OnlyLettersAndSpacesAndChars(pacChars)
		return This.ItemsWhere('isLetter(@item) or isSpace(@item) or Q(@item).IsOneOfThese(pacChars)')

		def OnlyLettersAndSpacesAndCharsQ(paChars)
			return This.OnlyLettersAndSpacesAndChars(pacChars)

		def OnlyLettersAndSpacesAndTheseChars(pacChars)
			return This.OnlyLettersAndSpacesAndChars(pacChars)

	def IsLetterOrSpaceOrChar(pcChar)
		return This.IsLetterOrSpaceOrOneOfTheseChars([ pcChar ])

		def IsLetterOrSpaceOrThisChar(pcChar)
			return IsLetterOrSpaceOrChar(pcChar)

	def IsLetterOrSpaceOrChars(pacChar)
		bResult = FALSE

		if This.IsLetter() or This.IsSpace() or
		   This.IsOneOfThese(pacChars)

			return TRUE
		else
			return FALSE
		ok

		def IsLetterOrSpaceOrOneOfTheseChars(pacChar)
			return This.IsLetterOrSpaceOreChars(pacChar)


	  #-----------------------------------#
	 #    TRANSFORMING STRING TO LIST    #
	#-----------------------------------#

	def Listify()
		return This.ListifyXT([ :NumberInStringIsTransformedToNumber = FALSE ])

	def ListifyXT(paOptions)

		if NOT StzListQ(paOptions).IsStringListifyOptionsNamedParam()
			stzRaise("Unsupported option list!")
		else
			# By default, or if specified, add the string
			# as a string (without any casting) inside the list
			if len(paOptions) = 0 or
			   (len(paOptions) = 1 and paOptions[1][1] = NULL)

				aResult = [ This.String() ]
				return aResult
			ok

			if This.RepresentsNumber()
				if paOptions[ :NumberInStringIsTransformedToNumber ] = TRUE
					aResult = [ 0+ This.String() ]
					return aResult
	
				but paOptions[ :NumberInStringIsTransformedToNumber ] = FALSE
					aResult = [ This.String() ]
					return aResult
	
				else
					stzRaise("Unsupported option value!")
				ok
			ok

		ok

	  #==========================#
	 #    ALIGNING THE STRING   #
	#==========================#

	def Align(cDirection)
		This.AlignXT( :Max, " ", cDirection )

		def AlignQ(cDirection)
			This.Align(cDirection)
			return This

		def AlignQC(cDirection)
			return This.Copy().Align(cDirection)

		def AlignToQ(cDirection)
			This.Align(cDirection)
			return This

		def AlignToQC(cDirection)
			return This.Copy().Align(cDirection)
		

	def Aligned(cDirection)
		return This.Copy().AlignQ(cDirection).Content()

		def AlignedTo(cDirection)
			return This.Aligned(cDirection)

	  #-----------------------------------#
	 #  ALIGNING THE STRING -- EXTENDED  #
	#-----------------------------------#

	// Aligns the text in a container of width nWidth
	// Note: if the width is smaller then the string, nothing is done!

	def AlignXT(nWidth, cChar, cDirection)
		# cChar is the char to fill the 'blanks" with.

		if isList(nWidth) and Q(nWidth).IsWidthNamedParam()
			nWidth = nWidth[2]
		ok

		if isList(cChar) and ( Q(cChar).IsUsingNamedParam() or
			Q(cChar).IsCharNamedParam() )

			cChar = cChar[2]
		ok

		if isString(cChar) and cChar = ""
			cChar = " "
		ok

		if isList(cDirection) and ( Q(cDirection).IsDirectionNamedParam() or
			Q(cDirection).IsToNamedParam() )

			cDirection = cDirection[2]
		ok

		switch cDirection

		on :Left
			return This.AlignLeftXT(nWidth, cChar)

		on :Right
			return This.AlignRightXT(nWidth, cChar)

		on :Center
			return This.AlignCenterXT(nWidth, cChar)

		on :Justified
			return This.JustifyXT(nWidth, cChar)

		other
			stzRaise(stzStringError(:UnsupportedStringJustificationDirection))
		end

		def AlignXTQ(nWidth, cChar, cDirection)
			This.AlignXT(nWidth, cChar, cDirection)
			return This
	
	def AlignedXT(nWidth, cChar, cDirection)
		cResult = This.Copy().AlignXTQ(nWidth, cChar, cDirection).Content()
		return cResult

	  #-----------------------------------#
	 #  ALIGNING THE STRING TO THE LEFT  #
	#-----------------------------------#

	def LeftAlign(nWidth)
		This.LeftAlignXT(nWidth, " ")

		def LeftAlignQ(nWidth)
			This.LeftAlign(nWidth)
			return This

		def AlignLeft(nWidth)
			This.LeftAlign(nWidth)

			def AlignLeftQ(nWidth)
				This.AlignLeft(nWidth)
				return This

		def AlignToLeft(nWidth)
			This.LeftAlign(nWidth)

			def AlignToLeftQ(nWidth)
				This.AlignToLeft(nWidth)
				return This

	def LeftAligned(nWidth)
		cResult = This.Copy().LeftAlignQ(nWidth).Content()
		return cResult

		def AlignedToLeft(nWidth)
			return This.LeftAligned(nWidth)

	  #-----------------------------------------------#
	 #  ALIGNING THE STRING TO THE LEFT -- EXTENDED  #
	#-----------------------------------------------#

	def LeftAlignXT(nWidth, cChar)

		/*
		Managing the special case of the arabic char (Shaddah)
		which can alter the justification of text, because Qt
		treats it as a spearate char with its own position in
		the resulting string, while it must set on top of chars!

		Note: The same case of arabic diacritics (7araket)
		is not managed in this version (In the future,
		an extended arabic library will manage those (and other)
		specificities of arabic language.

		WARNING: In this version, if your arabic text contains
		arabic diactritics (7arakets), then the alignment
		won't be correct!

		Also, for this alignement to work as expected, the font
		you use in to display the text must be of "fixed size".

 		*/

		nWidth += This.NumberOfOccurrence( ArabicShaddah() )

		# Computing the alignment using Qt

		if nWidth > This.NumberOfChars()
			oChar = new stzChar(cChar)
			oQChar = oChar.QCharObject()

			// Take in account a logical error of Qt in aligning non
			// left-to-right strings (like arabic and hebrew)

			if This.IsRightToLeft()
				cJustified = @oQString.rightJustified(nWidth, oQChar, FALSE)
			else
				cJustified = @oQString.leftJustified(nWidth, oQChar, FALSE)
			ok
	
			This.Update( cJustified )
		ok

		def LeftAlignXTQ(nWidth, cChar)
			This.LeftAlignXT(nWidth, cChar)
			return This

		def AlignLeftXT(nWidth, cChar)
			This.LeftAlignXT(nWidth, cChar)

			def AlignLeftXTQ(nWidth, cChar)
				This.AlignLeftXT(nWidth, cChar)
				return This

	def LeftAlignedXT(nWidth, cChar)
		cResult = This.Copy().LeftAlignXTQ(nWidth, cChar).Content()
		return cResult

		def AlignedToLeftXT(nWidth, cChar)
			return This.LeftAlignedXT(nWidth, cChar)

	  #------------------------------------#
	 #  ALIGNING THE STRING TO THE RIGHT  #
	#------------------------------------#

	def RightAlign(nWidth)
		This.RightAlignXT(nWidth, " ")

		def RightAlignQ(nWidth)
			This.RightAlign(nWidth)
			return This

		def AlignRight(nWidth)
			This.RightAlign(nWidth)

			def AlignRightQ(nWidth)
				This.AlignRight(nWidth)
				return This

		def AlignToRight(nWidth)
			This.RightAlign(nWidth)

			def AlignToRightQ(nWidth)
				This.AlignToRight(nWidth)
				return This
	
	def RightAligned(nWidth)
		cResult = This.Copy().RightAlignQ(nWidth).Content()
		return cResult

		def AlignedToRight(nWidth)
			return This.RightAligned(nWidth)

	  #------------------------------------------------#
	 #  ALIGNING THE STRING TO THE RIGHT -- EXTENDED  #
	#------------------------------------------------#

	def RightAlignXT(nWidth, cChar)

		# See comment in LeftAlign() method
 
		nWidth += This.NumberOfOccurrence( ArabicShaddah() )

		# Computing the justification using Qt

		if nWidth > This.NumberOfChars()
			oChar = new stzChar(cChar)
			oQChar = oChar.QCharObject()

			if This.IsRightToLeft()
				cJustified = @oQString.leftJustified(nWidth, oQChar, FALSE)
			else
				cJustified = @oQString.rightJustified(nWidth, oQChar, FALSE)
			ok
	
			This.Update( cJustified )
		ok

		def RightAlignXTQ(nWidth, cChar)
			
			This.RightAlignXT(nWidth, cChar)
			return This

		def AlignRightXT(nWidth, cChar)
			This.RightAlignXT(nWidth, cChar)

			def AlignRightXTQ(nWidth, cChar)
				This.AlignRightXT(nWidth, cChar)
				return This

	def RightAlignedXT(nWidth, cChar)
		cResult = This.Copy().RightAlignXTQ(nWidth, cChar).Content()
		return cResult

		def AlignedToRightXT(nWidth, cChar)
			return This.RightAlignedXT(nWidth, cChar)

	  #------------------------#
	 #  CENTERING THE STRING  #
	#------------------------#

	def CenterAlign(nWidth)
		This.CenterAlignXT(nWidth, " ")

		def CenterAlignQ(nWidth)
			This.CenterAlign(nWidth)
			return This

		def AlignToCenter(nWidth)
			This.CenterAlign(nWidth)

			def AlignToCenterQ(nWidth)
				This.AlignToCenter(nWidth)
				return This

		def AlignCenter(nWidth)
			This.CenterAlign(nWidth)

			def AlignCenterQ(nWidth)
				This.AlignCenter(nWidth)
				return This

		def Center(nWidth)
			This.CenterAlign(nWidth)

			def CenterQ(nWidth)
				This.Center(nWidth)
				return This

	def CenterAligned(nWidth)
		cResult = This.Copy().CenterAlignQ(nWidth).Content()
		return cResult

		def AlignedToCenter(nWidth)
			return This.CenterAligned(nWidth)

		def Centered(nWidth)
			This.CenterAligned(nWidth)

	  #------------------------------------#
	 #  CENTERING THE STRING -- EXTENDED  #
	#------------------------------------#

	def CenterAlignXT(nWidth, cChar)

		# See comment in LeftAlign() method
 
		nWidth += This.NumberOfOccurrence( ArabicShaddah() )

		# Computing the justification using Qt

		if nWidth > This.NumberOfChars()

			n = nWidth - This.NumberOfChars()
			n1 = 0
			n2 = 0

			oNumber = new stzNumber(n)
			if oNumber.IsEven()
				n1 = n / 2
				n2 = n1
			else
				n1 = (n - 1) / 2
				n2 = n1 + 1
			ok

			cResult = StringRepeat(cChar, n1) +
				  This.String() +
				  StringRepeat(cChar, n2)

			This.Update( cResult )
		ok

		def CenterAlignXTQ(nWidth, cChar)
			This.CenterAlignXT(nWidth, cChar)
			return This

		def AlignCenterXT(nWidth, cChar)
			This.CenterAlignXT(nWidth, cChar)

			def AlignCenterXTQ(nWidth, cChar)
				This.AlignCenterXT(nWidth, cChar)
				return This

		def AlignToCenterXT(nWidth, cChar)
			This.CenterAlignXT(nWidth, cChar)

			def AlignToCenterXTQ(nWidth, cChar)
				This.AlignToCenterXT(nWidth, cChar)
				return This

		def CenterXT(nWidth, cChar)
			This.CenterAlignXT(nWidth, cChar)

			def CenterXTQ(nWidth, cChar)
				This.CenterXT(nWidth, cChar)
				return This

	def CenterAlignedXT(nWidth, cChar)
		cResult = This.Copy().CenterAlignXTQ(nWidth, cChar).Content()
		return cResult

		def AlignedToCenterXT(nWidth, cChar)
			return This.CenterAlignedXT(nWidth, cChar)

		def CenteredXT(nWidth, cChar)
			return This.CenterAlignedXT(nWidth, cChar)


	  #-------------------------#
	 #  JUSTIFYING THE STRING  #
	#-------------------------#

	def Justify(nWidth)
		This.JustifyXT(nWidth, " ")

		def JustifyQ(nWidth)
			This.Justify(nWidth)
			return This

		// NEW: returns a jystified copy of the string object
		// --> Useful in copy-on-right (functional) programming
		def JustifyQC(nWith)
			return This.Copy().Justify(nWidth)

	def Justified(nWidth)
		return This.Copy().JustifyQ(nWidth).Content()

	  #-------------------------------------#
	 #  JUSTIFYING THE STRING -- EXTENDED  #
	#-------------------------------------#

	def JustifyXT(nWidth, cChar)

		# See comment in LeftAlign() method
 
		nWidth += This.NumberOfOccurrence( ArabicShaddah() )

		# Computing the justification

		if nWidth <= This.NumberOfChars()
			return NULL
		ok

		nPoints = nWidth - This.NumberOfChars()
		aTemp = []

		for i = 1 to This.NumberOfChars() - 1

			if NOT ( CharIsArabicShaddah(This[i]) or CharIsArabic7arakah(This[i]) )

				aTemp + This[i]
			else
				if len(aTemp) != 0
					aTemp[ len(aTemp) ] = aTemp[ len(aTemp) ] + This[i]
				ok
			ok
		next

		while nPoints > 0
			for i = 1 to len(aTemp)
				aTemp[i] = aTemp[i] + cChar
				nPoints--
				if nPoints = 0 { exit }
			next
		end

		aTemp + This.LastChar()

		cResult = ""
		for str in aTemp
			cResult += str
		next

		cResult = Q(cResult).ReplaceQ(" ", cChar).Content()
		This.Update( cResult )

		def JustifyXTQ(nWidth, cChar)
			This.JustifyXT(nWidth, cChar)
			return This

	def JustifiedXT(nWidth, cChar)
		cResult = This.Copy().JustifyXTQ(nWidth, cChar).Content()

	  #==================================#
	 #    TEXT ENCODING & CONVERTING    #
	#==================================#

	//Returns a UTF-8 representation of the string as a QByteArray
	def ToUTF8()
		return QByteArrayToList( @oQString.toUtf8() )

	def ToUTF8Q()
		return new stzString( This.ToUTF8() )

	def FromUTF8(pcUTF8String)
		// TODO

	def ToLatin1()
		return @oQString.toLatin1()

	def FromLatin1(pcLatin1String)
		// TODO

	def ToLocal8Bit()
		return @oQString.toLocal8Bit()

	def ToBase64()
		return This.ToStzListOfBytes().ToBase64()

		def ToBase64Q()
			return new stzString( This.ToBase64() )

	// Transforms the content of the string to a url-like encoded string
	def ToPercentEncoding(pcExcludedFromEncoding, pcIncludedInEncoding, pcPercentAsciiChar)
		/* Example:
		o1 = new stzString("{a fishy string?}")
		? o1.ToPercentEncoding( "{}", "s" )

		--> {a%20fi%73hy%20%73tring%3F}
		*/

	// Updates the list of bytes with an url-like decoded copy of the provided string
	def FromPercentEncoding(pcPercentEncodedString, pcPercentAsciiChar)
		/* Example:
		o1 = new stzString("")
		o1.FromPercentEncoding( "{a%20fi%73hy%20%73tring%3F}", "%" )
		o1.Content()

		--> {a fishy string?}
		*/

	def ToHex()
		return str2hex( This.String() )

		def ToHexQ()
			return new stzString( This.ToHex() )

	def ToHexSpacified()
		cHex = This.ToHex()
		n = ceil( StzStringQ(cHex).NumberOfChars() / This.NumberOfBytes() )

		cResult = StzStringQ(cHex).InsertAfterEveryNCharsQ(n, " ").Content()
		return cResult

	def FromHex(cHex)
		@oQString = new QString2()
		@oQString.append(hex2str(cHex))

		def FromHexQ(cHex)
			This.FromHex(cHex)
			return This

	// Escapes HTML special Chars in the string
	def EscapeHtml()
		cResult = @oQString.toHtmlEscaped()

		return cResult

		def EscapeHtmlQ()
			return new stzString( This.EscapeHtml() )

	def HtmlEscaped()
		return This.EscapeHtmlQ().Content()
	
	  #------------------------------------------------#
	 #    UNICODE CODES OF THE CHARS OF THE STRING    #
	#------------------------------------------------#

	// Transforms the string to a number based on the defined format
	// --> TODO: Use the ApplyFormat() method in the stzNumber class...
	// Rething the naming!
	def ToNumber(cFormat) // TODO
		/*
		o1 = new stzString("+12500,14")
		? o1.ToNumber("+99 999.99") --> 12 500.14
		*/

	def ToNumberQ(cFormat)
		return new stzNumber( This.ToNumber() )
	

	  #------------------------------------------------#
	 #    UNICODE CODES OF THE CHARS OF THE STRING    #
	#------------------------------------------------#

	// The following method is mainly used by stzChar class to
	// create a characrer object from text
	def UnicodeOfCharN(n)
		oTempQStr = new QString2()
		oTempQStr.append(This[n])
		return oTempQStr.unicode().unicode()
		/*
		The first unicode() on QString returns a QChar,
		while the seconde unicode() on this QChar returns
		the actual decimal unicode of the Char
		*/

	// Returns a list of unicodes of all the Chars in the string
	def Unicodes()
		aResult = []
		for i = 1 to This.NumberOfChars()
			aResult + This.UnicodeOfCharN(i)
		next

		return aResult

	def Unicode()
		if This.NumberOfChars() = 1
			return This.UnicodeOfCharN(1)

		else
			return This.Unicodes()
		ok

	def CharsAndUnicodes()
		aResult = []
		for i = 1 to This.NumberOfChars()
			aResult + [ This[i], This.UnicodeOfCharN(i) ]
		next

		return aResult

		def CharsAndTheirUnicodes()
			return This.CharsAndUnicodes()

		def UnicodesPerChar()
			return This.CharsAndUnicodes()

	def UnicodesAndChars()
		aResult = []

		for i = 1 to This.NumberOfChars()
			aResult + [ This.UnicodeOfCharN(i), This[i] ]
		next

		return aResult

		def UnicodesAndTheirChars()
			return This.UnicodesAndChars()

		def UnicodesXT()
			return This.UnicodesAndChars()

	
		def CharsPerUnicode()
			return This.UnicodesAndChars()

	  #-------------------#
	 #    CHARS NAMES    #
	#-------------------#

	def CharsNames()
		acResult = []

		for i = 1 to This.NumberOfChars()
			acResult + StzCharQ( This[i] ).Name()
		next

		return acResult

		def CharNamesQR(pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			if pcReturnType = :stzList
				return new stzList(This.CharNames())

			pcReturnType = :stzListOfStrings
				return new stzListOfString(This.CharNames())

			else
				stzRaise("Unsupported return type!")
			ok

		def CharNamesQ()
			return This.CharNamesQR(:stzListOfStrings)

		def CharsAndTheirNames()
			return This.CharsNames()

	def CharName()
		return This.CharsNames()[1]

		def CharNameQ()
			return new stzString(This.CharName())

	  #-------------------------------#
	 #    MULTINGUAL & LOCLAE INFO   #
	#-------------------------------#

	/*
	In Softanza, a unicode code of a language, country or locale can be:
		* number : like "6" for arabic
		* name : like "arabic" for arabic
		* abbreviation : like "ar" (short form) and "ara" (long form) for arabic
	*/

	def IsLanguageIdentifier()
		return 	This.IsLanguageNumber() or
			This.IsLanguageAbbreviation() or
			This.IsLanguageName()

	def IsLanguageNumber()
		if This.IsEmpty() { return FALSE }

		bResult = FALSE
		for aLanguageInfo in LocaleLanguagesXT()
			if aLanguageInfo[1] = This.String()
				bResult = TRUE
				exit
			ok
		next
	
		return bResult

		def IsLanguageCode()
			return This.IsLanguageNumber()

	def IsLanguageNumberXT()
		/*
		Returns :
		[ TRUE/FALSE, :LanguageName ]
		*/
		if This.IsEmpty() { return FALSE }

		bLangNumber = This.IsLanguageNumber()
		cLang = :Nothing

		if This.IsLanguageNumber()
			oList = new stzList(LocaleLanguageNumbers())
			if oList.Contains(This.String())
				oLocale = new stzLocale(This.String())
				cLang = oLocale.LanguageName()
			ok

		ok

		return [ bLangNumber, cLang ]


	def IsShortLanguageAbbreviation()
		if This.IsEmpty() { return FALSE }

		bResult = FALSE
		for aLanguageInfo in LocaleLanguagesXT()
			if lower(aLanguageInfo[3]) = lower(This.String())
				bResult = TRUE
				exit
			ok
		next
	
		return bResult

	def IsLongLanguageAbbreviation()
		if This.IsEmpty() { return FALSE }

		bResult = FALSE
		for aLanguageInfo in LocaleLanguagesXT()
			if lower(aLanguageInfo[4]) = lower(This.String())
				bResult = TRUE
				exit
			ok
		next
	
		return bResult

	def IsLanguageAbbreviation()
		/* Could be written expressively like this:

		return This.IsLanguageShotAbbreviation() OR This.IsLanguageLongAbbreviation()

		but the following is mutch more efficient: */

		if This.IsEmpty() { return FALSE }

		bResult = FALSE
		for aLanguageInfo in LocaleLanguagesXT()

			if lower(aLanguageInfo[3]) = lower(This.String()) OR
			   lower(aLanguageInfo[4]) = lower(This.String())
				bResult = TRUE
				exit
			ok
		next
	
		return bResult

	def IsLanguageShortAbbreviation()
		if This.IsEmpty() { return FALSE }

		bResult = FALSE
		for aLanguageInfo in LocaleLanguagesXT()
			if lower(aLanguageInfo[3]) = lower(This.String())
				bResult = TRUE
				exit
			ok
		next
	
		return bResult

	def IsLanguageLongAbbreviation()
		if This.IsEmpty() { return FALSE }

		bResult = FALSE
		for aLanguageInfo in LocaleLanguagesXT()
			if lower(aLanguageInfo[4]) = lower(This.String())
				bResult = TRUE
				exit
			ok
		next
	
		return bResult

	def IsLanguageAbbreviationXT()
		/*
		Returns :
		[ TRUE, :Short ] or [ :TRUE, :Long ] or [ FALSE, NULL ]
		*/
		if This.IsEmpty() { return FALSE }

		bAbbr = This.IsLanguageAbbreviation()
		ctype = :Nothing

		if This.IsLanguageShortAbbreviation()
			cType = :Short
		but This.IsLanguageLongAbbreviation()
			cType = :Long
		ok

		return [ bAbbr, cType ]

	def IsLanguageName() # In english

		if This.IsEmpty() { return FALSE }

		bResult = FALSE
		for aLanguageInfo in LocaleLanguagesXT()
			if lower(aLanguageInfo[2]) = lower(This.String())
				bResult = TRUE
				exit
			ok
		next
	
		return bResult

		def IsNotLanguageName()
			return NOT This.IsLanguageName()

	def IsNativeLanguageName() # Locale-specific
		if This.IsEmpty() { return FALSE }

		stzRaise(stzStringError(:UnsupportedFeatureInThisVersion)) # TODO

	def IsCountryIdentifier()
		return 	This.IsCountryNumber() or
			This.IsCountryAbbreviation() or
			This.IsCountryName() or
			This.IsCountryPhoneCode()

	def IsCountryAbbreviation()
		if This.IsEmpty() { return FALSE }

		cAbbr = This.String()
		bResult = FALSE
		for aCountryInfo in LocaleCountriesXT()
			if UPPER(aCountryInfo[3]) = UPPER(cAbbr) OR
			   UPPER(aCountryInfo[4]) = UPPER(cAbbr)

				bResult = TRUE
				exit
			ok
		next
	
		return bResult

	def IsCountryName()
		if This.IsEmpty() { return FALSE }

		cName = This.String()
		bResult = FALSE
		for aCountryInfo in LocaleCountriesXT()
			if lower(aCountryInfo[2]) = lower(cName)
				bResult = TRUE
				exit
			ok
		next

		return bResult

		def IsNotCountryName()
			return NOT This.IsCountryName()

	def IsNativeCountryName() # Locale-specific
		if This.IsEmpty() { return FALSE }

		stzRaise(stzString(:UnsupportedFeatureInThisVersion))

	def IsCountryPhoneCode()
		if This.IsEmpty() { return FALSE }

		cPhoneCode = This.String()
		bResult = FALSE

		for aCountryInfo in LocaleCountriesXT()
			if aCountryInfo[5] = cPhoneCode
				bResult = TRUE
				exit
			ok
		next

		return bResult

	def IsCountryNumber()
		if This.IsEmpty() { return FALSE }

		cNumber = This.String()
		bResult = FALSE

		for aCountryInfo in LocaleCountriesXT()
			if lower(aCountryInfo[1]) = lower(cNumber)
				bResult = TRUE
				exit
			ok
		next

		return bResult

		def IsCountryCode()
			return This.IsCountryNumber()

	def IsShortCountryAbbreviation()
		if This.IsEmpty() { return FALSE }

		cAbbr = This.String()
		bResult = FALSE
		for aCountryInfo in LocaleCountriesXT()
			if UPPER(aCountryInfo[3]) = UPPER(cAbbr)

				bResult = TRUE
				exit
			ok
		next
	
		return bResult

		def IsCountryShortAbbreviation()
			return This.IsShortCountryAbbreviation()

	def IsLongCountryAbbreviation()
		if This.IsEmpty() { return FALSE }

		cAbbr = This.String()
		bResult = FALSE
		for aCountryInfo in LocaleCountriesXT()
			if UPPER(aCountryInfo[4]) = UPPER(cAbbr)
				bResult = TRUE
				exit
			ok
		next
	
		return bResult

		def IsCountryLongAbbreviation()
			return This.IsLongCouontryAbbreviation()

	def IsCountryAbbreviationXT()
		/*
		Returns :
		[ TRUE, :Short ] or [ :TRUE, :Long ] or [ FALSE, NULL ]
		*/

		if This.IsEmpty() { return FALSE }

		bAbbr = This.IsCountryAbbreviation()
		ctype = :Nothing

		if This.IsShortCountryAbbreviation()
			cType = :Short
		but This.IsLongCountryAbbreviation()
			cType = :Long
		ok

		return [ bAbbr, cType ]
	
	def IsScriptIdentifier()
		return 	This.IsScriptNumber() or
			This.IsScriptAbbreviation() or
			This.IsScriptName()

	# Script abbreviation can't be short or long, it is always 4 chars long!
	def IsScriptAbbreviation()
		if This.IsEmpty() { return FALSE }

		cAbbr = This.String()
		bResult = FALSE
		for aScriptInfo in LocaleScriptsXT()
			if lower(aScriptInfo[3]) = lower(cAbbr)
				bResult = TRUE
				exit
			ok
		next
	
		return bResult

	def IsScriptName()
		if This.IsEmpty() { return FALSE }

		cScript = This.String()
		bResult = FALSE

		for aScriptInfo in LocaleScriptsXT()
			if lower(aScriptInfo[2]) = lower(cScript)
				bResult = TRUE
				exit
			ok
		next

		return bResult

		def IsScript()
			return This.IsScriptName()

		def IsNotScriptName()
			return NOT This.IsScriptName()

	def IsScriptNumber()
		if This.IsEmpty() { return FALSE }

		cScript = This.String()
		bResult = FALSE
		for aScriptInfo in LocaleScriptsXT()
			if lower(aScriptInfo[1]) = lower(cScript)
				bResult = TRUE
				exit
			ok
		next

		return bResult

		def IsScriptCode()
			return This.IsScriptNumber()

	def IsLocaleAbbreviation()
		cThisString = This.Copy().ReplaceQ("_", "-").Content()
		oLocalesInString = StzStringQ( LocaleAbbreviationsHostedInString() )
		bResult = oLocalesInString.ContainsCS( cThisString, :CaseSensitive = FALSE )

		return bResult
	
	def ContainsLocaleSeparator()
		return This.Contains("_") or This.Contains("-")

	def ExtractLocaleSeparator()

		if This.ContainsLocaleSeparator()
			if This.Contains("_")
				return "_"

			but This.Contains("-")
				return "-"
			ok
		ok

	def ContainsNoLocaleSeparator()
		return NOT This.ContainsLocaleSeparator()

	def ContainsOneLocaleSeparator()
		return  This.ContainsNTimes(1, "_") or
			This.ContainsNTimes(1, "_")

	def IsLocaleSeparator()
		return This.Content() = "_" or This.Content() = "-"

	def IsCurrencyName()
		if This.IsEmpty() { return FALSE }

		bResult = FALSE

		for aCurrencyInfo in CurrenciesXT()
			if lower(aCurrencyInfo[1]) = This.Lowercased()
				bResult = TRUE
				exit
			ok
		next

		return bResult	

	def IsCurrencySymbol()	# TODO
		if This.IsEmpty() { return FALSE }
		
	def IsBp64LocaleAbbreviation() # Like "ar-TN" for example
		if This.IsEmpty() { return FALSE }

		stzRaise(:UnsupportedFeatureInThisVersion)

	def IsDayName() # In english

		return This.IsDayNameIn(:English)

	def IsDayNameIn(pcLanguageName)
		if This.IsEmpty() { return FALSE }

		return This.LowercaseQ().IsOnOfThese(NamesOfDaysIn(pcLanguageName))

	def IsNativeDayNameInLocale(pLocale) # Locale-specific
		if This.IsEmpty() { return FALSE }

		return This.IsEqualToCS(StzLocaleQ(pLocale).NativeDayName(), :CaseSensitive = FALSE)

	def IsMonthName() # In english
		stzRaise(:UnsupportedFeatureInThisVersion)

	def IsNativeMonthName() # Locale-specific
		stzRaise(:UnsupportedFeatureInThisVersion)

	  #------------------------#
	 #    NUMBER IN STRING    #
	#------------------------#

	def RepresentsDecimalNumber()
		return This.RepresentsNumberInDecimalForm()

		def IsNumberInString()
			return This.RepresentsDecimalNumber()

		def IsANumberInString()
			return This.RepresentsDecimalNumber()

		def IsNumberInAString()
			return This.RepresentsDecimalNumber()

		def IsANumberInAString()
			return This.RepresentsDecimalNumber()

	def RepresentsBinaryNumber()
		oCopy = This.RemoveSpacesQ()

		if oCopy.RepresentsNumberInBinaryForm()
			return TRUE

		else
			return FALSE
		ok

		def IsBinaryNumberInString()
			return This.RepresentsBinaryNumber()

	def RepresentsOctalNumber()
		oCopy = This.RemoveSpacesQ()

		if oCopy.RepresentsNumberInOctalForm()
			return TRUE

		else
			return FALSE
		ok

		def IsOctalNumberInString()
			return This.RepresentsOctalNumber()

	def RepresentsHexNumber()
		oCopy = This.RemoveSpacesQ()

		if oCopy.RepresentsNumberInHexForm()
			return TRUE

		else
			return FALSE
		ok

		def IsHexNumberInString()
			return This.RepresentsHexNumber()

	def RepresentsScientificNotationNumber()
		oCopy = This.RemoveSpacesQ()

		if oCopy.RepresentsNumberInScientificNotation()
			return TRUE

		else
			return FALSE
		ok

		def IsScientificNotationNumberInString()
			return This.RepresentsScientificNotationNumber()


	def RepresentsNumber()

		oCopy = This.RemoveSpacesQ()

		if oCopy.RepresentsNumberInDecimalForm() or
		   oCopy.RepresentsNumberInBinaryForm() or
		   oCopy.RepresentsNumberInOctalForm() or
		   oCopy.RepresentsNumberInHexForm() or
		   oCopy.RepresentsNumberInScientificNotation()
			
			return TRUE

		else

			return FALSE
		ok

		#< @FunctionAlternativeForms

		def RepresentsNumberInString()
			return This.RepresentsNumber()

		#>
	
	def RepresentsSignedNumber()
		if This.RepresentsNumber() and
		   (This.FirstChar() = "+" or This.FirstChar() = "-")

			return TRUE
		else
			return FALSE
		ok

	def RepresentsUnsignedNumber()
		if This.RepresentsNumber() and
		   NOT (This.FirstChar() = "+" or This.FirstChar() = "-")

			return TRUE
		else
			return FALSE
		ok		

	def RepresentsCalculableNumber() 

		if This.RepresentsCalculableInteger() or
		   This.RepresentsCalculableRealNumber()

			return TRUE

		else
			return FALSE
		ok
				 
		/*
		Non calculable numbers are: 
		-  other numbers in Uniocde, like circled number icons,
		   roman and indian numbers and others

		- numbers in any form (decimal, binary, octal, hex, scientific)
		  that can not be calculated "precisily" with Ring, as defined by
		  MinCalculableNumber() and MaxCalculableNumber()
		*/

	def RepresentsInteger()
		if This.RepresentsNumber() and This.ContainsNo(".")
			return TRUE
		else
			return FALSE
		ok

	def RepresentsSignedInteger()
		if This.RepresentsInteger() and
		   (This.FirstChar() = "+" or This.FirstChar() = "-")

			return TRUE
		else
			return FALSE
		ok

	def RepresentsUnsignedInteger()
		if This.RepresentsInteger() and
		   NOT (This.FirstChar() = "+" or This.FirstChar() = "-")

			return TRUE
		else
			return FALSE
		ok

	def RepresentsCalculableInteger()

		if This.representsInteger()

			# Step 1: we define the number of digits of
			# the integer and the maximum number of digits
			# allowed by Ring for integers
			
			if This.RepresentsSignedInteger()

				nNumberOfDigits = This.NumberOfChars() - 1
				nMaxNumberOfDigits = MaxNumberOfDigitsInSignedInteger()

			else

				nNumberOfDigits = This.NumberOfChars()
				nMaxNumberOfDigits = MaxNumberOfDigitsInUnsignedInteger()
			ok

			# Step 2: we compare between them to kwow if this
			# integer is calculable precisely by Ring or not

			if nNumberOfDigits <= nMaxNumberOfDigits
				return TRUE
			else
				return FALSE
			ok

		else
			return FALSE
		ok

	def RepresentsRealNumber()
		if This.RepresentsNumber() and This.Contains(".")
			return TRUE
		else
			return FALSE
		ok		

	def RepresentsSignedRealNumber()
		if This.RepresentsRealNumber() and
		   (This.FirstChar() = "+" or This.FirstChar() = "-")

			return TRUE
		else
			return FALSE
		ok

	def RepresentsUnsignedRealNumber()
		if This.RepresentsRealNumber() and
		   NOT (This.FirstChar() = "+" or This.FirstChar() = "-")

			return TRUE
		else
			return FALSE
		ok

	def RepresentsCalculableRealNumber()
		
		if This.RepresentsRealNumber()

			# Step1: We split the string to get integer and
			# decimal parts and calculate the number of
			# digits in the real number

			cIntegerPart = This.Split(".")[1]
			nNumberOfDigitsIncIntegerPart = len(cIntegerPart)

		 	if left(cIntegerPart,1) = "+" or
			   left(cIntegerPart,1) = "-"
				nNumberOfDigitsIncIntegerPart--
			ok

			cFractionalPart = This.Split(".")[2]
			nNumberInDigitsInFractionalPart = len(cFractionalPart)

			nNumberOfDigits = nNumberOfDigitsIncIntegerPart +
					  nNumberInDigitsInFractionalPart

			# Step 2: We compute the maximum number of digits allowed
			# depending on the real number being singed or unsigned

			nMaxNumberOfDigits = 0
			if This.RepresentsSignedRealNumber()
				nMaxNumberOfDigits = MaxNumberOfDigitsInSignedRealNumber()
			else
				nMaxNumberOfDigits = MaxNumberOfDigitsInUnsignedRealNumber()
			ok

			# Step 3: we compare between them to kwow if this real
			# number is calculable precisely by Ring or not

			if nNumberOfDigits <= nMaxNumberOfDigits
				return TRUE
			else
				return FALSE
			ok

		else
			return FALSE
		ok

	def RepresentsNumberInDecimalForm()

		# Rule 1: String shouldn't be null

		if This.Content() = ""
			return FALSE
		ok

		# Rule 2: String shouldn't be just one of these chars

		if This.NumberOfChars() = 1 and
		   (This.Content() = "+" or This.Content() = "-" or
		    This.Content() = "." or This.Content() = "_" or
		    This.Content() = " ")

			return FALSE
		ok

		# Rule 3: String shouldn't contain more then once these chars

		if This.NumberOfOccurrence("-") > 1 or
		   This.NumberOfOccurrence("+") > 1 or
		   This.NumberOfOccurrence(".") > 1

			return FALSE
		ok

		# Rule 4: If "-" sign exits, then it should prefix the string

		if This.Contains("-") and This.FirstChar() != "-"
			return FALSE
		ok

		# Rule 5: If "+" sign exits, then it should prefix the string

		if This.Contains("+") and This.FirstChar() != "+"
			return FALSE
		ok

		# Rule 6: If "." separator exists, then it shouldn't be at the end

		if This.Contains(".") and This.LastChar() = "."
			return FALSE
		ok

		# Now, let's check the chars correspond to digits, signs or separators

		oPossibleChars = new stzList( "0":"9" + "-" + "+" + "." + "_" )

		for i = 1 to This.NumberOfChars()
			c = This.NthChar(i)

			if NOT oPossibleChars.Contains(c)
				return FALSE
			ok

		next

		# At this level, we can be sure the string is a decimal number

		return TRUE

	// Checks if the string corresponds to a binary number started by the
	// prefix defined in BinaryNumberPrefix() and composed of 0s and 1s

	def RepresentsNumberInBinaryForm()

		# Rule 1: String shouldn't be null or formed of just spaces

		if This.IsEmpty()
			return FALSE
		ok

		# Rule 2: String must contains 0s or 1s

		if This.ContainsNo("0") and This.ContainsNo("1")
			return FALSE
		ok

		# Rule 3: String should be prefixed with a binary prefix

		bTemp = FALSE

		for cBinPrefix in BinaryPrefixes()
			oCopy = This.Copy()
			oCopy.RemoveFromLeftQ("-").RemoveFromLeftQ("+")

			if oCopy.StartsWithCS(cBinPrefix, :CaseSensitive = FALSE)
				bTemp = TRUE
				exit
			ok
		next
		if bTemp = FALSE { return FALSE }

		# Rule 4: String shouldn't be just one of these chars

		if This.NumberOfChars() = 1 and
		   (This.Content() = "+" or This.Content() = "-" or
		    This.Content() = "." or This.Content() = "_")

			return FALSE
		ok

		# Rule 5: String shouldn't contain more then once these chars

		if This.NumberOfOccurrence("-") > 1 or
		   This.NumberOfOccurrence("+") > 1 or
		   This.NumberOfOccurrence(".") > 1

			return FALSE
		ok

		# Rule 6: If "-" sign exits, then it should prefix the string

		if This.Contains("-") and This.FirstChar() != "-"
			return FALSE
		ok

		# Rule 7: If "+" sign exits, then it should prefix the string

		if This.Contains("+") and This.FirstChar() != "+"
			return FALSE
		ok

		# Rule 8: If "." separator exists, then it shouldn't be at the end

		if This.Contains(".") and This.LastChar() = "."
			return FALSE
		ok

		# Now, let's check the chars correspond to digits, signs or separators

		oPossibleChars = new stzList( "0":"1" + "b" + "-" + "+" + "." + "_" )

		for i = 1 to This.NumberOfChars()
			c = This.NthChar(i)

			if NOT oPossibleChars.Contains(c)
				return FALSE
			ok

		next

		# At this level, we can be sure the string is a decimal number

		return TRUE

	// Checks if the string corresponds to a hex number form
	def RepresentsNumberInHexForm()

		# Rule 1: String shouldn't be null or formed of just spaces

		if This.IsEmpty()
			return FALSE
		ok

		# Rule 2: String must not contain just a hex prefix

		if This.IsEqualToOneOfTheseCS(HexPrefixes(), :CS = FALSE)
			return FALSE
		ok

		# Rule 3: String should be prefixed with a hex prefix

		bTemp = FALSE

		for cHexPrefix in HexPrefixes()
			oCopy = This.Copy()
			oCopy.RemoveFromLeftQ("-").RemoveFromLeftQ("+")

			if oCopy.StartsWithCS(cHexPrefix, :CaseSensitive = FALSE)
				bTemp = TRUE
				exit
			ok
		next
		if bTemp = FALSE { return FALSE }

		# Rule 4: String shouldn't be formed of these chars alone

		if This.NumberOfChars() = 1 and
		   (This.Content() = "+" or This.Content() = "-" or
		    This.Content() = "." or This.Content() = "_" )

			return FALSE
		ok

		# Rule 5: String shouldn't contain more then once these chars

		if This.NumberOfOccurrence("-") > 1 or
		   This.NumberOfOccurrence("+") > 1 or
		   This.NumberOfOccurrence(".") > 1

			return FALSE
		ok

		# Rule 6: If "-" sign exits, then it should prefix the string

		if This.Contains("-") and This.FirstChar() != "-"
			return FALSE
		ok

		# Rule 7: If "+" sign exits, then it should prefix the string

		if This.Contains("+") and This.FirstChar() != "+"
			return FALSE
		ok

		# Rule 8: If "." separator exists, then it shouldn't be at the end

		if This.Contains(".") and This.LastChar() = "."
			return FALSE
		ok

		# Now, let's check that chars correspond to digits, signs or separators

		oPossibleChars = new stzList( HexChars() + "x" + "-" + "+" + "." + "_" )

		for i = 1 to This.NumberOfChars()
			c = This.NthChar(i)	

			if NOT oPossibleChars.Contains(c)
				return FALSE
			ok

		next

		# At this level, we can be sure the string is a hex number

		return TRUE

	def RepresentsNumberInUnicodeHexForm()
		if NOT This.LeftNCharsQ(2).Uppercased() = "U+"
			return FALSE
		ok
	
		if This.IsEqualToOneOfTheseCS("U", "U+")
			return FALSE
		ok

		cNumber = This.LeftNCharsRemoved(2)
	
		if IsHexNumber( HexPrefix() + cNumber )
			return TRUE
		else
			return FALSE
		ok

	// Checks if the string corresponds to an octal number
	def RepresentsNumberInOctalForm()

		# Rule 1: String shouldn't be null or formed of just spaces

		if This.IsEmpty()
			return FALSE
		ok

		# Rule 2: String must not contain only an octal prefix

		if This.IsEqualToOneOfTheseCS(OctalPrefixes(), :CS = FALSE)
			return FALSE
		ok

		# Rule 4: String should be prefixed with an octal prefix

		bTemp = FALSE

		for cOctalPrefix in OctalPrefixes()
			oCopy = This.Copy()
			oCopy.RemoveFromLeftQ("-").RemoveFromLeftQ("+")

			if oCopy.StartsWithCS(cOctalPrefix, :CaseSensitive = FALSE)
				bTemp = TRUE
				exit
			ok
		next
		if bTemp = FALSE { return FALSE }

		# Rule 5: String shouldn't be formed of these chars alone

		if This.NumberOfChars() = 1 and
		   (This.Content() = "+" or This.Content() = "-" or
		    This.Content() = "." or This.Content() = "_" )

			return FALSE
		ok

		# Rule 6: String shouldn't contain more then once these chars

		if This.NumberOfOccurrence("-") > 1 or
		   This.NumberOfOccurrence("+") > 1 or
		   This.NumberOfOccurrence(".") > 1

			return FALSE
		ok

		# Rule 7: If "-" sign exits, then it should prefix the string

		if This.Contains("-") and This.FirstChar() != "-"
			return FALSE
		ok

		# Rule 8: If "+" sign exits, then it should prefix the string

		if This.Contains("+") and This.FirstChar() != "+"
			return FALSE
		ok

		# Rule 9: If "." separator exists, then it shouldn't be at the end

		if This.Contains(".") and This.LastChar() = "."
			return FALSE
		ok

		# Now, let's check that the chars correspond to digits, signs or separators

		oPossibleChars = new stzList( OctalChars() + "o" + "-" + "+" + "." + "_" )

		for i = 1 to This.NumberOfChars()
			c = This.NthChar(i)

			if NOT oPossibleChars.Contains(c)
				return FALSE
			ok

		next

		# At this level, we can be sure the string is a decimal number

		return TRUE

	def RepresentsNumberInScientificNotation()
		// TODO

	def StringIsNumberFraction() # of the form "1/2" or "۱/٢" or "Ⅰ/Ⅱ" or
					  # even "一/二" (in mandarin numerals)
		bResult = FALSE

		if This.NumberOfChars() = 3
			aStzChars = This.ToListOfStzChars()
			if aStzChars[1].IsANumber() and
			   (aStzChars[2].Content() = "/" or aStzChars[2].Content() = ":") and
			   aStzChars[3].IsANumber()

				bResult = TRUE
			ok
		ok

	  #==============#
	 #    CHARS     #
	#==============#

	// Returns the string as a list of Chars
	def Chars()
		aResult = []
		for i = 1 to This.NumberOfChars()
			aResult + This.NthChar(i)
		next
		return aResult

		#< @FunctionFluentForm

		def CharsQ()
			return This.CharsQR(:stzList)

		def CharsQR(pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.Chars() )

			on :stzListOfChars
				return new stzListOfChars( This.Chars() )

			on :stzListOfStrings
				return new stzListOfStrings( This.Chars() )
			other
				stzRaise([
					:Where = "stzString (13237) > CharsQR()",
					:What  = "Unsupported type!"
				])
			off

		#>

		#< @FunctionAlternativeForms

		def ToListOfChars()
			return This.Chars()

			#< @FunctionFluentForm

			def ToListOfCharsQR(pcReturnType)
				if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.Chars() )

				on :stzListOfChars
					return new stzListOfChars( This.Chars() )

				on :stzListOfStrings
					return new stzListOfStrings( This.Chars() )

				other
					stzRaise("Unsupported type!")
				off 

			def ToListOfCharsQ()
				return This.ToListOfCharsQR(:stzListOfChars)

			def ToStzListOfChars()
				return This.ToListOfCharsQR(:stzListOfChars)


			#>
	
		#>
			
	def ToListOfStzChars()
		aResult = []
		for i = 1 to This.NumberOfChars()
		# Warning: Note that using 'for in' yields erronous
		# result for strings coded on more then 1 byte
			aResult + new stzChar(This[i])
		next
		return aResult

		#< @FunctionFluentForm

		def ToListOfStzCharsQ()
			return new stzList( This.ToListOfStzChars() )

		#>

	  #-----------------------------------------------------#
	 #  CHECKING IF THE STRING IS THE NAME OF A FUNCTION   #
	#-----------------------------------------------------#
	/*
	TODO: Distinguish between Ring, Softanza, Qt, and other
	libraries functions, classes, and attributes.
	*/

	def IsAFunction()
		if ring_find( functions(), This.Lowercased() ) > 0
			return TRUE
		else
			return FALSE
		ok
 
		def IsAFunctionName()
			return This.IsAFunction()

		def IsFunction()
			return This.IsAFunction()

		def IsFunctionName()
			return This.IsAFunction()

		#--

		def IsFunc()
			return This.IsAFunction()

		def IsFunctName()
			return This.IsAFunction()

	  #--------------------------------------------------#
	 #  CHECKING IF THE STRING IS THE NAME OF A CLASS   #
	#--------------------------------------------------#

	def IsAClass()
		if ring_find( classes(), This.Lowercased() ) > 0
			return TRUE
		else
			return FALSE
		ok

		def IsAClassName()
			return This.IsAClass()

		def IsClass()
			return This.IsAClass()

		def IsClassName()
			return This.IsAClass()

	  #------------------------------------------------------#
	 #  CHECKING IF THE STRING IS THE NAME OF AN ATTRIBUTE  # TODO
	#------------------------------------------------------#

	def IsAnAttributeOfClass(pcClass)
		acTheseAttributes = Stz( Q(pcClass).FirstNCharsRemeoved(3), :Attributes )
		bResult = This.ExistsInCS( acTheseAttributes, :CS = FALSE )
		return bResult

		def IsAnAttributeInClass(pcClass)
			return This.IsAnAttributeOfClass(pcClass)

		def IsAnAttributeOf(pcClass)
			return This.IsAnAttributeOfClass(pcClass)

		def IsAnAttributeIn(pcClass)
			return This.IsAnAttributeOfClass(pcClass)

		def IsAttributeOfClass(pcClass)
			return This.IsAnAttributeOfClass(pcClass)

		def IsAttributeInClass(pcClass)
			return This.IsAnAttributeOfClass(pcClass)

		def IsAttributeOf(pcClass)
			return This.IsAnAttributeOfClass(pcClass)

		def IsAttributeIn(pcClass)
			return This.IsAnAttributeOfClass(pcClass)

	  #------------------------------------------------------#
	 #  CHECKING IF THE STRING IS THE NAME OF AN ATTRIBUTE  # TODO
	#------------------------------------------------------#

	def IsAMethodOfClass(pcClass)
		acTheseMethods = Stz( Q(pcClass).FirstNCharsRemeoved(3), :Methods )
		bResult = This.ExistsInCS( acTheseMethods, :CS = FALSE )
		return bResult

		def IsAMethodInClass(pcClass)
			return This.IsAMethodOfClass(pcClass)

		def IsAMethodOf(pcClass)
			return This.IsAMethodOfClass(pcClass)

		def IsAMethodIn(pcClass)
			return This.IsAMethodOfClass(pcClass)

		def IsMethodOfClass(pcClass)
			return This.IsAMethodOfClass(pcClass)

		def IsMethodInClass(pcClass)
			return This.IsAMethodOfClass(pcClass)

		def IsMethodOf(pcClass)
			return This.IsAMethodOfClass(pcClass)

		def IsMethodIn(pcClass)
			return This.IsAMethodOfClass(pcClass)

	  #----------------------------------------#
	 #      CHECKING IF ALL CHARS ARE ...     #
	#----------------------------------------#

	def AllCharsAre(pDescriptor)
		/* EXAMPLE

		? Q("248").AllCharsAre([ :Even, :Positive, :Numbers ])
		#--> TRUE

		? Q("248").AllCharsAre([ :Even, W('Q(@char).IsANumber()'), :Numbers ])
		#--> TRUE

		? Q(",:;").AllCharsAre(:Punctuations)

		*/

		if isString(pDescriptor)
			return This.AllCharsAreXT([ pDescriptor ], :EvalDirection = :Nothing)

		but isList(pDescriptor) and Q(pDescriptor).IsListOfStrings()
			return This.AllCharsAreXT(pDescriptor, :EvalDirection = :Nothing)

		ok	

	def AllCharsAreXT(pacDescriptors, paEvalDirection)

		if NOT ( isList(pacDescriptors) and Q(pacDescriptors).IsListOfStrings() )
			stzRaise("Incorrect param type! pacDescriptors must be a list of strings.")
		ok

		if isList(paEvalDirection) and
		   Q(paEvalDirection).IsOneOfTheseNamedParams([
			:Eval, :Evaluate,
			:EvalFrom, :EvaluateFrom,
			:EvalDirection, :EvaluationDirection
		   ])

			paEvalDirection = paEvalDirection[2]
		ok

		if NOT Q(paEvalDirection).IsOneOfTheseCS([
			:Default, :Nothing,
			:LeftToRight, :RightToLeft,
			:Left2Right, :Right2Left,
			:FromLeftToRight, :FromRightToLeft,
			:FromLeft2Right, :FromRight2Left,
			:LTR, :RTL, :L2R, :R2L,
			:FromLTR, :FromRTL, :FromL2R, :FromR2L
			], :CS = FALSE)

			stzRaise("Incorrect param value for paEvalDirection! Allowed values are :RightToLeft and :LeftToRight.")
		ok

		if Q(paEvalDirection).IsEither(:Default, :Or = :Nothing)
			paEvalDirection = :RightToLeft
		ok

		# Doing the job

		acDescriptors = pacDescriptors
		if Q(paEvalDirection).IsOneOfTheseCS([
			:RightToLeft,
			:Right2Left,
			:FromRightToLeft,
			:FromRight2Left,
			:RTL, :R2L,
			:FromRTL, :FromR2L
			], :CS = FALSE)

			acDescriptors = Q(acDescriptors).Reversed()
		ok

		if len(acDescriptors) = 1
			if acDescriptors[1] = :Number or acDescriptors[1] = :Numbers
				cMethod = :IsANumber

			but acDescriptors[1] = :String or acDescriptors[1] = :Strings
				cMethod = :IsAString

			but acDescriptors[1] = :List or acDescriptors[1] = :Lists
				Method = :IsAList

			but acDescriptors[1] = :Object or acDescriptors[1] = :Objects
				cMethod = :IsAnObject

			but Q(acDescriptors[1]).FirstChar() = "{" and
			    Q(acDescriptors[1]).LastChar() = "}"

				bResult = This.Check( :That = acDescriptors[1] )
				return bResult
			
			else

				cMethod = Q(acDescriptors[1]).InfereMethod(:From = :stzChar)

			ok

			bResult = This.Check( :That = 'StzCharQ(@char).' + cMethod + "()" )

		else

			cType = Q(acDescriptors[1]).InfereType()
			if Q(cType).StartsWithCS("stz", :CS = FALSE)
				cType = Q(cType).FirstNCharsRemoved(3)
			ok

			bResult = TRUE
	
			for i = 2 to len(acDescriptors)

 				if Q(acDescriptors[i]).FirstChar() = "{" and
			   	   Q(acDescriptors[i]).LastChar() = "}"

					bOk = This.Check( :That = acDescriptors[i] )
				
				else

					cMethod = Q(acDescriptors[i]).InfereMethod( :From = 'stz' + cType )
					bOk = This.Check( :That = 'Stz' + cType + 'Q(@item).' + cMethod + "()" )
				ok

				if bOk = FALSE
					bResult = FALSE
					exit
				ok
			next
		ok

		return bResult

	  #---------------------------------------------#
	 #      CHARS VERIFYING A GIVEN CONDITION      #
	#---------------------------------------------#
	
	def CharsW(pcCondition)
		aResult = This.YieldW('@char', pcCondition)
		return aResult

		def CharsWhere(pcCondition)
			return This.CharsW(pcCondition)

		def AllCharsWhere(pcCondition)
			return This.CharsW(pcCondition)

		def AllCharsW(pcCondition)
			return This.CharsW(pcCondition)

		def OnlyW(pcCondition)
			return This.CharsW(pcCondition)

		# The use of Item instead of Char is required by some
		# features of natural-coding (namely the IsA() function
		# is stzChainOfTruth class
		def ItemsW(pcCondition)
			return This.CharsW(pcCondition)

		def ItemsWhere(pcCondition)
			return This.CharsW(pcCondition)

	  #-------------------------------------------------------#
	 #      NUMBER OF CHARS VERIFYING A GIVEN CONDITION      #
	#-------------------------------------------------------#

	def NumberOfCharsW(pcCondition)
		return len( This.CharsW(pcCondition) )

		def NumberOfCharsWhere(pcCondition)
			return This.NumberOfCharsW(pcCondition)

		def CountCharsW(pcCondition)
			return This.NumberOfCharsW(pcCondition)

		def CountW(pcCondition)
			return This.NumberOfCharsW(pcCondition)

		def CountCharsWhere(pcCondition)
			return This.NumberOfCharsW(pcCondition)

		# Items-based naming as required for natural-coding

		def NumberOfItemsW(pcCondition)
			return This.NumberOfCharsW(pcCondition)

		def NumberOfItemsWhere(pcCondition)
			return This.NumberOfCharsW(pcCondition)

	  #-----------------------#
	 #   STRING IS A CHAR?   #
	#-----------------------#

	def IsChar()
		if This.NumberOfChars() = 1
			return TRUE
		else
				
			return FALSE
		ok

		def IsAChar()
			return This.IsChar()

	def IsNullOrChar()
		return isNull(This.Content()) or This.IsChar()

		def IsCharOrNull()
			return This.IsNullOrChar()

		def IsEmptyOrChar()
			return This.IsNullOrChar()

		def IsCharOrEmpty()
			return This.IsNullOrChar()

	def IsAsciiChar()
		if This.Unicode() <= 255
			return TRUE
		else
			return FALSE
		ok

		if oCopy.IsEmpty()
			return TRUE
		else
			return FALSE
		ok

	  #---------------------------#
	 #   STRING MADE OF CHARS?   #
	#---------------------------#

	def IsMadeOfChar(c)
		if ( NOT This.IsEmpty() ) and  StringIsChar(c)
			return This.IsMadeOf([ c ])
		else
			return FALSE
		ok

	def IsMadeOfSome(acSubstrings)
		oCopy = This.Copy()
		
		for cSubstr in acSubstrings
			if This.Contains(cSubStr)
				oCopy.RemoveAll(cSubStr)
			ok
		next

		if oCopy.IsEmpty()
			return TRUE
		else
			return FALSE
		ok

		return FALSE

		def IsMadeOfSomeOfThese(acSubstrings)
			return This.IsMadeOfSome(acSubstrings)

		def IsMadeOfSomeOfTheseSubstrings(acSubstrings)
			return This.IsMadeOfSome(acSubstrings)

	def IsMadeOfSomeOfTheseChars(acChars)
		if ListIsListOfChars(acChars)
			return This.IsMadeOfSome(acChars)
		else
			stzRaise("You must provide a list of chars!")
		ok

	   #------------------------------------------------#
	 #   STRING IS A CHAR IN A COMPUTABLE FORM ("c")   #
	#-------------------------------------------------#

	def IsCharInComputableForm()
		if This.IsChar() and This.IsInComputableForm()
			return TRUE
		else
			return FALSE
		ok

	def IsAsciiCharInString()
		if This.NumberOfChars() = 3 and
		   (This.IsBoundedBy("'", "'") or
		   This.IsBoundedBy('"', '"'))
			return StzStringQ(This[2]).IsAsciiChar()
		else
			return FALSE
		ok

	  #------------------#
	 #   UNIQUE CHARS   #
	#------------------#

	def UniqueChars()
		return This.ToSetOfChars()

		#< @FunctionFluentForm

			def UniqueCharsQ()
			return This.UniqueCharsQR(:stzList)
		#>

		def UniqueCharsQR(pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.UniqueChars() )

			on :stzListOfStrings
				return new stzListOfStrings( This.UniqueChars() )

			on :stzListOfChars
				return new stzListOfChars( This.UniqueChars() )

			other
				stzRaise("Unsupported return type!")
			off

		#>

	def RemoveDuplicatedChars()
		cNewString = This.UniqueCharsQR(:stzListOfStrings).Concatenated()
		This.Update(cNewString)

		def RemoveDuplicatedCharsQ()
			This.RemoveDuplicatedChars()
			return This
	
	def DuplicatedCharsRemoved()
		cResult = This.Copy().RemoveDuplicatedCharsQ().Content()
		return cResult

	  #-------------------------------#
	 #   CHAR AT A GIVEN POSITION    #
	#-------------------------------#
	
	def NthChar(n)
		if NOT isNumber(n)
			stzRaise("Incorrect param type! n should be a number.")
		ok

		if n = 0 or n > This.NumberOfChars()
			return NULL
		else
			return @oQString.mid(n-1, 1)
		ok

		#< @FunctionFluentForm
		
		def NthCharQR(n, pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzChar
				return new stzChar( This.NthChar(n) )
			on :stzString
				return new stzString( This.NthChar(n) )
			other
				stzRaise("Unsupported return type!")
			off

		def NthCharQ(n)
			return This.NthCharQR(n, :stzChar)

		#>
	
		#< @FunctionAlternativeForms

		def CharAt(n)
			return This.NthChar(n)

			def CharAtQR(n, pcReturnType)
				if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok

				return This.NthCharQR(n, pcReturnType)
	
			def CharAtQ(n)
				return This.CharAtQR(n, :stzChar)

		def CharAtPosition(n)
			return This.NthChar(n)

			def CharAtPositionQR(n, pcReturnType)
				return This.CharAtQR(n, pcReturnType)

			def CharAtPositionQ(n)
				return This.CharAtPositionQR(n, :stzChar)

		def CharN(n)
			return This.NthChar(n)

			def CharNQR(n, pcReturnType)
				return CharAtQR(n, pcReturnType)
	
			def CharNQ(n)
				return This.CharAtQR(n, :stzChar)

		def Char(n)
			return This.NthChar(n)

			def CharQR(n, pcReturnType)
				return CharAtQR(n, pcReturnType)
	
			def CharQ(n)
				return This.CharAQR(n, :stzChar)

		#>

	  #-------------------------------------------------#
	 #   NTH CHAR TO THE LAST (OR TO THE FIRST) CHAR   #
	#-------------------------------------------------#

	def NthToLast(n)
		return This.CharAtPosition( This.NumberOfChars() - n )

	def NthToFirst(n)
		return This.CharAtPosition(n + 1)

	  #-------------------------------#
	 #   CHARS AT A GIVEN POSITIONS   #
	#-------------------------------#
	
	def CharsAtPositions(panPositions)
		if NOT ( isList(panPositions) and Q(panPositions).IsListofNumbers() )
			stzRaise("Incorrect param! panPositions must be a list of numbers.")
		ok

		acResult = []

		for n in panPositions
			acResult + This.CharAt(n)
		next

		return acResult

		def CharsAtPositionsQ(panPosirtions)
			return This.CharsAtPositionsQR(panPositions, :stzList)

		def CharsAtPositionsQR(panPositions, pcReturnType)
			if isList(pcReturnType) and Q(pcReturnType).IsReturnTypeNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			if NOT isString(pcReturnType)
				stzRaise("Incorrect param! pcReturnType must be a string.")
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.CharsAtPositionsQR(panPositions, pcReturnType) )

			on :stzListOfStrings
				return new stzListOfStrings( This.CharsAtPositionsQR(panPositions, pcReturnType) )

			on :stzListOfChars
				return new stzListOfChars( This.CharsAtPositionsQR(panPositions, pcReturnType) )

			other
				stzRaise("Insupported param type!")
			off

	  #---------------------------#
	 #   FIRST AND LAST CHARS    #
	#---------------------------#
		
	def FirstChar()
		return This[1]

		#< @FunctionFluentForm

		def FirstCharQ()
			return This.FirstCharQR(:stzString)

		def FirstCharQR(pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzString
				return new stzString( This.FirstChar() )
			on :stzChar
				return new stzChar( This.FirstChar() )
			other
				stzRaise("Unsupported return type!")
			off

		#>

	def LastChar()
		return This[ This.NumberOfChars() ]

		#< @FunctionFluentForm

		def LastCharQ()
			return This.LastCharQR(:stzString)

		def LastCharQR(pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzString
				return new stzString( This.LastChar() )
			on :stzChar
				return new stzChar( This.LastChar() )
			other
				stzRaise("Unsupported return type!")
			off
	
		#>

		#< @FunctionAlternativeForms

		def الحرف_الأخير()
			return This.LastChar()

			def oالحرف_الأخير()
				return This.LastChar()
	
		def DernierCaractère()
			return This.LastChar()

		#>

	  #---------------------------#
	 #   LEFT AND RIGHT CHARS    #
	#---------------------------#
		
	def LeftChar()
		if This.IsLeftToRight()
			return This.FirstChar()
		else
			return This.LastChar()
		ok

		#< @FunctionFluentForm

		def LeftCharQ()
			return This.LeftCharQR(:stzString)

		def LeftCharQR(pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzString
				return new stzString( This.LeftChar() )
			on :stzChar
				return new stzChar( This.LeftChar() )
			other
				stzRaise("Unsupported return type!")
			off

		#>

	def RightChar()
		if This.IsLeftToRight()
			return This.LastChar()
		else
			return This.FirstChar()
		ok

		#< @FunctionFluentForm

		def RightCharQ()
			return This.RightCharQR(:stzString)

		def RightCharQR(pcReturnType)
			if isList(pcReturnType) and StzListQ(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzString
				return new stzString( This.RightChar() )
			on :stzChar
				return new stzChar( This.RightChar() )
			other
				stzRaise("Unsupported return type!")
			off
	
		#>

	  #-----------------------#
	 #   NUMBER OF CHARS     #
	#-----------------------#

	/* TODO
	Reimplement this function using QTextBoundaryFinder
	https://doc.qt.io/qt-5/qtextboundaryfinder.html#details
	*/

	def NumberOfChars()
		return @oQString.count()

		def NumberOfCharsQ()
			return new stzNumber(This.NumberOfChars())

		def 字符数()
			return This.LastChar()

		def Size()
			return This.NumberOfChars()

		def SizeInChars()
			return This.NumberOfChars()

		def NumberOfItems()
			return This.NumberOfChars()

		def Length()
			return This.NumberOfChars()
	
	def NumberOfLetters()
		return len(This.OnlyLetters())

		def NumberOfLettersQ()
			return new stzNumber(This.NumberOfLetters())
	
	def NumberOfSpaces()
		return len(This.FindAll(" "))

		def NumberOfSpacesQ()
			return new stzNumber(This.NumberOfSpaces())

	  #--------------------------------------------------------------#
	 #  CHECKING IF THE STRING HAS MORE ITEMS THAN AN OTHER STRING  #
	#--------------------------------------------------------------#

	def HasMoreNumberOfChars(paOtherString)
		if isList(paOtherString) and Q(paOtherString).IsThenNamedParam()
			paOtherString = paOtherString[2]
		ok

		if This.NumberOfChars() > len(paOtherString)
			return TRUE
		else
			return FALSE
		ok

		def HasMoreChars(paOtherString)
			return This.HasMoreNumberOfChars(paOtherString)

		def IsLarger(paOtherString)
			return This.HasMoreNumberOfChars(paOtherString)

	  #--------------------------------------------------------------#
	 #  CHECKING IF THE STRING HAS LESS ITEMS THAN AN OTHER STRING  #
	#--------------------------------------------------------------#

	def HasLessNumberOfChars(paOtherString)
		if isList(paOtherString) and Q(paOtherString).IsThenNamedParam()
			paOtherString = paOtherString[2]
		ok

		if This.NumberOfChars() < len(paOtherString)
			return TRUE
		else
			return FALSE
		ok

		def HasLessChars(paOtherString)
			return This.HasLessNumberOfChars(paOtherString)

		def IsSmaller(paOtherString)
			return This.HasLessNumberOfChars(paOtherString)

	  #-----------------------#
	 #   IS IT A LETTER?     #
	#-----------------------#

	def IsLetter()
		if This.IsChar() and StzCharQ(This.Content()).IsLetter()
			return TRUE
		else
			return FALSE
		ok
		
	  #------------------------------------------------------#
	 #    STRING IS IN A COMPUTABLE FORM ("str" or 'str')   #
	#------------------------------------------------------#

	def IsInComputableForm()
		if This.NumberOfChars() > 2 and
		   (This.IsBoundedBy("'", "'") or
		    This.IsBoundedBy('"', '"'))

			return TRUE
		else
			return FALSE
		ok
	
	  #-------------------------#
	 #    MADE OF SUBSTRINGS   #
	#-------------------------#

	def IsMadeOf(acSubStr)
		oCopy = This.Copy()
		
		for cSubstr in acSubStr
			if NOT This.Contains(cSubStr)
				return FALSE
			ok

			oCopy.RemoveAll(cSubStr)
		next

		if oCopy.IsEmpty()
			return TRUE
		else
			return FALSE
		ok

		def IsMadeOfThese(acSubStr)
			return This.IsMadeOf(acSubStr)

		def IsMadeOfTheseSubstrings(acSubStr)
			This.IsMadeOf(acSubStr)

	def IsMadeOfTheseChars(acChars)
		if ListIsListOfChars(acChars)
			return This.IsMadeOf(acChars)
		else
			stzRaise("You must provide a list of chars!")
		ok

	  #---------------------#
	 #    MADE OF SPACES   #
	#---------------------#
	
	def IsMadeOfSpaces()
		if This.NumberOfSpaces() = This.NumberOfChars()
			return TRUE
		else
			return FALSE
		ok

	  #-----------------#
	 #   MULTIPLY BY   #	TODO: reclassify it with other calculations
	#-----------------#

	def MultiplyBy(pValue)
			cResult = NULL

			if ring_type(pValue) = "NUMBER"
				cResult = This.RepeatNTimesQ(pValue).Content()
		
			but ring_type(pValue) = "STRING"

				if pValue = NULL { return NULL }

				cResult = NULL
				cTemp = NULL

				for i=1 to This.NumberOfChars()
					cTemp = @oQString.mid(i-1,1) + pValue
					cResult += cTemp
				next
		
			but ring_type(pValue) = "LIST"
				aValue = pValue // just for expressivity
				cResult = ""
				cTemp = ""
				
				for i=1 to This.NumberOfChars()
					for v=1 to len(aValue)
						cTemp = @oQString.mid(i-1,1) + aValue[v]
						cResult += cTemp 
					next
										
					if i != NumberOfChars() // avoiding adding space at the end
						cResult += " "
					ok
				next
			ok

			This.Update( cResult )

		#< @FunctionFluentForm

		def MultiplyByQ(pValue)
			This.MultiplyBy(pValue)
			return This

		#>

	  #----------------------------------------#
	 #     BOXING THE STRING AND ITS CHARS    #
	#----------------------------------------#
	
	def Box() # Undersatnd it as a verb action on the string

		return This.BoxXT([])

		#< @FunctionFluentForm

		def BoxQ()
			return new stzString( This.Box() )
		#>

		def Boxed()
			return This.BoxQ().Content()

	def BoxDashed()
		return This.BoxXT([ :Line = :Dashed ])

		#< @FunctionFluentForm

		def BoxDashedQ()
			return new stzString( This.BoxDashed() )
		#>

		def BoxedDashed()
			return This.BoxDashedQ().Content()

	def BoxRound()
		return This.BoxXT([ :AllCorners = :Round ])

		#< @FunctionFluentForm

		def BoxRoundQ()
			return new stzString( This.BoxRound() )
		#>

		def BoxedRound()
			return This.BoxRoundQ().Content()

	def BoxRoundDashed()
		return This.BoxXT([ :Line = :Dashed, :AllCorners = :Round ])

		#< @FunctionFluentForm

		def BoxRoundDashedQ()
			return new stzString( This.BoxRoundDashed() )
		#>

		def BoxedRoundDashed()
			return This.BoxRoundDashedQ().Content()

	def BoxDashedRound()
		return This.BoxRoundDashed()

		#< @FunctionFluentForm

		def BoxDashedRoundQ()
			return new stzString( This.BoxDashedRound() )
		#>

		def BoxedDashedRound()
			return This.BoxDashedRoundQ().Content()

	def BoxEachChar()
		return This.BoxXT([ :EachChar = TRUE ])

		#< @FunctionFluentForm

		def BoxEachCharQ()
			return new stzString( This.BoxEachChar() )
		#>

		def EachCharBoxed()
			return This.BoxEachCharQ().Content()

	def BoxEachCharRound()
		return This.BoxXT( [ :AllCorners = :Round, :EachChar = TRUE ])

		#< @FunctionFluentForm

		def BoxEachCharRoundQ()
			return new stzString( This.BoxEachCharRound() )
		#>

		def EachCharboxedRound()
			return This.BoxEachCharRoundQ().Content()

	def BoxEachCharXT(paBoxOptions)
		if StzHashListQ(paBoxOptions).ContainsKey( :EachChar )
			paBoxOptions = StzHashListQ(paBoxOptions).UpdateValueByKeyQ( :EachChar, TRUE ).Content()
		else
			paBoxOptions = StzHashListQ(paBoxOptions).AddPairQ( :EachChar = TRUE ).Content()
		ok

		return This.BoxedXT(paBoxOptions)

		#< @FunctionFluentForm

		def BoxEachCharXTQ(paBoxOptions)
			return new stzString( This.BoxedEachCharXT(paBoxOptions) )

		#>

		def EachCharBoxedXT(paBoxOptions)
			return This.BoxEachCharXTQ(paBoxOptions).Content()

	def BoxXT(paBoxOptions)

		/*
		Example:

		? StzStringQ("TEXT1").BoxXT([

			:Line = :Thin,	# or :Dashed
		
			:AllCorners = :Round, # can also be :Rectangualr
			# :Corners = [ :Round, :Rectangular, :Round, :Rectangular ],
		
			:TextAdjustedTo = :Center # or :Left or :Right or :Justified

		]).Content()

		--> Gives:
		╭───────────────╮
		│     TEXT1     │ 
		╰───────────────╯

		The list of possible options, as you find inforced in
		stzList.IsTextBoxedOptionsNamedParam(), are:

			aListOfBoxOptions = [
				# General options
				:Line,
				:AllCorners,
				:Corners,
				:Width,
				:TextAdjustedTo,

				# Options speciefic to list of chars and words
				:EachChar,
				:EachWord,
				:Hilighted,
				:HilightedIf,
				:Numbered
			]

		*/

		if StzListQ(paBoxOptions).IsTextBoxedOptionsNamedParam()

			# Reading the type of line (thin or dashed)

			cLine = :Thin # By default

			if paBoxOptions[ :Line ] = :Dashed
				cLine = :Dashed
			ok

			# Reading the type of corners (rectangualr or round)

			cAllCorners = :Rectangular # By default

			if paBoxOptions[ :AllCorners ] = :Round
				cAllCorners = :Round
			ok

			aCorners = []
			if cAllCorners = :Rectangular
				 # By default
				aCorners = [ :Rectangular, :Rectangular, :Rectangular, :Rectangular ]

			but cAllCorners = :Round
				aCorners = [ :Round, :Round, :Round, :Round ]

			ok

			if len(paBoxOptions[:Corners]) = 4 and
			   StzListQ( paBoxOptions[:Corners] ).IsMadeOfSome([ :Rectangular, :Round ])
	
				aCorners = paBoxOptions[:Corners]

			ok

			# If the boxing happens at the char level, delegate it
			# to the stzListOfChars class

			if paBoxOptions[ :EachChar ] = TRUE
				return StzListOfCharsQ( This.String() ).BoxedXT(paBoxOptions)
			ok

			# If the boxing happens at the word level, delegate it
			# to the stzListOfStrings class

			if paBoxOptions[ :EachWord ] = TRUE
				return This.ToListOfStringsQ().Boxed(paBoxOptions)
			ok

			# Reading the width of the box in number of chars

			nWidth = This.NumberOfChars() + 2 # By default

			if isNumber(paBoxOptions[:Width]) and
			   paBoxOptions[:Width] > This.NumberOfChars() + 2

				nWidth = paBoxOptions[:Width]
			ok

			# Reading the text adjustment option

			cTextAdjustedTo = :Center # By default

			oString = new stzString( paBoxOptions[ :TextAdjustedTo ] )
			if oString.IsOneOfThese([ :Left, :Center, :Right, :Justified ])

				cTextAdjustedTo = paBoxOptions[ :TextAdjustedTo ]
			ok
 
			# Composing the box

			cVTrait  = "│"

			cHTrait  = "─"

			if cLine = :Dashed
				cHTrait = "╌"
				cVTrait = "┊"
			ok
			
			
			cCorner1 = "┌"
			cCorner2 = "┐"
			cCorner3 = "┘"
			cCorner4 = "└"

			if  aCorners[1] = :Round
				cCorner1 = "╭"
			ok

			if aCorners[2] = :Round
				cCorner2 = "╮"
			ok

			if aCorners[3] = :Round
				cCorner3 = "╯"
			ok

			if aCorners[4] = :Round
				cCorner4 = "╰"
			ok

			cUpLine = cCorner1 +
				  StzStringQ(cHTrait).RepeatNTimesQ(nWidth).Content() +
				  cCorner2 

			
			cMidLine = cVTrait + " " +
				   This.AlignXTQ(nWidth - 2, " ", cTextAdjustedTo).Content() +
				   " " +
				   cVTrait

			cDownLine = cCorner4 +
				  StzStringQ(cHTrait).RepeatNTimesQ(nWidth).Content() +
				  cCorner3 

			return cUpLine + NL + cMidLine + NL + cDownLine

		but isList(paBoxOptions) and len(paBoxOptions) = 0
			# Do nothing, takes default options for boxing

		else
			stzRaise(stzStringError(:CanNotBoxTheString))
		ok

		#< @FunctionFluentForm

		def BoxedXTQ(paBoxOptions)
			return new stzString( This.BoxXT(paBoxOptions) )

		#>

		def BoxedXT(paBoxOptions)
			return This.BoxXT(paBoxOptions)

	  #-------------------------------------------------#
	 #   STRING EXISTENCE AS AN OTHER STRING OR LIST   #
	#-------------------------------------------------#

	def ExistsInCS( pStrOrList, pCaseSensitive )
		if isString(pStrOrList)
			return This.ExistsInStringCS( pStrOrList, pCaseSensitive )

		but isList(pStrOrList)
			return This.ExistsInListCS( pStrOrList, pCaseSensitive )

		else
			stzRaise("Unsupported param type! pStrOrList must be a string or list")
		ok

	def ExistsIn(pStrOrList)
		return This.ExistsInCS( pStrOrList, :CaseSensitive = TRUE )

	  #--------------------------------------------------------#
	 #   STRING EXISTENCE AS A SUBSTRING IN AN OTHER STRING   #
	#--------------------------------------------------------#

	def ExistsInStringCS(pcStr, pCaseSensitive)
		if NOT isString(pcStr)
			stzRaise("Incorrect param! pcStr must be a string.")
		ok

		bResult = StzStringQ(pcStr).ContainsCS( This.String(), pCaseSensitive )
		return bResult

		def ExistsAsSubStringInStringCS(pcStr, pCaseSensitive)
			return This.ExistsInStringCS(pcStr, pCaseSensitive)

	def ExistsInString(pcStr)
		return This.ExistsInStringCS(pcStr, :CaseSensitive = TRUE)

		def ExistsAsSubStringInString(pcStr)
			return This.ExistsInStringC(pcStr)

	  #-------------------------------------------------#
	 #   STRING EXISTENCE AS AN ITEM IN A GIVEN LIST   #
	#-------------------------------------------------#

	def ExistsInListCS(paList, pCaseSensitive)

		if NOT isList(paList)
			stzRaise("Incorrect param! paList must be a list.")
		ok

		bResult = FALSE

		for item in paList
			if isString(item) and Q(item).IsEqualToCS( This.String(), pCaseSensitive )
				bResult = TRUE
				exit
			ok
		next

		return bResult

		def ExistsAsItemInListCS(paList, pCaseSensitive)
			return This.ExistsInListCS(paList, pCaseSensitive)

		def IsOneOfTheseCS(paList, pCaseSensitive)
			return This.ExistsInListCS(paList, pCaseSensitive)

		def IsOneOfCS(paList, pCaseSensitive)
			return This.ExistsInListCS(paList, pCaseSensitive)

	#--

	def ExistsInList(paList)
		return This.ExistsInListCS(paList, :CaseSensitive = TRUE)

		def ExistsAsItemInList(paList)
			return This.ExistsInList(paList)

		def IsOneOfThese(paList)
			return This.ExistsInList(paList)

		def IsOneOf(paList)
			return This.ExistsInList(paList)

	  #----------------------------------------------------#
	 #  CHECHKING IF THE STRING IS EQUAL TO VAL1 OR VAL2  #
	#----------------------------------------------------#
	// TODO: Add same function to other classes

	def IsEitherCS(pcStr1, pcStr2, pCaseSensitive)

		if isList(pcStr1) and Q(pcStr1).IsThisNamedParam()
			pcStr1 = pcStr1[2]
		ok

		if isList(pcStr2) and
			Q(pcStr2).IsOneOfTheseNamedParams([ :Or, :OrThat, :OrThis ])

			pcStr2 = pcStr2[2]
		ok

		if NOT BothAreStrings(pcStr1, pcStr2)
			stzraise("Incorrect param type! Both pcStr1 and pcStr2 must be strings.")
		ok

		bResult = This.IsOneOfTheseCS([ pcStr1, pcStr2 ], pCaseSensitive)
		return bResult

	#-- WITHOUT CASESENSITIVITY

	def IsEither(pcStr1, pcStr2)
		return This.IsEitherCS(pcStr1, pcStr2, :CaseSensitive = TRUE)

	  #---------------------------------------------#
	 #  MOVING CHAR AT POSITION N1 TO POSITION N2  #
	#---------------------------------------------#

	def Move(n1, n2)

		# Checking params correctness

		if isList(n1) and
		   Q(n1).IsOneOfTheseNamedParams([
			:From, :FromPosition,
			:At, :AtPosition,
			:Char, :CharAt, :CharAtPosition,
			:FromCharAt, :FromCharAtPosition,
			:CharFrom, :CharFromPosition
		   ])

			n1 = n1[2]
		ok

		if isList(n2) and
		   Q(n2).IsOneOfTheseNamedParams([
				:To, :ToChar, :ToPosition, :ToPositionOfChar,
				:ToCharAt, :ToCharAtPosition ])

			n2 = n2[2]
		ok

		if isString(n1) and
		   Q(n1).IsOneOfThese([ :First, :FirstPosition, :FirstChar ])
				    
			n1 = 1
		ok

		if isString(n2) and
		   Q(n1).IsOneOfThese([ :Last, :LastPosition, :LastChar ])

			n2 = This.NumberOfItems()
		ok

		if NOT BothAreNumbers(n1, n2)
			stzRaise("Incorrect param type! n1 and n2 must be numbers.")
		ok

		# Doing the job
		
		if n1 > n2
		# . . . 2 . . 1 . .
		#       ^     |
		#       |_____|

			cTempChar = This[n1]
			This.RemoveCharAtPosition(n1)
			This.InsertBefore(n2, cTempChar)

		but n1 < n2
		# . . . 1 . . 2 . .
		#       |     ^
		#       |_____|

			cTempChar = This[n1]

			if n2 = This.NumberOfItems()
				This.AddChar(cTempChar)
			else
				This.InSertAfter(n2, cTempChar)
			ok

			This.RemoveCharAt(n1)
		ok

		#< @FunctionAlternativeForm

		def MoveChar(n1, n2)
			This.Move(n1, n2)

		#>

	  #-----------------------------------------#
	 #  SWAPPING CHARS AT TWO GIVEN POSITIONS  #
	#-----------------------------------------#

	def Swap(n1, n2)
		if isList(n1) and
		   Q(n1).IsOneOfTheseNamedPArams([
			:Between, :BetweenPosition, :BetweenPositions,
			:BetweenChar, :BetweenChars,
			:BetweenCharAt, :BetweenCharAtPosition, :BetweenCharAtPositions,
			:Position, :Positions, :CharAt, :CharAtPosition, :CharAtPositions,
			:CharsAt, :CharsAtPosition, :CharAtPositions
		   ])

			n1 = n1[2]
		ok

		if isList(n2) and
		   Q(n2).IsOneOfTheseNamedPArams([
			:And, :AndPosition, :AndCharAt, :AndCharAtPosition, :AndChar ])

			n2 = n2[2]
		ok

		copy = This[n2]
		This.ReplaceCharAtPosition(n2, :By = This[n1])
		This.ReplaceCharAtPosition(n1, :By = copy)

		#< @FunctionAlternativeForms

		def SwapBetween(n1, n2)
			This.Swap(n1, n2)

		def SwapBetweenPositions(n1, n2)
			This.Swap(n1, n2)

		def SwapItems(n1, n2)
			if isList(n1) and
			   Q(n1).IsOneOfTheseNamedParams([ :At, :AtPosition, :AtPositions ])
				n1 = n1[2]
			ok
	
			if isList(n2) and
			   Q(n2).IsOneOfTheseNamedParams([ :And, :AndPosition ])
				n2 = n2[2]
			ok
	
			This.Swap(n1, n2)

		def SwapChar(n1, n2)
			if isList(n1) and
			   Q(n1).IsOneOfTheseNamedParams([ :At, :AtPosition ])
				n1 = n1[2]
			ok
	
			if isList(n2) and
			   Q(n2).IsOneOfTheseNamedParams([
				:And, :AndPosition, :AndCharAt, :AndCharAtPosition ])

				n2 = n2[2]
			ok
	
			This.Swap(n1, n2)
		#>

	  #----------------------------------#
	 #   REVERSING THE ORDER OF CHARS   #
	#----------------------------------#

	def ReverseCharsOrder()
		cResult = ""
		
		for i = This.NumberOfChars() to 1 step -1
			cResult += This.NthChar(i)
		next
				
		This.Update( cResult )

		#< @FunctionFluentForm

		def ReverseCharsOrderQ()
			This.ReverseCharsOrder()
			return This
	
		#>

		#< @FunctionAlternativeForm

		def Reverse() # To stay consistent with Ring that has reverse() function
			This.ReversecharsOrder()

			def ReverseQ()
				This.Reverse()
				return This

		def ReverseChars()
			This.ReversecharsOrder()

			def ReverseCharsQ()
				This.ReverseChars()
				return This

		def ReverseOrder()
			This.ReversecharsOrder()

			def ReverseOrderQ()
				This.ReverseOrder()
				return This

		#>

	def CharsOrderReversed()
		cResult = This.Copy().ReverseCharsOrderQ().Content()
		return cResult


		#< @FunctionAlternativeForm

		def Reversed()
			return This.CharsOrderReversed()

		def CharsReversed()
			return This.CharsOrderReversed()

		def OrderReversed()
			return This.CharsOrderReversed()

		#>

	  #-----------------------------------------------------------#
	 #   INVERTING CHARS OF THE STRING (IF POSSIBLE IN UNICODE)  #
	#-----------------------------------------------------------#

	# Inverting (or turning) chars and strings
	# NOTE: In the mean time, Softanza uses Invert()
	# and Turn() as alternatives, but this should
	# change in the future to cope with their exact
	# meaning in Unicode!

	# NOTE: This is different from REVERSE() that Softanza
	# uses conforming to its Ring meaning (reversing the order
	# of the chars). See examples below to see how...

	def Invert()
		/*
		Example:
		? StzStringQ("LIFE").Turned()
		# --> ƎℲI⅂
		*/

		# Applies to latin script only

		if NOT This.ToStzText().ScriptIs(:Latin)
			return This.String()
		ok

		cResult = ""

		for i = 1 to This.NumberOfChars()
			cResult += StzCharQ( This.NthChar(i) ).Inverted()
		next

		This.Update( cResult )

		#< @FunctionFluentForm

		def InvertQ()
			This.Invert()
			return This

		def InvertChars()
			This.Invert()

			def InvertCharsQ()
				This.InvertChars()
				return This
		#>

		#< @FunctionAlternativeForm

		def Turn()
			This.Invert()

			def TurnQ()
				This.Turn()
				return This

		def TurnChars()
			This.Invert()

			def TurnCharsQ()
				This.TurnChars()
				return This

		#>

	def Inverted()
		return This.Copy().InvertQ().Content()

		def CharsInverted()
			return This.Inverted()

		def Turned()
			return This.Inverted()

		def CharsTurned()
			return This.Inverted()

	  #--------------------------------------------------#
	 #  CHECKING IF THE STRING IS MADE OF TURNED CHARS  #
	#--------------------------------------------------#

	def IsInverted()
		bResult = TRUE

		for c in This.String()
			if NOT StzCharQ(c).IsInverted()
				bResult = FALSE
				exit
			ok
		next

		return bResult

		def CharsAreInverted()
			return This.IsInverted()

	  #------------------------#
	 #   HASHING THE STRING   #
	#------------------------#
	
	# Currently we use the native hashing functions of Ring StdLib
	# NOTE: other algortithms can be added through RingQt

	def Hash(pcHashingAlgo)

		cHashed = ""

		switch pcHashingAlgo

		on :MD5
			cHashed = md5( This.String() )

		on :SHA1
			cHashed = sha1( This.String() )

		on :SHA256
			cHashed = sha256( This.String() )

		on :SHA512
			cHashed = sha512( This.String() )

		on :SHA384
			cHashed = sha384( This.String() )

		on :SHA224
			cHashed = sha224( This.String() )

		other
			stzRaise("syntax error or unsupported hashing algorithm!")
		off

		This.Update( cHashed )

		#< @FunctionFluidVersion

		def HashQ(pcHashingAlgo)
			return new stzString( This.Hash(pcHashingAlgo) )

		#>

		#< @FunctionAlternativeForms

		def HashWithAlgo(pcHashingAlgo)
			return This.Hash(pcHashingAlgo)

			#< @FunctionFluentForm

			def HashWithAlgoQ(pcHashingAlgo)
				return new stzString( This.HashWithAlgo(pcHashingAlgo) )

			#>
		#>

	def HashWithMD5()
		This.Hash(:MD5)

		#< @FunctionAlternativeForms
		#>

	def HashWithSHA1()
		This.Hash(:SHA1)

		#< @FunctionAlternativeForms
		#>

	def HashWithSHA256()
		This.Hash(:SHA256)

		#< @FunctionAlternativeForms
		#>

	def HashWithSHA384()
		This.Hash(:SHA384)

		#< @FunctionAlternativeForms
		#>

	def HashWithSHA224()
		This.Hash(:SHA224)

		#< @FunctionAlternativeForms
		#>

	  #------------------------------------------#
	 #   ENCRYPTING AND DECRYPTING THE STRING   #
	#------------------------------------------#
	
	# Encrypts the string using the blowfish algorithm:
	# --> returns what's called a cipher in a binary string

	# --> TODO: - what the cIV param means?
	# 	    - check: key must be between 4 and 56 bytes long 

	def EncryptWithBlowfish(cSecretKey, cIV)
		cEncrypted = encrypt( This.String(), cSecretKey, cIV)
		This.Update( cEncrypted )

		#< @FunctionAlternativeForms

		def EncryptWithBlowfishQ(cSecretKey, cIV)
			return new stzListOfBytes( EncryptWithBlowfish(cSecretKey, cIV) )

		#>

	# Updates the string from a cipher encrypted with the blowfish algorithm
	# --> cCypher should be in binary form (list of bytes)
	def FromDecryptedWithBlowfish(cCypher, cSecret, cIV)
		This.Update( decrypt(cCypher, cSecret, cIV) )

		#< @FunctionAlternativeForms

		def FromBlowfishCipher(cCypher, cSecret, cIV)
			This.FromDecryptedWithBlowfish(cCypher, cSecret, cIV)

		#>

	  #------------------------------#
	 #   GETTING TEXT FROM A URL    #
	#------------------------------#

	def UpdateFromURL(cURL)
		This.Update( download(cURL) )

		def UpdateFromURLQ(cURL)
			This.UpdateFromURLL(cURL)
			return This

	def UpdatedFromURL(cURL)
		cResult = This.Copy().UpdateFromURLQ(cURL).Content()
		return cResult

		def FromURL(cURL)
			return This.ImportedFromURL(cURL)

	  #----------------------------------------------------#
	 #     WALKING THE STRING AND RETURNING SOMETHING     #
	#----------------------------------------------------#

	def WalkXT(paOptions)

		if NOT ( isList(paOptions) and Q(paOptions).IsHashList() )

			stzRaise("Incorrect param! paOptions must be a hashlist.")
		ok

		if NOT ( len(paOptions) = 0 or

			  StzHashListQ(paOptions).
			  KeysQR(:stzListOfStrings).IsMadeOfSomeCS([
				:From, :FromPosition, :To, :ToPosition, :Step, :Return
			  ], :CS = FALSE) )

			stzRaise("Incorrect value!")
		ok

		oKeys = StzHashListQ(paOptions).KeysQR(:stzListOfStrings)

		if oKeys.ContainsBothCS(:From, :FromPosition, :CS = FALSE)
			stzRaise("Incorrect value! paOptions must not contain both :From and :FromPosition keys.")
		ok

		if oKeys.ContainsBothCS(:To, :ToPosition, :CS = FALSE)
			stzRaise("Incorrect value! paOptions must not contain both :To and :ToPosition keys.")
		ok

		if oKeys.ContainsCS(:From, :CS = FALSE)
			n = StzHashListQ(paOptions).FindKey(:From)
			paOptions[n][1] = :FromPosition
		ok

		if oKeys.ContainsCS(:To, :CS = FALSE)
			n = StzHashListQ(paOptions).FindKey(:To)
			paOptions[n][1] = :ToPosition
		ok

		pnFromPosition = 1
		if paOptions[ :FromPosition ] != NULL
			pnFromPosition = paOptions[ :FromPosition ]
		ok

		if isString(pnFromPosition)

		   	if Q(pnFromPosition).IsOneOfTheseCS([ :First, :FirstChar ], :CS = FALSE)
				pnFromPosition = 1
			ok

		   	if Q(pnToPosition).IsOneOfTheseCS([ :Last, :LastChar ], :CS = FALSE)
				pnFromPosition = This.NumberOfChars()
			ok

		ok

		pnToPosition = This.NumberOfChars()
		if paOptions[ :ToPosition ] != NULL
			pnToPosition = paOptions[ :ToPosition ]
		ok

		pnStep = 1
		if paOptions[ :Step ] != NULL
			pnstep = paOptions[ :Step ]
		ok

		pcReturn = :WalkedChars
		if paOptions[ :Return ] != NULL
			pcReturn = paOptions[ :Return ]
		ok

		# Doing the job

		anPositions = []
		acChars = []

		for i = pnFromPosition to pnToPosition step pnStep
			anPositions + i
			acChars + This[i]
		next

		aResult = []


		if pcReturn = :WalkedPositions
			aResult = anPositions

		but pcReturn = :WalkedChars
			aResult = acChars
		ok

		return aResult

	def Walk( pnFromPosition, pnToPosition, pnStep, pcReturn )
		return This.WalkXT([ pnFromPosition, pnToPosition, pnStep, pcReturn ])

	  #--------------------------------------------#
	 #   WALKING STARTING FROM N UNTIL CHAR IS    # TODO: Redo with stzWalker
	#--------------------------------------------#

	def WalkBackwardW( paStartingAt, pcCondition )
		/*
		str = "Ring Programming Languge"
		StzStringQ(str).WalkBackwardW( :StartingAt = 12, :Until = '{ @char = " " }' )

		--> Returns 5
		*/

		cResult = ""
		bStopWalking = FALSE
		nCurrentPosition = paStartingAt[2] + 1

		while NOT bStopWalking

			nCurrentPosition--
			if nCurrentPosition = 1
				exit
			ok

			@char = This[ nCurrentPosition ]
			@i = nCurrentPosition

			cCondition = StzStringQ(pcCondition[2]).TrimQ().RemoveBoundsQ("{","}").Content()

			cCode = "if " + cCondition + NL +
				TAB + "exit" + NL +
			"ok"

			eval(cCode)
		end

		return nCurrentPosition

	def WalkUntil(pcCondition)
		return This.WalkForeward(:StartingAt = 1, :Until = pcCondition)

	def WalkForewardW( paStartingAt, pcCondition )
		/*
		str = "Ring Programming Languge"
		StzStringQ(str).WalkForewardW( :StartingAt = 6, :UntilBefore = '{ @char = "r" }' )

		--> Returns 9
		*/

		cResult = ""
		bStopWalking = FALSE
		nCurrentPosition = paStartingAt[2] + 1

		while NOT bStopWalking
			nCurrentPosition++
			if nCurrentPosition = This.NumberOfChars()
				exit
			ok

			@char = This[ nCurrentPosition ]
			@i = nCurrentPosition

			cCondition = StzStringQ(pcCondition[2]).TrimQ().RemoveBoundsQ("{","}").Content()

			cCode = "if " + cCondition + NL +
				TAB + "exit" + NL +
			"ok"

			eval(cCode)			
		end

		if nCurrentPosition = This.NumberOfChars()
			nResult = 0
		else
			nResult = nCurrentPosition-1
		ok

		return nResult

	  #----------------------------------------------------#
	 #     COMPRESSING THE STRING WITH A BINARY SCHEMA    #
	#----------------------------------------------------#

	// Example : ABCDEFGH > 10011011 => ADEGH
	def CompressUsingBinary(cBinary)

		oBinary = new stzString(cBinary)
		if NOT oBinary.IsMadeOf(["0", "1"])
			stzRaise(stzStringError(:CanNotCompressStringUsingBinary))
		ok

		cCompressed = ""

		for i=1 to len(cBinary)
			if cBinary[i] = "1" and i <= This.NumberOfChars()					
				cCompressed += This[i]
			ok
		next
			
		if This.NumberOfChars() > len(cBinary)
			for i = len(cBinary)+1 to This.NumberOfChars()
				cCompressed += This[i] 
			next
		ok

		This.Update( cCompressed )

		#< @FunctionFluentForm

		def CompressUsingBinaryQ(cBinary)
			This.CompressUsingBinary(cBinary)
			return This

		#>

	  #--------------------------------------------------------------#
	 #    CHECKING IF THE STRING CORRESPONDS TO A STZ CLASS NAME    #
	#--------------------------------------------------------------#

	def IsStzClassName()
		bResult = This.LowercaseQ().ExistsIn( StzClasses() )
		return bResult

		def IsStzType()
			return This.IsStzClassName()

		def IsStzClass()
			return This.IsStzClassName()

		def IsAStzClassName()
			return This.IsStzClassName()

		def IsAStzType()
			return This.IsStzClassName()

		def IsAStzClass()
			return This.IsStzClassName()

	  #---------------------------------#
	 #    CHECKING A LIST IN STRING    #
	#---------------------------------#

	def IsListInString()
		/* EXAMPLES
	
		o1 = new stzString('[ "A","B", "C", "D" ]')
		? o1.IsListInString() #--> TRUE
		
		o1 = new stzString(' "A":"D" ')
		? o1.IsListInString() #--> TRUE
		
		o1 = new stzString('[ "ا", "ب", "ج" ]')
		? o1.IsListInString() #--> TRUE
		
		o1 = new stzString(' "ا":"ج": ')
		? o1.IsListInString() #--> TRUE
		*/

		oCopy = This.RemoveSpacesQ().RemoveBoundsQ([ "{","}" ]).

		# A list can not be written with less then 2 chars

		if oCopy.NumberOfChars() < 2
			return FALSE
		ok

		bResult = FALSE

		# Case 1 : The list is in normal [_,_,_] fprm

		if oCopy.IsBoundedBy([ "[","]" ]) and
			oCopy.Contains(",")

			cCode = "aTempList = " + oCopy.Content()
			eval(cCode)

			bResult = isList(aTempList)

		else

		# Case 2 : The list is in short _:_ form

			if oCopy.ContainsOneOccurrence(":")

				# the : separator in _:_ can not be at the
				# beginning or the end of the list in string

				n = oCopy.FindFirst(":")
				if NOT ( n > 1 and n < oCopy.NumberOfChars() )

					bResult = FALSE

				ok

				# The list is in short form, let's analyze it
				# and tranform it to a normal syntax
	
				aListMembers = QStringListToList( oCopy.QStringObject().split( ":", 0, 0 ) )
				# NOTE: could be written { aListMembers = oCopy.Split( :Using = ":" ) } atfer
				# terminating Split() funtion in Softanza.

				cMember1 = aListMembers[1]
				cMember2 = aListMembers[2]

				cCode = "pMember1 = " + cMember1

				eval(cCode)
	
				cCode = "pMember2 = " + cMember2
				eval(cCode)
	
				cNormalSyntax = "[ "
	
				if ( isString(pMember1) and StringIsChar(pMember1) ) and
				   ( isString(pMember2) and StringIsChar(pMember2) )
					
					n1 = CharUnicode(pMember1)
					n2 = CharUnicode(pMember2)
		
					if n1 <= n2
						for n = n1 to n2
							cNormalSyntax += '"' + StzCharQ(n).Content() + '"'
							if n < n2
								cNormalSyntax += ", "
							ok
						next
		
					but n1 > n2
						for n = n1 to n2 step -1
							cNormalSyntax += '"' + StzCharQ(n).Content() + '"'
							if n > n2
								cNormalSyntax += ", "
							ok
						next
					ok
		
					cNormalSyntax += " ]"
	
				but isNumber(pMember1) and isNumber(pMember2)

					n1 = pMember1
					n2 = pMember2
		
					if n1 <= n2

						for n = n1 to n2
							cNormalSyntax += (""+ n)
							if n < n2
								cNormalSyntax += ", "
							ok
						next
		
					but n1 > n2

						for n = n1 to n2 stzp -1
							cNormalSyntax += (""+ n)
							if n > n2
								cNormalSyntax += ", "
							ok
						next
		
					ok
		
				ok

				if Q(cNormalSyntax).LastChar() != "]"
					cNormalSyntax += " ]"
				ok

				cCode = "aTempList = " + cNormalSyntax

				eval(cCode)

				bResult = isList(aTempList)

			ok  
		ok

		return bResult

	def IsListInNormalForm()
		if NOT This.IsListInString()
			return FALSE
		ok

		if This.TrimQ().IsBoundedBy([ "[","]" ])
			return TRUE
		else
			return FALSE
		ok

	def IsListInShortForm()
		if This.IsListInString() and
		  ( NOT This.IsListInNormalForm() )

			return TRUE
		else
			return FALSE
		ok

	  #--------------------------------------------#
	 #    CHECKING A CONTIGUOUS LIST IN STRING    #
	#--------------------------------------------#

	def IsContiguousListInString()

		cCode = "aTempList = " + This.ToListInNormalForm()
		eval(cCode)
		bResult = StzListQ(aTempList).IsContiguous()

		return bResult

		def IsContinuousListInString()
			return This.IsContiguousListInString()

	def IsContiguousListInNormalForm()
	
		if This.IsContiguousListInString() and
		   This.IsListInNormalForm()
		  
			return TRUE
		else
			return FALSE
		ok

		def IsContinuousListInNormalForm()
			return This.IsContiguousListInNormalForm()

	def IsContiguousListInShortForm()

		if This.IsContiguousListInString() and
		   This.IsListInShortForm()
		   
			return TRUE
		else
			return FALSE
		ok

		def IsContinuousListInShortForm()
			return This.IsContiguousListInShortForm()

	  #----------------------------------------------------------------#
	 #   CPNVERTING CONTINUOUS LISTS BETWEEN NORMAL AND SHORT FORMS   #
	#----------------------------------------------------------------#

	def ToListInShortForm()
	
		if NOT This.IsContiguousListInString()
			stzRaise([
				:Where = "stzString > ToListInShortForm()",
				:What  = "Can't convert the list in string to short form!",
				:Why   = "The list in string is not contiguous list."
			])
		ok

		cResult = ""

		if This.IsListInShortForm()
			cResult  =  This.Copy().
					RemoveSpacesQ().
					ReplaceQ(":", " : ").
					Content()

		but This.IsListInNormalForm()

			cCode = "aTempList = " + This.String()
			eval(cCode)

			if StzListQ(aTempList).IsContiguous()

				This.TrimQ().RemoveBoundsQ([ "[","]" ])
				acMembers = QStringObject().split(",", 0, 0)
				acMembers = QStringListToList(acMembers)
				acMembers = StzListQ(acMembers).FirstAndLastItems()

				/*
				TODO : replace wth this when Split() is finished.

				acMembers = This.TrimQ().
						RemoveBoundsQ("[","]").
						SplitQ(",").
						FirstAndLastItems()
				*/

						
				cMember1 = StzStringQ(acMembers[1]).Simplified()
				cMember2 = StzStringQ(acMembers[len(acMembers)]).Simplified()

				cResult = cMember1 + ":" + cMember2

			else
				cResult = This.Simplified()
			ok
		ok

		return cResult

		def ToListInShortFormQ()
			return new stzString( This.ToListInShortForm() )

		def ToListInStringInShortForm()
			return This.ToListInShortForm()

			def ToListInStringInShortFormQ()
				return new stzString( This.ToListInStringInShortForm() )

	def ToListInNormalForm()

		If NOT This.IsListInString()
			stzRaise([
				:Where = "stzString > ToListInNormalForm()",
				:What  = "Can't convert the string to short form list!",
				:Why   = "The string is not a list in string."
			])
		ok

		if This.IsListInNormalForm()
			cResult = This.Simplified()

		but This.IsListInShortForm()

			# The list is in short form, let's analyze it
			# and tranform it to a normal syntax

			aListMembers = QStringListToList( This.QStringObject().split( ":", 0, 0 ) )
			# NOTE: could be written { aListMembers = This.Split( :Using = ":" ) } atfer
			# terminating Split() funtion in Softanza.
					
			cMember1 = aListMembers[1]
			cMember2 = aListMembers[2]

			cCode = "pMember1 = " + cMember1
			eval(cCode)
		
			cCode = "pMember2 = " + cMember2
			eval(cCode)
	
			cNormalSyntax = "[ "
	
			if ( isString(pMember1) and StringIsChar(pMember1) ) and
			   ( isString(pMember2) and StringIsChar(pMember2) )
						
				n1 = CharUnicode(pMember1)
				n2 = CharUnicode(pMember2)
		
				if n1 <= n2
					for n = n1 to n2
						cNormalSyntax += '"' + StzCharQ(n).Content() + '"'
						if n < n2
							cNormalSyntax += ", "
						ok
					next
		
				but n1 > n2
					for n = n1 to n2 step -1
						cNormalSyntax += '"' + StzCharQ(n).Content() + '"'
						if n > n2
							cNormalSyntax += ", "
						ok
					next
				ok
		
				cNormalSyntax += " ]"
		
			but isNumber(pMember1) and isNumber(pMember2)

				n1 = pMember1
				n2 = pMember2
		
				if n1 <= n2

					for n = n1 to n2
						cNormalSyntax += (""+ n)
						if n < n2
							cNormalSyntax += ", "
						ok
					next
		
				but n1 > n2

					for n = n1 to n2 stzp -1
						cNormalSyntax += (""+ n)
						if n > n2
							cNormalSyntax += ", "
						ok
					next
		
				ok
		
				cNormalSyntax += " ]"
			ok

			cResult = cNormalSyntax

		ok  

		return cResult

		def ToListInNormalFormQ()
			return new stzString( This.ToListInNormalForm() )

		def ToListInStringInNormalForm()
			return This.ToListInNormalForm()

			def ToListInStringInNormalFormQ()
				return new stzString( This.ToListInStringInNormalForm() )

	def ToListInstring()
		return This.ToListInNormalForm()

		def ToListInStringQ()
			return new stzString( This.ToListInString() )

	def ToListInString@C()
		return This.ToListInShortForm()

		def ToListInString@CQ()
			return new stzString( This.ToListInString@C() )

	def ToList()
		/*
		NOTE: Currently, it works only for a case like this:
		Q("#1 : #3").ToList() and gives [ "#1", "#2", "#3" ]

		but not for this:
		Q("#12 : #23") --> more then 1 digit

		TODO: Generalise it!
		*/

		This.TrimQ().RemoveBounds( [ "{", "}" ] )

		# Case where we have a normal list syntax

		if This.TrimQ().IsBoundedBy( [ "[", "]" ] )
			cCode = "aResult = " + This.Content()
			eval(cCode)
			return aResult
		ok

		# Case where we have a continuous list syntax:
		#  ? StzStringQ(' "Thing 1" : "Thing 3" ').ToList()

		cPart = NULL

		cPart1 = NULL
		cLastChar1 = NULL

		cPart2 = NULL
		cLastChar2 = NULL

		oThisWS = This.ReplaceManyQ([": ", " :"], " : ").SimplifyQ()
		
		if oThisWS.NumberOfOccurrence(":") = 1 and oThisWS.MiddleChar() = ":"

			aListMembers = QStringListToList( QStringObject().split(":", 0, 0) )
			oMember1 = StzStringQ(aListMembers[1]).TrimQ()
			oMember2 = StzStringQ(aListMembers[2]).TrimQ()

			cMember1 = oMember1.Content()
			cMember2 = oMember2.Content()

			if BothAreNumbersInStrings(cMember1, cMember2)
				cLastChar1 = cMember1
				cLastChar2 = cMember2

			but BothAreCharsInComputableForm(cMember1, cMember2)
				cLastChar1 = cMember1
				cLastChar2 = cMember2

			but BothAreStringsInComputableForm(cMember1, cMember2)

				c1 = '"'
				c2 = "'"

				oMember1.RemoveManyQ([c1, c2])
				oMember2.RemoveManyQ([c1, c2])

				cLastChar1 = oMember1.LastChar()
				cLastChar2 = oMember2.LastChar()
	
				nLenMember1 = oMember1.NumberOfChars()
				
				if nLenMember1 > 1
					cPart1 = oMember1.Section(1, nLenMember1 - 1)
				ok
	
				nLenMember2 = oMember2.NumberOfChars()
	
				if nLenMember2 > 1
					cPart2 = oMember2.Section(1, nLenMember2 - 1)
				ok

				if ( cPart1 = NULL     or cPart2 = NULL ) and
				   ( cLastChar1 = NULL or cLastChar2 = NULL )

					stzRaise("Syntax error! parts must not be null.")
				ok

				if cPart1 != cPart2
					stzRaise("Syntax error! The two parts must be the same.")
				ok
	
				cPart = cPart1
			else

				stzRaise("Syntax error! Can't transoform the string into list.")
			ok

		else

			stzRaise("Syntax error! Can't transoform the string into list.")

		ok
		
		# Composing the contiguous list for cLastChar1 to cLastChar2
	
		oString = StzStringQ( cLastChar1 + " : " + cLastChar2 )

		cCode = "aList = " + oString.ToListInNormalForm()
		eval(cCode)
	
		# Adding the other parts
	
		if cPart != NULL
			for item in aList
				item = cPart + item
			next
		ok

		return aList

		def ToListQ()
			return new stzList( This.ToList() )

  	  #==========================================================#
	 #   CHECKING IF ALL THE STRINGS VERIFY A GIVEN CONDITION   #
	#==========================================================#

	def CheckW(pcCondition)
		return This.CharsQ().CheckW(pcCondition)

		#< @FunctionAlternativeForms

		def Check(pcCondition)
			return This.CheckW(pcCondition)

		def Verify(pcCondition)
			return This.CheckW(pcCondition)

		def EachStringVerifyW(pcCondition)
			return This.CheckW(pcCondition)

		def EachStringVerify(pcCondition)
			return This.CheckW(pcCondition)

		def EachStringItemVerifyW(pcCondition)
			return This.CheckW(pcCondition)

		def EachStringItemVerify(pcCondition)
			return This.CheckW(pcCondition)

		#>

	  #-------------------------------------------------------------------#
	 #   CHECKING IF STRINGS AT GIVEN POSITIONS VERIFY A GIVEN CONDITION   #
	#-------------------------------------------------------------------#

	def CheckOnW(panPositions, pcCondition)

		return This.CharsQ().CheckOnW(panPositions, pcCondition)

		#< @FunctionAlternativeForms

		def VerifyOnW(panPositions, pcCondition)
			return This.CheckOnW(panPositions, pcCondition)

		def CheckOn(panPositions, pcCondition)
			return This.CheckOnW(panPositions, pcCondition)

		def VerifyOn(panPositions, pcCondition)
			return This.CheckOnW(panPositions, pcCondition)

		def CheckOnPositionsW(panPositions, pcCondition)
			return This.CheckOnW(panPositions, pcCondition)

		def VerifiyOnPositionsW(panPositions, pcCondition)
			return This.CheckOnW(panPositions, pcCondition)

		def CheckOnThesePositionsW(panPositions, pcCondition)
			return This.CheckOnW(panPositions, pcCondition)

		def VerifyThesePositionsW(panPositions, pcCondition)
			return This.CheckOnW(panPositions, pcCondition)

		def CheckOnPositions(panPositions, pcCondition)
			return This.CheckOnW(panPositions, pcCondition)

		def VerifyOnPositions(panPositions, pcCondition)
			return This.CheckOnW(panPositions, pcCondition)
		#>

	  #------------------------------------------------------------------#
	 #   CHECKING IF STRINGS AT GIVEN SECTIONS VERIFY A GIVEN CONDITION   #
	#------------------------------------------------------------------#

	def CheckOnSectionsW(paSections, pcCondition)
		return This.CharsQ().CheckOnSectionsW(paSections, pcCondition)

		#< @FunctionAlternativeForm

		def VerifyOnSectionsW(paSections, pcCondition)
			return This.CheckOnSectionsW(paSections, pcCondition)

		def CheckOnSections(paSections, pcCondition)
			return This.CheckOnSectionsW(paSections, pcCondition)

		def VerifyOnSections(paSections, pcCondition)
			return This.CheckOnSectionsW(paSections, pcCondition)

		def CheckOnTheseSectionsW(paSections, pcCondition)
			return This.CheckOnSectionsW(paSections, pcCondition)

		def VerifyOnTheseSectionsW(paSections, pcCondition)
			return This.CheckOnSectionsW(paSections, pcCondition)

		def CheckOnTheseSections(paSections, pcCondition)
			return This.CheckOnSectionsW(paSections, pcCondition)

		def VerifyOnTheseSections(paSections, pcCondition)
			return This.CheckOnSectionsW(paSections, pcCondition)

		#>

	  #=========================================#
	 #   YIELDING INFORMATION FROM EACH CHAR   #
	#=========================================#

	def Yield(pcCode)
		return This.CharsQ().YieldFrom( 1:This.NumberOfChars(), pcCode )

		#< @FunctionFluentForm

		def YieldQ(pcCode)
			return This.YieldQR(pcCode, :stzList)
	
		def YieldQR(pcCode, pcReturnType)
			if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.Yield(pcCode) )
	
			on :stzListOfStrings
				return new stzListOfStrings( This.Yield(pcCode) )
				
			on :stzListOfNumbers
				return new stzListOfNumbers( This.Yield(pcCode) )

			on :stzHashList
				return new stzHashList( This.Yield(pcCode) )
		
		other
				stzRaise("Unsupported return type!")
		off

		#>

		#< @FunctionAlternativeForms

		def YieldFromEachChar(pcCode)
			return This.Yield(pcCode)

			def YieldFromEachCharQ(pcCode)
				return This.YieldFromEachCharQR(pcCode, :stzList)
		
			def YieldFromEachCharQR(pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.YieldFromEachChar(pcCode) )
		
				on :stzListOfStrings
					return new stzListOfStrings( This.YieldFromEachChar(pcCode) )
					
				on :stzListOfNumbers
					return new stzListOfNumbers( This.YieldFromEachChar(pcCode) )
	
				on :stzHashList
					return new stzHashList( This.YieldFromEachChar(pcCode) )
			
			other
					stzRaise("Unsupported return type!")
			off

		def Harvest(pcCode)
			return This.Yield(pcCode)

			def HervestQ(pcCode)
				return This.YieldFromEachCharQR(pcCode, :stzList)
		
			def HarvestQR(pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.Harvest(pcCode) )
		
				on :stzListOfStrings
					return new stzListOfStrings( This.Harvest(pcCode) )
					
				on :stzListOfNumbers
					return new stzListOfNumbers( This.Harvest(pcCode) )
	
				on :stzHashList
					return new stzHashList( This.Harvest(pcCode) )
			
			other
					stzRaise("Unsupported return type!")
			off

		def HarvestFromEachChar(pcCode)
			return This.Yield(pcCode)

			def HarvestFromEachCharQ(pcCode)
				return This.HarvestFromEachCharQR(pcCode, :stzList)
		
			def HarvestFromEachCharQR(pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.HarvestFromEachChar(pcCode) )
		
				on :stzListOfStrings
					return new stzListOfStrings( This.HarvestFromEachChar(pcCode) )
					
				on :stzListOfNumbers
					return new stzListOfNumbers( This.HarvestFromEachChar(pcCode) )
	
				on :stzHashList
					return new stzHashList( This.HarvestFromEachChar(pcCode) )
			
			other
					stzRaise("Unsupported return type!")
			off
		#>

	  #--------------------------------------------------------#
	 #   YIELDING INFORMATION FROM CHARS AT GIVEN POSITIONS   #
	#--------------------------------------------------------#

	def YieldFrom(panPositions, pcCode)
		return This.CharsQ().YieldFrom(panPositions, pcCode)

		#< @FunctionFluentForm

		def YieldFromQ(paPositions, pcCode)
			return This.YieldFromQR(paPositions, pcCode, :stzList)
	
		def YieldFromQR(paPositions, pcCode, pcReturnType)
			if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.YieldFrom(paPositions, pcCode) )
	
			on :stzListOfStrings
				return new stzListOfStrings( This.YieldFrom(paPositions, pcCode) )
				
			on :stzListOfNumbers
				return new stzListOfNumbers( This.YieldFrom(paPositions, pcCode) )
		
			other
				stzRaise("Unsupported return type!")
			off

		#>

		#< @FunctionAlternativeForms

		def YieldFromPositions(panPositions, pcCode)
			return This.YieldFrom(panPositions, pcCode)

			def YieldFromPositionsQ(paPositions, pcCode)
				return This.YieldFromPositionsQR(paPositions, pcCode, :stzList)
		
			def YieldFromPositionsQR(paPositions, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.YieldFromPositions(paPositions, pcCode) )
		
				on :stzListOfStrings
					return new stzListOfStrings( This.YieldFromPositions(paPositions, pcCode) )
					
				on :stzListOfNumbers
					return new stzListOfNumbers( This.YieldFromPositions(paPositions, pcCode) )
	
				other
					stzRaise("Unsupported return type!")
				off

		def YieldFromCharsAt(panPositions, pcCode)
			return This.YieldFrom(panPositions, pcCode)

			def YieldFromCharsAtQ(paPositions, pcCode)
				return This.YieldFromCharsAtQR(paPositions, pcCode, :stzList)
		
			def YieldFromCharsAtQR(paPositions, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.YieldFromCharsAt(paPositions, pcCode) )
		
				on :stzListOfStrings
					return new stzListOfStrings( This.YieldFromCharsAt(paPositions, pcCode) )
					
				on :stzListOfNumbers
					return new stzListOfNumbers( This.YieldFromCharsAt(paPositions, pcCode) )
	
				other
					stzRaise("Unsupported return type!")
				off

		def YieldFromCharsAtPositions(panPositions, pcCode)
			return This.YieldOn(panPositions, pcCode)

			def YieldFromCharsAtPositionsQ(paPositions, pcCode)
				return This.YieldFromCharsAtPositionsQR(paPositions, pcCode, :stzList)
		
			def YieldFromCharsAtPositionsQR(paPositions, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.YieldFromCharsAtPositions(paPositions, pcCode) )
		
				on :stzListOfStrings
					return new stzListOfStrings( This.YieldFromCharsAtPositions(paPositions, pcCode) )
					
				on :stzListOfNumbers
					return new stzListOfNumbers( This.YieldFromCharsAtPositions(paPositions, pcCode) )
	
				on :stzHashList
					return new stzHashList( This.YieldFromCharsAtPositions(paPositions, pcCode) )
			
			other
					stzRaise("Unsupported return type!")
			off

		def HarvestFromPositions(panPositions, pcCode)
			return This.HarvestFrom(panPositions, pcCode)

			def HarvestFromPositionsQ(paPositions, pcCode)
				return This.HarvestFromPositionsQR(paPositions, pcCode, :stzList)
		
			def HarvestFromPositionsQR(paPositions, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.HarvestFromPositions(paPositions, pcCode) )
		
				on :stzListOfStrings
					return new stzListOfStrings( This.HarvestFromPositions(paPositions, pcCode) )
					
				on :stzListOfNumbers
					return new stzListOfNumbers( This.HarvestFromPositions(paPositions, pcCode) )
	
				other
					stzRaise("Unsupported return type!")
				off

		def HarvestFromCharsAt(panPositions, pcCode)
			return This.HarvestFrom(panPositions, pcCode)

			def HarvestFromCharsAtQ(paPositions, pcCode)
				return This.HarvestFromCharsAtQR(paPositions, pcCode, :stzList)
		
			def HarvestFromCharsAtQR(paPositions, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.HarvestFromCharsAt(paPositions, pcCode) )
		
				on :stzListOfStrings
					return new stzListOfStrings( This.HarvestFromCharsAt(paPositions, pcCode) )
					
				on :stzListOfNumbers
					return new stzListOfNumbers( This.HarvestFromCharsAt(paPositions, pcCode) )
	
				other
					stzRaise("Unsupported return type!")
				off

		def HarvestFromCharsAtPositions(panPositions, pcCode)
			return This.HarvestOn(panPositions, pcCode)

			def HarvestFromCharsAtPositionsQ(paPositions, pcCode)
				return This.HarvestFromCharsAtPositionsQR(paPositions, pcCode, :stzList)
		
			def HarvestFromCharsAtPositionsQR(paPositions, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.HarvestFromCharsAtPositions(paPositions, pcCode) )
		
				on :stzListOfStrings
					return new stzListOfStrings( This.HarvestFromCharsAtPositions(paPositions, pcCode) )
					
				on :stzListOfNumbers
					return new stzListOfNumbers( This.HarvestFromCharsAtPositions(paPositions, pcCode) )
	
				other
					stzRaise("Unsupported return type!")
				off
		#>

	  #------------------------------------------------------#
	 #   YIELDING INFORMATION ON CHARS IN GIVEN SECTIONS    #
	#------------------------------------------------------#

	def YieldFromSections(paSections, pcCode)
		return This.CharsQ().YieldFromSections(paSections, pcCode)

		#< @FunctionFluentForm

		def YieldFromSectionsQ(paSections, pcCode)
			return new stzList( This.YieldFromSections(paSections, pcCode) )

		def YieldSections(paSections, pcCode)
			return This.YieldFromSections(paSections, pcCode)

		#>

		#< @FunctionAlternativeForms

		def HarvestFromSections(paSections, pcCode)
			return This.YieldFromSections(paSections, pcCode)

			def HarvestFromSectionsQ(paSections, pcCode)
				return This.HarvestFromSections(paSections, pcCode, :stzList)

			def HarvestFromSectionsQR(paSections, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedTypeNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				if NOT isString(pcReturnType)
					stzRaise("Incorrect param! pcReturnType must be a string.")
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.HarvestFromSections(paSections, pcCode) )

				on :stzListOfLists
					return new stzListOfLists( This.HarvestFromSections(paSections, pcCode) )
	
				other
					stzRaise("Unsupported param type!")
				off
	
		def HarvestSections(paSections, pcCode)
			return This.YieldFromSections(paSections, pcCode)

			def HarvestSectionsQ(paSections, pcCode)
				return This.HarvestSections(paSections, pcCode, :stzList)

			def HarvestSectionsQR(paSections, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedTypeNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				if NOT isString(pcReturnType)
					stzRaise("Incorrect param! pcReturnType must be a string.")
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.HarvestSections(paSections, pcCode) )

				on :stzListOfLists
					return new stzListOfLists( This.HarvestSections(paSections, pcCode) )
	
				other
					stzRaise("Unsupported param type!")
				off
		#>

	def YieldFromSectionsOneByOne(paSections, pcCode)

		if NOT ( isList(paSections) and Q(paSections).IsListOfPairsOfNumbers() )

			stzRaise("Incorrect param! paSections must be a list of pairs of numbers.")
		ok

		aResult = []

		anSectionsExpanded = []
		for aSection in paSections
			anSectionsExpanded + Q(aSection).ExpandedIfPairOfNumbers()
		next

		for anPositions in anSectionsExpanded
			aResult + This.YieldFromPositions(anPositions, pcCode)
		next

		return aResult

		#< @FunctionFluentForm

		def YieldFromSectionsOneByOneQ(paSections, pcCode)
			return This.YieldFromSectionsOneByOneQR(paSections, pcCode, :stzList)

		def YieldFromSectionsOneByOneQR(paSections, pcCode, pcReturnType)
			if isList(pcReturnType) and Q(pcReturnType).IsReturnedTypeNamedParam()
				pcReturnType = pcReturnType[2]
			ok

			if NOT isString(pcReturnType)
				stzRaise("Incorrect param! pcReturnType must be a string.")
			ok

			switch pcReturnType
			on :stzList
				return new stzList( This.YieldFromSectionsOneByOneQ(paSections, pcCode) )

			on :stzListOfLists
				return new stzListOfLists( This.YieldFromSectionsOneByOneQ(paSections, pcCode) )

			other
				stzRaise("Unsupported param type!")
			off

		#>

		#< @FunctionAlternativeForms

		def HarvestFromSectionsOneByOne(paSections, pcCode)
			return This.YieldFromSections(paSections, pcCode)

			def HarvestFromSectionsOneByOneQ(paSections, pcCode)
				return This.HarvestFromSectionsOneByOne(paSections, pcCode, :stzList)

			def HarvestFromSectionsOneByOneQR(paSections, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedTypeNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				if NOT isString(pcReturnType)
					stzRaise("Incorrect param! pcReturnType must be a string.")
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.HarvestFromSectionsOneByOne(paSections, pcCode) )

				on :stzListOfLists
					return new stzListOfLists( This.HarvestFromSectionsOneByOne(paSections, pcCode) )
	
				other
					stzRaise("Unsupported param type!")
				off
				
		def HarvestSectionsOneByOne(paSections, pcCode)
			return This.YieldFromSections(paSections, pcCode)

			def HarvestSectionsOneByOneQ(paSections, pcCode)
				return This.HarvestSectionsOneByOne(paSections, pcCode, :stzList)

			def HarvestSectionsOneByOneQR(paSections, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedTypeNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				if NOT isString(pcReturnType)
					stzRaise("Incorrect param! pcReturnType must be a string.")
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.HarvestSectionsOneByOne(paSections, pcCode) )

				on :stzListOfLists
					return new stzListOfLists( This.HarvestSectionsOneByOne(paSections, pcCode) )
	
				other
					stzRaise("Unsupported param type!")
				off

		def YieldSectionsOneByOne(paSections, pcCode)
			return This.YieldFromSections(paSections, pcCode)

			def YieldSectionsOneByOneQ(paSections, pcCode)
				return This.YieldSectionsOneByOne(paSections, pcCode, :stzList)

			def YieldSectionsOneByOneQR(paSections, pcCode, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedTypeNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				if NOT isString(pcReturnType)
					stzRaise("Incorrect param! pcReturnType must be a string.")
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.YieldSectionsOneByOne(paSections, pcCode) )

				on :stzListOfLists
					return new stzListOfLists( This.YieldSectionsOneByOne(paSections, pcCode) )
	
				other
					stzRaise("Unsupported param type!")
				off

		#>

	  #----------------------------------------------------------------#
	 #   YIELDING INFORMATION ON ITEMS VERIFYiNG A GIVEN CONDITION    #
	#----------------------------------------------------------------#

	def YieldW(pcCode, pcCondition)
		return This.CharsQ().YieldW(pcCode, pcCondition)

		#< @FunctionFluentForm

		def YieldWQ(pcCode, pcCondition)
				return This.YieldWQR(paPositions, pcCode, :stzList)
		
			def YieldWQR(pcCode, pcCondition, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok
	
				switch pcReturnType
				on :stzList
					return new stzList( This.YieldW(pcCode, pcCondition) )
		
				on :stzListOfStrings
					return new stzListOfStrings( This.YieldW(pcCode, pcCondition) )
					
				on :stzListOfNumbers
					return new stzListOfNumbers( This.YieldW(pcCode, pcCondition) )
	
				on :stzHashList
					return new stzHashList( This.YieldW(pcCode, pcCondition) )
			
			other
					stzRaise("Unsupported return type!")
			off

		#>

		#> @FunctionAlternativeForm

		def HarvestW(pcCode, pcCondition)
			return This.YieldW(pcCode, pcCondition)

			def HervestWQ(pcCode, pcCondition)
				return This.HarvestWQR(pcCode, pcCondition, :stzList)

			def HervestWQR(pcCode, pcCondition, pcReturnType)
				if isList(pcReturnType) and Q(pcReturnType).IsReturnedAsNamedParam()
					pcReturnType = pcReturnType[2]
				ok

				if NOT isString(pcReturnType)
					stzRaise("IncorrectType! pcReturnType must be a string.")
				ok

				switch pcReturnType
				on :stzList
					return new stzList( This.HarvestW(pcCode, pcCondition) )

				on :stzListOfLists
					return new stzListOfLists( This.HarvestW(pcCode, pcCondition) )

				other
					stzRaise("Unsupported return type!")
				off

		#>

	  #=======================================#
	 #   PERFORMING AN ACTION ON EACH CHAR   #
	#=======================================#

	def Perform(pcCode)
		# Must begin with '@char ='

		This.UpdateWith(
			This.CharsQ().
			PerformQ(pcCode).
			ToStzListOfStrings().
			Concatenated()
		)

		#--

		def PerformQ(pcCode)
			This.Perform(pcCode)
			return This

	  #----------------------------------------------------#
	 #   PERFORMING ACTIONS ON CHARS IN GIVEN POSITIONS   #
	#----------------------------------------------------#

	def PerformOn(panPositions, pcCode)

		This.UpdateWith(
			This.CharsQ().
			PerformOnQ(panPositions, pcCode).
			ToStzListOfStrings().
			Concatenated()
		)

		#--

		def PerformOnQ(panPositions, pcCode)
			This.PerformOn(panPositions, pcCode)
			return This

		def PerformOnPositions(panPositions, pcCode)
			This.PerformOn(panPositions, pcCode)

			def PerformOnPositionsQ(panPositions, pcCode)
				This.PerformOnPositions(panPositions, pcCode)
				return This

		def PerformOnThesePositions(panPositions, pcCode)
			This.PerformOn(panPositions, pcCode)

			def PerformOnThesePositionsQ(panPositions, pcCode)
				This.PerformOnThesePositions(panPositions, pcCode)
				return This

	  #------------------------------------------------------#
	 #   PERFORMING AN ACTION ON CHARS IN GIVEN SECTIONS    #
	#------------------------------------------------------#

	def PerformOnSections(paSections, pcCode)

		This.UpdateWith(
			This.CharsQ().
			PerformOnSectionsQ(paSections, pcCode).
			ToStzListOfStrings().
			Concatenated()
		)

		#--

		def PerformOnSectionsQ(paSections, pcCode)
			This.PerformOnSections(paSections, pcCode)
			return This

		def PerformOnTheseSections(paSections, pcCode)
			This.PerformOnSections(paSections, pcCode)

			def PerformOnTheseSectionsQ(paSections, pcCode)
				This.PerformOnTheseSections(paSections, pcCode)
				return This

	  #---------------------------------------------------------------#
	 #   PERFORMING AN ACTION ON CHARS VERIFYING A GIVEN CONDITION   #
	#---------------------------------------------------------------#

	def PerformW(pcAction, pcCondition)

		This.UpdateWith(
			This.CharsQ().
			PerformWQ(pcAction, pcCondition).
			ToStzListOfStrings().
			Concatenated()
		)

		#--

		def DoW(pcAction, pcCondition) # TODO: Generalize in other classes
			This.PerformW(pcAction, pcCondition)

		def PerformWQ(paParams)
			This.PerformW(paParams)
			return This

			def DoWQ(paParams)
				This.PerformWQ(paParams)

	  #----------------------------#
	 #  OPERATORS OVERLOADING     #
	#----------------------------#

	/*
		TODO: Operators should carry same semantics in all classes...
	*/

	def operator(pOp,pValue)

		// string access : str[n]
		// string search : str[substr]

		if pOp = "[]"
			
			if isString(pValue)
				if pValue = :First or pValue = :FirsChar
					pValue = 1

				but pValue = :Last or pValue = :LastChar
					pValue = This.NumberOfChars()
				ok
			ok

			if isNumber(pValue)
			   
				return This.NthChar(pValue)
							
			but isString(pValue)
				if StzStringQ(pValue).TrimQ().IsBoundedBy(["{","}"])
					pcCondition = StzStringQ(pValue).TrimQ().BoundsRemoved(["{","}"])
					anResult = []

					@char = ""
					for i = 1 to This.NumberOfChars()
						@char = This[i]
						cCode = 'if ( ' + pcCondition + ' )' + NL +
							'	anResult + i' + NL +
							'ok'
						eval(cCode)
					next

					return anResult
				else
					return This.FindAll(pValue)
				ok	
			ok
				// Add an item at the beginning of the list
		but pOp = "<<"
			This.Prepend(1)

		// Add an item at the end of the list
		but pOp = ">>"
			This.Append(value)

		// compare equality : oString = str

		but pOp = "="
			return This.IsEqualTo(pValue)

		// Compare strict equality (case-sensitive)

		but pOp = "=="
			return This.IsStrictlyEqualTo(pValue)
	
		// oString < str

		but pOp = "<"
			return This.IsStrictlyLessThan(pValue)

		but pOp = "<="
			return This.IsLessThan(pValue)
		
		// compare : oString > str

		but pOp = ">"
			return This.IsStrictlyGreaterThan(pValue)

		but pOp = ">="
			return This.IsGreaterThan(pValue)
	
		// add : string + string | string + ListOfStrings

		but pOp = "+"
			if ring_type(pValue) = "STRING"
				This.Append(pValue)
				return This
		
			but StzListQ(pValue).IsListOfStrings()
				This.InsertListOfSubstrings(pValue)
				return This	
			ok

		// Multiply: string * n | string * string | string * list
	
		but pOp = "*"
			This.MultiplyBy(pValue)
			return This

		// Split: String / n  | String / str	| String / list

		but pOp = "/"
			if isString(pValue)
				aSplitted = QStringListToList( QStringObject().split(pValue, 0, 0) )
				return aSplitted

			but isNumber(pValue)
				return This.SplitToNParts(pValue)

			but ListIsListOfStrings(pValue)
				acResult = []

				acSplits = This.SplitToNParts( len(pValue) )
				
				i = 0
				for str in pValue
					i++
					acResult + [ str, acSplits[i] ]
				next
					
				return acResult

			but ListIsHashList(pValue) and StzHashListQ(pValue).ValuesQ().IsListOfNumbers()
				aResult = []

				# The sum of shares must be equal to the number of chars
				
				if NOT StzHashListQ(pValue).ValuesQR(:stzListOfNumbers).Sum() = This.NumberOfChars()
					stzRaise("Incorrect values! The sum of numbers must be equal to the number of chars!")
				ok

				n = 1
				for aPair in pValue
					
					cShare = This.Range(n, aPair[2])
					n += aPair[2]

					aResult + [ aPair[1], cShare ]
				next

			ok

			return aResult
					
		// String % n : returns the rest of letters after dividing String / n

		but pOp = "%"
			cResult = NULL

			if ring_type(pValue) = "NUMBER"	
				aParts = []
		
				nParts = ceil( This.NumberOfChars() / pValue )
				for i=1 to This.NumberOfChars() step nParts
					cTemp = @oQString.mid(i-1, nParts)
					aParts + cTemp	
				next
		
				if len(aParts) < pValue
					for i = len(aParts) to pValue-1
						aParts + "_"
					next
				ok
		
				if aParts[ len(aParts) ] != "_"
					return aParts[ len(aParts) ]
				ok
			ok

			return cResult
		
		// string - string | string - .25 | string - 3
		but pOp = "-"
			cResult = NULL
						
			if isString(pValue)
				This.RemoveAllQ(pValue)
				return This
			ok
		
			if isNumber(pValue)
				if pValue < This.NumberOfChars()
					if pValue > 0 and pValue < 1 // str - 0.5
						// Eats a portion of the string (half: 0.5, quarter0.25,...)
						n = floor( This.NumberOfChars() * pValue)
						cResult = This.Section( 1, This.NumberOfChars() - n ) // @oQString.mid(0,nLenStr-n)
					else
						cResult = This.Section(1, This.NumberOfChars() - pValue )
					ok		
				ok

				This.Update( cResult )
				return This
			ok

			if StzListQ(pValue).IsListOfStrings()
				for item in pValue
					This.RemoveAll(item)
				next
				return This
			ok

			if StzListQ(pValue).IsListOfLists() and len(pValue) = 1
				/*
				Example:

				o1 = new stzString("XRingorialand")
				o1 - [[ :FirstCharIf, :EqualTo, :X ]]

				Gives -> "Ringorialand"

				NB: We use the two brackets here to differenciate
				the syntax with:

					 o1 - [ "X", "oria", "land" ] --> "Ring"

				which means : remove this ist of substrings from
				the main string
				*/

				aListOfConditions = [
					:EqualTo, :LesserThan, :GreaterThan,
					:LesserThanOrEqual, :GreaterThanOrEqual,
					:DifferentThan ]

				cFirstOrLast = pValue[1][1]
		 		cCondition = pValue[1][2]
				value = pValue[1][3]

				oCondition = new stzString(cCondition)

				if NOT ( len(pValue[1]) = 3 AND
				   (cFirstOrLast = :FirstCharIf or cFirstOrLast = :LastCharIf) AND
				   oCondition.ExistsInList(aListOfConditions) AND
				   isString(value) )

					stzRaise(stzStringError(:UnsupportedExpressionInOverloadedMinusOperator))
				ok
					
				if cFirstOrLast = :FirstCharIf

					if cCondition = :EqualTo
						if IsNumberOrString(pValue)
							if This.FirstChar() = pValue
								This.RemoveFirstChar()
								return This
							ok
						ok

						if StzListQ(pValue).IsListOfStrings()
							oList = pValue
							if oList.IsEqualTo(cFirstOrLast)
								This.RemoveMany(pValue)
								return This
							ok
						ok

					but cCondition = :LesserThan
						stzRaise(:UnsupportedFeatureInThisVersion)

					but cCondition = :GreaterThan
						stzRaise(:UnsupportedFeatureInThisVersion)

					but cCondition = :LesserOrEqualThan
						stzRaise(:UnsupportedFeatureInThisVersion)

					but cCondition = :GreaterOrEqualThan
						stzRaise(:UnsupportedFeatureInThisVersion)
					
					but cCondition = :DifferentThan
						stzRaise(:UnsupportedFeatureInThisVersion)
					ok

				but cFirstOrLast = :LastCharIf

					if cCondition = :EqualTo
						if StringIsChar(pValue) and This.LastChar() = pValue
							This.RemoveNthChar(This.NumberOfChars())
							return This
						ok

						if ListIsListOfChars(pValue)
							oList = pValue
							if value.IsEqualTo(cFirstOrLast)
								This.RemoveMany(pValue)
								return This
							ok
							
						ok

					but cCondition = :LesserThan
						stzRaise(:UnsupportedFeatureInThisVersion)

					but cCondition = :GreaterThan
						stzRaise(:UnsupportedFeatureInThisVersion)

					but cCondition = :LesserOrEqualThan
						stzRaise(:UnsupportedFeatureInThisVersion)

					but cCondition = :GreaterOrEqualThan
						stzRaise(:UnsupportedFeatureInThisVersion)
					
					but cCondition = :DifferentThan
						stzRaise(:UnsupportedFeatureInThisVersion)
					ok

				ok

			ok
		ok // --- End of operator overloading section

	  #--------------------------------#
	 #     USED FOR NATURAL-CODING    #
	#--------------------------------#

	def IsAlmostAFunctionCall()
		# Why almost? Because it doesn't analyse the correctness of the params
		# which we should do in the future, but this is sufficient for our
		# actual needs in stzChainOfTruth and other classes of natural-coding

		# PS: if you you don't like sutch a precison, use the alternative name
		# IsFunctionCall() instead.

		if This.NumberOfOccurrence("(") = 1 and
		   This.NumberOfOccurrence(")") = 1 and
		   This.FindFirst("(") > 1 and
		   This.FindFirst("(") < This.FindFirst(")") and
		   This.LastChar() = ")" // and # TODO: complete this and remove "Almost" from the function name!
		   //This.SectionQ(1,  This.FindFirst("(") - 1).ContainsOnly(:CompterCodeChars)
		
			return TRUE
		else
			return FALSE
		ok

		#< FunctionAlternativeForms >

		def IsFunctionCall()
			return This.IsAlmostAFunctionCall()
		#>

	def IsAMethodOfThisObject(pObject)
		return This.String().ExistsIn( classes(pObject) )

		def IsMethodOfObject(pObject)
			return IsAMethodOfThisObject(pObject)

	def IsAnAttributeOfThisObject(pObject)
		return This.String().ExistsIn( attributes(pObject) )

		def IsAttributeOfObject(pObject)
			return IsAnAttributeOfThisObject(pObject)		 

	#-----------------

	def IsStzString()
		return TRUE

	def StzType()
		return :stzString

	def IsANumber()
		return FALSE

	def IsAString()
		return TRUE

	def IsAList()
		return FALSE

	def IsAnObject()
		return TRUE

	def Stringify()
		return This.String()

		def Stringified()
			return This.Stringify()
	  #-----------#
	 #   MISC.   #
	#-----------#
		
	def HasSameTypeAs(p)
		return isString(p)

	def IsAnagramOfCS(pcOtherStr, pCaseSensitive)

		oTheseChars = This.CharsQR(:stzListOfStrings).RemoveduplicatesQ().SortInAscendingQ()

		cOtherChars = StzStringQ( pcOtherStr ).
				CharsQ().RemoveDuplicatesQ().
				SortInAscendingQ().Content()
	
		bResult = oTheseChars.IsEqualToCS( cOtherChars, pCaseSensitive )

		return bResult

	def IsAnagramOf(pcOtherStr)
		return This.IsAnagramOfCS(pcOtherStr, :CS = TRUE)

	def UpTo(pcChar)
		if This.IsChar() and ( isString(pcChar) and StzStringQ(pcChar).IsChar() ) and
		   This.Unicode() < CharUnicode(pcChar)

			acResult = []
			for n = This.Unicode() to CharUnicode(pcChar)
				acResult + StzCharQ(n).Content()
			next
			return acResult
		ok

	def DownTo(pcChar)
		if This.IsChar() and ( isString(pcChar) and StzStringQ(pcChar).IsChar() ) and
		   This.Unicode() > CharUnicode(pcChar)

			acResult = []
			for n = This.Unicode() to CharUnicode(pcChar) step -1 
				acResult + StzCharQ(n).Content()
			next

			return acResult
		ok

	def FirstAndLastChars()
		aResult = [ This.FirstChar(), This.LastChar() ]
		return aResult

	def LastAndFirstChars()
		aResult = [ This.LastChar(), FirstChar() ]
		return aResult

	def IsListOfCharsInComputableForm()
		// TODO

	def Show()
		? This.Content()

	def Methods()
		return ring_methods(This)

	def Attributes()
		return ring_attributes(This)

	def ClassName()
		return "stzstring"

		def StzClassName()
			return This.ClassName()

		def StzClass()
			return This.ClassName()

	def IsLatinScript()
		return This.ToStzText().IsLatinScript()

		def IsLatin()
			return This.IsLatinScript()

	def IsArabicScript()
		return This.ToStzText().IsArabicScript()

		def IsArabic()
			return This.IsArabicScript()

	def IsText()
		return TRUE
