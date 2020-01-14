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
      var url = $('#your_form_id').attr('action');
      $.ajax({
        type: 'get',
        url: url,
        data: {working_day: dateObject}
      })
    }
  })
});

