---
---

$ ->

	# autocomplete cities
	$('#destination').autocomplete
		source: (request, response) ->
			$.getJSON 'http://gd.geobytes.com/AutoCompleteCity?callback=?&q=' + request.term, (data) ->
				response data
				return
			return
		minLength: 3
		select: (event, ui) ->
			$('#destination').val ui.item.value
			false
		open: ->
			# $(this).removeClass("ui-corner-all").addClass("ui-corner-top");
			return
		close: ->
			# $(this).removeClass("ui-corner-top").addClass("ui-corner-all");
			return
		# $('#destination').autocomplete 'option', 'delay', 100
