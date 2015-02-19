(function() {
  jQuery(function() {
    $('body').prepend('<div id="fb-root"></div>');
    return $.ajax({
      url: window.location.protocol + "//connect.facebook.net/en_US/all.js",
      dataType: 'script',
      cache: true
    });
  });
  
  window.fbAsyncInit = function() {
    FB.init({
        appId      : '1413314268965344',
        xfbml      : true,
        version    : 'v2.2',
        status     : true,
        cookie     : true
    });
    
    $('#sign_in').click(function(e) {
      e.preventDefault();

      return FB.login(function(response) {
          console.log(response);
          e.preventDefault();
          
        if (response.status == "unknown")
            window.location = "/auth/facebook"
        else
            window.location = ("/auth/facebook/callback?signed_request=" + response.authResponse.signedRequest)          
        //if (response.authResponse) {
        //  return window.location = ("/auth/facebook/callback?signed_request=" + response.authResponse.signedRequest)
        //}
       }, {scope: 'email'});
    });
    
    return $('#sign_out').click(function(e) {
      FB.getLoginStatus(function(response) {
        if (response.authResponse) {
          return FB.logout();
        }
      });
      return true;
    });
  };

}).call(this);