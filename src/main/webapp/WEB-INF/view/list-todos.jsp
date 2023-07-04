<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Your Todo List</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous">
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
        
        <div class="container">
            <div class="row col-md-10 mt-3 mb-3">
                <h1>Manage Your Todos</h1>
            </div>
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>Description</th>
                        <th>Target Date</th>
                        <th>Is Done?</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="todo" items="${todos}">
                        <tr>
                            <td>${todo.description}</td>
                            <td>${todo.targetDate}</td>
                            <td>${todo.isDone}</td>
                            <td><a href="${pageContext.request.contextPath}/todo-app/delete-todo?id=${todo.id}" class="btn btn-warning" onclick="return confirm('Are you sure, you want to delete?');">Delete</a></td>
                            <td><a href="${pageContext.request.contextPath}/todo-app/update-todo?id=${todo.id}" class="btn btn-success">Update</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <a class="btn btn-success" href="${pageContext.request.contextPath}/todo-app/add-todo">Add Todo</a>
        </div>
    </body>
</html>