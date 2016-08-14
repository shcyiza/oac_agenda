# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#event_esdate_date').datepicker({
    dateFormat: 'dd/mm/yy',
    firstDay: 1
    }).val();
  $('#event_eedate_date').datepicker({
    dateFormat: 'dd/mm/yy',
    firstDay: 1
    }).val();
