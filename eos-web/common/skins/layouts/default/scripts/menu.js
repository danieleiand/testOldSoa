/*
 *根据应用编号和url生成完整的url
 */
function generateUrl(url,appid,context){
    var protoexpr = new RegExp("^http(|s)://");
    var app = apps[appid];
    if(protoexpr.test(url)){ //如果是http或者https开头则直接返回
        return url;
    }else{  
	    if(app!=null&&app.apptype!='0'){
	      //http://192.168.0.1:8080/eos-default/org.gocom.abframe.auth.Login.flow
	      return "http://"+app.ipaddr+generatePort(app.ipport)+"/"+generateContext(app.url,context)+"/"+geturl(url);
	    }else{
	      return generateContext(app.url,context)+"/"+geturl(url);
	    }
    }
}
 function generatePort(port){
    if(port!=null&&port!="80"){
       return ":"+port;
    }else{
       return "";
    }
 }
 function generateContext(context,currentContext){
    if(context==null||context==""){
     return currentContext; 
    }
    var  expr = new RegExp("^/");
    if(expr.test(context)){
       context = context.substr(1);       
    }    
    expr = new RegExp("/$");
    if(expr.test(context)){
      context = context.substr(0,context.length-1);    
    }
    return context;
 }
 function geturl(url){
    var expr = new RegExp("^/");
    return expr.test(url)?url.substring(1):url;
 }
 function testUrl(ctx){
    alert(generateUrl($id('testurl').value,$id('testapp').value,ctx));
 }