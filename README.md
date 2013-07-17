<html>
	<head>
		<title></title>
	</head>
	<body>
		<div>
			<u><strong>UIImageScanlineFloodfill</strong></u></div>
		<div>
			&nbsp;</div>
		<div>
			This is an Objective-C implementation of Scanline Flood Fill Algorithm.</div>
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
		<div>
			<strong><u>I like Tho give thanks to following post:</u></strong></div>
		<ul>
			<li>
				<a href="http://stackoverflow.com/questions/448125/how-to-get-pixel-data-from-a-uiimage-cocoa-touch-or-cgimage-core-graphics">How to get pixel data from a UIImage (Cocoa Touch) or CGImage (Core Graphics)</a></li>
			<li>
				<a href="http://iwantmyreal.name/blog/2012/09/29/a-faster-array-in-objective-c/">A Faster Array in Objective-c</a></li>
			<li>
				<a href="http://lodev.org/cgtutor/floodfill.html">Lode&#39;s Computer Graphics Tutorial Flood Fill</a></li>
		</ul>
		<p>
			<u><strong>How To Use It:</strong></u></p>
		<p>
			If you wan to use this directly in your project that do as follow:</p>
		<ol>
			<li>
				Copy Folllowing file in your project
				<ol>
					<li>
						LinkedListStack.h</li>
					<li>
						LinkedListStack.m</li>
					<li>
						UIImage+FloodFill.h</li>
					<li>
						UIImage+FloodFill.m</li>
				</ol>
			</li>
			<li>
				Import&nbsp;UIImage+FloodFill.h file where you want to use this .</li>
			<li>
				Call flood fill function with all argument like folloeing</li>
		</ol>
		<p>
			<span class="s1">UIImage</span><span class="s2"> *image1 = [</span><span class="s3">self</span><span class="s2">.</span><span class="s1">image</span><span class="s2"> </span>floodFillFromPoint<span class="s2">:tpoint </span>withColor<span class="s2">:[</span><span class="s1">UIColor</span><span class="s2"> </span><span class="s1">grayColor</span><span class="s2">] </span>andTolerance<span class="s2">:tolerance</span><span class="s2">];</span></p>
	</body>
</html>
