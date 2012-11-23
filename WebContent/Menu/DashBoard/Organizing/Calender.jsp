<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type='text/javascript'>


	$(document).ready(function() {
	
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		
		$('#calendar').fullCalendar({
			 header: {
                 left: "prev,next",
                 center: "title",
                 right: "today,month"
       },
      width:350,
      height: 520,
			editable: true,
			
			dayClick: function(dayDate, allDay, jsEvent, view){
              alert(allDay);
				 			$("#event-form").dialog("open");
			},
			eventClick: function(calEvent, jsEvent, view) {
							alert("이벤트 클릭시 나타나는 alert");                   
      },
      eventDrop: function(calEvent, dayDelta, minuteDelta, allDay, revertFunc, jsEvent, ui, view) {
                // update the event with the new data
    	         alert("이벤트 드롭시 나타나는 alert");
      },
      eventResize: function(calEvent, dayDelta, minuteDelta, revertFunc, jsEvent, ui, view) {
                // update the event with the new data
    	        alert("이벤트 Resize시 나타나는 alert");
      },
		  events: [
			   
				{
					title: 'All Day Event',
					start: new Date(y, m, 1),
				 	color: 'yellow',   // an option!
				  textColor: 'black' // an option!
				},
				{
					title: 'Reserve Date',
					start: new Date(y, m, d-5),
					end: new Date(y, m, d-2)
				}

			]
		
		});
		
		
	});

</script>


<div class="span8">
<div id='calendar'></div>

<p><a href="#" id="dialog-link" class="ui-state-default ui-corner-all">Open Dialog</a></p>


<div id="dialog" title="Dialog Title">
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>
  <div class="pull-right">
							            <button type="submit" class="btn btn-primary">Next>></button>
							            <button type="reset" class="btn">Cancel</button>
	</div>
</div>







    