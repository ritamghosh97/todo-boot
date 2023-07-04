<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Manage your Todos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
        <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    </head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" th:href="${pageContext.request.contextPath}/todo-app/todos">Todo Webapp</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" 
                            href="${pageContext.request.contextPath}/todo-app/todos">Home</a></li>
                        <li class="nav-item"><a class="nav-link" 
                            href="${pageContext.request.contextPath}/todo-app/todos">Todos</a></li>
                    </ul>
                </div>
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
                </ul>
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

                            <form:hidden path="id"/>

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
                uiLibrary: 'bootstrap5',
                format: 'dd-mmm-yyyy'
            });
        </script>
    </body>
</html>