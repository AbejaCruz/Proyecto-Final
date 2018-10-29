$(document).ready(function() {
  actions();
});

function actions() {
  $('#submit').prop('disabled', true);
  $('#zone_city').prop('disabled', true);

  var states;
  
  states = $('#zone_city').html();
  $('#_department').change(function() {
    if ($(this).val() !== ""){
      $('#zone_city').prop('disabled', false);
      var country, escaped_country, options;
      country = $('#_department :selected').text();
      escaped_country = country.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
      options = $(states).filter("optgroup[label=" + escaped_country + "]").html();
      if (options) {
        $('#zone_city').html(options);
        if ($('#zone_city').val() !== ""){
          $('#submit').prop('disabled', false);
        }
      } else {
        $('#zone_city').empty();
        return $('#zone_city').parent().hide();
      }
    }else{
      $('#zone_city').prop('disabled', true);
      $('#submit').prop('disabled', true);
    }
  });
}