<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="menu.jsp" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>Registration  Template · Bootstrap v5.0</title>

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
	background-image: url('images/registerbg.jpg');
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
	backdrop-filter: blur(5px);
}
    </style>

    
    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
    
<main class="form-signin">
  <form action="registeraction" method="post">
    <!-- <img class="mb-4" src="assets/brand/bootstrap-logo.svg" alt="" width="72" height="57"> -->
    <h1 class="h3 fw-normal">User Registration Form</h1>

    <div class="form-floating">
      <input type="email" name="email" class="form-control" id="email">
      <label for="floatingInput">Email address</label>
    </div>
    <div class="form-floating">
      <input type="password" name="password" class="form-control" id="password">
      <label for="floatingPassword">Password</label>
    </div>
    <div class="form-floating">
      <input type="text" name="name" class="form-control" id="name">
      <label for="floatingInput">Name</label>
    </div>
    <div class="form-floating">
      <input type="text" name="contractId" class="form-control" id="contractId">
      <label for="floatingInput">Contract Id</label>
    </div>
    
    <div class="form-floating">
      
      <select name="department" class="form-select" id="department">
      <option value="Embedded">Embedded</option>
      <option value="Software">Software</option>
      <option value="All">All</option>
      </select>
      <label for="floatingInput">Department</label>
    </div>
    
    <div class="form-floating">
      
      <select name="role" class="form-select" id="role">
      <option value="Developer">Developer</option>
      <option value="DeptHOD">HOD</option>
      <option value="DevManager">Development Manager</option>
      </select>
      <label for="floatingInput">Role</label>
    </div>
    
    
    <input type="hidden" id="status" name="status" value="Active">

   
    <button class="w-100 btn btn-lg btn-primary" type="submit">Sign up</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2017–2023</p>
  </form>
</main>


    
  </body>
</html>
