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
								$( "#dialog" ).dialog( "open" );
								event.preventDefault();
								
			},
			eventClick: function(calEvent, jsEvent, view) {
	     							
      },
      eventDrop: function(dayDate,calEvent, dayDelta, minuteDelta, allDay, revertFunc, jsEvent, ui, view) {
    	 				 $( "#dialog" ).dialog( "open" );
								event.preventDefault();
      },
      eventResize: function(calEvent, dayDelta, minuteDelta, revertFunc, jsEvent, ui, view) {

      },
		  events: [
			   
				{
					title: 'Want to your Select',
					start: new Date(y, m, 1),
				 	color: 'yellow',   // an option!
				  textColor: 'black' // an option!
				}

			]
		
		});
		
		
	});

</script>


<div class="span7">
<div id='calendar'></div>
</div>
				<div id="dialog">
						<span>※ 선택하신 날짜는 다음과 같습니다.</span>
						<div class="dateinput">
						<form action="Menu/DashBoard/Organizing/register?mode=cal" method="post" id="dataform">
						<input type="text"  class="input-small" name="start" id="start"> ~ <input type="text" class="input-small"  name="end" id="end">
						</form>
						</div>
			
				</div>
 <script>
	$( "#dialog" ).dialog({
		autoOpen: false,
		width: 270,
		height: 200,
		modal:true,
		title:"활동 날짜 설정",
		buttons: [
					{
						text: "결정",
						click: function() {
							$("#dataform").submit();
						}
					},
					{
						text: "Cancel",
						click: function() {
							$( this ).dialog( "close" );
						}
					}
				]
	});

	// Link to open the dialog
	
	$( "#dialog-close" ).click(function( event ) {
		$( "#dialog" ).dialog( "close" );
		event.preventDefault();
	});
	</script>
    <script>
			$( "#dialog-link" ).click(function( event ) {
				$( "#dialog" ).dialog( "open" );
				event.preventDefault();
				});
    </script>






    