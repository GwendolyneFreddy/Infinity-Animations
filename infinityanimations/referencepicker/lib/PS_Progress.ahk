;
; AutoHotkey Version: 1.1.30.01
; Language:       English
; Platform:       Optimized for Windows 10
; Author:         Sam.
;

;~ #NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;~ #Warn All, StdOut  ; Enable warnings to assist with detecting common errors.
;~ SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;~ SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;~ #SingleInstance Force  ; Skips the dialog box and replaces the old instance automatically, which is similar in effect to the Reload command.

;~ Progress1:=New PS_Progress(755,30)
;~ Progress1.AddSection(255,0,0,0,9)
;~ Progress1.AddSection(255,255,0,0,1)
;~ Progress1.AddSection(0,128,0,0,90)
;~ Progress:=Progress1.GethProgress()
;~ Progress1:=""

;~ ;file:=FileOpen(A_ScriptDir "\tmpbmp.bmp","w-d")
	;~ ;file.RawWrite(Progress1.GetAddress("Raw"),Progress1.FileSize)
;~ ;file.Close()

;~ Gui, Add, Picture, x10 y10, % "hBitmap:*" Progress
;~ Gui, Show, w800 h100
;~ Return

;~ GuiClose:
;~ Progress1:=""
;~ DllCall("DeleteObject","ptr",Progress)
;~ ExitApp


class PS_Progress{
	__New(Width,Height){
		this.Width:=Width, this.Height:=Height
		this.ScanLinePadding:=0, this.Palette:={}, this.Section:={}, this.pToken:=Gdip_Startup()
		While (Mod(this.Width+this.ScanLinePadding,4)>0)
			this.ScanLinePadding++
		this.FileSize:=1078+this.Width*this.Height+this.ScanLinePadding*this.Height
		this.Raw:=" ", this.SetCapacity("Raw",this.FileSize), DllCall("RtlFillMemory","Ptr",this.GetAddress("Raw"),"UInt",this.FileSize,"UChar",0)
		this.DataMem:=New MemoryFileIO(this.GetAddress("Raw"),this.FileSize)
		this.DataMem.Seek(0,0)
		this.DataMem.Write("BM",2)
		this.DataMem.WriteUInt(this.FileSize)
		this.DataMem.WriteUShort(0)
		this.DataMem.WriteUShort(0)
		this.DataMem.WriteUInt(1078)
		this.DataMem.WriteUInt(40)
		this.DataMem.WriteInt(this.Width)
		this.DataMem.WriteInt(this.Height)
		this.DataMem.WriteUShort(1)
		this.DataMem.WriteUShort(8)
		this.DataMem.WriteUInt(0)
		this.DataMem.WriteUInt(0)
		this.DataMem.WriteInt(0)
		this.DataMem.WriteInt(0)
		this.DataMem.WriteUInt(NumPal:=256)
		this.DataMem.WriteUInt(NumPal)
	}
	SetSectionColor(Idx,RR,GG,BB,AA:=0){ ; Idx should be 0-based
		this.Palette[Idx,"RR"]:=RR
		this.Palette[Idx,"GG"]:=GG
		this.Palette[Idx,"BB"]:=BB
		this.Palette[Idx,"AA"]:=AA
	}
	AddSection(RR,GG,BB,AA:=0,Percent:=0){
		this.SetSectionColor((Idx:=this.Palette.Count()),RR,GG,BB,AA)
		this.Section[Idx]:=Percent
	}
	SetSectionPercent(Idx,Percent){
		this.Section[Idx]:=Percent
	}
	GethProgress(){
		; Write Palette
		this.DataMem.Seek(54,0)
		Loop, % this.Palette.Count()
			{
			Index:=A_Index-1
			this.DataMem.WriteUChar(this.Palette[Index,"BB"])
			this.DataMem.WriteUChar(this.Palette[Index,"GG"])
			this.DataMem.WriteUChar(this.Palette[Index,"RR"])
			this.DataMem.WriteUChar(this.Palette[Index,"AA"])
			}
		; Write Frame Data
		this.DataMem.Seek(1078,0)
		Index:=0
		Loop, % this.Height ; For each row in Height of Progress
			{
			For Idx,Percent in this.Section	; For each section of Progress
				{
				Loop, % (Cnt:=Round(Percent*this.Width/100))	; Sets pixels for this section
					{
					this.DataMem.WriteUChar(Idx)
					Index++
					If (Index=this.Width)
						Break, 2
					}
				}
			Loop, % (this.ScanLinePadding)
				this.DataMem.WriteUChar(0)
			Index:=0
			}
		Return GDIPlus_hBitmapFromBuffer("",this.FileSize,this.GetAddress("Raw"))
	}
	__Delete(){
		this.Raw:="", this.Delete("Raw"), this.DataMem:=""
		Gdip_Shutdown(this.pToken)
	}
}

;;;;;;;;;;;;;;;;;;;;;;;;;	Gdip	;;;;;;;;;;;;;;;;;;;;;;;;;
GDIPlus_hBitmapFromBuffer( ByRef Buffer, nSize , BufferAddress) { ;  Last Modifed : 21-Jun-2011
; https://autohotkey.com/boards/viewtopic.php?p=178626#p178626
; Adapted version by SKAN www.autohotkey.com/forum/viewtopic.php?p=383863#383863
; Original code   by Sean www.autohotkey.com/forum/viewtopic.php?p=147029#147029
 pStream:=pBitmap:=hBitmap:=""
 hData := DllCall("GlobalAlloc", UInt,2, UInt,nSize )
 pData := DllCall("GlobalLock",  UInt,hData )
 DllCall( "RtlMoveMemory", UInt,pData, UInt,(BufferAddress?BufferAddress:&Buffer), UInt,nSize )
 DllCall( "GlobalUnlock" , UInt,hData )
 DllCall( "ole32\CreateStreamOnHGlobal", UInt,hData, Int,True, UIntP,pStream )
 DllCall( "gdiplus\GdipCreateBitmapFromStream",  UInt,pStream, UIntP,pBitmap )
 DllCall( "gdiplus\GdipCreateHBITMAPFromBitmap", UInt,pBitmap, UIntP,hBitmap, UInt,RtlUlongByteSwap64(DllCall( "GetSysColor", Int,15 )<<8) | 0xFF000000 )
 DllCall( "gdiplus\GdipDisposeImage", UInt,pBitmap )
 DllCall( NumGet( NumGet(1*pStream)+8 ), UInt,pStream ) ; IStream::Release
Return hBitmap
; Also See:
;   GdiPlus_SaveImageToBuffer() - Scripts and Functions - AutoHotkey Community
;   https://autohotkey.com/board/topic/85523-gdiplus-saveimagetobuffer/
}
Gdip_Startup()
	{
	Ptr := A_PtrSize ? "UPtr" : "UInt"
	pToken := 0

	if !DllCall("GetModuleHandle", "str", "gdiplus", Ptr)
		DllCall("LoadLibrary", "str", "gdiplus")
	VarSetCapacity(si, A_PtrSize = 8 ? 24 : 16, 0), si := Chr(1)
	DllCall("gdiplus\GdiplusStartup", A_PtrSize ? "UPtr*" : "uint*", pToken, Ptr, &si, Ptr, 0)
	return pToken
	}
Gdip_Shutdown(pToken)
	{
	Ptr := A_PtrSize ? "UPtr" : "UInt"

	DllCall("gdiplus\GdiplusShutdown", Ptr, pToken)
	if hModule := DllCall("GetModuleHandle", "str", "gdiplus", Ptr)
		DllCall("FreeLibrary", Ptr, hModule)
	return 0
	}
RtlUlongByteSwap64(num){
	; Url: https://autohotkey.com/boards/viewtopic.php?p=181437&sid=ed1119d85377e323927b569b0281d9cd#p181437
	;	- https://msdn.microsoft.com/en-us/library/windows/hardware/ff562886(v=vs.85).aspx (RtlUlongByteSwap routine)
	;	- https://msdn.microsoft.com/en-us/library/e8cxb8tk.aspx (_swab function)
	; For example, if the Source parameter value is 0x12345678, the routine returns 0x78563412.
	; works on both 32 and 64 bit.
	; v1 version
	static dest, src
	static i := varsetcapacity(dest,4) + varsetcapacity(src,4)
	numput(num,src,"uint")
	,DllCall("MSVCRT.dll\_swab", "ptr", &src, "ptr", &dest+2, "int", 2, "cdecl")
	,DllCall("MSVCRT.dll\_swab", "ptr", &src+2, "ptr", &dest, "int", 2, "cdecl")
	return numget(dest,"uint")
}


;~ #Include, lib
#Include, MemoryFileIO.ahk
;~ #Include, ImageLibraryImports.ahk
