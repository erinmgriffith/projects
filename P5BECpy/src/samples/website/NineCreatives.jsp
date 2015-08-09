
<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>P5 Nine Creatives on Creativity</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Get the news you really value, on the topics you care about, at the quality you demand, for the price you want. For our audience, CrowdNe.ws is like an iTunes for news. Journalists: the dynamics of journalism has changed. Today, the audience can buy their news directly from you. CrowdNe.ws connects you, the journalist, directly to your audience. Think of us as your very own KickStarter.">    <meta name="author" content="">

	<!-- Tiny Pass Paywall Script -->

        <%@page import="samples.servlet.customerServlet"%>
        <%@page import="Database.CustomerData"%>
        <%@ page import="java.io.*,java.util.*" %>
        <%@ page import="samples.cli.*;" %>
        <%@page import="com.sun.faces.application.WebPrintWriter"%>
        <%@page import="samples.cli.SimpleCheckoutExampleCLI"%>
        <%@page import="samples.utils.NewstreamOrderReferenceId"%>
        <%@page import="samples.servlet.SimpleCheckoutServlet"%>
        <%@page import="samples.SetOrderReferenceDetailsSample"%>
        <%@page import=" samples.utils.PropertyBundle;"%>
        <%@page import="com.amazonservices.mws.offamazonpaymentsipn.model.OrderReference.*;"%>
        <%@page import="com.amazonservices.mws.offamazonpayments.OffAmazonPaymentsService.*;"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!--This script helps load the video jsScripts at the bottom of page -->
	<script src=" http://crowdne.ws/assets/js/html5shiv.js"></script>   
	<!-- Le styles -->
    <link href=" http://crowdne.ws/assets/css/bootstrap-responsive.css" rel="stylesheet" type="text/css">
    <link href=" http://crowdne.ws/assets/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href=" http://crowdne.ws/assets/css/video-js.css" rel="stylesheet">
    <script src='common.js'></script>
   
    <script>
      window.onAmazonLoginReady = function() {
        amazon.Login.setClientId('amzn1.application-oa2-client.c1d5462678d1477b8d9ae524c4707ff6');
           amazon.Login.setSandboxMode(true);
      };
    </script>
    
    <script type='text/javascript' 
            src='https://static-na.payments-amazon.com/OffAmazonPayments/us/sandbox/js/Widgets.js?sellerId=A2TU3GQJOHSGWZ'>
    </script>
	<!-- Is this used anywhere?-->
    <style>
	  .Absolute-Center {
		width: 50%;
		height: 50%;
		overflow: auto;
		margin: auto;
		position: absolute;
		top: 0; left: 0; bottom: 0; right: 0;
	  }

	  disabled {
		pointer-events: none;

	  }
	</style>
  </head>

  <body onload="autoAuth()"> 
     
      <script>
          amazon.Login.authorize(options, function(response) {
            if (response.error) {
              alert('auth error ' + response.error);
               return;
            }
          }
</script>
         

  <script>
      function autoAuth(){
       var options = {};
        options.scope= 'profile' ;
            options.auto='true';
        amazon.Login.authorize(options, function(response) {        
    if ( response.error ) {
       window.location.assign("ProcessPayment.jsp");         
return;
 }
//  amazon.Login.retrieveProfile(response.access_token, function(response) {        
//               var token = response.access_token;
//                                      


});
      }
</script>

   

	<!-- CrowdNe.ws Masthead
	   ================================================== -->  
	<div class="container">
	  <div class="masthead">  <!-- masthead-->
		<div class="row">  <!-- row-->
		  <div class="col-md-5"  style="padding-bottom:12px;">  <!-- Col-5-->
			<a href="http://crowdne.ws/p5Demo/P5A/web/index.html"><img src=" http://crowdne.ws/assets/img/CrowdNews_BLACK_Logo_265x39 copy.png" alt="CrowdNe.ws is Rebooting the News!"/> </a>
		  </div>
		  <div class="col-md-2" align="right"> <!-- Col-2-->
		  </div> <!-- /Col-2-->

	<!--	  		 Welcome Member =================================================   -->   
			<div class="btn-group pull-right"   style="padding-top:4px;">
			  <a button type="button" href="http://app.getresponse.com/survey.html?u=SBRI&survey_id=96301"  class="btn btn-info">  Feedback Survey</a> 
			</div>

		  <p class="lead" style="padding-top:12px;">This is beta prototype P5A </p>
      </ul>
</div>
		  </div> <!-- Col-5 -->
</div>  
	  </div>   <!-- /masthead-->
	</div><!-- /Container Masthead
		=================================--> 
 <hr/>
 
    <!-- Newstream Image Mark Steele
    ================================================== -->
	<div class="row">
	  <div class="col-md-12"><!-- Main Container -->
		<div id="myCarousel" class="carousel slide">
		  <div class="carousel-inner">       
			<div class="item active">

			  <img src=" http://crowdne.ws/assets/img/posterShots/markSteelPosterShot.jpg" class="img-responsive"  >
			  <!-- HTML5 Video Player  ================================================== -->
			  <div  align="center">
				<div class="row" style="padding-top:3em;">
				  <div class="col-md-12" style="padding-top:10px;"> 
<!--					<video id="markSteele" class="video-js vjs-default-skin "
						   controls preload="auto" width="620" height="320"
						   poster=" http://crowdne.ws/assets/img/posterShots/MarkSteeleTalkPoster2.jpg"
						   data-setup='{"markSteele_option":true}'>
					  <source src="https://s3-us-west-2.amazonaws.com/crowdne.wsvideos/MARK+STEELE2-desktop.m4v" type='video/mp4' />
					</video>-->
<iframe src="//player.vimeo.com/video/97440524" width="500" height="281" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe> <p></p>
				  </div>
				</div>
				<!-- /HTML5 Video Player  ================================================== -->
			  </div><!-- /item active --> 
			</div><!-- /carousel inner --> 
		  </div><!-- / id my carousel -->

		</div><!-- /main container-->

	  </div> <!-- /row -->
      </div>
 
	<hr>
	  <!-- Stream Content 9 Creatives ================================================== -->
	  <div class="container marketing">

		<div class="col-md-9">
		  <a name="topStory"></a>
		<h3 style="padding-top:15px">Nine Creatives on Creativity<br>
			<muted>by Jeff Hoffman and Mark Steele of Squashhouse</muted><br>
		  <span class="lead">July, 1 2014</span></h3>

		  <h4> <a name="dispatch1"></a></h4>
		  <p>The idea of creativity is a fascinating one. But it's different for every individual. Each gets from point A to point B in a unique way. Its done with inspiration, or discipline or something in-between. What they have in common is taking a series of unrelated ideas and putting them together into the making a new whole ?   and that might be a painting, it might be a new book, it might be a sculpture or it might be a song. Our Nine Creatives include musicians, a legendary ad man, artists, an author, a film composer, and even a phyisician. We present to you the idea of creativity, from some very, very creative people.</p>
		  <p>Our latest dispatch brings you  <strong>Mark Steele</strong>, an artist working out of his studio in Cambridge, Massachusetts. He's developed a unique way of creating compelling works of art. </p>
    <p>Upcoming dispatches from Squashhouse: Hayley Reardon, Songwriter; Bob Childs, Musician;  Norman LaLiberte, Artist/Author; Paul Glass, Film Composer; Duane Stanley, Songwriter/Musician; Dr. Alexander Angelov, Musician; Edward McCabe, Ad Man; and Esprit, Jazz Ensemble.

	<!-- content Paul Glass removed- kept div for layout purposes.	 -->
		  <p class="pull-right"><a href="#topStory"></a></p>  
		</div>   
		<!--/Stream Content-->



	<!--Dispatch Navigation-->  
		<div class="col-md-3">

			<br>

		  <div class="sthumbnails">
			<div class="dispatch">    <img src=" http://crowdne.ws/assets/img/posterShots/markSteelPosterShot.jpg"> </div>
			<h4 class="dispatch"> Dispatches</h4>
			<ul class="unstyledFooter">         
			  <li><a href="http://apollobob-env.elasticbeanstalk.com/p5nineCreatives.jsp">Mark Steele: Artist  </a></li>
<hr>
              <li>Upcoming Dispatches</li>
<hr>
			   <li class = "text-muted" title="Upcoming Dispatch!">Hayley Reardon: Songwriter &amp; Performer</li>
			<li class = "text-muted" title="Upcoming Dispatch!">Bob Childs:	 Violin Maker &amp; Musician</li>
			<li class = "text-muted" title="Upcoming Dispatch!">Norman LaLiberte:	Artist/Author</li>
				<li class = "text-muted" title="Upcoming Dispatch!">Paul Glass: Film Composer</li>
				 <li class = "text-muted" title="Upcoming Dispatch!">Duane Stanley: Songwriter/Musician</li>
				<li class = "text-muted" title="Upcoming Dispatch!">Dr. Alexander Angelov:	 Physician</li>
					 <li class = "text-muted" title="Upcoming Dispatch!">Edward McCabe:	 Ad Man</li>
					<li class = "text-muted" title="Upcoming Dispatch!">Esprit:	 Jazz Ensemble</li>

			</ul>
		  </div><!--/Dispatch Navigation--> 

		</div>

	  </div>         <!-- /container -->



<!--Simmialr Streams -->      
    
   <div class="container marketing">  

    <div class="row">
    <hr>


   <!-- Streams Stream-->
         <ul class="liStreams ">
              <li class="col-md-3">
                <div class="sthumbnail">
                    <h2>Similar Newstreams<small>&#8482</small></h2>
                </div>
              </li>
              
               <li class="col-md-3">
                <div class="sthumbnail">
               <a href="">   <img src="http://crowdne.ws/assets/img/typingJournalist.jpg"  alt="coming soon"></a>
                  <div class="sthumbnail">
                    <h6><a href=""  title="coming soon">Working Late</a></h6>
             
                  </div>
                </div>
              </li>
       
              <li class="col-md-3">
                <div class="sthumbnail">
     <a href="" >   <img src="http://crowdne.ws/assets/img/peopleInMotion400.png" alt="coming soon"></a>
                  <div class="caption">
                    <h6><a href=""  title="coming soon">CCTV Everywhere</a></h6>
                   
                    
                  </div>
                </div>
              </li>
              
              <li class="col-md-3">
                <div class="sthumbnail">
              <a href=""  >   <img src="http://crowdne.ws/assets/img/photodune-1969324-touching-screen-on-tablet-pc-m.jpg"  alt="coming soon"></a>
                  <div class="caption" >
                    <h6><a href="" title="coming soon">Instant Access</a></h6>
              
                  </div>
                </div>
           </li>
      </ul>   
     </div>
 
    <hr>

   </div>
 <!-- /Similar Streams-->
 


<!-- Profile
	   ================================================== -->

<div class="container marketing">
<hr>
<div class="row">
		<div class="col-md-12">
        	  <h3 >About Squashhouse Media<br>
		    Jeff Hoffman and Mark Steele<br>
		  <span class="lead">Member Since 2014</span></h3>

		  <p id= "authorBio" class="lead"> Squashhouse Media is a full-service, high-definition video production company located near Boston, Massachusetts. </p>
          </div>
         </div> 
          <div class="row">
<div class="col-md-10">
		  <h2>Jeff Hoffman: Producer/Cinematographer</h2>
			<p class="lead" id= "authorBio"> 
			  Producer/Director of Photography with extensive film, television, documentary and commercial experience. Jeff earned international expertise from projects shot worldwide from Easter Island to Antarctica, Japan to Europe. His clients range from Canadian and German television to all three US networks, Disney and Lexus. With his family and numerous dogs he has lived in LA, NYC, New Orleans and Vancouver, before settling in his hometown of Marblehead, Massachusetts. </p>
</div>
			<div class="col-md-2" >
			  <img src="http://crowdne.ws/assets/img/journalists/Jeff.jpg"  style="margin-right:0px; margin-top:50px" alt="Thumbnail 300x200"> 


		</div>
        </div>
        <div class="row">
          <div class="col-md-10">
		  <h2 id="authorName">Mark Steele: Director/Editor</h2>
			<p class="lead" id= "authorBio"> 
			  Director/Editor with extensive experience in the industry. Growing up in Woodstock, New York, Mark developed a passion for music, which is reflected in the imaginative projects he's done involving musical performance and commercials. He handles all aspects of HD production as well as DVD and web applications. From &#8220;This Old House,&#8221; to &#8220;Frontline,&#8221; Mark gained much of his creative expertise from a wide range of programming on PBS. </p>
</div>
			<div class="col-md-2" >
			  <img src="http://crowdne.ws/assets/img/journalists/MarkSteele.jpg"  style="; margin-top:50px" alt="Thumbnail 300x200"> 

</div>
</div>
		</div>

<!-- /Profile
	   ================================================== -->





	  <!-- FOOTER ==================================================-->
	  <div class="container" style="background-color:#f5f5f5; margin-top: 50px">
		<div class="footer">
		  <div class="col-md-3">
			<h6 text-muted=""><a href="http://CrowdNe.ws" title="CrowdNe.ws Home">CrowdNe.ws</a></h6>  
			<ul class="unstyledFooter">         

			  <li>&nbsp;</li>
			  <li>&nbsp;</li>
			  <li>&nbsp;</li>
			</ul>
			<p class="text-muted"><small>2014 CrowdNews, Inc | Version P5.0</small></p>
		  </div>  <!--/col-md-3-->
		  <div class="col-md-3">
			<h6 class="text-muted">About Us</h6>            
			<ul class="unstyledFooter">         
			  <li><a href="http://CrowdNe.ws" title="Learn more about CrowdNe.ws">About CrowdNe.ws</a></li>
			  <li><a href="http://CrowdNe.ws/team" title="Meet our great team.">Our Team</a></li>
			  <li><a href="http://crowdne.ws/pressKit.html" title="Info for the press. Need more? Just ask.">Press Kit</a></li>
			  <li><a href="http://blog.crowdne.ws/crowdnews-inc-privacy-policy.html" title="We take your privacy seriously.">Privacy Policy</a></li>
			   	  <li><a href=" http://web.crowdne.ws/privateBetaTOS.html"> Beta  TOS</a></li>          
			</ul>
		  </div> <!--/col-md-3-->
		  <!-- Contact Us  ==================================================--> 
		  <div class="col-md-3">
			<h6 class="text-muted">Get Started</h6>
			<ul class="unstyledFooter">         
			  <li><a href="http://crowdne.ws/startNow" title="Sign Up for our Beta Program to StartNow!">Start Now!</a></li>
			  <li><a href="http://crowdne.ws/emailSignUp.html" title="Stay up-to-date with our newsletter.">Join Our Emai List</a></li>


<!-- END ContactUs-->
			  <!-- END ContactUs--> 
			  <!-- Info Links  ==================================================--> 

			</ul>
		  </div>   <!--/col-md-3-->
		  <div class="col-md-3">
			<h6 class="text-muted">More </h6>
			<ul class="unstyledFooter">         
			  <li><a href="http://blog.crowdne.ws/" title="What we're doing and thinking about.">CrowdNe.ws Blog</a></li>
			  <li><a href="http://crowdne.ws/intern1" title="Join our amazing team!">Work at CrowdNe.ws!</a></li>
			</ul>
		  </div>   <!--/col-md-3-->
		</div><!--/Footer-->
	  </div>  <!--/Contatiner-->
	  <!--/FOOTER  ==================================================-->




	  <!-- Le javascript  ================================================== -->
	  <!-- Placed at the end of the document so the pages load faster -->
	  <script src=" http://crowdne.ws/assets/js/jquery.js"></script>
	  <script src=" http://crowdne.ws/assets/js/bootstrap-transition.js"></script>
	  <script src=" http://crowdne.ws/assets/js/bootstrap-alert.js"></script>
	  <script src=" http://crowdne.ws/assets/js/bootstrap-modal.js"></script>
	  <script src=" http://crowdne.ws/assets/js/bootstrap-dropdown.js"></script>
	  <script src=" http://crowdne.ws/assets/js/bootstrap-scrollspy.js"></script>
	  <script src=" http://crowdne.ws/assets/js/bootstrap-tab.js"></script>
	  <script src=" http://crowdne.ws/assets/js/bootstrap-tooltip.js"></script>
	  <script src=" http://crowdne.ws/assets/js/bootstrap-popover.js"></script>
	  <script src=" http://crowdne.ws/assets/js/bootstrap-button.js"></script>
	  <script src=" http://crowdne.ws/assets/js/bootstrap-collapse.js"></script>
	  <script src=" http://crowdne.ws/assets/js/bootstrap-carousel.js"></script>
	  <script src=" http://crowdne.ws/assets/js/bootstrap-typeahead.js"></script>


	  <script src=" http://crowdne.ws/assets/js/video.js"></script>
	  <script> videojs.options.flash.swf = " http://crowdne.ws/assets/js/video-js.swf";</script>



<!--	   AddThis Smart Layers BEGIN 
	   Go to http://www.addthis.com/get/smart-layers to customize 
	  <script type="text/javascript" src="//m.addthis.com/js/300/addthis_widget.js#pubid=ra-521e219e7f1e9404"></script>
	  <script src=" http://crowdne.ws/assets/js/addThisSmartButtons.js"></script>
	   AddThis Smart Layers END -->



	  <!-- Google Analytics  ================================================== -->
	  <script type="text/javascript">
	  var _gaq = _gaq || [];
	  _gaq.push(['_setAccount', 'UA-36007398-1']);
	  _gaq.push(['_setDomainName', 'crowdne.ws']);
	  _gaq.push(['_setAllowLinker', true]);
	  _gaq.push(['_trackPageview']);

	  function aFunction() {
		var ga = document.createElement('script');
		ga.type = 'text/javascript';
		ga.async = true;
		ga.src = 'https:' === document.location.protocol ? 'https://ssl' : 'http://www' + '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(ga, s);
	  }
	  </script>  <!-- /Google Analytics -->

  </body>  