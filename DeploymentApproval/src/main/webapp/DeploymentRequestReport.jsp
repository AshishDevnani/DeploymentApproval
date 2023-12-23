<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.List" %>
    <%@page import="springboot.deploy.entities.DeploymentSheet" %>
    <%@include file="menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<!-- <link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="assets/dist/js/bootstrap.bundle.min.js"></script> -->

<link rel="stylesheet" href="DataTables/Buttons-2.4.2/css/buttons.dataTables.min.css">
<link rel="stylesheet" href="DataTables/Buttons-2.4.2/css/buttons.bootstrap5.min.css">
<link rel="stylesheet" href="DataTables/Buttons-2.4.2/css/buttons.jqueryui.min.css">
<link rel="stylesheet" href="DataTables/DataTables-1.13.8/css/dataTables.bootstrap.min.css">

<!-- <script src="DataTables/DataTables-1.13.8/js/dataTables.bootstrap.min.js"></script> -->
<script src="DataTables/datatables.min.js"></script>
<script src="DataTables/Buttons-2.4.2/js/dataTables.buttons.min.js"></script>
<script src="DataTables/Buttons-2.4.2/js/buttons.html5.min.js"></script>
<script src="DataTables/Buttons-2.4.2/js/buttons.print.min.js"></script>
<script src="DataTables/JSZip-3.10.1/jszip.min.js"></script>
<script src="DataTables/pdfmake-0.2.7/pdfmake.min.js"></script>
<script src="DataTables/pdfmake-0.2.7/vfs_fonts.js"></script>
<!-- <style>
td{
border: 1px solid black;
}
th{
border: 1px solid black;
}
</style> -->
<script>
function validate(){
	var chkf="";
 	var chkt="";
 	var objFromDate = document.getElementById("fromDate").value;
 	
 	
 	var fdate=objFromDate.split("-");
 	if(fdate[1]=="Jan")
 	{
 		chkf="01";
 	}
 	if(fdate[1]=="Feb")
 	{
 		chkf="02";
 	}
 	if(fdate[1]=="Mar")
 	{
 		chkf="03";
 	}
 	if(fdate[1]=="Apr")
 	{
 		chkf="04";
 	}
 	if(fdate[1]=="May")
 	{
 		chkf="05";
 	}
 	if(fdate[1]=="Jun")
 	{
 		chkf="06";
 	}
 	if(fdate[1]=="Jul")
 	{
 		chkf="07";
 	}
 	if(fdate[1]=="Aug")
 	{
 		chkf="08";
 	}
 	if(fdate[1]=="Sep")
 	{
 		chkf="09";
 	}
 	if(fdate[1]=="Oct")
 	{
 		chkf="10";
 	}
 	if(fdate[1]=="Nov")
 	{
 		chkf="11";
 	}
 	if(fdate[1]=="Dec")
 	{
 		chkf="12";
 	}
 	var objFromDate1=""+fdate[2]+"-"+chkf+"-"+fdate[0]+"";
     var objToDate = document.getElementById("toDate").value;
     var tdate=objToDate.split("-");
     if(tdate[1]=="Jan")
 	{
     	chkt="01";
 	}
 	if(tdate[1]=="Feb")
 	{
 		chkt="02";
 	}
 	if(tdate[1]=="Mar")
 	{
 		chkt="03";
 	}
 	if(tdate[1]=="Apr")
 	{
 		chkt="04";
 	}
 	if(tdate[1]=="May")
 	{
 		chkt="05";
 	}
 	if(tdate[1]=="Jun")
 	{
 		chkt="06";
 	}
 	if(tdate[1]=="Jul")
 	{
 		chkt="07";
 	}
 	if(tdate[1]=="Aug")
 	{
 		chkt="08";
 	}
 	if(tdate[1]=="Sep")
 	{
 		chkt="09";
 	}
 	if(tdate[1]=="Oct")
 	{
 		chkt="10";
 	}
 	if(tdate[1]=="Nov")
 	{
 		chkt="11";
 	}
 	if(tdate[1]=="Dec")
 	{
 		chkt="12";
 	}
     var objToDate1=""+tdate[2]+"-"+chkt+"-"+tdate[0]+"";
    // alert("Entry from date > "+objFromDate1+" Todate > "+objToDate1);
      
     var date1 = new Date(objFromDate1);
     var date2 = new Date(objToDate1);
     
     //alert("from > "+date1+" Todate > "+date2);
     
     var date3 = new Date();
     var date4 = date3.getMonth() + "-" + date3.getDay() + "-" + date3.getYear();
     var currentDate = new Date(date4);
      
         if(date1 > date2)
         {
             alert("From Date Should be Less Than To Date");
             return false; 
         }
         return true;
}
</script>
</head>

<body>
<h3 align="center">Deployment Request Report</h3><br>
<%
String datex1 = request.getAttribute("fromDate").toString();
String datex2 = request.getAttribute("toDate").toString();

String role = session.getAttribute("role").toString();
System.out.println("role:"+role);

String name = session.getAttribute("name").toString();
System.out.println("name:"+name);
%>
<form action="requestreport" method="get" onsubmit="return validate()">
<div class="row col-12">
<div class="col-md-3"></div>
<div class="col-md-3">
 <label>From Date</label>
 <input type="text" class="form-control" id="fromDate" name="fromDate" value="<%=datex1%>">
 <script>

						$(document).ready(function() {
							$( function() {
   				 $( "#fromDate" ).datepicker({
		    dateFormat: 'dd-M-yy',
			changeMonth: true,
            changeYear: true
	});
  } );
				
});

				   </script>
</div>
<div class="col-md-3">
 <label>To Date</label>
 <input type="text" class="form-control" id="toDate" name="toDate" value="<%=datex2%>">
 <script>

						$(document).ready(function() {
							$( function() {
   				 $( "#toDate" ).datepicker({
		    dateFormat: 'dd-M-yy',
			changeMonth: true,
            changeYear: true
	});
  } );
				
});

				   </script>
</div>
<div class="col-md-3">
 <input type="submit" class="btn btn-primary" style="margin-top: 20px;" name="submit" value="submit">
</div>

</div>
</form>
<br>
<table width="100%" id="example" class="table table-bordered table-striped">
<thead>
<tr>
<th>Sr.</th>
<th>Page Name</th>
<th>Requirement</th>
<th>Changes</th>
<th>Developer</th>
<th>Tester</th>
<th>Project</th>
<th>Server IP</th>
<th>Path</th>
<th>Commit ID</th>
<th>Parent ID</th>
<th>Status</th>
<% if(role.equals("DeptHOD") || role.equals("DevManager")){ %>
<th>Action</th>
<% } %>
</tr>
</thead>
<tbody>
<%
List<DeploymentSheet> list = (List<DeploymentSheet>)request.getAttribute("requestlist");

int sr = 1;
for(DeploymentSheet deployment : list){
/*	System.out.println("sr:"+sr);
	System.out.println("page name:"+deployment.getPageName());
	System.out.println("developer:"+deployment.getDeveloper());
	System.out.println("tester:"+deployment.getTester());
	System.out.println("project:"+deployment.getProjectname());
	System.out.println("ip:"+deployment.getServerIP());
	System.out.println("path:"+deployment.getPath());
	System.out.println("commit id:"+deployment.getCommitId());
	System.out.println("parent id:"+deployment.getParentId());
	System.out.println("status:"+deployment.getStatus());*/
	%>
	<tr>
	<td><%=sr%></td>
	<td><%=deployment.getPageName()%></td>
	<td><%=deployment.getRequirement()%></td>
	<td><%=deployment.getChanges()%></td>
	<td><%=deployment.getDeveloper()%></td>
	<td><%=deployment.getTester()%></td>
	<td><%=deployment.getProjectname()%></td>
	<td><%=deployment.getServerIP()%></td>
	<td><%=deployment.getPath()%></td>
	<td><%=deployment.getCommitId()%></td>
	<td><%=deployment.getParentId()%></td>
	<td><%=deployment.getStatus()%></td>
<% if(role.equals("DeptHOD") || role.equals("DevManager")){ %>	
	<td><a href="depappr?action=Approved&id=<%=deployment.getId()%>&fdate=<%=datex1%>&tdate=<%=datex2%>&actionby=<%=name%>"><button type="button" class="btn btn-success">Approve</button></a>
	    <a href="depappr?action=Rejected&id=<%=deployment.getId()%>&fdate=<%=datex1%>&tdate=<%=datex2%>&actionby=<%=name%>"><button type="button" class="btn btn-danger">Reject</button></a>
	</td>
	<% } %>
	</tr>
	<%
	sr++;
}
%>
</tbody>
<tfoot>
<tr>
<th>Sr.</th>
<th>Page Name</th>
<th>Requirement</th>
<th>Changes</th>
<th>Developer</th>
<th>Tester</th>
<th>Project</th>
<th>Server IP</th>
<th>Path</th>
<th>Commit ID</th>
<th>Parent ID</th>
<th>Status</th>
<% if(role.equals("DeptHOD") || role.equals("DevManager")){ %>
<th>Action</th>
<% } %>
</tr>
</tfoot>
</table>
<script>
$(document).ready(function() {
    $('#example').DataTable( {
        dom: 'Bfrti',
        buttons: [
            { 
             extend: 'collection',
             text: 'Export',
             
        buttons: [
            {
                extend: 'print',
                text: 'Print',
                className: 'dropdown-item',
				title: 'Deployment Request Report',
                exportOptions: { columns: [0,1,2,3,4,5,6,7,8,9,10,11] }
            },
            {
                extend: 'csv',
                text: 'Csv',
                className: 'dropdown-item',
				title: 'Deployment Request Report',
                exportOptions: { columns: [0,1,2,3,4,5,6,7,8,9,10,11] }
            },
            {
                extend: 'excel',
                text: 'Excel',
                className: 'dropdown-item',
				title: 'Deployment Request Report',
                exportOptions: { columns: [0,1,2,3,4,5,6,7,8,9,10,11] }
            },
            {
                extend:'pdf',
                text: 'Pdf',
                orientation: 'landscape',
                pageSize: 'A3',
                className: 'dropdown-item',
				title: 'Deployment Request Report',
                exportOptions: { columns: [0,1,2,3,4,5,6,7,8,9,10,11] }
            },
            {
                extend: 'copy',
                text: 'Copy',
                className: 'dropdown-item',
				title: 'Deployment Request Report',
                exportOptions: { columns: [0,1,2,3,4,5,6,7,8,9,10,11] }
            },
           
        ]
        
        },
        'colvis',
        'pageLength'
      ],
      
      
     
   	   
      
    } );
    
   /*  $('#example').addClass('table-responsive'); */
    
} );

   jQuery.extend( jQuery.fn.dataTableExt.oSort, {
	 "date-uk-pre": function ( a ) {
	    var ukDatea = a.split('/');
	    return (ukDatea[2] + ukDatea[1] + ukDatea[0]) * 1;
	 },

	 "date-uk-asc": function ( a, b ) {
	    return ((a < b) ? -1 : ((a > b) ? 1 : 0));
	 },

	 "date-uk-desc": function ( a, b ) {
	    return ((a < b) ? 1 : ((a > b) ? -1 : 0));
	 }



} );
</script>
</body>
</html>