(function($){
	var eatWithMe = {
		'config' : {
			
			'test' : "#facade",
			
			'charSelect' : ".screen--character",
		},

		'init' : function() {
			
			
			$("body").on("click", ".screen--character .character", function() {
				
				
				var test = eatWithMe.characterSelect($(this));
				test.about();
				
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
				var animal = element.attr("class").slice(26);
				console.log(animal);
				
				
				
				console.log("hey this worked!");
				
				element.find(".information").show();
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