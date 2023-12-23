<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="menu.jsp" %>
    <%@page import="springboot.deploy.entities.Project" %>
    <%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script> -->

<link rel="stylesheet" href="DataTables/Buttons-2.4.2/css/buttons.dataTables.min.css">
<link rel="stylesheet" href="DataTables/Buttons-2.4.2/css/buttons.bootstrap5.min.css">
<link rel="stylesheet" href="DataTables/Buttons-2.4.2/css/buttons.jqueryui.min.css">
<link rel="stylesheet" href="DataTables/DataTables-1.13.8/css/dataTables.bootstrap.min.css">
<link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- <script src="DataTables/DataTables-1.13.8/js/dataTables.bootstrap.min.js"></script> -->
<script src="DataTables/datatables.min.js"></script>
<script src="DataTables/Buttons-2.4.2/js/dataTables.buttons.min.js"></script>
<script src="DataTables/Buttons-2.4.2/js/buttons.html5.min.js"></script>
<script src="DataTables/Buttons-2.4.2/js/buttons.print.min.js"></script>
<script src="DataTables/JSZip-3.10.1/jszip.min.js"></script>
<script src="DataTables/pdfmake-0.2.7/pdfmake.min.js"></script>
<script src="DataTables/pdfmake-0.2.7/vfs_fonts.js"></script>


</head>
<body>
<h3 align="center">Project Master Report</h3>
<%
String currentName="";
String currentRole="";
String department="";
String addProjectStatus="";
String updateProjectStatus="";

System.out.println("session max inactive interval:"+session.getMaxInactiveInterval());
System.out.println("session creation time:"+session.getCreationTime() );
System.out.println("session creation time:"+new java.util.Date().getTime());





	
	currentName = session.getAttribute("name").toString();
	currentRole = session.getAttribute("role").toString();
	department = session.getAttribute("dept").toString();
	
	if(request.getAttribute("addstatus")!=null)
	{
	
	addProjectStatus = request.getAttribute("addstatus").toString();

	System.out.println("Session Name:"+currentName+" Session Role:"+currentRole);
	
	if(addProjectStatus.equals("successful")){
	%>
	<script>
	  alert("Project Added Successfully")
	</script>
	
	<%
	}else{
		%>
		<script>
		 alert("Some Error Has Occured in Adding Project")
		</script>
		<%
	}
	}
	
	if(request.getAttribute("updtstatus")!=null){
		
		updateProjectStatus = request.getAttribute("updtstatus").toString();
		
		if(updateProjectStatus.equals("successful")){
			%>
			<script>
			   alert("Project Updated Successfully");
			</script>
			<%
		}else{  
		%>
			<script>
			
			alert("Some Error Occurred in Update");
			</script>
	
	   <%  
	   }
		
	}
	


	if(request.getAttribute("projects")!=null){
		
	
	   List<Project> projects = (List<Project>)request.getAttribute("projects");
	
	   System.out.println(projects);
%>	   
	  <table style="width:100%" id="example" class="table table-bordered table-striped">
	  <thead>
	  <tr>
	  <th>Sr.</th>
	  <th>Project</th>
	  <th>Server IP</th>
	  <th>Deployment Path</th>
	  <th>Department</th>
	  <% if(currentRole.equals("DevManager")) { %>
	  <th>Action</th>
	  <% } %>
	  </tr>
	  </thead>
	  <tbody>
	  <%
	  int sr = 1;
	  for(Project project : projects){
		  %>
		  <tr>
		  <td align="right"><%=sr++%></td>
		  <td><%=project.getProjectName() %></td>
		  <td><%=project.getServerIP() %></td>
		  <td><%=project.getDeploymentPath() %></td>
		  <td><%=project.getDepartment() %>
		  
		  <% if(currentRole.equals("DevManager")) { %>
		  <td>
		    <a data-toggle="modal" data-bs-toggle="modal"  data-bs-target="#MyModal" href="#MyModal" onclick="return demo('<%=project.getId()%>','<%=project.getProjectName()%>','<%=project.getServerIP()%>','<%=project.getDeploymentPath()%>')">Edit</a>
		 </td>
		<% } %>
		  </tr>
		  <%
	  }
	  %>
	  </tbody>
	  <tfoot>
	  <tr>
	  <th>Sr.</th>
	  <th>Project</th>
	  <th>Server IP</th>
	  <th>Deployment Path</th>
	  <th>Department</th>
	  
	  <% if(currentRole.equals("DevManager")) { %>
	  <th>Action</th>
	  <% } %>
	  </tr>
	  </tfoot>
	  
	  </table>
	   
<%			
	}else{
		response.sendRedirect("home.jsp");
	}
%>

<div class="modal fade" id="MyModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				 <form name="entryform"  class="form" action="projectupdate" method="POST">
				<div class="modal-header">
					<h5 class="modal-title" id="MyModal">Update Project Details </h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
				<div class="row mb-2">
						  <div class="col-md-2">
						  <label for="basicSelect">Project:</label>
							<div class="input-group input-group-merge">
							<input class="form-control" type="text" name="project" id="project" value="">
						    </div>
						 </div>
						
                    <div class="col-md-6">
							<label for="basicSelect">Deployment Path: </label>
							<div class="input-group input-group-merge">
							<input class="form-control" type="text" name="deppath" id="deppath" value="">	
						   </div>
						</div>
                         <div class="col-2">
							<label>Server IP</label> 
							<input class="form-control" type="text" name="serverip" id="serverip" value=""  />
						</div> 
                     </div>	
					<input type="hidden" name="projectId" id="projectId" readonly>
					 
                 
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">Save changes</button>
				</div>
				</form>
			</div>
		</div>
	</div>
<script>
function demo(projectid,name,ip,path){
	//alert("in demo");
	document.getElementById('projectId').value = projectid;
	document.getElementById('project').value = name;
	document.getElementById('deppath').value = path;
	document.getElementById('serverip').value = ip;
	
	//alert("serviceId:"+document.getElementById('serviceId').value);
	return true;
}
</script>
<script>
$(document).ready(function() {
    $('#example').DataTable( {
        dom: 'Bfrtip',
        buttons: [
            { 
             extend: 'collection',
             text: 'Export',
             
        buttons: [
            {
                extend: 'print',
                text: 'Print',
                className: 'dropdown-item',
				title: 'All Project Report',
                exportOptions: { columns: [0,1,2,3,4] }
            },
            {
                extend: 'csv',
                text: 'Csv',
                className: 'dropdown-item',
				title: 'All Project Report',
                exportOptions: { columns: [0,1,2,3,4] }
            },
            {
                extend: 'excel',
                text: 'Excel',
                className: 'dropdown-item',
				title: 'All Project Report',
                exportOptions: { columns: [0,1,2,3,4] }
            },
            {
                extend:'pdf',
                text: 'Pdf',
                orientation: 'landscape',
                pageSize: 'A3',
                className: 'dropdown-item',
				title: 'All Project Report',
                exportOptions: { columns: [0,1,2,3,4] }
            },
            {
                extend: 'copy',
                text: 'Copy',
                className: 'dropdown-item',
				title: 'All Project Report',
                exportOptions: { columns: [0,1,2,3,4] }
            },
           
        ]
        
        },
        'colvis',
        'pageLength'
      ],
      
      
     
   	   
      
    } );
    
     $('#example').addClass('table-responsive'); 
    
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