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
