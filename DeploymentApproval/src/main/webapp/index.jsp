<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>Signin Template · Bootstrap v5.0</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">

    

    <!-- Bootstrap core CSS -->
<link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
      body {
	background-image: url('images/loginbg.jpg');
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
	backdrop-filter: blur(5px);
}
    </style>
<script>
 function validate(){
	 
	 //alert("in function() validate");
	 
	 email = document.getElementById("email").value;
	 //alert("email::::"+email);
	 
	 password = document.getElementById("password").value;
	 //alert("password::::"+password);
	 
	if(email==""){
		alert("please enter email");
		return false;
	}
	
	if(password==""){
		alert("please enter password");
		return false;
	}
	
	return true 
} 

</script>
    
    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
    
<main class="form-signin">
  <form action="loginaction" method="post" onsubmit="return validate()">
    <!-- <img class="mb-4" src="assets/brand/bootstrap-logo.svg" alt="" width="72" height="57"> -->
    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

    <div class="form-floating">
      <input type="email" name="email" class="form-control" id="email" placeholder="name@example.com">
      <label for="floatingInput">Email address</label>
    </div>
    <div class="form-floating">
      <input type="password" name="password" class="form-control" id="password" placeholder="Password">
      <label for="floatingPassword">Password</label>
    </div>

    <!-- <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div> -->
    <button class="w-100 btn btn-lg btn-success"  type="submit" >Sign in</button>
    <!-- <p class="mt-5 mb-3 text-muted">&copy; 2017–2021</p> -->
  </form>
</main>
<%

if(request.getAttribute("status")!=null){
	String loginstatus = request.getAttribute("status").toString();
	if(loginstatus.equals("failed")){
		%>
		<script>alert("Login Failed")</script>
		<%
	}
	
}
    		  


%>

    
  </body>
</html>
