<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/assets/common.jsp"%>
<style type="text/css">
	.datagrid .datagrid-pager  {
			display: none;
	}
	.datagrid-pager {
			display: none;
	}
 	 .tablist{width:100%; height:30px;}
	 .tablist>li{padding:0 1%; height:30px;line-height:30px;vertical-align: middle;float:left; background:#FFF; border-radius:2px; position:relative;}

	 .tablist>li:nth-child(1), .tablist li:nth-child(3){width:2%;}
	 .tablist a{font-size: 13px;color:#666;text-decoration: none;}
	 .tablist>li:nth-child(1){margin-left:1%;}
	 .tablist>li:nth-child(2), .tablist li:nth-child(3){margin-left:0.5%;}
	 .tablist>li:nth-child(5){margin-left:40%; margin-right:1%; padding-left:30px;}
	 
	 #tag_a{
	     width:40px;
	     margin-left:10px;
	     background: url("../assets/images/tag.png") #ffffff center center no-repeat;
	     cursor: pointer;
	 }
 	ul, ol {
		list-style: none;
		margin:0;
	}
	a{
		text-decoration: none;
	}
	
	#tabs{
		height:40px;
		width: 100%;
		border-bottom:1px solid #ccc;
	}
	#tabs .tab{
	    float:left;
		height: 40px;
		width:100px;
		text-align: center;
		line-height: 40px;
		vertical-align: middle;
		cursor: pointer;
	}
	
	.separator {
    float: left;
    height: 30px;
    border-left: 1px solid #ccc;
    border-right: 1px solid #fff;
    margin: 5px 1px;
}

.current {
    border-bottom: 2px solid #ed6c44;
}
</style>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.uploadify-3.1.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/uploadify.css" />
				<div class="page-content">
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								  <div id="tabs">
								  <div class="tab current" data="/ledger/detail">台账管理</div>
								  <div class="separator"></div>
								  <div class="tab" data="/stock/tostock">库存</div>
								  <div class="separator"></div>
								  <div class="tab" data="/account/toaccount">对账</div>
								  <div class="separator"></div>
								  <div class="tab" data="/scrap/toscrap">报废表</div>
								  </div>
								  <input type="hidden" id="columns" value="${columns}"/>
								  <div style="margin:20 0 10 0;">
										<ul class="tablist">
								        	<li><a id="btn_prev" href="#" ><</a> </li>
								            <li><a id="pageindex">1/7</a></li>
								            <li><a id="btn_next" href="#">> </a></li>
								            <li id="tag_a"></li>
								            <li><a href="${pageContext.request.contextPath}/ledger/toHigh">高级</a></li>
								            <li><a href="${pageContext.request.contextPath}/ledger/toAdd">新增</a></li>
								            <li><a href="javascript:void(0)" onclick="$('#dlg').dialog('open');">导入</a></li>
								            <li><a href="#" onClick="Export('asset', $('#dg'))">导出</a></li>
								            <li><a href="">打印二维码</a>
								            	<!--<ul class="tablistmin">
								                	<li>全部</li>
								                    <li>当前</li>
								                    <li>变更</li>
								                </ul>-->
								            </li>
								            <li><a href="#" onClick="CreateFormPage('打印',$('#dg'));">打印</a></li>
								            
								        </ul>
								  </div>
								  <div style="height:420px">
								  <table id="dg" style="width:700px;height:420px">
								  </table>
								  </div>
								  <div id="dlg" class="easyui-dialog" title="导入台账" style="width:400px;height:200px;padding:10px"
						            data-options="
						                iconCls: 'icon-save',
						                buttons: [{
						                    text:'取消',
						                    handler:function(){
						                       $('#dlg').dialog('close')
						                    }
						                }]
						            ">
						            <input id="file_import" name="file_import" type="file" value="导入"/>
								  </div>
								  </div>
								  </div>
								    <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/datagrid-filter.js"></script> --%>
								    <script type="text/javascript">
								        $(function(){
								        	
								        	$('#dlg').dialog('close');
								        	var rootpath = $("#rootpath").val();
								        	
								        	
								        	$("#tag_a").click(function(){
								        		//为loadGrid()添加参数  
								        	    var queryParams = $('#dg').datagrid('options').queryParams;  
								        	    queryParams.checkNumber = "1";  
								        	     //查询后返回首页
								        	    $('#dg').datagrid('options').pageNumber = 1;  
								        	    var p = $('#dg').datagrid('getPager');
								        		p.pagination({pageNumber: 1}); 
								        	    //重新加载datagrid的数据  
								        	    $("#dg").datagrid('reload');  
								        	});
								            var dg = $('#dg').datagrid({
								            	url:rootpath+'/ledger/data',
								                pagination: true,
								                remoteFilter: false,
								                columns:eval($("#columns").val()),
								                fitColumns: false,
								                fit:true,
								                rownumbers: true,
								                onDblClickRow: function(index,row){
								                	location.href=rootpath+"/ledger/property/"+row.assetId;
								                },
								                onHeaderContextMenu: function(e, currfield){

								                    e.preventDefault();
								                    if (!cmenu){
								                        createColumnMenu(currfield);
								                    }else{
								                    	/*将当前元素除外，所有置空*/
								                    	$("#cmenu").find(".menu-item").each(function(){
								                    		  var title = $(this).find(".menu-text").text();
								                    		  var col = $('#dg').datagrid('getColumnOption', currfield);
								                    		  if(title ==col.title){
									                          	  cmenu.menu('setIcon', {
									                          		 target: $(this)[0],
									                                 iconCls: 'icon-ok'
									                              });
								                              }else{
								                            	  cmenu.menu('setIcon', {
								 	                          		 target: $(this)[0],
								 	                                 iconCls: 'icon-empty'
								 	                              });
								                              }
								                    		
								                    	});
								                    }
								                    
								                    cmenu.menu('show', {
								                        left:e.pageX,
								                        top:e.pageY
								                    });
								                }
								            });
								        /* 	dg.datagrid('enableFilter'); */
								        
								            $("#file_import").uploadify({
										        // 指定swf文件
										        'swf': rootpath+'/assets/js/uploadify/uploadify.swf',
										        'fileObjName':'file',
										        // 后台处理的页面
										         'uploader':rootpath+'/ledger/import',
										        // 按钮显示的文字
										        'buttonText': '导入',
										        'formData':{type:-1},
										        // 允许上传的文件后缀
										        'fileTypeExts': '*.xls;*.xlsx',
										        'auto': true,
										        // 设置为true将允许多文件上传
										        'multi': false,
										        onUploadSuccess :function(event, response, status){
										        	var data = jQuery.parseJSON(response);
										        	if(data.success){
										        		$.messager.alert("提示","导入成功");
										        		$('#dg').datagrid('reload');
										        	}else{
										        		$.messager.alert("错误",data.msg);
										        	}
										        }
										    });
								        });
								        var cmenu;
								        function createColumnMenu(currfield){
								            cmenu = $('<div id="cmenu" style="position:absolute; height:400px; overflow:auto"/>').appendTo('body');
								            cmenu.menu({
								            	onClick: function(item){
								                	/*将所有选中的元素置空，隐藏*/
								                	$("#cmenu").find(".menu-item").each(function(){
								                		var itemEl = $(this)[0];  // the menu item element
								                		var itemOther = $('#cmenu').menu('getItem', itemEl);
								                		if (itemOther.iconCls == 'icon-ok' && item.name != itemOther.name){
								                            $('#dg').datagrid('hideColumn', itemOther.name);
								                            cmenu.menu('setIcon', {
								                                target: itemEl,
								                                iconCls: 'icon-empty'
								                            });
								                        }
								                	});
								               	 if (item.iconCls == 'icon-ok'){
							                         $('#dg').datagrid('hideColumn', item.name);
							                         cmenu.menu('setIcon', {
							                             target: item.target,
							                             iconCls: 'icon-empty'
							                         });
							                     } else {
							                         $('#dg').datagrid('showColumn', item.name);
							                         cmenu.menu('setIcon', {
							                             target: item.target,
							                             iconCls: 'icon-ok'
							                         });
							                     }
								                }
								            });
								            var fields = $('#dg').datagrid('getColumnFields');
								            for(var i=0; i<fields.length; i++){
								                var field = fields[i];
								                var col = $('#dg').datagrid('getColumnOption', field);
								                if(currfield == field){
								                 	cmenu.menu('appendItem', {
								                        text: col.title,
								                        name: field,
								                        iconCls: 'icon-ok'
								                    });
								                }else{
								                 	cmenu.menu('appendItem', {
								                        text: col.title,
								                        name: field,
								                        iconCls: 'icon-empty'
								                    });
								                }
								              
								            }
								        }
								    </script>
								<!-- PAGE CONTENT ENDS -->