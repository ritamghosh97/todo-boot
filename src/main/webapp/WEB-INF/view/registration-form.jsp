<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Sign Up - Todo Webapp</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous">
    </head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/todo-app/todos">Todo Webapp</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/showLoginPage">Login</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <br/><br/><br/>

        <div class="container">
            <div class="row col-md-8 offset-md-2">
                <div class="card">
                    <div class="card-header">
                        <h2 class="text-center">Please Sign Up</h2>
                    </div>
                    
                    <div>
                        <c:if test="${param.success != null}">
                            <div class="alert alert-info">
                                You have successfully registered to the todo webapp!
                            </div>
                        </c:if>
                    </div>

                    <div class="card-body">
                        <form:form method="POST" role="form"
                                action="${pageContext.request.contextPath}/register/processRegistrationForm" 
                                modelAttribute="crmUser">

                            <div class="form-group mb-4">
                                <form:label path="userName" cssClass="form-label">Username</form:label>
                                <form:input cssClass="form-control" id="userName" path="userName" placeholder="Enter your username"/>
                                <p>
                                    <form:errors path="userName" cssClass="text-warning"/>
                                </p>
                            </div>

                            <div class="form-group mb-4">
                                <form:label path="password" cssClass="form-label">Password</form:label>
                                <form:password cssClass="form-control" id="password" path="password" placeholder="Enter password"/>
                                
                                <!-- An element to toggle between password visibility -->
                                <div class="mt-1">
                                    <p class="text-muted">
                                        <input type="checkbox" onclick="myFunctionPass()"> Show Password
                                    </p>
                                </div>
                                <p>
                                    <form:errors path="password" cssClass="text-warning"/>
                                </p>
                            </div>

                            <div class="form-group mb-4">
                                <form:label path="confirmPassword" cssClass="form-label">Confirm Password</form:label>
                                <form:password cssClass="form-control" id="confirmPassword" path="confirmPassword" placeholder="Confirm your password"/>
                                
                                <!-- An element to toggle between password visibility -->
                                <div class="mt-1">
                                    <p class="text-muted">
                                        <input type="checkbox" onclick="myFunctionConfPass()"> Show Password
                                    </p>
                                </div>
                                <p>
                                    <form:errors path="confirmPassword" cssClass="text-warning"/>
                                </p>
                            </div>

                            <div class="form-group mb-4">
                                <form:label path="firstName" cssClass="form-label">First Name</form:label>
                                <form:input cssClass="form-control" id="firstName" path="firstName" placeholder="Enter last name"/>      
                                <p>
                                    <form:errors path="firstName" cssClass="text-warning"/>
                                </p>
                            </div>

                            <div class="form-group mb-4">
                                <form:label path="lastName" cssClass="form-label">Last Name</form:label>
                                <form:input cssClass="form-control" id="lastName" path="lastName" placeholder="Enter last name"/>     
                                <p>
                                    <form:errors path="lastName" cssClass="text-warning"/>
                                </p>
                            </div>

                            <div class="form-group mb-4">
                                <form:label path="email" cssClass="form-label">Email</form:label>
                                <form:input cssClass="form-control" id="email" path="email" placeholder="Enter email address"/>
                                <p>
                                    <form:errors path="email" cssClass="text-warning"/>
                                </p>
                            </div>

                            <div class="form-group">
                            <button class="btn btn-primary" type="submit">Sign Up</button>
                                <span class="p-3">Already registered? <a href="${pageContext.request.contextPath}/showLoginPage">Login here</a></span>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
        <script tyoe="text/javascript">
            function myFunctionPass() {
                var x = document.getElementById("password");
                if (x.type === "password") {
                    x.type = "text";
                } else {
                    x.type = "password";
                }
            }
        </script>
        <script tyoe="text/javascript">
            function myFunctionConfPass() {
                var x = document.getElementById("confirmPassword");
                if (x.type === "password") {
                    x.type = "text";
                } else {
                    x.type = "password";
                }
            }
        </script>
    </body>
</html>