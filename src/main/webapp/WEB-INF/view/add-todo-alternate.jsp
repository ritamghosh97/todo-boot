<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Add a new Todo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
    </head>
    <body>
        <%@ include file="common/navigation.jspf"%>
        <div class="shadow p-3 mb-5 bg-body rounded">
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