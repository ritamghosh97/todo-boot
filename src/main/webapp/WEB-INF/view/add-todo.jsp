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
        <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
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
                        <h2 class="text-center">Enter Todo Details</h2>
                    </div>

                    <div class="card-body">
                        <form:form method="POST" role="form" modelAttribute="todo">

                            <div class="form-group mb-4">
                                <form:label path="description" cssClass="form-label">Description</form:label>
                                <form:input id="desc" path="description" cssClass="form-control" aria-describedby="descError" required="required"/>
                                <p>
                                    <form:errors path="description" cssClass="text-warning"/>
                                </p>
                            </div>

                            <div class="form-group mb-4">
                                <form:label path="targetDate" cssClass="form-label">Target Date</form:label>
                                <form:input id="tarDt" path="targetDate" cssClass="form-control" aria-describedby="tarDtError" required="required"/>
                                <p>
                                    <form:errors path="targetDate" cssClass="text-warning"/>
                                </p>
                            </div>

                            <div class="form-group">
                                <button class="btn btn-primary" type="submit">Add/Update</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $('#tarDt').datepicker({
                format: 'yyyy-mm-dd'
            });
        </script>
    </body>
</html>