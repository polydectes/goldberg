/*
 * @ description: Plugin to display 960.gs gridlines See http://960.gs/
 * @author: badlyDrawnToy sharp / http://www.badlydrawntoy.com
 * @license: Creative Commons License - ShareAlike http://creativecommons.org/licenses/by-sa/3.0/
 * @version: 1.0 20th April 2009
 * @params:
 *	 cols - Either 12 or 16. Defaults to 12
 *	 options - Default options are as follows. They may be overridden by passing in this param
 *	   var defaults = {
 *		 default_cols: 12,
 *		 z_index: 999,
 *		 img_path: '/images/',
 *		 opacity:.6
 *	   };
*/

(function ($) {
	$.fn.addGrid = function (image_path) {

			var default_cols = 24;
			var z_index = 999;
			var i_path = image_path;
			var opacity = .3 ;
		    var grid_id = 24;

		return this.each(function () {
			var $el = $(this);
			var height = $el.height();
            var wrapper = $('<div id= "24"/>')
				.appendTo($el)
				.css({
					'display':'none',
					'position':'absolute',
					'top':0,
					'z-index':(z_index -1),
					'height':height,
					'opacity':opacity,
					'width':'100%'});

			$('<div/>')
				.css({
					'margin':'0 auto',
					'width':'950px',
					'height':height,
                    'background-image': 'url(' + i_path + ')'})
				.appendTo(wrapper);

				$('<div>grid on</div>')
					.appendTo($el)
					.css({
						'position':'absolute',
						'top':0,
						'left':0,
						'z-index':z_index,
						'background': '#222',
						'color':'#fff',
						'padding': '3px 6px',
						'width': '40px',
						'text-align':'center'
					})
					.hover( function() {
						$(this).css("cursor", "pointer");
					}, function() {
						$(this).css("cursor", "default");
					})
					.toggle( function () {
						$(this).text("grid off");
						$('#'+grid_id).slideDown();
					},
					function() {
						$(this).text("grid on");
						$('#'+grid_id).slideUp();
					});
		});
	};
})(jQuery);
