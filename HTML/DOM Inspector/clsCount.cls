VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsCount"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'Copyright (C) 2004 Kristian. S.Stangeland

'This program is free software; you can redistribute it and/or
'modify it under the terms of the GNU General Public License
'as published by the Free Software Foundation; either version 2
'of the License, or (at your option) any later version.

'This program is distributed in the hope that it will be useful,
'but WITHOUT ANY WARRANTY; without even the implied warranty of
'MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
'GNU General Public License for more details.

'You should have received a copy of the GNU General Public License
'along with this program; if not, write to the Free Software
'Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

Private Declare Function QueryPerformanceCounter Lib "kernel32" (lpPerformanceCount As Currency) As Long
Private Declare Function QueryPerformanceFrequency Lib "kernel32" (lpFrequency As Currency) As Long

Private m_HasCounter As Boolean
Private m_Freq As Currency
Private m_Start As Currency
Private m_Stop As Currency
Private m_Elapsed As Currency

Private Sub Class_Initialize()

    m_HasCounter = QueryPerformanceFrequency(m_Freq)

End Sub

Public Sub StartTimer()

    QueryPerformanceCounter m_Start
    
End Sub

Public Sub StopTimer()

    QueryPerformanceCounter m_Stop

End Sub

Public Property Get Elasped() As String

    m_Elapsed = (((m_Stop - m_Start) / m_Freq) * 1000)
    Elasped = Format(m_Elapsed, "###,###,##0.00")

End Property


