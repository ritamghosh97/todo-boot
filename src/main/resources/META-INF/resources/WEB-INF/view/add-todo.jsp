<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Add a new Todo</title>
        <link rel="stylesheet" href="webjars\bootstrap\5.1.3\css\bootstrap.min.css">
        <link rel="stylesheet" href="webjars\bootstrap-datepicker\1.9.0\css\bootstrap-datepicker.standalone.min.css">
    </head>
    <body>
        <%@ include file="common/navigation.jspf"%>
        <div class="container">

            <h1>Enter Todo Details</h1>

            <form:form method="POST" modelAttribute="todo">

                <fieldset class="mb-3">
                    <form:label path="description" cssClass="form-label">Description</form:label>
                    <div class="col-sm-7">
                        <form:input id="desc" path="description" cssClass="form-control" aria-describedby="descError" required="required"/>
                    </div>
                    <div id="descError" class="form-text">
                        <form:errors path="description" cssClass="text-warning"/>
                    </div>
                </fieldset>

                <fieldset class="mb-3">
                    <form:label path="targetDate" cssClass="form-label">Target Date</form:label>
                    <div class="col-sm-7">
                        <form:input id="tarDt" path="targetDate" cssClass="form-control" aria-describedby="tarDtError" required="required"/>
                    </div>
                    <div id="tarDtError" class="form-text">
                        <form:errors path="targetDate" cssClass="text-warning"/>
                    </div>
                </fieldset>

                <input type="submit" value="Submit" class="btn btn-primary"/>

            </form:form>
        </div>

        <script src="webjars\bootstrap\5.1.3\js\bootstrap.min.js"></script>
        <script src="webjars\jquery\3.6.0\jquery.min.js"></script>
        <script src="webjars\bootstrap-datepicker\1.9.0\js\bootstrap-datepicker.min.js"></script>

        <script type="text/javascript">
            $('#tarDt').datepicker({
                format: 'yyyy-mm-dd'
            });
        </script>
    </body>
</html>