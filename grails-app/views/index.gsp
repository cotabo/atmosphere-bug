<html>
    <head>
        <title>Welcome to Grails</title>
        <meta name="layout" content="main" />       
        <g:javascript library="jquery" plugin="jquery"/> 
		<script type="text/javascript" src="${resource(dir:'js', file:'jquery.atmosphere.js')}"></script>
		<script type="text/javascript">
		var subscribeChannel = function(channelString, callback) {						
		    $.atmosphere.subscribe(channelString,
		    	callback,		    	    
		    	$.atmosphere.request={transport:'websocket'}
			);    
		}

		var appendedIndex = 0
		var callback = function(response) {
			if (response.responseBody != null && response.responseBody != 'undefined') {
				appendedIndex++;
				$('#appender').append('<p><b>[' + appendedIndex + '-client]</b>: '+ response.responseBody + '</p>');			
			}
		}
		
		jQuery(function(){
			subscribeChannel('<g:resource dir="/atmosphere/test"/>', callback);

			$('#btn').click(function(e) {
				e.preventDefault();				
				$.get('<g:createLink controller="buggy"/>');
				return false;				
			});
		});
		</script>
    </head>
    <body>
    	 <p>2 messages gets broadcasted on the server </p>
    	 <button id="btn">Generate 2 messages</button>  
    	 <div id="appender" style="border: 1px black solid;"></div>       	  
    </body>
</html>
