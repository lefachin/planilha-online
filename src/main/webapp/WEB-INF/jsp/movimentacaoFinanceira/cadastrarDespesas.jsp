<%--
  Created by IntelliJ IDEA.
  User: Luiz Fachin
  Date: 15/06/2016
  Time: 04:57
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="pt-br">
<html>
<head>
    <meta name="viewport" content="width=device-width, maximum-scale=1">

    <title>Página Inicial</title>

    <link rel="icon" href="<c:url value="/img/icon-32px.png"/>" type="image/png">

    <!--Fontes-->
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,800italic,700italic,600italic,400italic,300italic,800,700,600'
          rel='stylesheet' type='text/css'>

    <!--CSS-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/animate.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrap.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/font-awesome.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/carousel.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/simple-sidebar.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrap-datepicker.min.css"/>">
</head>
<body>

<div id="wrapper">
    <div class="overlay"></div>

    <!-- Sidebar -->
    <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
        <ul class="nav sidebar-nav">
            <li class="sidebar-brand">
                <a href="#" class="nao-clicavel">
                    <figure>
                        <img src="<c:url value="/img/icon-55px.png"/>" alt="">
                    </figure>
                </a>
            </li>
            <li>
                <a href="<c:url value='/'/>">Página Inicial</a>
            </li>
            <li>
                <a href="<c:url value='/cadastrarDespesas/demonstrativo'/>">Demonstrativo</a>
            </li>
            <li>
                <a href="<c:url value='/cadastrarDespesas/receitas'/>">Cadastrar Receitas</a>
            </li>
            <li class="ativo">
                <a href="#">Cadastrar Despesas</a>
            </li>
        </ul>
    </nav>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">
        <button type="button" class="hamburger is-closed" data-toggle="offcanvas">
            <span class="hamb-top"></span>
            <span class="hamb-middle"></span>
            <span class="hamb-bottom"></span>
        </button>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <h1>Cadastrar Despesas</h1>

                    <form action="/adicionarDespesa" class="margin-top-10">

                        <div class="form-group">
                            <label>Tipo despesa</label>

                            <div class="dropdown">

                                <select id="selecao" class="btn btn-default dropdown-toggle" type="button"
                                        data-toggle="dropdown" name="despesa.tipoDespesa" required>
                                    <span class="caret"></span>

                                    <c:forEach items="${tpDespesas}" var="d">
                                        <option value="${d}">
                                            <c:out value="${d.descricao}"></c:out>
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="margin-top-10" for="descricao">
                                Descrição
                            </label>

                            <input type="text" class="form-control" id="descricao" name="despesa.descricao">
                        </div>

                        <div class="form-group">
                            <label for="valor" class="margin-top-10">
                                Valor
                            </label>
                            <div class="input-group">
                                <div class="input-group-addon">R$</div>
                                <input type="number" class=" form-control" id="valor" name="despesa.valor" required>
                            </div>

                        </div>

                        <div class="form-group">
                            <label class="margin-top-10" for="data">
                                Data do pagamento
                            </label>

                            <input type="date" class="datepicker block" data-date-format="dd/mm/yyyy" id="data"
                                   name="despesa.data">
                        </div>

                        <button type="button" id="adicionar" class="btn btn-default">Adicionar</button>
                    </form>

                </div>
            </div>
        </div>
    </div>
    <!-- /#page-content-wrapper -->

</div>
<!-- /#wrapper -->


<!-- jQuery -->
<script src="<c:url value="/js/jquery.js"/>"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>


<script>
    $(document).ready(function () {
        var trigger = $('.hamburger'),
                overlay = $('.overlay'),
                isClosed = false;

        trigger.click(function () {
            hamburger_cross();
        });

        function hamburger_cross() {

            if (isClosed == true) {
                overlay.hide();
                trigger.removeClass('is-open');
                trigger.addClass('is-closed');
                isClosed = false;
            } else {
                overlay.show();
                trigger.removeClass('is-closed');
                trigger.addClass('is-open');
                isClosed = true;
            }
        }

        $('[data-toggle="offcanvas"]').click(function () {
            $('#wrapper').toggleClass('toggled');
        });
    });
</script>

<script>
    $('.datepicker').datepicker();
</script>
</body>
</html>
