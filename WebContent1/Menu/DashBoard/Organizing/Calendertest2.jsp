<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script type="text/javascript">
 $('#calendar').fullCalendar({ 
dayClick: function (date, allDay, jsEvent, view) {  
            $("#dialog").dialog('open');     
            $("#name").val("(event name)");
            $("#date-start").val($.fullCalendar.formatDate(date, 'MM/dd/yyyy'));
            $("#date-end").val($.fullCalendar.formatDate(date, 'MM/dd/yyyy'));
            $("#time-start").val($.fullCalendar.formatDate(date, 'hh:mmtt'));
            $("#time-end").val($.fullCalendar.formatDate(date, 'hh:mmtt')); 
    }, 
});

    $("#dialog").dialog({
        autoOpen: false,
        height: 350,
        width: 700,
        modal: true,
        buttons: {
            'Create event': function () {
                $(this).dialog('close');
            },
            Cancel: function () {
                $(this).dialog('close');
            }
        },

        close: function () {
        }

    });   
</script>

            <div id="dialog" class="event-dialog" title="Event">
            <div id="dialog-inner">
                <input type="text" name="name" id="name" class="text ui-widget-content ui-corner-all title"><br>
                <span class="inline"><input type="text" name="date-start" id="date-start" class="text ui-widget-content ui-corner-all"></span>
                <span class="inline"><input type="text" name="time" id="time-start" class="text ui-widget-content ui-corner-all"></span>
                <span class="inline">To:</span> <span class="inline"><input type="text" name="date" id="date-end" class="text ui-widget-content ui-corner-all"></span>
                <span class="inline"><input type="text" name="time" id="time-end" class="text ui-widget-content ui-corner-all"></span>
                <span class="inline">&nbsp;All day <input id="all-day" type="checkbox"></span> 
                <label for="description">Description:</label> 
                <textarea name="description" id="description" class="text ui-widget-content ui-corner-all" rows="8" cols="73">       
</textarea>
            </div>
        </div>
        <div id="calendar"></div>