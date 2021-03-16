#tag Window
Begin Window Window1
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   False
   DefaultLocation =   "0"
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   400
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   1611063295
   MenuBarVisible  =   True
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   True
   Title           =   "Base32 ListBox Lazy Loading"
   Type            =   "0"
   Visible         =   True
   Width           =   600
   Begin Listbox Listbox1
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   True
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   4
      ColumnWidths    =   "20%,*,*,*"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLinesHorizontalStyle=   "0"
      GridLinesVerticalStyle=   "0"
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   329
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   "0"
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   51
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   536
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin ScrollBar ScrollBar1
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowLiveScrolling=   True
      Enabled         =   True
      Height          =   329
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   558
      LineStep        =   1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MaximumValue    =   100
      MinimumValue    =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   51
      Transparent     =   False
      Value           =   0
      Visible         =   False
      Width           =   15
   End
   Begin PushButton LoadButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Load # rows"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   173
   End
   Begin PushButton LazyLoadButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Use Lazy Loading"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   362
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   194
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // DataOriginalLazyLoad
		  
		  // Base32FromID
		  
		  // Base32Random4
		  
		  // IsEvenList
		  
		  // StrScramble
		  
		  // StrDescramble
		  
		  CheckSumTest
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub Base32FromID()
		  For i As Integer = 1 To DataRows
		    Var d As New ListData
		    
		    'i is a simple integer serial number value starting with 1'
		    d.c1 = i
		    
		    'd.c2 in following line is d.c1 converted to equivilant base32 string'
		    d.c2 = Base32StringFromInteger(i)
		    
		    'd.c2 in following line is d.c1 converted to equivilant base32 value'
		    d.c3 = Base32StringToBase10String(d.c2)
		    
		    'Setting of Reversal of Base32 value in Desc back to number for comparison'
		    d.c4 = Base32StringToBase10Integer(d.c2).ToString
		    
		    Data.AddRow(d)
		  Next
		  
		  Listbox1.ColumnCount = 4
		  Listbox1.ColumnWidths = "10%,*,*,*"
		  Listbox1.HeaderAt(0) = "ID Integer"
		  Listbox1.HeaderAt(1) = "Base32StringFromInteger"
		  Listbox1.HeaderAt(2) = "Base32StringToBase10String"
		  Listbox1.HeaderAt(3) = "Base32StringToBase10Integer"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Base32Random4()
		  Var f As String = "###,###,###,###"
		  
		  For i As Integer = 1 To DataRows
		    Var d As New ListData
		    
		    'i is a simple integer serial number value starting with 1'
		    d.c1 = i
		    
		    'RandomB32 Test for nDigits As Int for the width'
		    d.c2 = RandomB32(4)
		    
		    'd.c2 in following line is d.c1 converted to equivilant base32 value'
		    d.c3 = Base32StringToBase10String(d.c2)
		    
		    'Setting of Reversal of Base32 value in Desc back to number for comparison'
		    d.c4 = Format(Base32StringToBase10Integer(d.c2), f)
		    
		    Data.AddRow(d)
		  Next
		  
		  Listbox1.ColumnCount = 4
		  Listbox1.ColumnWidths = "20%,*,*,*"
		  Listbox1.HeaderAt(0) = "ID Integer"
		  Listbox1.HeaderAt(1) = "Random Base32"
		  Listbox1.HeaderAt(2) = "Base32StringToBase10String"
		  Listbox1.HeaderAt(3) = "Base32StringToBase10Integer"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CheckSumTest()
		  For i As Integer = 1 To DataRows
		    Var d As New ListData
		    
		    'Column 1
		    'i is a simple integer serial number value starting with 1
		    d.c1 = i
		    
		    'Column 2
		    ' Randomized base 32 string
		    If i = 1 Then
		      d.c2 = "123456789ABCD"
		    Else
		      d.c2 = RandomB32(13)
		    End If
		    
		    'Column 3
		    'Check sum of Column 2
		    d.c3 = Base32CheckDigit(d.c2)
		    
		    'Column 4
		    'Scrambled Column 2
		    d.c4 = StrScramble(d.c2)
		    
		    'Column 5
		    'Check sum of Column 4
		    d.c5 = Base32CheckDigit(d.c4)
		    
		    Data.AddRow(d)
		  Next
		  
		  Listbox1.ColumnCount = 5
		  Listbox1.ColumnWidths = "15%,*,*,*,*"
		  Listbox1.HeaderAt(0) = "ID Integer"
		  Listbox1.HeaderAt(1) = "Ordered Text"
		  Listbox1.HeaderAt(2) = "Ordered CheckSum"
		  Listbox1.HeaderAt(3) = "Scrambled"
		  Listbox1.HeaderAt(4) = "Scrambled CheckSum"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DataOriginalLazyLoad()
		  For i As Integer = 1 To DataRows
		    Var d As New ListData
		    'i is a simple integer serial number value starting with 1
		    d.c1 = i
		    
		    'ListBoxLazyLoad original value Random value'
		    d.c3 = Rnd.ToString
		    
		    'ListBoxLazyLoad original value Description value'
		    d.c2 = "Testing"
		    
		    Data.AddRow(d)
		  Next
		  
		  Listbox1.ColumnCount = 3
		  Listbox1.ColumnWidths = "20%,*,*"
		  Listbox1.HeaderAt(0) = "ID Integer"
		  Listbox1.HeaderAt(1) = "Value"
		  Listbox1.HeaderAt(2) = "Description"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub isEvenList()
		  For i As Integer = 1 To DataRows
		    Var d As New ListData
		    'i is a simple integer serial number value starting with 1
		    d.c1 = i
		    
		    'ListBoxLazyLoad original value Random value'
		    d.c2 = isEven(i).ToString
		    
		    Data.AddRow(d)
		  Next
		  
		  Listbox1.ColumnCount = 2
		  Listbox1.ColumnWidths = "10%,*"
		  Listbox1.HeaderAt(0) = "ID Integer"
		  Listbox1.HeaderAt(1) = "IsEven"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub StrDescramble()
		  For i As Integer = 1 To DataRows
		    Var d As New ListData
		    
		    'Column 1
		    'i is a simple integer serial number value starting with 1
		    d.c1 = i
		    
		    'Column 2
		    'Ordered Text Before Scramble - Randomize
		    If i = 1 Then
		      d.c2 = "123456789ABCD"
		    Else
		      d.c2 = RandomB32(13)
		    End If
		    
		    'Column 3
		    'Scrambled Desc
		    d.c3 = strScramble(d.c2)
		    
		    'Column 4
		    'Scrambled from Value
		    d.c4 = StrDescramble(d.c3)
		    
		    'Column 5
		    'Does Column 2 equal Colum 4
		    'd.c5 = d.c2.Compare(d.c4, ComparisonOptions.CaseSensitive).ToString
		    d.c5 = isEqualCaseSensitive(d.c2, d.c4).ToString
		    
		    Data.AddRow(d)
		  Next
		  
		  Listbox1.ColumnCount = 5
		  Listbox1.ColumnWidths = "15%,*,*,*,*"
		  Listbox1.HeaderAt(0) = "ID Integer"
		  Listbox1.HeaderAt(1) = "Ordered Text"
		  Listbox1.HeaderAt(2) = "Scrambled"
		  Listbox1.HeaderAt(3) = "Descrambled"
		  Listbox1.HeaderAt(4) = "Ordered = Descrambled"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub StrScramble()
		  For i As Integer = 1 To DataRows
		    Var d As New ListData
		    
		    'Column 1
		    'i is a simple integer serial number value starting with 1
		    d.c1 = i
		    
		    'Column 2
		    'Ordered Text Before Scramble - Randomize
		    If i = 1 Then
		      d.c2 = "123456789ABCD"
		    Else
		      d.c2 = RandomB32(13)
		    End If
		    
		    'Column 3
		    'Scrambled Desc
		    d.c3 = strScramble(d.c2)
		    
		    'Column 4
		    'Length of scrambled Value
		    d.c4 = d.c3.Length.ToString
		    
		    Data.AddRow(d)
		  Next
		  
		  Listbox1.ColumnCount = 4
		  Listbox1.ColumnWidths = "20%,*,*,*"
		  Listbox1.HeaderAt(0) = "ID Integer"
		  Listbox1.HeaderAt(1) = "Ordered Text"
		  Listbox1.HeaderAt(2) = "Scrambled"
		  Listbox1.HeaderAt(3) = "Scrambled Length"
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Data() As ListData
	#tag EndProperty

	#tag Property, Flags = &h0
		DataRows As Integer = 1000
	#tag EndProperty


#tag EndWindowCode

#tag Events ScrollBar1
	#tag Event
		Sub ValueChanged()
		  Listbox1.RemoveAllRows
		  For i As Integer = Me.Value To Me.Value + 50
		    If i <= Data.LastRowIndex Then
		      Listbox1.AddRow(Data(i).c1.ToString, Data(i).c2, Data(i).c3, Data(i).c4, Data(i).c5)
		    End If
		  Next
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LoadButton
	#tag Event
		Sub Action()
		  Listbox1.HasVerticalScrollbar = True
		  ScrollBar1.Visible = False
		  Listbox1.RemoveAllRows
		  
		  For i As Integer = 0 To Data.LastRowIndex
		    Listbox1.AddRow(Data(i).c1.ToString, Data(i).c2, Data(i).c3, Data(i).c4, Data(i).c5, Data(i).c6)
		  Next
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.Caption = "Load " + DataRows.ToString + " Rows"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LazyLoadButton
	#tag Event
		Sub Action()
		  Listbox1.RemoveAllRows
		  Listbox1.HasVerticalScrollbar = False
		  ScrollBar1.Visible = True
		  ScrollBar1.MinimumValue = 0
		  ScrollBar1.MaximumValue = Data.LastRowIndex
		  ScrollBar1.Value = 0
		  
		  For i As Integer = 0 To 50
		    Listbox1.AddRow(Data(i).c1.ToString, Data(i).c2, Data(i).c3, Data(i).c4, Data(i).c5, Data(i).c6)
		  Next
		End Sub
	#tag EndEvent
#tag EndEvents
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
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DataRows"
		Visible=false
		Group="Behavior"
		InitialValue="1000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
