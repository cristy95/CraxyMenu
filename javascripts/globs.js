var siteloc = "http://localhost/CraxyMenu";
var scriptloc = "/script/"

function fetch_items_list()
{
 $.ajax({
	url: siteloc + scriptloc + "getlistcratems.py",
	data:{},
	dataType: 'json',
	success: function(res){
		console.log(res);
		if(res[0][0] != "None")
		{
			table = '<table border="1">';
			for(i=0; i<res.length; i++)
			{
				row = res[i];
				table += "<tr>";
				for(j=0; j<row.length; j++)
				{
					table += "<td>" + row[j] + "</td>";
				}
			table += "</tr>";
			}
		table += "</table>";
		$("#target").html(table);
		}
	}
       });
}
