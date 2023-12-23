<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="springboot.deploy.entities.User" %>
    <%@page import="java.util.List" %>
    <%@include file="menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery and jQuery UI -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

    <!-- DataTables and Buttons -->
    <link rel="stylesheet" href="DataTables/Buttons-2.4.2/css/buttons.dataTables.min.css">
    <link rel="stylesheet" href="DataTables/Buttons-2.4.2/css/buttons.bootstrap5.min.css">
    <link rel="stylesheet" href="DataTables/Buttons-2.4.2/css/buttons.jqueryui.min.css">
    <link rel="stylesheet" href="DataTables/DataTables-1.13.8/css/dataTables.bootstrap.min.css">
    <script src="DataTables/datatables.min.js"></script>
    <script src="DataTables/Buttons-2.4.2/js/dataTables.buttons.min.js"></script>
    <!-- Include other DataTables and Buttons scripts -->

    <!-- Bootstrap CSS -->
    <link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%
String currentRole = session.getAttribute("role").toString();

 if(request.getAttribute("updtuserstatus")!=null){
	String updatestatus = request.getAttribute("updtuserstatus").toString();

	if(updatestatus.equals("successful")){
		%>
		<script>
		alert("User detail updated successfully")
		</script>
		<%
	}else{
		%>
		<script>
		alert("Some error occurred in user update")
		</script>
		<%
	}




 } 
 
 if(request.getAttribute("createstatus")!=null){
	 
	 boolean create = (boolean)request.getAttribute("createstatus");
	 
	 if(create==true){
		 %>
		<script>
		alert("user created successfully");
		</script>
		 <%
	 }else{
		 %>
		 <script>
		alert("some error occurred in user creation");
		</script>
	  <%
	 }
	 
 }
 
 %>

<h3 align="center">User Master Report</h3>
<% 
  if(request.getAttribute("users")!=null){
		
	
	   List<User> users = (List<User>)request.getAttribute("users");
	%>
	<table id="example" width="100%" class="table table-bordered table-striped">
	<thead>
	<tr>
	<th>Sr</th>
	<th>Contract ID</th>
	<th>Name</th>
	<th>Role</th>
	<th>Department</th>
	<th>Active Status</th>
	<% if(currentRole.equals("DevManager")) { %>
	<th>Action</th>
	<% } %>
	</tr>
	</thead>
	<tbody>
	<%
	int counter = 1;
	for(User user : users){
		%>
		<tr>
		<td align="right"><%=counter++ %></td>
		<td><%=user.getContractId() %></td>
		<td><%=user.getName()%></td>
		<td><%=user.getRole() %></td>
		<td><%=user.getDepartment() %></td>
		<td><%=user.getStatus() %></td>
		  <% if(currentRole.equals("DevManager")) { %>
		  <td>
		    <a data-toggle="modal" data-bs-toggle="modal"  data-bs-target="#MyModal" href="#MyModal" onclick="return demo('<%=user.getContractId()%>','<%=user.getName()%>','<%=user.getRole()%>','<%=user.getDepartment()%>','<%=user.getStatus()%>','<%=user.getEmail()%>')">Edit</a>
		 </td>
		<% } %>
		
		</tr>
		<%
	}
	
	%>
	</tbody>
<tfoot>
   <tr>
	<th>Sr</th>
	<th>Contract ID</th>
	<th>Name</th>
	<th>Role</th>
	<th>Department</th>
	<th>Active Status</th>
	<% if(currentRole.equals("DevManager")) { %>
	<th>Action</th>
	<% } %>
	</tr>
</tfoot>	
	
	</table>   
	   
	   
 <% }%>
  
 <div class="modal fade" id="MyModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				 <form name="entryform"  class="form" action="userupdate" method="POST">
				<div class="modal-header">
					<h5 class="modal-title" id="MyModal">Update User Details </h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
				<div class="row mb-2">
						  <div class="col-md-2">
						  <label for="basicSelect">Contract ID:</label>
							<div class="input-group input-group-merge">
							<input class="form-control" type="text" name="contractid" id="contractid" value="" readonly>
						    </div>
						 </div>
						
                    <div class="col-md-6">
							<label for="basicSelect">Name: </label>
							<div class="input-group input-group-merge">
							<input class="form-control" type="text" name="name" id="name" value="">	
						   </div>
						</div>
                         <div class="col-2">
							<label>Role:<span id="rolelabel" style="font-color:#008000"></span> </label>
							<select class="form-select" id="role" name="role">
							<option value='Developer'>Developer</option>
							<option value='DeptHOD'>Department HOD</option>
							<option value='DevManager'>Development Manager</option>
							</select>
						</div> 
                     </div>	
					<div class="row mb-2">
					  <div class="col-2">
							<label>Department:<span id="departmentlabel" style="font-color:#008000"></span></label> 
							<select class="form-select" id="department" name="department">
							<option value='Software'>Software</option>
							<option value='Embedded'>Embedded</option>
							<option value='All'>All</option>
							</select>
					  </div>
					  <div class="col-md-6">
							<label for="basicSelect">Email: </label>
							<div class="input-group input-group-merge">
							<input class="form-control" type="email" name="email" id="email" value="">	
						   </div>
						</div> 
					   <div class="col-2">
					   <label>Status:<span id="statuslabel" style="font-color:#008000"></span></label>
					   <select class="form-select" id="status" name="status">
							<option value='Active'>Active</option>
							<option value='DeActive'>DeActive</option>
							</select>
					   </div>
					</div>
                 
				</div>
				<div class="modal-footer center">
					<button type="submit" class="btn btn-primary">Save changes</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	
	<script src="DataTables/Buttons-2.4.2/js/buttons.html5.min.js"></script>
    <script src="DataTables/Buttons-2.4.2/js/buttons.print.min.js"></script>
    <script src="DataTables/JSZip-3.10.1/jszip.min.js"></script>
    <script src="DataTables/pdfmake-0.2.7/pdfmake.min.js"></script>
    <script src="DataTables/pdfmake-0.2.7/vfs_fonts.js"></script>
	
<script>
function demo(contractid,name,role,department,status,email){
	//alert("in demo "+contractid+" "+name+" "+role+" "+department+" "+status+" "+email);
	//String roledropdown = "<option value='"+role+"' selected >"+role+"</option>";
	//String deptdropdown = "<option value='"+department+"' selected >"+department+"</option>";
	
	document.getElementById('contractid').value = contractid;
	
	document.getElementById('name').value = name;
	
	document.getElementById('email').value = email;
	
	document.getElementById('rolelabel').innerHTML = role;
	
	document.getElementById('departmentlabel').innerHTML = department;
	
	document.getElementById('statuslabel').innerHTML = status;
	
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
				title: 'User Master Report',
                exportOptions: { columns: [0,1,2,3,4] }
            },
            {
                extend: 'csv',
                text: 'Csv',
                className: 'dropdown-item',
				title: 'User Master Report',
                exportOptions: { columns: [0,1,2,3,4] }
            },
            {
                extend: 'excel',
                text: 'Excel',
                className: 'dropdown-item',
				title: 'User Master Report',
                exportOptions: { columns: [0,1,2,3,4,5] }
            },
            {
                extend:'pdf',
                text: 'Pdf',
                orientation: 'landscape',
                pageSize: 'A3',
                className: 'dropdown-item',
				title: 'User Master Report',
                exportOptions: { columns: [0,1,2,3,4,5] }
            },
            {
                extend: 'copy',
                text: 'Copy',
                className: 'dropdown-item',
				title: 'User Master Report',
                exportOptions: { columns: [0,1,2,3,4,5] }
            },
           
        ]
        
        },
        'colvis',
        'pageLength'
      ],
      
      
     
   	   
      
    } );
    
    
    
} );

//$('#example').addClass('table-responsive'); 
</script> 
</body>
</html>