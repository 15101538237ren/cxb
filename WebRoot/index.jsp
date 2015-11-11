<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
		<link href="/cxb/css/bootstrap.css" rel="stylesheet" type="text/css">
		<link href="/cxb/css/docs.css" rel="stylesheet">
		<title>创新杯</title>
		<script type="text/javascript">
	function render() {

		var fov = 250;

		var SC_W = 630;
		var SC_H = 300;
		var RS = 100;
		var PLAYWIDTH = SC_W / RS;
		var PLAYHEIGHT = 50;
		var HALF_WIDTH = SC_W / 2;
		var HALF_HEIGHT = SC_H / 2;

		var screenLeft = 0.0;
		var screenTop = -10.0;
		var screenFront = 0.0;

		function convert3Dto2D(x3d, y3d, z3d) {

			var scale = fov / (fov + z3d);
			var x2d = ((x3d - HALF_WIDTH) * scale) + HALF_WIDTH;
			var y2d = ((y3d - HALF_HEIGHT) * scale) + HALF_HEIGHT
					- (z3d * 0.01);
			// just using a 2 dimensional array as a 2D point - not sure if that's the best way to do it! 
			return [ x2d, y2d ];
		}

		function noise(x, y) {
			return (Math.sin(y * 0.2) + Math.sin((x + (y * 0.6)) * 0.2)) * 4;
		}

		var canvas = document.getElementById('Canvas2D');
		var c = canvas.getContext('2d');

		function drawLand() {
			c.fillStyle = "rgb(255,255,255)";
			c.fillRect(0, 0, SC_W, SC_H);
			screenFront += 1;
			screenLeft += 1;

			c.lineWidth = 0.5;

			var slicecount = SC_W / RS;
			var leftshift = (screenLeft % 1) * RS;
			var frontshift = (screenFront % 1) * RS;

			var p2d = [ 0, 0 ];

			for ( var slicez = 100; slicez >= 10; slicez--) {
				c.beginPath();

				// rudimentary frustum culling
				var edgewidth = slicez * 1.22;

				var zpos = (slicez * RS) - frontshift;
				var slicevisible = false;

				// this bit of code makes the colour fade out towards the distance.
				if (Math.abs(zpos) < 100)
					linecol = 0xff;
				else if (zpos > 7000) {
					// should give number from 1 - 2000;  
					linecol = (((10000 - zpos) / 3000) * 0xff);

				} else {
					linecol = 0xff;
				}

				c.strokeStyle = "rgb(0," + linecol + ",0)";

				// make sure we only moveTo the first point. 

				var firstpoint = true;

				for ( var slicex = -edgewidth; slicex <= slicecount + edgewidth; slicex++) {
					var h = (noise(slicex + screenLeft, screenFront + slicez));
					var xpos = (slicex * RS) - leftshift;
					var ypos = (h - screenTop) * RS;

					p2d = convert3Dto2D(xpos, ypos, zpos);
					if (p2d[1] > SC_H)
						p2d[1] = SC_H;
					else if (p2d[1] < 0)
						p2d[1] = 0;
					else
						slicevisible = true;

					if (firstpoint) {
						c.moveTo(p2d[0], p2d[1]);
						firstpoint = false;
					} else {
						c.lineTo(p2d[0], p2d[1]);
					}

				}

				if (slicevisible)
					c.stroke();
			}

		}

		var loop = setInterval(function() {
			drawLand();
		}, 50);
		//drawLand();
	}
</script>
	</head>
	<body data-spy="scroll" data-target=".bs-docs-sidebar"
		onload="render();">
		<div class="container">
			<header style="text-align: center;">

			</header>
			<!--			<div id="backtop"-->
			<!--				style="left: auto; right: 30px; position: fixed; top: auto; bottom: 30px; z-index: 99999999; overflow: hidden;">-->
			<!--				<a href="#" title="返回顶部"-->
			<!--					style="margin-left: 3px; background-image: url(http://img.ujian.cc/style/1.png); background-attachment: scroll; background-color: transparent; display: block; float: right; outline-width: 0px; outline-style: none; text-indent: -9999em; width: 32px; height: 32px; background-position: -64px 0px; background-repeat: no-repeat no-repeat;">返回顶部</a>-->
			<!--			</div>-->
			<!-- Navbar================================================== -->
			<jsp:include page="/cxb/topmenu/menu.jsp"></jsp:include>

			<h3 align="center">
				<legend class="center">
					北航软件学院第5届“创新杯”
				</legend>
			</h1>
			<div class="row">
				<div class="span12">
					<div class="row">

						<div class="span4">
							<legend>
								登录
							</legend>
							<s:form class="form-horizontal" action="doLogin"
								namespace="/login" method="post">

								<div class="control-group">
									<label class="control-label" for="inputEmail">
										学号
									</label>
									<div class="controls">
										<input type="text" class="span4" name="username"
											placeholder="">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="inputPassword">
										密码
									</label>
									<div class="controls">
										<input type="password" class="span4" name="password"
											id="inputPassword" placeholder="">
									</div>
								</div>
								<div class="control-group">
									<div class="controls">
										<!--						<label class="checkbox">-->
										<!--							<input type="checkbox">-->
										<!--								下次自动登录 -->
										<!--						</label>-->
										<button type="submit" class="btn">
											登录
										</button>
									</div>
								</div>
							</s:form>
						</div>

						<div class="span8">
							<canvas id="Canvas2D" width="630" height="300">您的浏览器不支持相应功能，请使用Chrome浏览器或Firefox浏览器。</canvas>
						</div>
					</div>
				</div>
			</div>
		</div>

		<hr />
		<!-- Le javascript
    ================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->

		<script type="text/javascript" src="/cxb/js/processing.js"></script>
		<script type="text/javascript" src="/cxb/js/jquery.min.js"></script>
		<script type="text/javascript" src="/cxb/js/bootstrap-transition.js"></script>
		<script type="text/javascript" src="/cxb/js/bootstrap-alert.js"></script>
		<script type="text/javascript" src="/cxb/js/bootstrap-modal.js"></script>
		<script type="text/javascript" src="/cxb/js/bootstrap-dropdown.js"></script>
		<script type="text/javascript" src="/cxb/js/bootstrap-scrollspy.js"></script>
		<script type="text/javascript" src="/cxb/js/bootstrap-tab.js"></script>
		<script type="text/javascript" src="/cxb/js/bootstrap-tooltip.js"></script>
		<script type="text/javascript" src="/cxb/js/bootstrap-popover.js"></script>
		<script type="text/javascript" src="/cxb/js/bootstrap-button.js"></script>
		<script type="text/javascript" src="/cxb/js/bootstrap-collapse.js"></script>
		<script type="text/javascript" src="/cxb/js/bootstrap-carousel.js"></script>
		<script type="text/javascript" src="/cxb/js/bootstrap-typeahead.js"></script>
		<script type="text/javascript" src="/cxb/js/bootstrap.min.js"></script>
	</body>

	<footer>
		<center>
			© 北航软件学院,2011-2015
		</center>
	</footer>

</html>
