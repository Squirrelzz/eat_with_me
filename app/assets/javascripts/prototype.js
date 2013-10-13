(function($){
	var eatWithMe = {
		'config' : {
			
			'test' : "#facade",
			
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
				//eatWithMe.config.charSelect.find(".character").each( function() {
			
				
				element.addClass("selected");
				element.siblings().removeClass("selected");	
				element.siblings().find(".information").hide();
				info();
				
			}
			function info() {
				var height = parseInt(element.height(), 10);
				var width = parseInt(element.width(), 10);
				
				console.log(height)
			
				element.find(".information").fadeIn().css("margin-top", -height).css("margin-left", -15).height(height-32).width(width);
			}
	

			return {
				'about' : function() {
					selectBg();
					//other();
				}
			}
		}

	};

	$(document).ready( function() {
		eatWithMe.init();
	});
}(jQuery));	