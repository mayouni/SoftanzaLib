
func StzBit(c)
	return new stzBit(c)

func StzBitQ(c)
	return new stzBit(c)

class stzBit from stzObject
	nValue

	def init(n)
		if NOT isNumber(n)
			raise(stzError(:UnsupportedType))
		ok

		if NOT IsBit(n)
			raise(stzBitError(:IncorrectValue))
		else
			nValue = n
		ok

	def Content()
		return nValue
