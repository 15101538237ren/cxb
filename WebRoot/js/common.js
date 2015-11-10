/** form 提交 **/
function submitFrm(formName){
	//alert(formName);
	
	var frm;
	
	if(formName){
		frm = document.forms[formName];
				
	}else{
		frm = document.forms[0];
	}
	//$('#projectFrm').validation();
	
	var vResult = validateFrm(formName).form();
	//var vResult = true;
	if(vResult)	{
		var sureToSubmit = confirm("提交后项目信息不能更改。\n\r是否提交？");
		if(sureToSubmit == false){
			return;
		}
		window.setTimeout(function(){frm.submit();}, 100);
		//alert('subumit');
		return true;
	}
	else validateFrm(formName).focusInvalid();
}

/** 表单验证 **/
function validateFrm(formName){
	var commonCfg = {
		meta: "validate",
		event: "keyup",
		errorClass: "Verror",
		ignore:"input[type='file']",
		ignore: "input[type='file']",
		ignore:".ignore",
		success: function(label) {   
			//label.addClass("Vmsg").text("输入正确");
		},   
		errorPlacement: function(error, element) {
			element.parent().find("em").html(error);
		},
		errorElement:"em"
	};

	if(vBundle){
		var validateCfg = $.extend({}, commonCfg, vBundle);
	}

	var vldt ;
	if(formName){
		vldt = $(document.forms[formName]).validate(validateCfg);
	}else{
		vldt = $("form").eq(0).validate(validateCfg);
	}
	return vldt;
}

/**** 显示msgDiv ****/
function showBackMsg(){
	if($("#msgDiv") && $.trim($("#msgDiv").html()).length>2){ 
		$("#msgDiv").fadeIn(500).fadeOut(3000);
	}else if($("#errorDiv") && $.trim($("#errorDiv").html()).length>2){
		$("#errorDiv").fadeIn(200).fadeOut(8000);
	}
}

/**** 删除 ****/
function askDel(url, msg){
	if(!msg) msg = "此操作将不可恢复，确定进行此操作吗？" ;
	if(confirm(msg)){
		jump(url);
	}else{
		return;	
	}
}

function ensure(url, msg){
	if(!msg) msg = "您确定要进行此操作吗？" ;
	if(confirm(msg)){
		jump(url);
	}
}

//按列排序
function sortColumn(attr,sort,actionName){
	if(sort == "asc") sort="desc";
	else sort="asc";
	var url = actionName + "column=" + attr + "&sort=" + sort;
	jump(url);
}

function jump(url){
	if(document.all){
		var e = document.createElement("a");
		document.body.appendChild(e);
		e.href = url;
		e.click(); 
    }else{
		window.location.href = url;
    }
}

/** 展开或者收缩实体基本信息 **/
function slideObjInfo(){ 
	$("#objInfoShow").click(function(){ 
		$("#objInfo").slideToggle("normal",function(){
			if($("#objInfoShow").hasClass("expand")) $("#objInfoShow").removeClass("expand").addClass("shrink");
			else $("#objInfoShow").removeClass("shrink").addClass("expand");
		});
	});
}

/** 展开或者收缩流程信息 **/
function slideFlowInfo(){ 
	$("#flowInfoShow").click(function(){ 
		$("#flowInfo").slideToggle("normal",function(){
			if($("#flowInfoShow").hasClass("expand")) $("#flowInfoShow").removeClass("expand").addClass("shrink");
			else $("#flowInfoShow").removeClass("shrink").addClass("expand");
		});
	});
}

function labelCheck(label){
	var label = $.trim(label);
	$("#comments").val(label);
}
