$(document).on('ready page:load', function () {
	$('#exampleModal2').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-title').text('Delete!')
	  var the_button = "<a class='btn btn-danger btn_delete' rel='nofollow' data-method='delete' href='/user_items/" + recipient + "'>Delete</a>"
	  modal.find('.modal-footer a').replaceWith(the_button)

	});
});