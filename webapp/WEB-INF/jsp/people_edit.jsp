<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Add People</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>${title}</title>

        <!-- CSS only -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

    </head>

    <body>

        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
            <div class="container">
                <a class="navbar-brand" href="#">People</a>
            </div>
        </nav>

        <!-- Page Content -->
        <div class="container">

            <div class="row">
                <div class="col-lg-12 mt-3">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Edit</h3>
                        </div>
                        <div class="card-body">
                            <form:form method="POST" action="/people/update" modelAttribute="people">
                                <table class="table">
                                    <form:hidden path="id"/>
                                    <tr>
                                        <td><form:label path="name">Name</form:label></td>
                                        <td><form:input path="name"/></td>
                                        <td><form:errors path="name" cssClass="text-danger"/></td>
                                    </tr>
                                    <tr>
                                        <td><form:label path="gender">Genre</form:label></td>
                                        <td>
                                            <form:radiobutton path="gender" value="male"/> Male
                                            <form:radiobutton path="gender" value="female"/> Female
                                        <td><form:errors path="gender" cssClass="text-danger"/></td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><form:label path="address">Address</form:label></td>
                                        <td><form:input path="address"/></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <div style="margin-top: 10px">
                                                <button type="button" class="btn btn-secondary" onclick="window.history.back()">Back</button>
                                                <input type="submit" value="Submit" class="btn btn-primary"/>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </form:form>
                        </div>
                        <!-- card-body -->
                    </div>
                    <!-- card -->
                </div>
            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/js/bootstrap.min.js"></script>

    </body>

</html>
