<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<script type="text/javascript">        
        var Common = {
            getEvent: function() {//ie/ff
                if (document.all) {
                    return window.event;
                }
                func = getEvent.caller;
                while (func != null) {
                    var arg0 = func.arguments[0];
                    if (arg0) {
                        if ((arg0.constructor == Event || arg0.constructor == MouseEvent) || (typeof (arg0) == "object" && arg0.preventDefault && arg0.stopPropagation)) {
                            return arg0;
                        }
                    }
                    func = func.caller;
                }
                return null;
            },
            getMousePos: function(ev) {
                if (!ev) {
                    ev = this.getEvent();
                }
                if (ev.pageX || ev.pageY) {
                    return {
                        x: ev.pageX,
                        y: ev.pageY
                    };
                }

                if (document.documentElement && document.documentElement.scrollTop) {
                    return {
                        x: ev.clientX + document.documentElement.scrollLeft - document.documentElement.clientLeft,
                        y: ev.clientY + document.documentElement.scrollTop - document.documentElement.clientTop
                    };
                }
                else if (document.body) {
                    return {
                        x: ev.clientX + document.body.scrollLeft - document.body.clientLeft,
                        y: ev.clientY + document.body.scrollTop - document.body.clientTop
                    };
                }
            },            
            getItself: function(id) {
                return "string" == typeof id ? document.getElementById(id) : id;
            },
            getViewportSize: { w: (window.innerWidth) ? window.innerWidth : (document.documentElement && document.documentElement.clientWidth) ? document.documentElement.clientWidth : document.body.offsetWidth, h: (window.innerHeight) ? window.innerHeight : (document.documentElement && document.documentElement.clientHeight) ? document.documentElement.clientHeight : document.body.offsetHeight },
            isIE: document.all ? true : false,
            setOuterHtml: function(obj, html) {
                var Objrange = document.createRange();
                obj.innerHTML = html;
                Objrange.selectNodeContents(obj);
                var frag = Objrange.extractContents();
                obj.parentNode.insertBefore(frag, obj);
                obj.parentNode.removeChild(obj);
            }
        }
        
        ///------------------------------------------------------------------------------------------------------
        var Class = {
            create: function() {
                return function() { this.init.apply(this, arguments); }
            }
        }
        var Drag = Class.create();
        Drag.prototype = {
            init: function(titleBar, dragDiv, Options) {
                //设置点击是否透明，默认不透明
                titleBar = Common.getItself(titleBar);
                dragDiv = Common.getItself(dragDiv);
                this.dragArea = { maxLeft: 0, maxRight: Common.getViewportSize.w - dragDiv.offsetWidth - 2, maxTop: 0, maxBottom: Common.getViewportSize.h - dragDiv.offsetHeight - 2 };
                if (Options) {
                    this.opacity = Options.opacity ? (isNaN(parseInt(Options.opacity)) ? 100 : parseInt(Options.opacity)) : 100;                    
                    this.keepOrigin = Options.keepOrigin ? ((Options.keepOrigin == true || Options.keepOrigin == false) ? Options.keepOrigin : false) : false;
                    if (this.keepOrigin) { this.opacity = 50; }
                    if (Options.area) {
                        if (Options.area.left && !isNaN(parseInt(Options.area.left))) { this.dragArea.maxLeft = Options.area.left };
                        if (Options.area.right && !isNaN(parseInt(Options.area.right))) { this.dragArea.maxRight = Options.area.right };
                        if (Options.area.top && !isNaN(parseInt(Options.area.top))) { this.dragArea.maxTop = Options.area.top };
                        if (Options.area.bottom && !isNaN(parseInt(Options.area.bottom))) { this.dragArea.maxBottom = Options.area.bottom };
                    }
                }
                else {
                    this.opacity = 100, this.keepOrigin = false;
                }
                this.originDragDiv = null;
                this.tmpX = 0;
                this.tmpY = 0;
                this.moveable = false;

                var dragObj = this;

                titleBar.onmousedown = function(e) {
                    var ev = e || window.event || Common.getEvent();
                    //只允许通过鼠标左键进行拖拽,IE鼠标左键为1 FireFox为0
                    if (Common.isIE && ev.button == 1 || !Common.isIE && ev.button == 0) {
                    }
                    else {
                        return false;
                    }

                    if (dragObj.keepOrigin) {
                        dragObj.originDragDiv = document.createElement("div");
                        dragObj.originDragDiv.style.cssText = dragDiv.style.cssText;
                        dragObj.originDragDiv.style.width = dragDiv.offsetWidth;
                        dragObj.originDragDiv.style.height = dragDiv.offsetHeight;
                        dragObj.originDragDiv.innerHTML = dragDiv.innerHTML;
                        dragDiv.parentNode.appendChild(dragObj.originDragDiv);
                    }

                    dragObj.moveable = true;
                    dragDiv.style.zIndex = dragObj.GetZindex() + 1;
                    var downPos = Common.getMousePos(ev);
                    dragObj.tmpX = downPos.x - dragDiv.offsetLeft;
                    dragObj.tmpY = downPos.y - dragDiv.offsetTop;

                    titleBar.style.cursor = "move";
                    if (Common.isIE) {
                        dragDiv.setCapture();
                    } else {
                        window.captureEvents(Event.mousemove);
                    }

                    dragObj.SetOpacity(dragDiv, dragObj.opacity);

                    //FireFox 去除容器内拖拽图片问题
                    if (ev.preventDefault) {
                        ev.preventDefault();
                        ev.stopPropagation();
                    }

                    document.onmousemove = function(e) {
                        if (dragObj.moveable) {
                            var ev = e || window.event || Common.getEvent();
                            //IE 去除容器内拖拽图片问题
                            if (document.all) //IE
                            {
                                ev.returnValue = false;
                            }

                            var movePos = Common.getMousePos(ev);
                            dragDiv.style.left = Math.max(Math.min(movePos.x - dragObj.tmpX, dragObj.dragArea.maxRight), dragObj.dragArea.maxLeft) + "px";
                            dragDiv.style.top = Math.max(Math.min(movePos.y - dragObj.tmpY, dragObj.dragArea.maxBottom), dragObj.dragArea.maxTop) + "px";

                        }
                    };

                    document.onmouseup = function() {
                        if (dragObj.keepOrigin) {
                            if (Common.isIE) {
                                dragObj.originDragDiv.outerHTML = "";
                            }
                            else {
                                Common.setOuterHtml(dragObj.originDragDiv, "");
                            }
                        }
                        if (dragObj.moveable) {
                            if (Common.isIE) {
                                dragDiv.releaseCapture();
                            }
                            else {
                                window.releaseEvents(dragDiv.mousemove);
                            }
                            dragObj.SetOpacity(dragDiv, 100);
                            titleBar.style.cursor = "default";
                            dragObj.moveable = false;
                            dragObj.tmpX = 0;
                            dragObj.tmpY = 0;
                        }
                    };
                }
            },
            SetOpacity: function(dragDiv, n) {
                if (Common.isIE) {
                    dragDiv.filters.alpha.opacity = n;
                }
                else {
                    dragDiv.style.opacity = n / 100;
                }

            },
            GetZindex: function() {
                var maxZindex = 0;
                var divs = document.getElementsByTagName("div");
                for (z = 0; z < divs.length; z++) {
                    maxZindex = Math.max(maxZindex, divs[z].style.zIndex);
                }
                return maxZindex;
            }
        }

        window.onload = function() {
            new Drag("dragDiv", "dragDiv", { opacity: 100, keepOrigin: true }); //, area: { left: 50, right: 500, top: 100, bottom: 400}
        }  
    </script>

		<jsp:include page="/cxb/_message.jsp"></jsp:include>
		<title>创新杯</title>

	</head>

	<body>
		<h1
			style="FILTER: mask(color =   #E1E4EC) shadow(color =   #8C96B5, direction =   135) chroma(color =   #E1E4EC)">
			<a href='<s:url action="login" namespace="/login" />'>登录创新杯网站 </a>
		</h1>
		<div id="dragDiv"
			style="position: absolute; background-color: #FFFFFF; border: solid 1px #849BCA; width: 300px; left: 10px; top: 220px; filter: alpha(opacity =   100); opacity: 1;">
			<table cellpadding="0" cellspacing="0" border="0"
				style="width: 100%; border-collapse: collapse;">
				<tr id="titleBar"
					style="height: 22px; text-align: left; background-color: #547BC9; color: White; padding: 3px;">
					<th align="left" unselectable="on">
						友情连接（使用火狐可以拖拽这里）
					</th>
				</tr>

				<tr>
					<td>
						<ul>
							<li>
								<a href="http://jwgl.buaa.edu.cn">登录教务系统</a>
							</li>
							<li>
								<a href="http://cmusphinx.sourceforge.net/">CMU Sphinx语音识别</a>
							</li>
							<li>
								<a href="http://www.opencv.org.cn/index.php/%E9%A6%96%E9%A1%B5">OpenCV图像处理</a>
							</li>
							<li>
								<a href="http://www.cvchina.info/tag/%E5%A2%9E%E5%BC%BA%E7%8E%B0%E5%AE%9E/">增强现实</a>
							</li>
							<li>
								<a href="http://www.eguidedog.net/index_cn.php">语音识别应用：电子导盲犬</a>
							</li>
						</ul>
					</td>
				</tr>
			</table>
		</div>

		<h3>
			说明：
		</h3>
		<ol>
			<li>
				"创新杯"网站刚刚运行，只包括基本功能，其他功能、页面等方面都需要完善。
			</li>
			<li>
				欢迎对开发网站项目感兴趣的同学联系我。我们可以一起把这个网站弄好。
			</li>
			<li>
				联系我：张野，yezhang989@163.com。
			</li>
		</ol>

	</body>
</html>
