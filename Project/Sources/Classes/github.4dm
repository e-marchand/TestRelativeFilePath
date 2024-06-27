singleton Class constructor
	
	// MARK:-  log
	
Function notice($message : Text; $parameters : Object)
	This:C1470.cmd("notice"; $message+"\n"; Information message:K38:1; $parameters)
	
Function error($message : Text; $parameters : Object)
	This:C1470.cmd("error"; $message+"\n"; Error message:K38:3; $parameters)
	
Function warning($message : Text; $parameters : Object)
	This:C1470.cmd("warning"; $message+"\n"; Information message:K38:1/*Warning message, to test*/; $parameters)
	
Function debug($message : Text; $parameters : Object)
	This:C1470.cmd("debug"; $message+"\n"; Information message:K38:1; $parameters)
	
Function cmd($cmd : Text; $message : Text; $level : Integer/*0 default = info*/; $parameters : Object)
	var $finalMessage : Text
	$finalMessage:="::"+$cmd
	If (($parameters#Null:C1517) && Not:C34(OB Is empty:C1297($parameters)))
		$finalMessage+=" "+OB Entries:C1720($parameters).map(Formula:C1597($1.value.key+"="+String:C10($1.value.value))).join(",")
	End if 
	$finalMessage+="::"+String:C10($message)+"\n"
	LOG EVENT:C667(Into system standard outputs:K38:9; $finalMessage; $level)