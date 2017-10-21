/* Set the defaults for DataTables initialisation */
$.extend( true, $.fn.dataTable.defaults, {
	"sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
	"sPaginationType": "bootstrap",
	"oLanguage": {
		"sLengthMenu": "_MENU_ records per page"
	}
} );


/* Default class modification */
$.extend( $.fn.dataTableExt.oStdClasses, {
	"sWrapper": "dataTables_wrapper form-inline"
} );


/* API method to get paging information */
$.fn.dataTableExt.oApi.fnPagingInfo = function ( oSettings )
{
	return {
		"iStart":         oSettings._iDisplayStart,
		"iEnd":           oSettings.fnDisplayEnd(),
		"iLength":        oSettings._iDisplayLength,
		"iTotal":         oSettings.fnRecordsTotal(),
		"iFilteredTotal": oSettings.fnRecordsDisplay(),
		"iPage":          Math.ceil( oSettings._iDisplayStart / oSettings._iDisplayLength ),
		"iTotalPages":    Math.ceil( oSettings.fnRecordsDisplay() / oSettings._iDisplayLength )
	};
};



/* Bootstrap style pagination control */
$.extend( $.fn.dataTableExt.oPagination, {
	"bootstrap": {
		"fnInit": function( oSettings, nPaging, fnDraw ) {
			var oLang = oSettings.oLanguage.oPaginate;
			var fnClickHandler = function ( e ) {
				e.preventDefault();
				if ( oSettings.oApi._fnPageChange(oSettings, e.data.action) ) {
					fnDraw( oSettings );
				}
			};

			$(nPaging).addClass('pagination').append(
				'<ul>'+
					'<li class="prev disabled"><a href="#">&larr; '+oLang.sPrevious+'</a></li>'+
					'<li class="next disabled"><a href="#">'+oLang.sNext+' &rarr; </a></li>'+
				'</ul>'
			);
			var els = $('a', nPaging);
			$(els[0]).bind( 'click.DT', { action: "previous" }, fnClickHandler );
			$(els[1]).bind( 'click.DT', { action: "next" }, fnClickHandler );
		},

		"fnUpdate": function ( oSettings, fnDraw ) {
			var iListLength = 5;
			var oPaging = oSettings.oInstance.fnPagingInfo();
			var an = oSettings.aanFeatures.p;
			var i, j, sClass, iStart, iEnd, iHalf=Math.floor(iListLength/2);

			if ( oPaging.iTotalPages < iListLength) {
				iStart = 1;
				iEnd = oPaging.iTotalPages;
			}
			else if ( oPaging.iPage <= iHalf ) {
				iStart = 1;
				iEnd = iListLength;
			} else if ( oPaging.iPage >= (oPaging.iTotalPages-iHalf) ) {
				iStart = oPaging.iTotalPages - iListLength + 1;
				iEnd = oPaging.iTotalPages;
			} else {
				iStart = oPaging.iPage - iHalf + 1;
				iEnd = iStart + iListLength - 1;
			}

			for ( i=0, iLen=an.length ; i<iLen ; i++ ) {
				// Remove the middle elements
				$('li:gt(0)', an[i]).filter(':not(:last)').remove();

				// Add the new list items and their event handlers
				for ( j=iStart ; j<=iEnd ; j++ ) {
					sClass = (j==oPaging.iPage+1) ? 'class="active"' : '';
					$('<li '+sClass+'><a href="#">'+j+'</a></li>')
						.insertBefore( $('li:last', an[i])[0] )
						.bind('click', function (e) {
							e.preventDefault();
							oSettings._iDisplayStart = (parseInt($('a', this).text(),10)-1) * oPaging.iLength;
							fnDraw( oSettings );
						} );
				}

				// Add / remove disabled classes from the static elements
				if ( oPaging.iPage === 0 ) {
					$('li:first', an[i]).addClass('disabled');
				} else {
					$('li:first', an[i]).removeClass('disabled');
				}

				if ( oPaging.iPage === oPaging.iTotalPages-1 || oPaging.iTotalPages === 0 ) {
					$('li:last', an[i]).addClass('disabled');
				} else {
					$('li:last', an[i]).removeClass('disabled');
				}
			}
		}
	}
} );


/*
 * TableTools Bootstrap compatibility
 * Required TableTools 2.1+
 */
if ( $.fn.DataTable.TableTools ) {
	// Set the classes that TableTools uses to something suitable for Bootstrap
	$.extend( true, $.fn.DataTable.TableTools.classes, {
		"container": "DTTT btn-group",
		"buttons": {
			"normal": "btn",
			"disabled": "disabled"
		},
		"collection": {
			"container": "DTTT_dropdown dropdown-menu",
			"buttons": {
				"normal": "",
				"disabled": "disabled"
			}
		},
		"print": {
			"info": "DTTT_print_info modal"
		},
		"select": {
			"row": "active"
		}
	} );

	// Have the collection use a bootstrap compatible dropdown
	$.extend( true, $.fn.DataTable.TableTools.DEFAULTS.oTags, {
		"collection": {
			"container": "ul",
			"button": "li",
			"liner": "a"
		}
	} );
}

var table;
/* Table initialisation */
$(document).ready(function() {
	table=$('#queueTable').dataTable( {
		"sDom": "<'row'<'span6'><'span6'>r>t<'row'<'span4'i><'span8'p>>",
		"sPaginationType": "bootstrap",
		"bPaginate": true,
        "bLengthChange": false,
        "bFilter": true,
        "bSort": true,
        "bInfo": true,
        "bProcessing": false,
        "bServerSide": false,
        "sAjaxSource": "queue/getLatest",
		"aoColumns": [
		                { "sClass": "center", "sTitle": "ID" },
		                { "sClass": "center", "sTitle": "Description" },
		                { "sClass": "center", "sTitle": "Started" },
		                { "sClass": "center", "sTitle": "Status <a id=\"statusFilter\">(Filter)</a>" },
		                { "sClass": "center", "sTitle": "Duration" },		          
		            ],
		            "aoColumnDefs": [
		                           { "bSortable": false, "aTargets": [ 3 ]}
		                         ],
		"oLanguage": {
			"sLengthMenu": "_MENU_ records per page"
		},		          
		"fnInitComplete": function ( oSettings )
		{
		    for ( var i=0, iLen=oSettings.aoData.length ; i<iLen ; i++ )
		    {
		        oSettings.aoData[i].nTr.className += " row"+i%2;
		    }
		}
		
	} );
	
	table.fnSort( [ [0,'desc'] ] );
	table.fnReloadAjax(table.fnSettings());
	$('#searchBox').on('keyup change', function(){
		  console.log($(this).val());
		  table.fnFilter($(this).val());
	});
	$('#statusFilter').on('click', function() {
		//alert("click")
		$('#filterModal').modal('show');
	});
	
	$("input[name='statusFilter']").click(function() {
	    console.log(this.value)
	    table.fnFilter(this.value);
	});
	
	$("#clearFilter").click(function() {
		$('input[name=statusFilter]').attr('checked',false);
		$('#filterModal').modal('hide');
		table.fnFilter("");		
	});
	
	setInterval(function(){table.fnReloadAjax(table.fnSettings());}, 45000); 
	}
);

function reloadTable(){
	table.fnReloadAjax(table.fnSettings());
}
$.fn.dataTableExt.oApi.fnReloadAjax = function(oSettings)
{
//oSettings.sAjaxSource = sNewSource;
this.fnClearTable(this);
this.oApi._fnProcessingDisplay(oSettings, true );
var that = this;

$.getJSON(oSettings.sAjaxSource, null, function(json){
	/* Got the data - add it to the table */
	for (var i=0; i<json.length; i++)
	{
	that.oApi._fnAddData(oSettings, json[i]);
	}
	
	oSettings.aiDisplay = oSettings.aiDisplayMaster.slice();
	that.fnDraw(that);
	that.oApi._fnProcessingDisplay(oSettings, false);
});
}





