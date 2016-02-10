---
---

$ ->

	# Get City Details (city, region/state, country)
	getcitydetails = (fqcn) ->
		if typeof fqcn == 'undefined'
			fqcn = $('#ticket_custom13').val()
		cityfqcn = fqcn
		if cityfqcn
			$.getJSON '//gd.geobytes.com/GetCityDetails?callback=?&fqcn=' + cityfqcn, (data) ->
				$('#ticket_custom5').val data.geobytescity
				$('#ticket_custom6').val data.geobytesregion
				$('#ticket_custom7').val data.geobytescountry
			return
		return

	# autocomplete cities
	$('#ticket_custom13').autocomplete
		source: (request, response) ->
			$.getJSON '//gd.geobytes.com/AutoCompleteCity?callback=?&q=' + request.term, (data) ->
				response data
				return
			return
		minLength: 3
		select: (event, ui) ->
			$('#ticket_custom13').val ui.item.value
			getcitydetails ui.item.value
			false

	# show/hide rooms
	$('#rooms .room-info:gt(0)').hide()
	$('#ticket_custom3').change ->
		n = parseInt $(this).val()
		$('#rooms .room-info:gt(0)').hide()
		$('#rooms .more-than-8').hide()
		$('#rooms .room-info:lt('+n+')').show()
		if $(this).val() == 'I need more than 8 rooms! '
		  $('#rooms .room-info').hide()
		  $('#rooms .more-than-8').show()

	# room fields generator
	generateFields = (idsArr, defaultID) ->
		$.each idsArr, (index, id) ->
			$elem = $('#ticket_custom'+id)
			$default = $('#ticket_custom'+defaultID)
			theName = $elem.attr('name')
			theID = $elem.attr('id')
			$elem.replaceWith( $default.clone().attr('name', theName).attr('id', theID) )
			return
	generateFields([32,33,34,35,36,37], 4) # room types
	generateFields([26,27,28,29,30,31], 11) # guest counts

	# validations
	$('#customer_custom8').rules 'add',
		required: true
		messages: required: 'Phone Number is required.'
