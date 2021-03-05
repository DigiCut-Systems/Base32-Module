#tag Module
Protected Module Base32
	#tag Method, Flags = &h0
		Function Base32StringFromInteger(Base10Num As Integer) As String
		  Var base As Integer
		  Var char As String
		  Var nextChar As Double
		  Var result As String
		  
		  
		  base = Base10Num Mod 32
		  char = Base32Chars.Middle(base, 1)
		  nextChar = Floor(Base10Num / 32)
		  
		  If nextChar <> 0 Then
		    result = Base32StringFromInteger(nextChar) + char
		  Else
		    result = char
		  End If
		  
		  Return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Base32StringToBase10Integer(b32String As String) As Integer
		  Return Base32StringToBase10String(b32String).ToInteger
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Base32StringToBase10String(b32String As String) As String
		  Var resultString As String
		  
		  // Check for Blank input
		  If b32String = "" Then
		    Return resultString
		  End If
		  
		  // Check for invalid Characters
		  If b32String.IndexOf(1,"I") <> -1 And b32String.IndexOf(1,"L") <> -1 And b32String.IndexOf(1,"O") <> -1 And b32String.IndexOf(1,"U") <> -1 Then
		    Var errorText As String
		    errorText = "Error: This string (" + b32String + ") contains alpha letters not used in duotrigesimal [I,L,O,U]"
		    MessageBox(errorText)
		    Return resultString
		  End If
		  
		  Var rest As String
		  Var char As String
		  Var charValue As Integer
		  
		  char = b32String.Uppercase.Right(1)
		  charValue = Base32Chars.IndexOf(0,char)
		  If charValue = -1 Then
		    // bail out if a non Base32 or DTG character is encountered
		    Return resultString
		  End If
		  
		  If b32String.Length < 2 Then
		    Return charValue.ToString
		  End If
		  rest = b32String.Left(b32String.Length - 1)
		  
		  If charValue = -1 Then
		    // bail out if a non Base32 or DTG character is encountered
		    Return resultString
		  End If
		  
		  Var nextValue As Integer = 32 * Base32StringToBase10String(rest).ToInteger
		  Var resultInteger As Integer = charValue + nextValue
		  resultString = resultInteger.ToString
		  
		  Return resultString
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isEven(num As Integer) As Boolean
		  'Returns True when 'n' is even and False when Odd'
		  Var m As Integer = Num Mod 2
		  If m = 0 Then
		    Return True
		  Else
		    Return False
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RandomB32(nDigits As Integer) As String
		  Var result As String
		  Var rdm As Integer
		  
		  If nDigits < 1 Then
		    nDigits = 1
		  End If
		  
		  For i As Integer = 1 To nDigits
		    rdm = System.Random.InRange(0, 31)
		    result = result + Base32Chars.Middle(rdm,1)
		  Next
		  
		  Return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function strDescramble(s As String) As String
		  Var sFin As String
		  Var sBuf1 As String
		  Var sBuf2 As String
		  
		  If IsEven(s.Length) Then 'Even number length
		    sBuf1 = s.Left(s.Length / 2) 'left half of string
		    sBuf2 = s.Right(s.Length / 2) ' right half of string
		    For i As Integer = 0 To sBuf1.Length - 1
		      'regroup char by char
		      sFin = sFin + sBuf1.Middle(i, 1) + sBuf2.Middle(i, 1)
		    Next
		  Else 'Odd number length
		    sBuf1 = s.Left(((s.Length + 1) / 2)) 'left half of string
		    sBuf2 = s.Right(((s.Length - 1) / 2)) ' right half of string
		    For i As Integer = 0 To sBuf2.Length - 1
		      'regroup char by char
		      sFin = sFin + sBuf1.Middle(i, 1) + sBuf2.Middle(i, 1)
		    Next
		    'add the last odd char
		    sFin = sFin + sBuf1.Right(1)
		  End If
		  
		  Return sFin
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function strScramble(s As String) As String
		  Var sFin As String 'Final string
		  Var sBuf1 As String 'Buffer
		  Var sBuf2 As String 'Buffer2
		  Var sLength As Integer = s.Length 'Length of s Parameter
		  
		  For i As Integer = 0 To s.Length - 1
		    If IsEven(i) Then
		      sBuf1 = sBuf1 + s.Middle(i,1)
		    Else
		      sBuf2 = sBuf2 + s.Middle(i,1)
		    End If
		  Next
		  
		  sFin = sBuf1 + sBuf2
		  Return sFin
		End Function
	#tag EndMethod


	#tag Note, Name = Base32StringFromInteger Source
		/*
		NumToDuoTrigesimal ( number )
		FileMaker Custom Function
		
		No dependencies
		
		( to convert Duotrigesimal strings back to numbers use custom function  DuoTrigesimalToNum ( DTGString ) )
		
		Created: December 26, 2010  St. Louis, MO  USA
		
		Tim Griffith Sr.
		
		Duotrigesimal, or base 32 numbers are like Hexadecimal numbers in that after 9, numbers are represented by letters. We know we can't use all the letters of the alphabet because the index of numbers would go beyond 31 up to 35. As best I have discovered the letters 'I' 'L' and 'O' are not used because in various forms they can be mistaken for other characters. My research has also shown that the letter 'U' has been omited because of 'accidental obscenities'.
		   Throughout books and the internet there are numerous algorithms showing how to convert numbers to hex and hex to numbers. I am not a genius, but rather a bit clever enough to augment those formulas to add the additional letters beyong hex F, and substitute dividing or multplying 16 into 32. All in all it was quite simple.
		   If credit is due- then it is due to those many people who have provided hex to num formulas. Thank you all- you know who you are! 
		*/
		
		// converts a number to a duotrigesimal (DTG) string
		
		Let ( [
		_BASE = Mod ( number ; 32 ) ;
		_ALPH = "0123456789ABCDEFGHJKMNPQRSTVWXYZ" ;
		_CHAR = Middle ( _ALPH ; _BASE + 1 ; 1 ) ;
		_NEXT = Div ( number ; 32 )
		] ;
		
		Case ( 
		_NEXT ;
		NumToDuoTrigesimal ( _NEXT )
		)//end Case
		& _CHAR
		)//end Let
	#tag EndNote

	#tag Note, Name = Base32StringToBase10 Source
		/* 
		DuoTrigesimalToNum ( DTGString )
		FileMaker Custom Function
		
		No dependencies
		
		( to convert Duotrigesimal strings back to numbers use custom function  NumToDuoTrigesimal ( number ) )
		
		Created: December 26, 2010  St. Louis, MO  USA
		
		Tim Griffith Sr.
		
		Duotrigesimal, or base 32 numbers are like Hexadecimal numbers in that after 9, numbers are represented by letters. We know we can't use all the letters of the alphabet because the index of numbers would go beyond 31 up to 35. As best I have discovered the letters 'I' 'L' and 'O' are not used because in various forms they can be mistaken for other characters. My research has also shown that the letter 'U' has been omited because of 'accidental obscenities'.
		   Throughout books and the internet there are numerous algorithms showing how to convert numbers to hex and hex to numbers. I am not a genius, but rather a bit clever enough to augment those formulas to add the additional letters beyong hex F, and substitute dividing or multplying 16 into 32. All in all it was quite simple.
		   If credit is due- then it is due to those many people who have provided hex to num formulas. Thank you all- you know who you are! */
		
		// converts a duotrigesimal (DTG) string into a decimal number
		// letters omited  I  L  O  U
		
		
		If ( PatternCount ( DTGString ; "I" ) > 0 or PatternCount ( DTGString ; "L" ) > 0 or PatternCount ( DTGString ; "O" ) > 0 or PatternCount ( DTGString ; "U" ) > 0 ; "Error: This string contains alpha letters not used in duotrigesimal [I,L,O,U]"
		;
		If ( IsEmpty ( DTGString ) ; 0 ; 
		  Let( [ rest = Left ( DTGString ; Length ( DTGString ) - 1 ) ; 
		           char = Upper ( Right ( DTGString ; 1 ) ) ] ; 
		    // bail out if a non DTG digit is encountered
		    If ( Position ( "0123456789ABCDEFGHJKLMNPQRSTVWXYZ" ; char ; 1 ; 1 ) ;    
		      Substitute( char ; ["A";10]; ["B";11]; ["C";12]; ["D";13]; ["E";14]; ["F";15]; ["G";16]; ["H";17]; ["J";18]; ["K";19]; ["M";20]; ["N";21]; ["P";22]; ["Q";23]; ["R";24]; ["S";25]; ["T";26]; ["V";27]; ["W";28]; ["X";29]; ["Y";30]; ["Z";31] ) 
		           + ( 32 * DuoTrigesimalToNum ( rest ) ) )
		  ) 
		)
		)
		
	#tag EndNote

	#tag Note, Name = Read Me
		Base32 or DuoTrigesimal
		
		Tim Griffith Sr. Author of FileMaker Custom Function
		Duotrigesimal, or base 32 numbers are like Hexadecimal numbers in that after 9, numbers are represented by letters. We know we can't use all the letters of the alphabet because the index of numbers would go beyond 31 up to 35. As best I have discovered the letters 'I' 'L' and 'O' are not used because in various forms they can be mistaken for other characters. My research has also shown that the letter 'U' has been omited because of 'accidental obscenities'.
		Letters omited  "I" "L"  "O" "U".
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private Base32Chars As String = "0123456789ABCDEFGHJKMNPQRSTVWXYZ"
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
