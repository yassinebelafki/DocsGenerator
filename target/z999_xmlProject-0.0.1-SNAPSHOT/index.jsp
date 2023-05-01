<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Seymour+One&display=swap" rel="stylesheet">
<meta charset="ISO-8859-1">
<style>
    h1 {
        font-family: 'Seymour One', sans-serif;
    }
    .container{
        text-align: center;
        margin-top: 80px;
    }
    .btn {
        margin-top: 18px;
    }
</style>
<title>Gestion des etudiants</title>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-header bg-primary text-white">
                <center><h1>Gestion des etudiants</h1></center>
            </div>
            <div class="card-body">
				<form action="<%=request.getContextPath()%>/controller" method="post">
                <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="action" required>
                    <option selected>Choisir une option</option>
                    <option value="student-card">carte d'etudiant</option>
                    <option value="scolarity">attestation de scolarite</option>
                    <option value="notes">releve des notes</option>
                    <option value="timetable">emploi de temps</option>
                  </select>
                  <label for="code_apogee" class="form-label" >Code Appogee</label>
                <input type="number" class="form-control" id="code_apogee" name="code" placeholder="Taper votre code d'apogee" >
            <input type="submit" class="btn btn-outline-primary" value="Generer">
            </form>

            </div>

            <c:if test="${requestScope.error!=null}">
                <div class="alert alert-danger d-flex align-items-center" role="alert">
                    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                    <div>
                        <%= request.getAttribute("error") %>
                    </div>
                </div>
            </c:if>

        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

</body>
</html>