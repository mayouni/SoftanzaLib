/*
The main advantage of using Octal numbers is that it uses less
digits than decimal and Hexadecimal number system. So, it has
fewer computations and less computational errors. It uses only
3 bits to represent any digit in binary and easy to convert
from octal to binary and vice-versa. It is easier to handle
input and output in the octal form.
*/

func StzOctalNumberQ(cNumber)
	return new stzOctalNumber(cNumber)

class stzOctalNumber from stzObject
	@cOctalNumber

	def init(pNumber)
		if isString(pNumber)
			if pNumber = ""
				@cOctalNumber = OctalPrefix()

			but StringRepresentsNumberInOctalForm(pNumber)
				@cOctalNumber = pNumber
			ok

		else
			raise(stzOctalNumberError(:CanNotCreateOctalNumber))
		ok

	def Content()
		return @cOctalNumber
	
	def ToStzNumber()
		return new stzNumber(This.ToDecimalForm())

	def ToStzString()
		return new stzString(This.OctalNumber())

	def ToDecimalForm()
		oStzStr = new stzString(This.OctalNumber())
		cOctal = oStzStr.Section(2, len(This.OctalNumber()) )

		nResult = 0
		nLen = len(cOctal)

		aPow = []
		for i = 0 to nLen - 1
			aPow + pow(8, i)
		next

		aDigits = []
		for i = nLen to 1 step -1
			aDigits + cOctal[i]
		next

		for i = 1 to nLen
			nResult += aDigits[i] * aPow[i]
		next
		
		return nResult

	def OctalNumber()
		return Content()

	def ToBinaryForm()
		return This.ToStzNumber().ToBinaryForm()

		def ToBinary()
			return This.ToBinaryForm()

	def ToBinaryFormWithoutPrefix()
		return This.ToStzNumber().ToBinaryFormWithoutPrefix()

		def ToBinaryWithoutPrefix()
			return This.ToBinaryFormWithoutPrefix()

	def ToHexForm()
		oNumber = new stzNumber(This.ToDecimalForm())
		return oNumber.ToHexForm()

		def ToHex()
			return This.ToHexForm()

	def ToUnicodeHexForm()
		oNumber = new stzNumber(This.ToDecimalForm())
		return oNumber.ToUnicodeHexForm()

		def ToUnicodeHexFor()
			return This.ToUnicodeHexForm()

	def ToHexFormWithoutPrefix()
		return This.ToStzNumber().ToHexFormWithoutPrefix()

		def ToHexmWithoutPrefix()
			return This.ToHexFormWithoutPrefix()

	def ToBaseNForm(n)
		# n must be netween 2 to 32
		return This.ToStzNumber().ToBaseNForm(n)

		def toBaseN(n)
			return This.ToBaseNForm(n)

	def ToScientificNotationForm()
		return This.ToStzNumber().ToScientificNotationForm()

		def ToScientificNotation()
			return This.ToScientificNotationForm()

	def ToBytes() # TODO: Should also be turned as stzListOfBytes
		return This.ToStzNumber().ToBytes()

	def FromDecimalForm(n)
		@cOctalNumber = StzNumberQ(n).ToOctalForm()		

		def FromDecimal(n)
			This.FromDecimalForm(n)

	def FromBinaryForm(cBinary)
		@cOctalNumber = StzBinaryNumberQ(cBinary).ToOctalForm()		

		def FromBinary(cBinary)
			This.FromBinaryForm(cBinary)

	def FromHexForm(cHex)
		@cOctalNumber = StzHexNumberQ(cHex).ToOctalForm()		

		def FromHex(cHex)
			This.FromHexForm(cHex)

