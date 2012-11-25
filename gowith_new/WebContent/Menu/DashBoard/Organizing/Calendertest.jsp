<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>Agenda</h1>

<script type="text/javascript">

        $(document).ready(function() {
        
                var date = new Date();
                var d = date.getDate();
                var m = date.getMonth();
                var y = date.getFullYear();
                
                /* 
                        TODO:
                        ====
                        - Make past appointments uneditable, undraggable, unmovable
                        - Make the events multicolored
                        - Make the events editable
                        - Add events via modal dialog
                */
                
                $("#calendar").fullCalendar({
                        defaultView: "agendaWeek",
                        weekends: false,
                        minTime: 8,
                        maxTime: 21,
                        height: 620,
                        header: {
                                left: "prev,next today",
                                center: "title",
                                right: "month,agendaWeek,agendaDay"
                        },
                        editable: true,
                        events: "/appointments",
                        allDaySlot: false,
                        allDayDefault: false,
                        dayClick: function(dayDate, allDay, jsEvent, view){
                                if (view.name != "month"){
                                        // Reset the form                       
                                        // Set the start date for the new event
                                        $("#appointment-startsAt").val(dayDate);
                                        // Reveal the dialog
                                        $("#event-form").dialog("open");
                                }
                        },
                       /* eventClick: function(calEvent, jsEvent, view) {
                                // Set the data into the form

                                // Change the form action URL to an update URL
                                
                                // Reveal the dialog
                                $("#event-form").dialog("open");                        
                        },*/
                        eventClick: function(event) {
                            if (event.url) {
                              $dialog
                                .load(event.url)
                                .dialog({
                                  autoOpen: false,
                                  width: 500,
                                  height:300
                                });
                              $dialog.dialog('open');
                              return false;
                            };
                          },
                        eventDrop: function(calEvent, dayDelta, minuteDelta, allDay, revertFunc, jsEvent, ui, view) {
                                // update the event with the new data
                        },
                        eventResize: function(calEvent, dayDelta, minuteDelta, revertFunc, jsEvent, ui, view) {
                                // update the event with the new data
                        },
                        
                });
                
                // Setup the dialog
                $("#event-form").dialog({
                        title: "New appointment", autoOpen: false, resizable: false, width: 480, height: 350, modal: true
                });
                
                // Setup autocomplete for patients
                $("#appointment-patient").autocomplete("/patients/search");
                
                // Assigned the selected patient
                $("#appointment-patient").result(function(event, data, formatted) {
                        $("#appointment-patientId").val(data[1]);
                });
                
                // Limit the notes
                $('#appointment-notes').limit('255');           
        });
        
        function onSubmitSuccess(data, textStatus){
                $("#calendar").fullCalendar("refetchEvents");
                $("#event-form").dialog("close");       
        }
        
        function onSubmitError(XMLHttpRequest, textStatus, errorThrown){
                alert("Oops, an error occured. Please verify your data and try again");
        }       
        
</script>

<div id="calendar"></div>

<div id="event-form" class="hidden">
        <cfoutput>
                #startRemoteFormTag(controller="appointments", action="create")#
                        <p><label class="required inlined">Enter the patient name or UID</label>
                                #textFieldTag(name="appointment[patient]", class="input-text")#</p>
                        
                        <p><label for="appointment-doctorId">Doctor</label>
                                #selectTag(name="appointment[doctorId]", options=doctors, textField="fullName")#</p>
                        
                        <p><label class="required inlined">Additional notes</label>
                                #textAreaTag(name="appointment[notes]", class="input-text")#</p>
                        
                        #hiddenFieldTag(name="appointment[patientId]")#
                        #hiddenFieldTag(name="appointment[startsAt]")#
                        
                        #submitTag(class="g-button")# or <a href="##" onclick="$('##event-form').dialog('close');">Cancel</a>
                #endRemoteFormTag()#
        </cfoutput>     
</div>