<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://eos.primeton.com/tags/html" prefix="h"%>
<%@ taglib uri="http://eos.primeton.com/tags/logic" prefix="l"%>
<%@ taglib uri="http://eos.primeton.com/tags/bean" prefix="b"%>
<%@ taglib uri="http://eos.primeton.com/tags/eos" prefix="e"%>
<%@ taglib uri="http://eos.primeton.com/tags/webcomp" prefix="w"%>
<%@ taglib uri="http://eos.primeton.com/tags/richweb" prefix="r"%>
<%@ taglib uri="http://eos.primeton.com/tags/dict" prefix="d"%>
<%@ taglib uri="http://eos.primeton.com/tags/abframe" prefix="abf"%>
<%@page import="org.gocom.abframe.auth.bizlet.SkinUtil"%>
<%@page import="org.gocom.abframe.ABFConfigKey"%>
<%@page import="com.eos.foundation.eoscommon.BusinessDictUtil"%>
<%
//TODO 如果要设置客户端缓存页面，注释以下三行
response.setHeader("Pragma","No-Cache"); 
response.setHeader("Cache-Control","No-Cache");
response.setHeader("Content-Type", "text/html; charset=utf-8");
response.setDateHeader("Expires",   0);

String systemTitle = "韵达SOA";
String selectNullLable = "-请选择-";
String selectAllLable = "-全部-";
String goutongTip = "<font style='color: red;'>注：为了提高审批效率，现已对审批操作功能进行了优化，通常默认审批意见为“同意”，如暂不审批，如需沟通，请勾选“沟通”选项，并在沟通内容栏中填写！</font>";
goutongTip += "<br><font style='color: red;'>在流程审批过程中，若发现审批流与授权有冲突或者发生异常，请第一时间将流程号及问题上报给</font>";
goutongTip += "<a href='wxwork://message/uin=8444250174320681'><span style='color:blue;padding-left:5px;'>在线技术客服</span></a>";
String backBtnText = "返回";
String backBtnEvent = "windowclose();";
String nbsp_btn = "&nbsp;&nbsp;&nbsp;&nbsp;";
%>
<script type="text/javascript">
	var contextPath = "<%=request.getContextPath()%>";	 // you should define the contextPath of web application
	var EOSDEBUG = false;
	var FINAL_PANEL_HEIGHT = 22;
	<%-- manager(group_manager.jsp)主页面中iframe需要减少的高度 --%>
	var IFRAME_MODIFY_HEIGHE = 35;
	<%-- tree(group_tree.jsp)页面中tree需要减少的高度 --%>
	var TREE_MODIFY_HEIGHT = 22;
	
	var workflow_condesc_length = 1000;
	var mobileReg = /<%=BusinessDictUtil.getDictName("YD_REGULAR_EXPRESSION","moblie") %>/; //验证手机号的正则表达式
</script>
<h:script i18n="true" src="/common/javascripts/message.js" />
<script type="text/javascript">
	
var CN_ZERO = "零";
var CN_ONE = "壹";
var CN_TWO = "贰";
var CN_THREE = "叁";
var CN_FOUR = "肆";
var CN_FIVE = "伍";
var CN_SIX = "陆";
var CN_SEVEN = "柒";
var CN_EIGHT = "捌";
var CN_NINE = "玖";
var CN_TEN = "拾";
var CN_HUNDRED = "佰";
var CN_THOUSAND = "仟";
var CN_TEN_THOUSAND = "万";
var CN_HUNDRED_MILLION = "亿";
var CN_SYMBOL = "人民币";
var CN_DOLLAR = "圆";
var CN_TEN_CENT = "角";
var CN_CENT = "分";
var CN_INTEGER = "整";
var CN_MINUS = "负";
var NUMBER_MONEY_PREFIX = "￥";
var NUMBER_CHINESE_ERROR_NULL = "输入货币不能为空!";
var NUMBER_CHINESE_ERROR_CHARATER = "输入格式不为货币!";
var NUMBER_CHINESE_ERROR_LARGE = "输入数字太大!";

var CALENDAR_TODAY = "今天";
var CALENDAR_DEFAULT_FORMAT = "yyyy年MM月dd日";
var CALENDAR_PRE_YEAR = "上一年";
var CALENDAR_PRE_MONTH = "上一月";
var CALENDAR_NEXT_MONTH = "下一月";
var CALENDAR_NEXT_YEAR = "下一年";
var CALENDAR_SUNDAY = "日";
var CALENDAR_MONDAY = "一";
var CALENDAR_TUESDAY = "二";
var CALENDAR_WEDNESDAY = "三";
var CALENDAR_THURSDAY = "四";
var CALENDAR_FRIDAY = "五";
var CALENDAR_SATURDAY = "六";
var CALENDAR_YEAR = "年";
var CALENDAR_MONTH = "月";
var CALENDAR_DAY = "日";
var CALENDAR_YEAR_OVERFLOW = "年份超出范围（1000-9999）!";
var CALENDAR_TIME = "时间";

var EOSLOG_ERROR_TYPE=" 错误类型:";
var EOSLOG_ERROR_CODE=" 错误编号:";
var EOSLOG_ERROR_INFO=" 错误信息:";
var EOSLOG_ERROR_URL=" 错误地址:";
var EOSLOG_ERROR_LINE=" 错误行数:";
var EOSLOG_ERROR_STACK=" 调用堆栈:";
var EOSLOG_ERROR_DETAIL=" 错误详情:";
var EOSLOG_ERROR_FUNCTION=" 调用函数:";
var EOSLOG_EVAL_ERROR = " 命令出错,请检查命令. ";



var SELECT_EDITOR_FILTER_BUTTON = "过滤";
var SELECT_EDITOR_FILTER_LABEL = "按";

var DATACELL_CELL_ADVANCED = "高级控件";
var DATACELL_MODIFY_CONFIRM = "数据已修改，但未提交，要提交数据吗?";
var DATACELL_MODIFY_NO = "数据未修改!";
var DATACELL_SAVE_ERR = "数据保存操作发生错误!";
var DATACELL_PAGENUM_ERR = "请输入一个正整数!";

var CHECK_MUST_INPUT=" 该项为必填项.";
var CHECK_INPUT_LENGTH_CANNOT_MORE_THAN="输入最大长度不能超过";
var CHECK_INPUT_LENGTH_CANNOT_LESS_THAN="输入最小长度不能小于";
var CHECK_NOT_MORE_THAN="输入最大值不能超过";
var CHECK_NOT_LESS_THAN="输入最小值不能小于";
var CHECK_INPUT_NUMBER="请输入数字";
var CHECK_INPUT_NATURALNUMBER="请输入自然数";
var CHECK_IUPUT_INT="请输入整数";
var CHECK_INPUT_FLOAT="请输入实数";
var CHECK_INPUT_ZH="请输入汉字";
var CHECK_INPUT_LLETTER="请输入小写英文字母";
var CHECK_INPUT_ULETTER="请输入大写英文字母";
var CHECK_INPUT_LETTER="请输入英文字母";
var CHECK_INPUT_LLETTER_NUMBER="请输入小写字母或数字";
var CHECK_INPUT_ULETTER_NUMBER="请输入大写字母或数字";
var CHECK_INPUT_LETTER_NUMBER="请输入字母或数字";
var CHECK_INPUT_ZH_LETTER_NUMBER="请输入汉字、字母或数字";
var CHECK_INVALID_IP="请输入合法的计算机IP地址";
var CHECK_INVALID_PORT="请输入合法的计算机IP地址端口号";
var CHECK_INVALID_WEBSITE="请输入合法的网页地址";
var CHECK_INVALID_EMAIL="请输入合法的电子邮件地址";
var CHECK_INVALID_FOLDER="请输入合法的文件夹名称";
var CHECK_INVALD_HANDPHONE="请输入正确的手机号码";
var CHECK_INVALID_PHONE="请输入正确的电话号码";
var CHECK_POSTALCODE_MUST_NUMBER="邮政编码长度必须数字";
var CHECK_INVAILID_POSTALCODE_LENGTH="邮政编码长度必须是6位";
var CHECK_INVALID_ID="请输入合法的身份证号码";
var CHECK_INVALID_EXP="不符合指定的正则表达式要求";
var CHECK_LEGNT_NOT_THAN=",总位数不超过";
var CHECK_WEI="位";
var CHECK_FRACTION_LENGTH_NOT_THAN=",小数位不超过";
var CHECK_ERROROCCUR="有错误发生"
var STREE_ENTITY_NOT_EXIST="实体不存在!";

var RTREE_CANNOT_MOVE_NODE1= "无法移动节点: 目标节点和被移动节点的父节点相同。";
var RTREE_CANNOT_MOVE_NODE2= "无法移动节点: 目标节点是被移动节点的子节点。";
var STREE_MOT_FOUND="未找到方法";
var PAGE_INFO = "共{0}页";
var PAGE_RECORDINFO = "显示{0}-{1}条,共{2}条";
var PAGE_INFO_NOCOUNT = "第{0}页";
var PAGE_RECORDINFO_NOCOUNT = "显示{0}-{1}条";

var TOOLTIP_ADD = "添加";
var TOOLTIP_DELETE = "删除";
var TOOLTIP_SAVE = "保存";
var TOOLTIP_RELOAD = "刷新";
var TOOLTIP_GOTO = "转到";
var TOOLTIP_FIRST_PAGE = "第一页";
var TOOLTIP_PRIVOUS_PAGE = "上一页";
var TOOLTIP_NEXT_PAGE = "下一页";
var TOOLTIP_LAST_PAGE = "最后一页";

var ADD = "添加";
var DELETE = "删除";
var SAVE = "保存";
var REFRESH = "刷新";
var GOTO = "转到";
var FIRST_PAGE = "第一页";
var LAST_PAGE = "最后一页";
var NEXT_PAGE = "下一页";
var PRIVOUS_PAGE = "上一页";

var EOSLOG_ERROR_TYPE=" 错误类型:";
var EOSLOG_ERROR_CODE=" 错误编号:";
var EOSLOG_ERROR_INFO=" 错误信息:";
var EOSLOG_ERROR_URL=" 错误地址:";
var EOSLOG_ERROR_LINE=" 错误行数:";
var EOSLOG_ERROR_STACK=" 调用堆栈:";
var EOSLOG_ERROR_DETAIL=" 错误详情:";
var EOSLOG_ERROR_FUNCTION=" 调用函数:";
var EOSLOG_EVAL_ERROR = " 命令出错,请检查命令. ";
var EOS_CITY_LIST={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"};
var DATE_FORMAT_ERROR = "日期格式错误!";
var TIME_FORMAT_ERROR = "时间格式错误!";

var AJAX_EXCEPTION = "Ajax操作发生异常,异常信息如下:";
var AJAX_EXCEPTION_INVALID = "您没有登录或无权访问您所请求的资源.";
var GOTO_LOGIN_PAGE = "您没有登录或无权访问您所请求的资源.\n系统将跳转到登录页面,请您重新登录.";
var CLEAR = "清空";
var VERIFYCODETITLE="看不清,换一张."
var CALENDAR_ERROR_RORMAT = "日期 {0} 必须符合 {1} 格式";
var CALENDAR_ERROR_BETWEEN = "日期 {0} 必须符合 {1} 格式，并且在 {2} 和 {3} 之间！";
var CALENDAR_ERROR_MIN = "日期 {0} 必须小于 {1}！";
var CALENDAR_ERROR_MAX = "日期 {0} 必须大于 {1}！";
var CALENDAR_BUTTON_OK = "确定";
</script>
<h:script src="/common/fckeditor/fckeditor.js" />
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<h:script src="/common/lib/mootools.js"/>
<h:script src="/common/skins/layouts/tabs/scripts/resource.js"/>
<h:script src="/common/javascripts/common.js" />
<h:script src="/common/javascripts/ydcommon.js" />
<h:css href='<%=SkinUtil.getStyleFileForTag("theme/style-sys.css",request)%>'/>
<h:css href='<%=SkinUtil.getStyleFileForTag("theme/style-component.css",request)%>'/>
<h:css href='<%=SkinUtil.getStyleFileForTag("theme/style-custom.css",request)%>'/>

<%-- 
<h:script src="/ydsoacomm/scripts/My97DatePicker/WdatePicker.js" />
 --%>
<h:script src="/ydsoacomm/scripts/owes_date.js"/>
<h:script src="/ydsoacomm/scripts/owes_op_tooltip.js" />





<style>
body{
margin: 0;
}
.logz{position: absolute; top: 43px; left:50%; height: 18px;  margin-left: -120px; text-align:left; opacity:0.7; z-index:2048;}  
        .logi{display:block; background-color:#ffffae; width:240px; padding:2px; margin:5px;}  
        
.tab {
	padding-left:0px;
	clear: both;
}
</style>
<style>
/* 
	Web20 Table Style
	written by Netway Media, http://www.netway-media.com
	border: 1px solid #666666;background: #f6f6f6;
*/
.widget_table {
  border-collapse: collapse;
  
  font: normal 12px verdana, arial, helvetica, sans-serif;
  
  text-align:left;
  line-height: 1.5
  }
.widget_table th{
   text-align:center;
  }
.caption {
  text-align: center;
  font: bold 16px arial, helvetica, sans-serif;
  background: transparent;
  padding:6px 4px 8px 0px;
  color: #CC00FF;
  text-transform: uppercase;
}
.thead, tfoot {
background:url(bg1.png) repeat-x;
text-align:left;
height:30px;
}
.thead th, tfoot th {
padding:5px;
}
.table a {
color: #333333;
text-decoration:none;
}
.table a:hover {
text-decoration:underline;
}
.tr.odd {
background: #f1f1f1;
}

</style>

<%
	String myCalMgrUrl = "com.yd.soa.mycal.myCalTab.flow";
 %>