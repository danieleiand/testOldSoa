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
<script type="text/javascript">
	var contextPath = "<%=request.getContextPath()%>";	 // you should define the contextPath of web application
	var EOSDEBUG = true;
	var FINAL_PANEL_HEIGHT = 22;
	<%-- manager(group_manager.jsp)主页面中iframe需要减少的高度 --%>
	var IFRAME_MODIFY_HEIGHE = 35;
	<%-- tree(group_tree.jsp)页面中tree需要减少的高度 --%>
	var TREE_MODIFY_HEIGHT = 22;
</script>
<h:script i18n="true"  src="/common/javascripts/message.js"/>
<h:script src='<%=ABFConfigKey.SKIN_LOC.getConfigValue()+"/resource.js.jsp"%>'/>
<h:script src="/common/fckeditor/fckeditor.js" />
<h:script src="/common/javascripts/eos-key.js"></h:script>
<h:script src="/common/javascripts/eos-base.js"></h:script>
<h:script src="/common/javascripts/eos-event.js"></h:script>
<h:script src="/common/javascripts/eos-util.js"></h:script>
<h:script src="/common/javascripts/eos-domdrag.js"></h:script>
<h:script src="/common/javascripts/eos-dom.js"></h:script>
<h:script src="/common/javascripts/eos-log.js"></h:script>
<h:script src="/common/javascripts/eos-ajax.js"></h:script>
<h:script src="/common/javascripts/eos-check.js"></h:script>
<h:script src="/common/javascripts/eos-mask.js"></h:script>
<h:script src="/common/javascripts/eos-progressbar.js"></h:script>
<h:script src="/common/javascripts/eos-modeldialog.js"></h:script>
<h:script src="/common/javascripts/eos-widget.js"></h:script>
<h:script src="/common/javascripts/eos-panel.js"></h:script>
<h:script src="/common/javascripts/eos-radioGroup.js"></h:script>
<h:script src="/common/javascripts/eos-richtext.js"></h:script>
<h:script src="/common/javascripts/eos-rowselect.js"></h:script>
<h:script src="/common/javascripts/eos-dataset.js"></h:script>
<h:script src="/common/javascripts/eos-editors.js"></h:script>
<h:script src="/common/javascripts/eos-time.js"></h:script>
<h:script src="/common/javascripts/eos-calendar.js"></h:script>
<h:script src="/common/javascripts/eos-lookup.js"></h:script>
<h:script src="/common/javascripts/eos-multibox.js"></h:script>
<h:script src="/common/javascripts/eos-multiselect.js"></h:script>
<h:script src="/common/javascripts/eos-popmenu.js"></h:script>
<h:script src="/common/javascripts/eos-rtree.js"></h:script>
<h:script src="/common/javascripts/eos-stree.js"></h:script>
<h:script src="/common/javascripts/eos-switchcheckbox.js"></h:script>
<h:script src="/common/javascripts/eos-tabs.js"></h:script>
<h:script src="/common/javascripts/eos-comboselect.js"></h:script>
<h:script src="/common/javascripts/eos-datacell.js"></h:script>
<h:script src="/common/javascripts/eos-verifyCode.js"></h:script>
<h:script src="/common/lib/mootools.js"/>
<h:script src="/common/javascripts/common.js" />
<h:css href='<%=SkinUtil.getStyleFileForTag("theme/style-sys.css",request)%>'/>
<h:css href='<%=SkinUtil.getStyleFileForTag("theme/style-component.css",request)%>'/>
<h:css href='<%=SkinUtil.getStyleFileForTag("theme/style-custom.css",request)%>'/>

