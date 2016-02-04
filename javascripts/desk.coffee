---
---

$ ->

	# autocomplete cities
	$('#ticket_custom13').autocomplete
		source: (request, response) ->
			$.getJSON 'http://gd.geobytes.com/AutoCompleteCity?callback=?&q=' + request.term, (data) ->
				response data
				return
			return
		minLength: 3
		select: (event, ui) ->
			$('#ticket_custom13').val ui.item.value
			false
