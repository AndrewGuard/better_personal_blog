function parallaxScroll() {
	var scrolled = $(window).scrollTop();
	$('.bg1').css('top', (0 -(scrolled * 0.2)) + 'px');
	// $('.bg2').css('top', (0 -(scrolled * 0.2)) + 'px');
};

$(document).ready(function() {
	  $(window).bind('scroll',(function(e){
	  	parallaxScroll();
	  }))
});


// function parallaxScroll() {
// 	var scrolled = $(window).scrollTop();
// 	$('.bg2').css('top', (0 -(scrolled * 0.2)) + 'px');
// 	console.log("scrolled = " + scrolled);
// };

// $(document).ready(function() {
// 	  $(window).bind('scroll',(function(e){
// 	  	parallaxScroll();
// 	  }))
// });


// var $window = $(window); 
// var velocity = 0.4;

// function update(){ 
// 	var pos = $window.scrollTop(); 
// 	$('.container').each(function() { 
// 		var $element = $(this); 
// 		var height = $element.height(); 
// 		$(this).css('backgroundPosition', '50% ' + Math.round((height - pos) * velocity) + 'px');
// 	});
// };
// $window.bind('scroll', update);
