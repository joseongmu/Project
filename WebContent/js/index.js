
			  (function(window) {
			   			var gidsy = window.gidsy = window.gidsy || {};
			
				    	gidsy._dom_ready_queue = [];
			  	  	gidsy.on_dom_ready = function(func) {
			  	    gidsy._dom_ready_queue.push(func);
			  	  };
			  	})(this);
