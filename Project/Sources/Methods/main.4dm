//%attributes = {}

var $path:="Project/TestRelativeFilePath.4DProject"
var $paths:=[$path; "./"+$path; File:C1566(Folder:C1567(fk database folder:K87:14).file($path).platformPath; fk platform path:K87:2).path]

For each ($path; $paths)
	
	cs:C1710.github.me.notice("----- "+$path+"-----")
	
	var $file:=File:C1566($path)
	Case of 
		: ($file=Null:C1517)
			cs:C1710.github.me.error("file does not exist: NULL")
		: ($file.exists)
			cs:C1710.github.me.notice("file exists:"+$file.path)
		Else 
			cs:C1710.github.me.error("file does not exist:"+$file.path)
	End case 
	
	var $parent:=$file.parent
	Case of 
		: ($parent=Null:C1517)
			cs:C1710.github.me.error("parent does not exist: NULL")
		: ($parent.exists)
			cs:C1710.github.me.notice("parent exists:"+$parent.path)
		Else 
			cs:C1710.github.me.error("parent does not exist:"+$parent.path)
	End case 
	
	$parent:=$parent.parent
	Case of 
		: ($parent=Null:C1517)
			cs:C1710.github.me.error("parent of parent does not exist: NULL")
		: ($parent.exists)
			cs:C1710.github.me.notice("parent of parent exists:"+$parent.path)
		Else 
			cs:C1710.github.me.error("parent of parent does not exist:"+$parent.path)
	End case 
	
End for each 