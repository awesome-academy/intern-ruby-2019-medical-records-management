$(function() {
  $('#datepicker').datepicker({
    beforeShowDay: function(date) {
      var day = date.getDay();
      return [(day != 0), ''];
    },
    minDate: 0,
    dateFormat: 'dd/mm/yy',
    onSelect: function() {
      var dateObject = $(this).datepicker('getDate');
      $.ajax({
        type: 'get',
        url: "/select_doctors",
        data: {working_day: dateObject}
      })
    }
  })
});

$(document).ready(function() {
  var working_days = $("#data_date").data("id");

  var date = new Date(2020, 1, 1);
  var free_days = [];

  while (date.getMonth() === 1) {
    date.setDate(date.getDate() + 1);
    var date_json = date.toISOString().slice(0,10);
    free_days.push(date_json);
  }

  for (i = 0; i < working_days.length; i++) {
    for(j = 0; j < free_days.length; j++){
      if(working_days[i] == free_days[j]){
        free_days.splice(j, 1);
        break;
      }
    }
  }

  function Disable_free_days(date) {
    var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
    return [free_days.indexOf(string) == -1];
  }

  $(function() {
    $("#datepicker1").datepicker({
      beforeShowDay: Disable_free_days, function(date) {
        var day = date.getDay();
        return [(day != 0), ''];
      },
      minDate: 0,
      dateFormat: 'dd/mm/yy'
   });
  });

  $(document).on('blur', '#datepicker1', function() {
    date_selected = $('#datepicker1').val();
    if(!free_days.includes(date_selected)) {
      $('#datepicker1').val(I18n.t("javascripts.custom.select_available_date"));
    }
  })
})
