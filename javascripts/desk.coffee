---
---

$ ->

	# Get City Details (city, region/state, country)
	getcitydetails = (fqcn) ->
		if typeof fqcn == 'undefined'
			fqcn = jQuery('#f_elem_city').val()
		cityfqcn = fqcn
		if cityfqcn
			jQuery.getJSON '//gd.geobytes.com/GetCityDetails?callback=?&fqcn=' + cityfqcn, (data) ->
				jQuery('#ticket_custom5').val data.geobytescity
				jQuery('#ticket_custom6').val data.geobytesregion
				jQuery('#ticket_custom7').val data.geobytescountry
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
