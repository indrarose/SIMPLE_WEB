<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html lang="en">

    <head>

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

            </div>
        </nav>

        <!-- Page Content -->
        <div class="container">

            <div class="row">
                <div class="col-lg-12 mt-3">
                    <div class="card">
                        <div class="card-header" style="margin-bottom: 10px">
                            <h3 class="card-title">People</h3>
                            <a class="btn btn-success" href="add">Add</a>
                        </div>
                        <div class="card-body" style="padding-top: 10px">
                            <c:if test="${not empty message}">
                                <div class="alert alert-warning alert-dismissible" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                        ${message}
                                </div>
                            </c:if>
                            <nav>
                                <ul class="pagination" style="float: left">
                                    <c:forEach var="i" begin="1" end="${peoples.getTotalPages()}" step="1">
                                        <li class="page-item ${peoples.getNumber()==i-1 ? "active":""}"><a class="page-link" href="?sort=${param.sort}&page=${i-1}">${i}</a></li>
                                    </c:forEach>
                                </ul>
                                <div style="width: 200px;float: right">
                                    <select class="form-control sort-select">
                                        <option value="">--</option>
                                        <option value="name,asc">Name ASC</option>
                                        <option value="name,desc">Name DESC</option>
                                    </select>
                                </div>
                            </nav>
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Name</th>
                                    <th>Gender</th>
                                    <th>Address</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="people" items="${peoples.getContent()}">
                                    <tr>
                                        <td>${people.id}</td>
                                        <td>${people.name}</td>
                                        <td>${people.gender}</td>
                                        <td>${people.address}</td>
                                        <td><a href="edit?id=${people.id}">Edit</a> | <a class="confirmation" href="delete?id=${people.id}">Delete</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <nav>
                                <ul class="pagination">
                                    <c:forEach var="i" begin="1" end="${peoples.getTotalPages()}" step="1">
                                        <li class="page-item ${peoples.getNumber()==i-1 ? "active":""}"><a class="page-link" href="?sort=${param.sort}&page=${i-1}">${i}</a></li>
                                    </c:forEach>
                                </ul>
                            </nav>

                        </div>
                        <!-- card-body -->
                    </div>
                    <!-- card -->
                </div>
            </div>
        </div>

    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        $('.confirmation').on('click', function () {
            return confirm('Are you sure?');
        });

        $('.sort-select').change(function () {
            window.location = window.location.pathname+"?page=${peoples.getNumber()}&sort="+$(this).val();
        }).val('${param.sort}');


    </script>

</html>
