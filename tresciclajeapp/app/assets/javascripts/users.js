$(document).ready(function() {
  user_actions();  
});

function user_actions() {  
  $('#userform').prop('disabled', true);
  $("#user_city_id").prop('disabled', true);
  $("#user_zone_id").prop('disabled', true);

  var states;
  
  states = $('#user_city_id').html();
  zones =  $('#user_zone_id').html();
  
  $('#_department').change(function() {
    if ($(this).val() !== ""){
      $('#user_city_id').prop('disabled', false);
      var country, escaped_country, options;
      country = $('#_department :selected').text();
      escaped_country = country.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
      options = $(states).filter("optgroup[label=" + escaped_country + "]").html();
      if (options) {
        $('#user_city_id').html(options);
        if ($('#user_city_id').val() !== ""){
          $("#user_zone_id").prop('disabled', false);
          $('#userform').prop('disabled', false);
        }
      } else {
        $('#user_city_id').empty();
        return $('#user_city_id').parent().hide();
      }
    }else{
      $('#user_city_id').prop('disabled', true);
      $('#userform').prop('disabled', true);
    }
  });
}