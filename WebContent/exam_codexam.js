(function() {
	
	
	
	
	$("#timer").text();
	
	var examTimer = new Timer({
	    tick    : 1,
	    ontick  : function(sec) { 
	    	$("#timer").text(sec);
	    	console.log(sec + ' seconds left') },
	    onstart : function() { console.log('timer started') },
	    onstop  : function() { console.log('timer stop') },
	    onpause : function() { console.log('timer set on pause') },
	    onend   : function() { console.log('timer ended normally') }
	});

	// defining options using on
	examTimer.on('end', function () {
		$("#timer").text("0");
		
		//$( "#question_form" ).submit();
	    console.log('timer ended');
	    
	    $("#next").click()
	});

	//start timer for 40 seconds
	examTimer.start(5);
})();