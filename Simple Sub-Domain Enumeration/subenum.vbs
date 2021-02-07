Dim Arg, domain, wordlist, http
Set Arg = WScript.Arguments
Set fso = CreateObject("Scripting.FileSystemObject")

domain = Arg(0)
wordlist = Arg(1)

Set f = fso.OpenTextFile(wordlist)
Do Until f.AtEndOfStream
    url = f.ReadLine & "." & domain
    Set http = CreateObject("MSXML2.ServerXMLHTTP")
    http.setTimeouts 1000, 1000, 1000, 1000 
    http.open "GET","https://" & url, False
    http.send   
On Error Resume Next
    If NOT http.Status = 12007 Then
        WScript.StdOut.WriteLine "Domain: " & url & " Status Code: " & http.Status
    End if
    Set http = Nothing
Loop

Set Arg = Nothing
Set fso = Nothing
Set f = Nothing