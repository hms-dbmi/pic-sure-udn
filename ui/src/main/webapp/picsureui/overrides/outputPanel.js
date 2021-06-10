define(["handlebars", "backbone", "text!../settings/settings.json", "text!output/outputPanel.hbs", "text!options/modal.hbs", "text!output/variantTable.hbs", "output/dataSelection"], 
function(HBS, BB, settings, outputTemplate, modalTemplate, variantTableTemplate, dataSelection){
	var outputModelDefaults = {
		totalPatients : 0,
		spinnerClasses: "spinner-medium spinner-medium-center ",
		spinning: false,
		resources : {}
	};

	return {
		/*
		 * This should be a function that returns the name of a Handlebars partial
		 * that will be used to render the count. The Handlebars partial should be
		 * registered at the top of this module.
		 */
		countDisplayOverride : undefined,
		/*
		 * This is a function that if defined replaces the normal render function
		 * from outputPanel.
		 */
		renderOverride : undefined,
		/*
		 * If you want to replace the entire Backbone.js View that is used for
		 * the output panel, define it here.
		 */
		viewOverride : BB.View.extend({
			//ontology: ontology,
			initialize: function(){
				this.template = HBS.compile(outputTemplate);
				HBS.registerHelper("outputPanel_obfuscate", function(count){
					if(count < 10 && false){
						return "< 10";
					} else {
						return count;
					}
				});
				
				this.modalTemplate = HBS.compile(modalTemplate);
				this.variantTableTemplate = HBS.compile(variantTableTemplate);
				settings = JSON.parse(settings);
			},
			events:{
				"click #select-btn": "select",
				"click #variant-data-btn" : "variantdata",
			},
			select: function(event){
				this.model.set('spinning', true);
				if(!this.dataSelection){
					var query = JSON.parse(JSON.stringify(this.model.get("query")));
					this.dataSelection = new dataSelection({query:query});
					$("#concept-tree-div",this.$el).append(this.dataSelection.$el);
					this.model.set("spinning", false);
					this.dataSelection.render();
				}
			},
			// Check the number of variants in the query and show a modal if valid.
			variantdata: function(event){
				this.model.set('spinning', true);
				this.render();
				// make a safe deep copy of the incoming query so we don't modify it
				var query = JSON.parse(JSON.stringify(this.model.get("query")));
				
				//this query type counts the number of variants described by the query.
				query.query.expectedResultType="VARIANT_COUNT_FOR_QUERY";
				
				$.ajax({
				 	url: window.location.origin + "/picsure/query/sync",
				 	type: 'POST',
				 	headers: {"Authorization": "Bearer " + JSON.parse(sessionStorage.getItem("session")).token},
				 	contentType: 'application/json',
				 	data: JSON.stringify(query),
				 	dataType: 'text',
				 	success: function(response){
//				 		console.log(response);
				 		
				 		//If there are fewer variants than the limit, show the modal
				 		maxVariantCount =  settings.maxVariantCount ? settings.maxVariantCount : 1000;
				 		
				 		responseJson = JSON.parse(response);
				 		
				 		if( responseJson.count == 0 ){
				 			this.showBasicModal("Variant Data", "No Variant Data Available.  " + responseJson.message);
				 		} else if( responseJson.count <= maxVariantCount ){
				 			this.showVariantDataModal(query);
				 		} else {
				 			this.showBasicModal("Variant Data", "Too many variants!  Found " + parseInt(response) + ", but cannot display more than " + maxVariantCount + " variants.")
				 		}
				 	}.bind(this),
				 	error: function(response){
				 		this.model.set('spinning', false);
				 		this.render();
				 		console.log("ERROR: " + response);
					}
				});
			},
			showBasicModal: function(titleStr, content){
				$("#modal-window").html(this.modalTemplate({title: titleStr}));
	 			$(".close").click(function(){
	 				 $("#modalDialog").hide();
				});
	 			
                $("#modalDialog").show();
                $(".modal-body").html(content);
                this.model.set('spinning', false);
                this.render();
			},
			//this takes a parsed query object and gets a list of variant data & zygosities from the HPDS 
			//and creates a modal table to display it
			showVariantDataModal: function(query){
				
				//we expect an object that has already been parsed/copied from the model.  
				//update the result type to get the variant data
				query.query.expectedResultType="VCF_EXCERPT";

				$.ajax({
				 	url: window.location.origin + "/picsure/query/sync",
				 	type: 'POST',
				 	headers: {"Authorization": "Bearer " + JSON.parse(sessionStorage.getItem("session")).token},
				 	contentType: 'application/json',
				 	data: JSON.stringify(query),
				 	dataType: 'text',
				 	success: function(response){
//				 		console.log(response);
				 		
				 		//default message if no data
				 		variantHtml = "No Variant Data Available"
				 		output = {};
				 		
				 		if(response.length > 0){
				 			//each line is TSV
							var lines = response.split("\n");
							
							headers = lines[0].split("\t");
							output["headers"] = headers;
							output["variants"] = []
							//read the tsv lines into an object that we can sent to Handlebars template
							for(i = 1; i < lines.length; i++){
								variantData = {};
								values = lines[i].split("\t");
								for(j=0; j < values.length; j++){
									variantData[headers[j]] = values[j];
								}
								output["variants"].push(variantData);
							}
							//render the template!
							variantHtml = this.variantTableTemplate(output);
				 		}
				 		
				 		//lines ends up with a trailing empty object; strip that and the header row for the count
				 		$("#modal-window").html(this.modalTemplate({title: "Variant Data: " + (lines.length - 2) + " variants found"}));
				 		$(".close").click(function(){
			 				 $("#modalDialog").hide();
						});
		                $("#modalDialog").show();
		                $(".modal-body").html(variantHtml);
		                
		                //now add a handy download link!
		                $(".modal-header").append("<a id='variant-download-btn'>Download Variant Data</a>");
		                responseDataUrl = URL.createObjectURL(new Blob([response], {type: "octet/stream"}));
						$("#variant-download-btn", $(".modal-header")).off('click');
						$("#variant-download-btn", $(".modal-header")).attr("href", responseDataUrl);
						$("#variant-download-btn", $(".modal-header")).attr("download", "variantData.tsv");
						 this.model.set('spinning', false);
						 this.render();
				 	}.bind(this),
				 	error: function(response){
				 		console.log("ERROR: " + response);
				 		this.model.set('spinning', false);
				 		this.render();
					}
				});
				
			},
			totalCount: 0,
			tagName: "div",
			runQuery: function(incomingQuery){
				this.model.set("totalPatients",0);

				this.model.spinAll();
				this.render();

				// make a safe deep copy of the incoming query so we don't modify it
				var query = JSON.parse(JSON.stringify(incomingQuery));

				query.resourceUUID = settings.picSureResourceId;
				query.resourceCredentials = {};
				query.query.expectedResultType="COUNT";
				this.model.set("query", query);

				if(this.dataSelection){
					this.dataSelection.updateQuery(query);
					this.dataSelection.render();
				}

				var dataCallback = function(result){
					this.model.set("totalPatients", parseInt(result));
					this.model.set("spinning", false);
					this.model.set("queryRan", true);
					this.render();
				}.bind(this);

				var errorCallback = function(message){
					this.model.set("spinning", false);
	                                        this.model.set("queryRan", true);
	                                        this.render();
					$("#patient-count").html(message);
				}.bind(this);

				$.ajax({
				 	url: window.location.origin + "/picsure/query/sync",
				 	type: 'POST',
				 	headers: {"Authorization": "Bearer " + JSON.parse(sessionStorage.getItem("session")).token},
				 	contentType: 'application/json',
				 	data: JSON.stringify(query),
				 	success: function(response){
				 		dataCallback(response);
				 	},
				 	error: function(response){
						if (response.status === 401) {
							sessionStorage.clear();
							window.location = "/";
						} else {
							response.responseText = "<h4>"
								+"Something went wrong while processing your query, please try again later.  If this repeats, please contact admin."
								+ "</h4>";
					 		errorCallback(response.responseText);//console.log("error");console.log(response);
						}
					}
				});
			},
			render: function(){
				var context = this.model.toJSON();
				this.$el.html(this.template(context));
				if(this.dataSelection){
					this.dataSelection.setElement($("#concept-tree-div",this.$el));
					this.dataSelection.render();
				}
				if(this.model.get("query") && this.model.get("query").query.variantInfoFilters.length > 0){
					_.each(this.model.get("query").query.variantInfoFilters, function(variantHolder){
						if(Object.keys(variantHolder.categoryVariantInfoFilters).length != 0 ||
						   Object.keys(variantHolder.numericVariantInfoFilters).length != 0){
								$("#variant-data-btn").removeClass("hidden");
						   		return false;
						   }
					});
				}
			}
		})
		,
		/*
		 * If you want to replace the entire Backbone.js Model that is used for
		 * the output panel, define it here.
		 */
		modelOverride : BB.Model.extend({
			defaults: outputModelDefaults,
			spinAll: function(){
				this.set('spinning', true);
				this.set('queryRan', false);
			}
		}),
		/*
		 * In case you want to change the update logic, but not the rendering or
		 * anything else, you can define a function that takes an incomingQuery
		 * and dispatches it to the resources you choose, and handles registering
		 * callbacks for the responses and error handling.
		 */
		update: undefined,
		/*
		 * A function that takes two parameters, the first being a PUI, the second
		 * being a picsureInstance such as is configured in settings.json and returns
		 * a PUI that is valid for that picsureInstance.
		 */
		mapPuiForResource: undefined,
		/*
		 * If you want to show your customized error message, please override this
		 */
		outputErrorMessage: undefined
	};
});
