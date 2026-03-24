
function checkpwd(pwd){
	var myajax = new Ajax("org.gocom.abframe.rights.OperatorManager.checkPwdVaild.biz");
		myajax.addParam("pwd", pwd);
		myajax.submit();
		var result ={
		  flag :myajax.getValue("root/data/flag"),
		  msg : myajax.getValue("root/data/msg")
		  }
	return result;
	
}