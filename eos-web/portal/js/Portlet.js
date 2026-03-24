/*
 * Ext JS Library 2.3.0
 * Copyright(c) 2006-2009, Ext JS, LLC.
 * licensing@extjs.com
 * 
 * http://extjs.com/license
 */

Ext.ux.Portlet = Ext.extend(Ext.Panel, {
    anchor: '100%',
    frame:true,
    collapsible:true,
    draggable:true,
    cls:'x-portlet',
    iconCls: 'portlet',
    
    setTitle : function(title, iconCls){
       	if(iconCls){
            this.setIconClass(iconCls);
        }
       	var width = this.header.dom.lastChild.previousSibling.offsetLeft;
        if(!this.icon){
			this.header.removeClass('x-panel-icon');
		}else
			width=width-30;
    	var l = parseInt(this.header.getStyle("font-size").split("px")[0]);
		var length = parseInt(width/(l+2));
		title=this.generateText(title,2*length); 	
        this.title = title;
        if(this.header && this.headerAsText){
            this.header.child('span').update(title);
        }
        this.fireEvent('titlechange', this, title);
        return this;
    },
    
   	generateText: function(text,length){
    	var pattern = /[u00-uFF]/;
    	var textLength = 0;
    	var limitLength = 0;
    	for(var i=0;i<text.length;i++)
    	{	
    		if(pattern.test(text.charAt(i)))
    			textLength = textLength + 1;
    		else
    			textLength = textLength + 2;
    		if(textLength==length-1 ||textLength==length){
    			limitLength = i;
    		}	
    	}
		var shortText = textLength>=(length-1)?text.substring(0,limitLength)+"...":text;
		return shortText; 	
    }
});
Ext.reg('portlet', Ext.ux.Portlet);