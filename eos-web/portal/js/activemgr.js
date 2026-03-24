/**
*添加信任站点
*/
var WshShell = null;
function addSafeSite(sitename){
	try{
		if(!WshShell) WshShell=new ActiveXObject("WScript.Shell");
		if(sitename.indexOf(":")>0){
			sitename = sitename.substring(0,sitename.indexOf(":"));
		}
		 var prefix = sitename.substring(0,sitename.indexOf("."));
		 var suffix = sitename.substring(sitename.indexOf(".")+1,sitename.length);
		 regcreate("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\ZoneMap\\Domains\\"+suffix+"\\"+prefix+"\\http","2","REG_DWORD");
	}catch(e){
		//alert("addSafeSite ErrInfoIS:"+e);
		setCookie("activexusable","false","d360");
	}
}

/**
* 修改IE ActiveX 安全设置
* zone 2= 可信的站点区域 3=Internet 区域
*/
function setActivex(zone){
	try{
		if(!WshShell) WshShell=new ActiveXObject("WScript.Shell");
		 WshShell.RegWrite("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\Zones\\"+zone+"\\1001","0","REG_DWORD");//下载已签名的 ActiveX 控件
		 WshShell.RegWrite("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\Zones\\"+zone+"\\1004","0","REG_DWORD");//下载未签名的 ActiveX 控件
		 WshShell.RegWrite("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\Zones\\"+zone+"\\1200","0","REG_DWORD");//运行 ActiveX 控件 和插件
		 WshShell.RegWrite("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\Zones\\"+zone+"\\1201","0","REG_DWORD");//对没有标记为安全的 ActiveX 控件 进行初始化和脚本运行
		 WshShell.RegWrite("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\Zones\\"+zone+"\\1405","0","REG_DWORD");//对标记为可安全执行脚本的 ActiveX 控件 执行脚本
		 WshShell.RegWrite("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\Zones\\"+zone+"\\2201","3","REG_DWORD");//ActiveX 控件 自动提示 **
		 setCookie("hassetactivex","true","d360");
	}catch(e){
		//alert("setActivex ErrInfoIS:"+e)
		setCookie("activexusable","false","d360");
	}
}

/**
* 创建注册表
*/
function regcreate(key,val,type){
	try{
		if(WshShell){
			if(type){
			 WshShell.RegWrite(key,val,type);
			}else{
			 WshShell.RegWrite(key,val);
			}
		 }
	 }catch(e){
		//alert("regcreate ErrInfoIS:"+e)
		setCookie("activexusable","false","d360");
	}
}

/**
* 获取cookie
*/
function getCookie(name){
	var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
	if(arr=document.cookie.match(reg))
	return unescape(arr[2]);
	else
	return null;
}

function delCookie(name)
{
	var exp = new Date();
	exp.setTime(exp.getTime() - 1);
	var cval=getCookie(name);
	if(cval!=null)
	document.cookie= name + "="+cval+";expires="+exp.toGMTString();
}

/**
* 设置cookie
*s20是代表20秒
*h是指小时，如12小时则是：h12
*d是天数，30天则：d30
*/
function setCookie(name,value,time){
	var strsec = getsec(time);
	var exp = new Date();
	exp.setTime(exp.getTime() + strsec*1);
	//document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}
function getsec(str)
{
    var str1 = str.substring(1, str.length) * 1;
    var str2 = str.substring(0, 1);
    if (str2 == "s") {
        return str1 * 1000;
    }
    else if (str2 == "h"){
        return str1 * 60 * 60 * 1000;
    }
    else if (str2 == "d"){
        return str1 * 24 * 60 * 60 * 1000;
    }
}
