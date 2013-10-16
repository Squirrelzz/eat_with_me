(function($){
	var eatWithMe = {
		'config' : {
			'charSelect' : ".screen--character",
			'status' : ".foods .status"
		},

		'init' : function() {
			$("body").on("click", ".screen--character .character", function() {
				var chars = eatWithMe.characterSelect($(this));
				chars.about();
			})
			

			
			$(".information").hide();
		},

		// CHECK YOUR COMMAS
		'characterSelect' : function(element) {
			function selectBg() {
				element.addClass("selected");
				element.siblings(".character").removeClass("selected");	
				element.siblings(".character").find(".information").hide();
				info();
			}
			function info() {
				var height = parseInt(element.height(), 10);
				var width = parseInt(element.width() - 2, 10);
				
				element.find(".information").fadeIn().css("margin-top", -height).css("margin-left", -15).height(height-32).width(width);
			}
	

			return {
				'about' : function() {
					selectBg();
				}
			}
		}
	};

	$(document).ready( function() {
		eatWithMe.init();
	});
}(jQuery));	