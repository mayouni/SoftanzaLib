# TODO

func StzNaturalCodeQ()
	return new stzNaturalCode

class stzNaturalCode from stzString
	@cCode
	@EndPoint

	def Say(pcCode)
		@cCode = StzStringQ(cCode).RemoveBoundsQ("{","}").Simplified()

	def Code()
		return @cCode

	def IsWellFormed()
		bResult = TRUE

		# Check for mistakes

		return bResult

	def CodeExecute()
		if NOT This.IsWellFormed()
			stzRaise("Can't parse it! Check for mistakes.")
		ok

		eval( This.Code() )

	def ContainsEndPoint()
		if NOT This.IsWellFormed()
			stzRaise("Can't parse it! Check for mistakes.")
		ok



		//if StzStringQ( This.Code() ).ContainsCS("until(", :CS = FALSE) OR
		   

	def EndPoint()
		// TODO
