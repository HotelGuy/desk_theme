---
---

$ ->

	# autocomplete cities
	$('#ticket_custom_destination').autocomplete
		source: (request, response) ->
			$.getJSON 'http://gd.geobytes.com/AutoCompleteCity?callback=?&q=' + request.term, (data) ->
				response data
				return
			return
		minLength: 3
		select: (event, ui) ->
			$('#ticket_custom_destination').val ui.item.value
			false
