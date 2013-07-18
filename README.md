<html>
	<head>
		<title></title>
	</head>
	<body>
		<h1>
			<u><strong>UIImageScanlineFloodfill</strong></u></h1>
		<h3>
			This is an Objective-C implementation of Scanline Flood Fill Algorithm.</h3>
		<div>
			I have used Scanline Floodfill Algorithm because it is faster than 4 way and 8 way.</div>
		<div>
			And implement using&nbsp;iterative logic because iPhone have very limite capicity compare to computera and&nbsp;recursive implementation make stackover flow exception.</div>
		<div>
			&nbsp;</div>
		<address>
			<span style="font-size:16px;"><em>I have try my best to make it fast but it is still in its beginning phase so any suggestion and contribution is welcome.</em></span></address>
		<div>
			&nbsp;</div>
		<div>
			This is part of my iOS drawing app.</div>
		<div>
			When I search for flood fil on google I found that there are many implementation for c, c#, Java</div>
		<div>
			But for Objective - C there are oonly 2 or 3 implementation and not very easy to understand.</div>
		<div>
			So I decide to share my work.</div>
		<div>
			&nbsp;</div>
		<h4>
			<strong><u>I like to give thanks to following post:</u></strong></h4>
		<ul>
			<li>
				<a href="http://stackoverflow.com/questions/448125/how-to-get-pixel-data-from-a-uiimage-cocoa-touch-or-cgimage-core-graphics">How to get pixel data from a UIImage (Cocoa Touch) or CGImage (Core Graphics)</a></li>
			<li>
				<a href="http://iwantmyreal.name/blog/2012/09/29/a-faster-array-in-objective-c/">A Faster Array in Objective-c</a></li>
			<li>
				<a href="http://lodev.org/cgtutor/floodfill.html">Lode&#39;s Computer Graphics Tutorial Flood Fill</a></li>
		</ul>
		<h3>
			<u><strong>How To Use It:</strong></u></h3>
		<p>
			If you wan to use this directly in your project that do as follow:</p>
		<ol>
			<li>
				Copy Folllowing file in your project
				<ol>
					<li>
						<code>LinkedListStack.h</code></li>
					<li>
						<code>LinkedListStack.m</code></li>
					<li>
						<code>UIImage+FloodFill.h</code></li>
					<li>
						<code>UIImage+FloodFill.m</code></li>
				</ol>
			</li>
			<li>
				<code>UIImage+FloodFill.h</code> file where you want to use this .</li>
			<li>
				Call flood fill function with all argument like folloeing</li>
		</ol>
		<p>
			<code>UIImage *image1 = [self.image floodFillFromPoint:tpoint withColor:[UIColor grayColor] andTolerance:tolerance];</code></p>
		<h4>
			License : <a href="https://github.com/chinatndave/UIImageScanlineFloodfill/blob/master/LICENSE">MIT LICENSE FILE</a></h4>
	</body>
</html>