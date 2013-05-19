;
(function($) {
	$.fn.serializeObject = function() {
		var o = {};
		var a = this.serializeArray();
		$.each(a, function() {
			if (o[this.name] !== undefined) {
				if (!o[this.name].push) {
					o[this.name] = [ o[this.name] ];
				}
				o[this.name].push(this.value || '');
			} else {
				o[this.name] = this.value || '';
			}
		});
		return o;
	};
	$.fn.populateJSON2Form = function(json, attr) {
		var form = $(this);
		attr = (attr) ? attr : "id";
		$.each(json, function(key, value) {
			var input = form.find('[' + attr + '="' + key + '"]');
			input.val(value);
		});
	};
})(jQuery);
