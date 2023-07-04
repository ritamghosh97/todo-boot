<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Please Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous">
    </head>
    
    <body>
		<!-- Header -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/todo-app/todos">Todo Webapp</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>
        </nav>

        <br /><br />

        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">

                    <!-- Place for messages: error, alert etc ... -->

                    <!-- Check for login error --> 
                    <!-- Spring security automatically append 'error' parameter to login url, if any error is there -->
                    <!-- http://localhost:8080/showLoginPage?error -->
                    <c:if test="${param.error != null}">
                        <div class="alert alert-danger">
                            Invalid Username or Password
                        </div>
                    </c:if>

                    <!-- Check for logout -->'
                    <!-- Spring security automatically append 'logout' parameter to login url, if any error is there -->
                    <!-- http://localhost:8080/showLoginPage?logout -->
                    <c:if test="${param.logout != null}">
                        <div class="alert alert-success"> 
                            You have been logged out.
                        </div>
                    </c:if>


                    <div class="card">

                        <div class="card-header">
                            <h2 class="text-center"> Please Sign In</h2>
                        </div>

                        <div class="card-body">
                            <form method="POST" role="form" action="${pageContext.request.contextPath}/authenticateTheUser" class="form-horizontal">
                                
                                <!-- Username -->
                                <div class="form-group mb-3">
                                    <label class="control-label"> Username</label>
                                    <input type="text" id="username" name="username" 
                                            class="form-control" placeholder="Enter your username"/>
                                </div>

                                <!-- Password -->
                                <div class="form-group mb-3">
                                    <label class="control-label"> Password</label>
                                    <input type="password" id="password" name="password" 
                                            class="form-control" placeholder="Enter your password"/>
                                </div>

                                <!-- Login/Submit Button along with sign up link-->
                                <div class="form-group mb-3">
                                    <button type="submit" class="btn btn-primary" >Login</button>
                                    <span class="p-3"> Don't have an account?
                                        <a href="${pageContext.request.contextPath}/register/showRegistrationForm">Sign up</a>
                                    </span>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>           
        </div>       
    </body>
</html>