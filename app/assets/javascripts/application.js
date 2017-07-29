// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery
//= require bootstrap.min
//= require jquery_ujs
//= require popper
//= require turbolinks
//= require Chart.bundle
//= require chartkick
//= require bootstrap-datepicker
//= require_tree .


// $( document ).on( 'click', '.navbar-nav li', function ( e ) {
//     $( this ).addClass( 'active' ).siblings().removeClass( 'active' );
// } );

// $(document).ready(function(){

// 	var current_item  = $('.active')
// 	$('.nav a').click(function(){
// 		current_item.removeClass('active');
// 		$(this).addClass('active');
// 	});
// });

// $(document).ready(function() {
//     $(document).on('click', '.nav a', function (e) {
//         $(this).parent().addClass('active').siblings().removeClass('active');
//     });
// });

$(document).on('ready page:load', function () {
//$( document ).ready(function() {

	$('#exampleModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-title').text('Delete!')
	  var the_button = "<a class='btn btn-danger btn_delete' rel='nofollow' data-method='delete' href='/incomes/" + recipient + "'>Delete</a>"
	  modal.find('.modal-footer a').replaceWith(the_button)

	});




	$('#exampleModal_edit1').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var income_id = button.data('incomeid'); // Extract info from data-* attributes
	  var income_job = button.data('incomejob');
	  var income_pay = button.data('incomepay');
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-title').text('Edit')
	  modal.find('.modal-body .container-fluid .row .col-sm-6 .field #job').text(incomejob)

	});

	$('.date_picker_1').datepicker();

  // you code here

  	//var comment = $('p .comment').val();
  	//alert(comment);
  	//var new_button = "<button type='button' class='btn btn-default' data-toggle='popover' title='Comment' data-content='" + comment + "' data-placement='top'>" + "View Comment" + "</button>"

  	//$('#my_button').replaceWith(new_button);
  	$('[data-toggle="popover"]').popover();

});

