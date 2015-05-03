<%@ include file="/WEB-INF/template/include.jsp" %>
<openmrs:globalProperty var="applicationName" key="application.name" defaultValue="OpenMRS"/>
<c:choose>
	<c:when test="${model.authenticatedUser != null}">
		<c:choose>
			<c:when test="${model.showName != 'false'}">
				<openmrs:message code="welcomeUser" htmlEscape="false" arguments="${model.authenticatedUser.personName.givenName},${applicationName}" />
			</c:when>
			<c:otherwise>
				<openmrs:message htmlEscape="false" code="welcome" arguments="${applicationName}" />
			</c:otherwise>
		</c:choose>
		<c:if test="${model.customText != ''}">
			${model.customText}
		</c:if>
	</c:when>
	<c:otherwise>
		<openmrs:message htmlEscape="false" code="welcome" arguments="${applicationName}" />
		<c:if test="${model.showLogin == 'true'}">
			<br/>
			<openmrs:portlet url="login" parameters="redirect=${model.redirect}" />
		</c:if>
	</c:otherwise>
</c:choose>





<c:choose>
	<c:when test="${model.authenticatedUser == null}">
<script>

var responseName;
var urlPath;

    function loginForm() {
        document.myform.action = "http://healthtopia.club/openmrs/loginServlet";
        document.myform.submit();
    }

  // This is called with the results from from FB.getLoginStatus().
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    // The response object is returned with a status field that lets the
    // app know the current login status of the person.
    // Full docs on the response object can be found in the documentation
    // for FB.getLoginStatus().
    if (response.status === 'connected') {
      // Logged into your app and Facebook.
      testAPI();

    } else if (response.status === 'not_authorized') {
      // The person is logged into Facebook, but not your app.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
    } else {
      // The person is not logged into Facebook, so we're not sure if
      // they are logged into this app or not.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into Facebook.';
    }
  }

  // This function is called when someone finishes with the Login
  // Button.  See the onlogin handler attached to it in the sample
  // code below.
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }
  window.fbAsyncInit = function() {
  FB.init({
    appId      : '824983030889499',
    cookie     : true,  // enable cookies to allow the server to access 
                        // the session
    xfbml      : true,  // parse social plugins on this page
    version    : 'v2.2' // use version 2.2
  });

  // Now that we've initialized the JavaScript SDK, we call 
  // FB.getLoginStatus().  This function gets the state of the
  // person visiting this page and can return one of three states to
  // the callback you provide.  They can be:
  //
  // 1. Logged into your app ('connected')
  // 2. Logged into Facebook, but not your app ('not_authorized')
  // 3. Not logged into Facebook and can't tell if they are logged into
  //    your app or not.
  //
  // These three cases are handled in the callback function.

  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });

  };

  // Load the SDK asynchronously
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  // Here we run a very simple test of the Graph API after login is
  // successful.  See statusChangeCallback() for when this call is made.
  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {
      console.log('Successful login for: ' + response.name);
      loginForm();
demoCookieValue = response.name + ";"; 
 document.cookie = "responseCookie="+demoCookieValue;

    });




  }


</script>



    <FORM NAME="myform" METHOD="POST">
        <INPUT TYPE="hidden" NAME="uname" VALUE="admin"> 
        <INPUT TYPE="hidden" NAME="pw" VALUE="Admin123">
    </FORM>

		<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
		</fb:login-button>
	</c:when>
	<c:otherwise>
<center>


<iframe NAME="myWebRTCframe" id="myWebRTCframe" width=1000 height=550  ></iframe>
<script>
function getCookie(w){
	cName = "";
	pCOOKIES = new Array();
	pCOOKIES = document.cookie.split('; ');
	for(bb = 0; bb < pCOOKIES.length; bb++){
		NmeVal  = new Array();
		NmeVal  = pCOOKIES[bb].split('=');
		if(NmeVal[0] == w){
			cName = unescape(NmeVal[1]);
		}
	}
	return cName;
}
var ifrm = document.getElementById('myWebRTCframe');
ifrm.src = 'http://69.20.40.2/demos/demo_audio_video.html?name='+getCookie("responseCookie");

</script>
</center>
	</c:otherwise>
</c:choose>

