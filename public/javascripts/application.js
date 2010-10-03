soundManager.url = '/'; // directory where SM2 .SWFs live
soundManager.useFlashBlock = false;
soundManager.useHTML5Audio = true;

var SC = {
	user_ids_to_follow: [],
	Connect: {
		//client_id:  	'bisLB9wz3NHSmKmRcj2wQ',
		client_id:  	'pwUmpD7f9b9xflpfLzlvIw',
		
		oauth_token: 	null,
		endpoint: 		'/connect',
		callback:     function(){
			SC.Connect.oauth_token = oauth_token_from_hash(SC.Connect.popup_window);
			SC.Connect.popup_window.close();
			process_to_follow();
		}
	}
};

function oauth_token_from_hash(win){
	return win.location.hash.split('#')[1].split('=')[1];
}

function process_to_follow(){
	
	$.each(SC.user_ids_to_follow, function() {
		var user_id = this;
		follow(user_id, function(){
			bounce(user_id);
			toggle(user_id);
		});
	});
};

function bounce(id){
	$('.user-id-' + id).effect('bounce');
}

function toggle(id){
	$('.user-id-' + id).find('.follow-link').html('-');
}

function follow(id, callback){
	$.postCORS("https://api.soundcloud.com/me/followings/"+id+".json?oauth_token=" + SC.Connect.oauth_token, {'_method': 'PUT'}, callback);
}

function unfollow(id, callback){
	$.postCORS("https://api.soundcloud.com/me/followings/"+id+".json?oauth_token=" + SC.Connect.oauth_token, {'_method': 'DELETE'}, callback);
}


function sc_connect(){
	var redirect_uri = 'http://localhost:3001/sc_connect_complete.html';
	var redirect_uri = 'http://topbillin.com/sc_connect_complete.html';
	
	var url = 'https://soundcloud.com/connect?client_id=' + SC.Connect.client_id + '&display=popup&response_type=token&redirect_uri=' +redirect_uri; 	
	SC.Connect.popup_window = window.open(url ,"sc_connect_popup","location=1, width=456, height=500,toolbar=no,scrollbars=yes");
}

function path_to_url(path){
	return 'http://api.soundcloud.com' + path + '&consumer_key=' + SC.Connect.client_id;
}

$(function(){
	$('a.play').live('click', function(){
		var that = this;
		if($(this).hasClass("playing")){
			soundManager.stop('player');
			$(this).removeClass('playing');
		} else {
			var user_id = $(this).attr('href').split("#")[1];
			
			soundManager.destroySound('player');
			
			$('a.play').removeClass('playing');
			$(that).addClass('playing');
			$.getCORS(path_to_url('/users/' + user_id + '/tracks.json?filter=streamable'), null, function(r){
				soundManager.createSound('player', path_to_url('/tracks/'+ r[0].id + '/stream?'));
				soundManager.play('player');
			});
		}
		return false;
	});
	
	
	$('a.follow').live('click', function(){
		SC.user_ids_to_follow = $(this).attr('href').split("#")[1].split(",");
		
		if(SC.Connect.oauth_token){
			process_to_follow();
		}else{
			sc_connect();
		}
		return false;
	});
	
	////// scrolling code
	$(".tag")
	  .live('mouseenter',function() {
	    $(this).addClass("active");
    })
    .live('mouseleave',function() {
  	  $(this).removeClass("active");
  	});
  	
  $(".small.user")
	  .live('mouseenter',function() {
	    $(this).addClass("active");
    })
    .live('mouseleave',function() {
  	  $(this).removeClass("active");
  	});
  	
});