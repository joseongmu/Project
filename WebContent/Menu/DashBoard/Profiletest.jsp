<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div class="span7 offset1">
      <div>
  <div class="general-form inlineForm">
          <div class="avatar-box">
            <div id="avatar-container">
              



<div class="profile-avatar">
  
    <img src="https://d210sb62pv61zh.cloudfront.net/avatars/095cca57/resized/220/vi.png" alt="095cca57" width="220" height="220" class="avatar-display" />
  
</div>
<h4>Select an image on your computer</h4>
<form id="avatar-form" enctype="multipart/form-data" method="POST"
  action="/avatar/add/">
  <div style='display:none'><input type='hidden' name='csrfmiddlewaretoken' value='nUiP6mI2mYvzhAZQekeBWP3yX4Idqscu' /></div>
  <span class="subtext">Maximum size of 4MB. JPG, GIF, PNG.</span>
  <input type="file" name="avatar" id="id_avatar" />
  <input type="hidden" name="next" value="/profile/avatar/" />
  <div class="loading">
    <img src="https://d3pvklq8xnxxh2.cloudfront.net/img/ajax-loader.c706287.gif" />
    uploading ...
  </div>
  <div id="avatar-success" class="success-indicator">
    <strong>Well, hello gorgeous!</strong><br/>
    You've successfully uploaded your photo
   </div>
</form>

            </div>
            <div class="clear"></div>
          </div>
          <form action="" class="uniForm profile-form" method="POST">
            <div style='display:none'><input type='hidden' name='csrfmiddlewaretoken' value='nUiP6mI2mYvzhAZQekeBWP3yX4Idqscu' /></div>
            
            <link href="https://d3pvklq8xnxxh2.cloudfront.net/jquery-autosuggest/css/gidsyAutoSuggest.c706287.css" type="text/css" media="all" rel="stylesheet">
            <fieldset class="inlineLabels">
              
    





  <div id="div_id_user-first_name" class="ctrlHolder  ">
      
        <label for="id_user-first_name">
            First Name
        </label>
        <div class="clear"></div>
      
      <input type="text"
    name="user-first_name"
    
        value="Lee123123"
    
     id="id_user-first_name" class="textinput required validateMaxLength val-15" maxlength="15"
    class="inline-label-field  required"
    id="" />

      <div class="error-indicator">
        <span class="message error-signal">
          
          Required field
        </span>
      </div>
      <span id="id_user-first_name_counter" class="counter"></span>
      
      <div class="clear"></div>
  </div>



    





  <div id="div_id_user-last_name" class="ctrlHolder  ">
      
        <label for="id_user-last_name">
            Last Name
        </label>
        <div class="clear"></div>
      
      <input type="text"
    name="user-last_name"
    
     id="id_user-last_name" class="textinput validateMaxLength val-60" maxlength="60"
    class="inline-label-field "
    id="" />

      <div class="error-indicator">
        <span class="message error-signal">
          
          Required field
        </span>
      </div>
      <span id="id_user-last_name_counter" class="counter"></span>
      
      <div class="clear"></div>
  </div>



    





  <div id="div_id_user-username" class="ctrlHolder  ">
      
        <label for="id_user-username">
            Your public Gidsy page
        </label>
        <div class="clear"></div>
      
      <input type="text"
    name="user-username"
    
     class="textinput validateMaxLength val-30 validateCallback validate_username" id="id_user-username"
    class="inline-label-field "
    id="" />

      <div class="error-indicator">
        <span class="message error-signal">
          
          Required field
        </span>
      </div>
     
      
      <div class="clear"></div>
  </div>



              <div id="div_id_email-email"
                class="ctrlHolder error-indication">
                <label for="id_email">
                  Email address
                </label>
                <div class="privacy_fieldset">
                  <input type="text"
    name="email-email"
    
        value=""
    
     class="emailinput validateEmail validateCallback validate_email" id="id_email-email"
    class="inline-label-field "
    id="" />
                </div>
                
                <span id="hint" class="formHint fineprint-text">Your email address will never be displayed publicly</span>
                <div class="clear"></div>
              </div>
              <div id="div_id_phone" class="ctrlHolder">
                <label for="id_phone">
                  Phone number
                </label>
                <div class="privacy_fieldset">
                  <label class="tipsy-item private-msg private"
                    title="This information is only shared after a successful booking">
                    <span class="icon private"></span>Private
                  </label>
                  <input type="text"
    name="phone-phone"
    
     id="id_phone-phone"
    class="inline-label-field "
    id="" />

                  <span id="hint_id_phone" class="formHint fineprint-text">Don&#39;t forget to include the country code!</span>
                </div>
                <div class="clear"></div>
              </div>
              
    





  <div id="div_id_profile-location" class="ctrlHolder  ">
      
        <label for="id_profile-location">
            Location
        </label>
        <div class="clear"></div>
      
      <input type="text"
    name="profile-location"
    
     class="locationautocomplete validateMaxLength val-300" id="id_profile-location"
    class="inline-label-field "
    id="" />

<script type="text/javascript">
	$(function(){
	    gidsy.search_box_autocomplete($("#id_profile-location"), { autosubmit: false });
	});
</script>
      <div class="error-indicator">
        <span class="message error-signal">
          
          Required field
        </span>
      </div>
      <span id="id_profile-location_counter" class="counter"></span>
      
      <div class="clear"></div>
  </div>
  </fieldset>
  </form>
  </div>
  </div>
  </div>



    


    