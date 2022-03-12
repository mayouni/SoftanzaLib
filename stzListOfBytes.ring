
/*
Internatlly, stzListOfBytes (and thus QByteArray) use UTF-8 encoding of bytes.
		
UTF 8 encodes characters on 1, 2, 3 or 4 bytes depending on the char unicode:
	* from 0 to 127 (ascii characters) : 1 byte
	* from 128 to 2047 : 2 bytes
	* from 2048 to 65535 : 3 bytes
	* from 65536 to 1114111 : 4 bytes
		
Look at this: http://tutorials.jenkov.com/unicode/utf-8.html
*/

func StzListOfBytesQ(p)
	return new stzListOfBytes(p)

func IsListOfBytes(p)
	if isString(p) or IsStzString(p) or IsStzListOfBytes(p) or IsQByteArray(p)
		return TRUE
	else
		return FALSE
	ok

func IsQByteArrayObject(p)
	if isObject(p) and classname(p) = :QByteArray
		return TRUE
	else
		return FALSE
	ok

func ToQByteArrayObject(p)
	if IsListOfBytes(p)
		if IsQByteArrayObject(p)
			return p

		but isString(p)
			oQByteArray = new QByteArray()
			oQByteArray.append(p)
			return oQByteArray

		but IsStzString(p)
			oQByteArray = new QByteArray()
			oQByteArray.append(p.Content())
			return oQByteArray

		but IsStzListOfBytes(p)
			return p.QByteArrayObject()

		ok
	ok

func QByteArrayToListOfUnicodes(oQByteArray)
	if IsQByteArrayObject(oQByteArray)
		oListOfBytes = new stzListOfBytes(oQByteArray)
		return oListOfBytes.Unicodes()
	else
		raise(stzListOfBytesError(:CanNotConvertQByteArray))
	ok

func QByteArrayToListOfChars(oQByteArray)
	/*
	Can also be solved like this:
	oString = new stzString(oQByteArray.data())
	return oString.ToListOfChars()
	*/

	oListOfBytes = new stzListOfBytes(oQByteArray)
	return oListOfBytes.ToStzString().Chars()

func QByteArrayToListOfUnicodesPerChar(oQByteArray)
	oListOfBytes = new stzListOfBytes(oQByteArray)
	return oQByteArray.UnicodesPerChar()
	

// The fellowing function is Used to retrive the numeric value hosted in
// pointers returned by some Qt methods (made with the help of Ilir)
func NumberInPointer(ptr)
	if IsPointer(ptr)
		BinStr = pointer2string(ptr, 0, len(int2bytes(0)) )
		return bytes2int(BinStr)
	else
		raise("Value you provided is not of type Pointer!")
	ok

class stzListOfBytes from stzObject
	
	@oQByteArray

	// Creates a list of bytes from an ordinary string or
	// from a QByteArray object
	def init(pValue)
		@oQByteArray = new QByteArray()

		if isString(pValue)
			@oQByteArray.append(pValue)

		but IsQByteArrayObject(pValue)
			@oQByteArray = pValue
		ok

	// Returns the text represented by the list of bytes content
	def Content()
		aResult = []
		for i = 1 to This.NumberOfBytes()
			aResult + This.Section( i, i)
		next

		return aResult
	
	def ListOfBytes()
		return This.Content()

	def Bytes()
		return This.ListOfBytes()

	def ToString()
		return @oQByteArray.data()

	def ToStzString()
		return new stzString(This.ToString())

	def QByteArrayObject()
		return @oQByteArray

	// Returns the object pointer (for low level use)
	def Pointer()
		return @oQByteArray.objectpointer()

	// Inserts n bytes of a substr in the nPosition position of the list of bytes
	def InsertNBytesOfSubstringAt(nPosition, nBytes, pcSubstr)
		@oQByteArray.insert(nBytes, pcSubstr, nPosition)
		// TODO: ...insert before & after (like in stzString & stzList)

	// Returns the n left bytes as a string
	def NLeftBytes(n)
		return @oQByteArray.left(n).data()

		def LeftNBytes(n)
			return NLeftBytes(n)
	
	// Returns the n right bytes as a string
	def NRightBytes(n)
		return @oQByteArray.right(n).data()

		def RightNBytes(n)
			return NRightBytes()
	
	// Clears the content of the list of bytes
	def Clear()
		@oQByteArray.clear()

		def ClearQ()
			This.Clear()
			return This
	
	// Checks if the list of bytes is empty
	def IsEmpty()
		return @oQByteArray.isempty()

	// Removes n bytes starting from a given position
	def RemoveNBytesStartingAt(nPosition, nBytes)
		@oQByteArray.remove(nPosition, nBytes)
		/* If nPosition is out of range, nothing happens.
		If nPosition is valid, but nPosition + nBytes is larger than the size
		of the array, the array is truncated at position nBytes.
		*/

	def RemoveNBytesStartingAtQ(nPosition, nBytes)
		This.RemoveNBytesStartingAt(nBytes, nPosition)
		return This

	// Removes n bytes from the end of the list of bytes
	def RemoveNBytesFromEnd(n)
		@oQByteArray.chop(n)

	def RemoveNBytesFromEndQ(n)
		This.RemoveNBytesFromEnd(n)
		return This

	// Returns a portion of the list of bytes starting from position nStart
	def Range(nStart, nBytes)
		return @oQByteArray.mid(nStart - 1, nBytes).data()

	// Returns the list of bytes between positions nStart and nEnd
	def Section(nStart, nEnd)
		return This.Range( nStart, nEnd - nStart + 1 )

	// Replaces nBytesFromMainStr bytes from the main list of bytes, starting at
	// position nStartingAtPosition, with nWithNBytes bytes from the provided substring
	def ReplaceNBytes(nBytesFromMainStr, nStartingAtPosition, nWithNBytes, pcFromSubstr)
		@oQByteArray.replace(nStartingAtPosition-1, nBytesFromMainStr, pcFromSubstr, nWithNBytes ).data()
		/*
		Example:
		o1 = new stzListOfBytes("Rixo")
		o1.Replace(2, 3, 2, "ngioom")
		? o1.Content() # Gives 'Ring'
		*/

	def ReplaceNBytesQ(nBytesFromMainStr, nStartingAtPosition, nWithNBytes, pcFromSubstr)
		This.ReplaceNBytes(nBytesFromMainStr, nStartingAtPosition, nWithNBytes, pcFromSubstr)
		return This

	def UnicodeOfNthByte(n)
		return @oQByteArray.at(n-1)

	def Bytecodes()
		aResult = []

		for i = 0 to @oQByteArray.size()
			aResult + @oQByteArray.at(i)
		next

		if aResult[ len(aResult) ] = 0
			del(aResult, len(aResult) )
		ok

		return aResult
		
		def BytecodesQ()
			return new stzList( This.Bytecodes() )
	
	def Chars()
		return This.ToStzString().Chars()

		def CharsQ()
			return new stzList( This.Chars() )
	
	def BytecodesPerChar()
		aResult = []

		for char in This.Chars()
			aResult + [ char, StzListOfBytesQ(char).Bytecodes()]
		next

		return aResult

	def BytesPerChar()
		aResult = []

		for char in This.Chars()
			aResult + [ char, StzListOfBytesQ(char).Bytes()]
		next

		return aResult

	def NumberOfBytes()
		return @oQByteArray.size()

	// Export the list of bytes as a list of unicode integers
	// where each unicode corresponds to a byte in the list
	def BytesToUnicodes()
		aResult = []
		for i = 1 to This.NumberOfBytes()
			aResult + This.UnicodeOfNthByte(i)
		next i
		return aResult

	def NumberOfBytesPerChar() # ---> stzString domain
		/* Exp:
			o1 = new stzListOfBytes("s㊱m")
			? o2.NumberOfBytesPerChar()
			--> [ :s = 1, :㊱ = 3, :m = 1 ]
		*/

		aResult = []
		for i = 1 to This.ToStzString().NumberOfChars()
		// WARNING: Note that for in loop, instead of for loop with a counter
		// does not give a correct result!
			oStzChar = new stzChar(This.ToStzString()[i])
			aResult + [ This.ToStzString()[i], oStzChar.NumberOfBytes() ]
		next

		return aResult

	def NumberOfBytesInNthChar(n) # ---> stzChar domain

		return This.NumberOfBytesPerChar()[n][2]

	def NumberOfBytesInChar(pcCaract) # ---> stzChar domain
		return This.NumberOfBytesPerChar()[pcCaract]

	// Sets each byte in the list of bytes using the provided ascii character
	// Warning: non ascii characters are not supported
	def FillWithAsciiChar(pcChar)
		oCaract = new stzChar(pcChar)
		if oCaract.IsAscii()
			return @oQByteArray.fill(oCaract.AsciiCode(), This.NumberOfBytes()).data()
		else
			return raise(stzListOfBytesError(:CanNotFillBytesWithNonAsciiChar))
		ok

	def FillWithAsciiChar_UpToNBytes(pcChar, nBytes)
		@oQByteArray.fill(ascii(pcChar), nBytes)

	def FillWithAsciiChar_UpToNChars(pcChar, nChars)
		nBytes = nChars * This.NumberOfBytesPerChar()
		@oQByteArray.fill(ascii(pcChar), nBytes)

	// Resises the list of bytes
	def Resize(n)
		@oQByteArray.resize(n)

	// Reserves n bytes of memory for the list of bytes
	// Use it if you know the size in advance -> better performance
	def Reserve(n)
		@oQByteArray.reserve(n)

	// Releases any memory not required to store the list of bytes's data
	def ReleaseUnusedMemory()
		@oQByteArray.squeeze()

	def Squeeze()
		This.ReleaseUnusedMemory()

	// Sets the list of bytes to the printed value of a number in base nBase
	// (nBase can be any number from 2 to 36)
	def SetWithtNumberInBase(nNumber, nBase)
		@oQByteArray.setNum(nNumber,nBase)

	// Swaps the main list of bytes with an other list of bytes created from
	// the provided string
	def SwapWith(oOtherListOfBytes)
		if IsListOfBytes(oOtherListOfBytes)
			@oQByteArray.swap(ToQByteArrayObject(oOtherListOfBytes))
		else
			raise(stzListOfBytesError(:CanNotSwapWithNonListOfBytes))
		ok

	// Encodes the main list of bytes in a base64 string
	def ToBase64()
		return @oQByteArray.toBase64().data()
		/*
		Example:

		o1 = new stzListOfBytes("teebah")
		? o1.Content()
		? o1.ToBase64()

		--> "dGVlYmFo"
	
		Base64 is an encoding algorithm that allows you to transform
		any characters into an alphabet which consists of Latin letters,
		digits, plus, and slash. Thanks to it, you can convert Chinese
		characters, emoji, and even images into a “readable” string,
		which can be saved or transferred anywhere.

		BASE64 characters are 6 bits in length. They are formed by taking
		a block of three octets to form a 24-bit string, which is converted
		into four BASE64 characters.

		The final '==' sequence indicates that the last group contained
		only one byte, and '=' indicates that it contained two bytes.
		Thus, this is some sort of padding to a multiple of 4 characters
		in length, so that it can be decoded correctly

		Note that although Base64 is often used in cryptography is not a
		security mechanism. Anyone can convert the Base64 string back to
		its original bytes, so it should not be used as a means for protecting
		data, only as a format to display or store raw bytes more easily.
		*/

	// Decodes a base64 string into the list of bytes
	def FromBase64(pcBase64String)
		/*
		Example:

		o1 = new stzListOfBytes("")
		o1.FromBase64("dGVlYmFo")
		? o1.Content()

		--> "teebah"
		*/

		oTempQByteArray = new QByteArray()
		oTempQByteArray.append(pcBase64String)

		cResult = @oQByteArray.fromBase64(oTempQByteArray).data()

		@oQByteArray = new QByteArray()
		@oQByteArray.append(cResult)

	// Transforms the content of the list of bytes to a url-like encoded string
	def ToPercentEncoding(pcExcludedFromEncoding, pcIncludedInEncoding, pcPercentAsciiChar)
		/* Example:
		o1 = new stzListOfBytes("{a fishy string?}")
		? o1.ToPercentEncoding( "{}", "s" )

		--> {a%20fi%73hy%20%73tring%3F}
		*/

		// Checking that pcPercentAsciiChar is actually ASCII
		// And setting it to % by default
		oTempChar = new stzChar(pcPercentAsciiChar)
		if oTempChar.IsAsciiChar()
			if pcPercentAsciiCaract = NULL
				pcPercentAsciiChar = "%"
			ok
		else
			raise(stzListOfBytesError(:CanNotTransformListOfBytesToPercentEncoding))
		ok

		// Preparing the required objects for the Qt QByteArray method
		oExcluded = new QByteArray()
		oExcluded.append(pcExcludedFromEncoding)
		oIncluded = new QByteArray()
		oIncluded.append(pcIncludedInEncoding)

		// Executing the Qt toPercentEncoding() method and returning the result
		return @oQByteArray.toPercentEncoding(oExcluded, oIncluded, ascii(pcPercentAsciiCaract)).constData()

	// *** Updates the list of bytes with an url-like decoded copy of the provided string
	def FromPercentEncoding(pcPercentEncodedString, pcPercentAsciiChar)
		/* Example:
		o1 = new stzListOfBytes("")
		o1.FromPercentEncoding( "{a%20fi%73hy%20%73tring%3F}", "%" )
		o1.Content()

		--> {a fishy string?}
		*/

		// Checking that pcPercentAsciiChar is actually ASCII
		// And setting it to % by default
		oTempChar = new stzChar(pcPercentAsciiChar)
		if oTempChar.IsAsciiChar()
			if pcPercentAsciiChar = NULL
				pcPercentAsciiChar = "%"
			ok
		else
			raise(stzListOfBytesError(:CanNotTransformPercentEncodingToListOfBytes))
		ok

		// Preparing the required objects for the Qt QByteArray method
		oTempQByteArray = new QByteArray()
		oTempQByteArray.append(pcPercentEncodedString)

		// Executing the Qt toPercentEncoding() method and storing the result
		cResult = @oQByteArray.fromPercentEncoding( oTempQByteArray, ascii(pcPercentAsciiCaract)).data()

		// Updating the main QByteArray object with the result
		@oQByteArray = new QByteArray()
		@oQByteArray.append(cResult)

		// If everything goes well, then return TRUE
		return TRUE
			
	// *** Returns a hex encoded string from the content of the list of bytes
	// The hex encoding uses the numbers 0-9 and the letters a-f
	def ToHex()
		return @oQByteArray.toHex().data()

	def FromHex(pcHexString)
		oTempQByteArray = new QByteArray()
		oTempQByteArray.append(pcHexString)

		cResult = @oQByteArray.fromHex(oTempQByteArray).data()

		// Updating the main QByteArray object with the result
		This.Update(cResult)

	def Update(pcString)
		if isList(pcString) and
		   ( StzListQ(pcString).IsWithParamList() or StzListQ(pcString).IsUsingParamList() )

			pcString = pcString[2]

		ok

		@oQByteArray = new QByteArray()
		@oQByteArray.append(cResult)

	// TODO: For the 2 following functions (Bits() and ToStzListOfBits)
	// we need to write stzListOfBits class based on QTBitArray.
	// Also, we need to manage the conversion between bits and bytes (and
	// vice-versa). For that, read this: https://wiki.qt.io/Working_with_Raw_Data
	def Bits()
		// TODO: after making stzListOfBits

	def ToStzListOfBits()
		// TODO

	// Returns a lowercase copy of the list of bytes
	// The bytearray is interpreted as a Latin-1 encoded string
	def Lowercase()
		return @oQByteArray.toLower().data()

		def ToLowercase()
			return This.Lowercased()

	def ApplyLowercase()
		This.Update( This.Lowercased() )

		def ApplyLowercaseQ()
			This.ApplyLowercase()
			return This

	// Returns an UPPERcase copy of the list of bytes
	def UPPERcase()
		return @oQByteArray.toUPPER().data()

		def ToUppercase()
			return This.Uppercased()

	def ApplyUppercase()
		This.Update( This.Uppercased() )

		def ApplyUppercaseQ()
			This.ApplyUppercase()
			return This

	// Returns a list of bytes that has whitespace removed from the both sides
	def Trimmed()
		return @oQByteArray.trimmed().data()

	def Trim()
		This.Update( This.Trimmed() )

		def TrimQ()
			This.Trim()
			return This

	// Truncates the list of bytes at the position of the nth byte
	def TruncatedAt(n)
		return @oQByteArray.truncate(8)

	def TruncateAt(n)
		This.Update( This.TruncatedAt(n) )

		def TruncateAtQ(n)
			This.TruncateAt(n)
			return this

