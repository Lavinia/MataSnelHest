jQuery ->
	jQuery('#weight').keyup ->
		jQuery('#showWeight').html jQuery(this).val()
	
	jQuery('input[name=gender]:radio').change ->
		jQuery('#showGender').html jQuery(this).val()
		
	jQuery('input[name=feedType]:radio').change ->
		jQuery('#showFeedType').html jQuery(this).val()
	
	jQuery('#horseInfo').submit -> false
