//  /* Every time the window is scrolled ... */
// $(window).scroll( function(){

//     /* Check the location of each desired element */
//     $('.fade_in').each( function(i){
        
//         var bottom_of_object = $(this).offset().top + $(this).outerHeight();
//         var bottom_of_window = $(window).scrollTop() + $(window).height();
        
//         /* If the object is completely visible in the window, fade it it */
//         if( bottom_of_window > bottom_of_object ){
//             $(this).animate({'opacity':'1'},500);        
//         }  
//     }); 
// });

$(window).scroll( function(){
    $('.fadeIn').each(function(i) {
        var bottom_of_object = $(this).offset().top + $(this).outerHeight() - 200 ;
        var bottom_of_window = $(window).scrollTop() + $(window).height();
        var result = (bottom_of_object - bottom_of_window) ;
        if( result < 0 ){   
            //$(this).delay((i++) * 300).fadeTo(600, 1); 
            //var a = (i++) * 300;
            var j = i%3 ;
            console.log(j);
            $(this).delay((j++) * 300).animate({'opacity':'1'},1000); 
        }  
    });
});