$(document).ready(function() {
  $('#submit').prop('disabled', true);
  $('#recycling_record_source_id').change(function() {
    if ($(this).val() !== ""){
      $('#submit').prop('disabled', false);
    }
    else{
      $('#submit').prop('disabled', true);
    };
  })
});