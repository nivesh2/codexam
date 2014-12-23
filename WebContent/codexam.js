(function() {

    $(document).on('click', 'button.topic_display', function() {
    	
        var name = $(this).attr('id');
        $(name).modal('hide');
        
        
        
    });
    $( "input" ).focus(function() {
    	$('.alert-div').hide();
    	});
    
})();