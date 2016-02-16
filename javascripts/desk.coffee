---
---

$ ->

	# Get City Details (city, region/state, country)
	getcitydetails = (place) ->
		console.log place
	# 	if typeof place == 'undefined'
	# 		place = $('#ticket_custom13').val()
	# 	cityplace = place
	# 	if cityplace
	# 		$.getJSON '//gd.geobytes.com/GetCityDetails?callback=?&place=' + cityplace, (data) ->
	# 			$('#ticket_custom5').val data.geobytescity
	# 			$('#ticket_custom6').val data.geobytesregion
	# 			$('#ticket_custom7').val data.geobytescountry
	# 		return
	# 	return

	# autocomplete cities
	input = document.getElementById('ticket_custom13')
	autocomplete = new (google.maps.places.Autocomplete)(input, types: [ '(cities)' ])
	google.maps.event.addListener autocomplete, 'place_changed', ->
		getcitydetails autocomplete.getPlace()
		return

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
