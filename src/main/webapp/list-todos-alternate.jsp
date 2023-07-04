<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Todo List</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <body>
        <%@ include file="common/navigation.jspf"%>
        <div class="container">
            <h1>Manage Your Todos</h1>
            <table class="table">
                <thead>
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

        <script src="webjars\bootstrap\5.1.3\js\bootstrap.min.js"></script>
        <script src="webjars\jquery\3.6.0\jquery.min.js"></script>
    </body>
</html>