<%-- 
    Document   : tabela-price
    Created on : 06/09/2017, 22:58:05
    Author     : Nilo
--%>

<%@page import="java.text.DecimalFormat"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/styles.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Price</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <%
            double s = 0, saux = 0, i = 0;
            int n = 0 ; String table;
            
            if (request.getParameter("saldo") != null){
                try {s = Double.parseDouble(request.getParameter("saldo"));}
                catch(Exception ex){%>
                <script>
                    alert("Parâmetro Inválido - Somente números!");
                </script>
            <%}}
            if (request.getParameter("indice") != null) {
                try {i = Double.parseDouble(request.getParameter("indice"));}
                catch(Exception ex){%>
                <script>
                    alert("Parâmetro Inválido - Somente números!");
                </script>
            <%}}
            if (request.getParameter("tempo") != null){
                try {n = Integer.parseInt(request.getParameter("tempo"));}
                catch(Exception ex){%>
                <script>
                    alert("Parâmetro Inválido - Somente números!");
                </script>
            <%}}
            table = request.getParameter("acao");
%>        
        <h2>Tabela Price</h2>
        
        <form>
            <label>Saldo Devedor:</label>
            <input id="input" type="text" name="saldo" value="<%=new DecimalFormat("0").format(s)%>"/><br/><br/>
            <label>Taxa de Juros (%):</label>
            <input id="input" type="text" name="indice" value="<%=new DecimalFormat("0").format(i)%>"/><br/><br/>
            <label>Nº de Períodos:</label>
            <input id="input" type="number" name="tempo" value="<%=n%>"/><br/><br/>
            <input class='button' type="submit" name="acao" value="Calcular">
        </form>
        <br/>
        
        <%if (table != null) {%>
            <%if (s != 0 && n != 0) {%>
                <table align="center" border="1">

                    <%double aux=i/100, a=0, ta = 0, juros = 0, tjuros = 0 , tpmt = 0;%>
                    <%double pmt=(s*aux)/(1- (1/(Math.pow(1+aux,n))));%>
                    <%saux = s;%>
                    <%juros = (i/100)*s;%>
                    <%a = pmt-juros;%>

                    <tr><th>Período</th><th>Prestação</th><th>Juros</th><th>Amortização</th><th>Saldo Devedor</th></tr>
                    <tr><th>0</th><td></td><td></td><td></td><td>R$ <%=new DecimalFormat("0.00").format(s)%></td></tr>

                    <%for (int k=1; k<=n; k++) {%>
                        <tr>
                            <th><%=k%></th>     <!--Período  OK-->

                            <td>R$<%=new DecimalFormat("0.00").format(pmt)%></td>   <!--Parcela-->
                            <%tpmt = tpmt + pmt;%>

                            <td>R$<%=new DecimalFormat("0.00").format(juros = (aux)*saux)%></td>     <!--Juros-->
                            <%tjuros = tjuros + juros;%>

                            <td>R$<%=new DecimalFormat("0.00").format(a = pmt-juros)%></td>     <!--Amortização-->
                            <%ta = ta + a;%>

                            <td>R$<%=new DecimalFormat("0.00").format(saux = saux - a)%></td>    <!--Saldo devedor-->                                                
                        </tr>                                        
                    <%}%>
                        <tr><th>Total</th>
                            <td>R$ <%=new DecimalFormat("0.00").format(tpmt)%></td>
                            <td>R$ <%=new DecimalFormat("0.00").format(tjuros)%></td>
                            <td>R$ <%=new DecimalFormat("0.00").format(ta)%></td>
                            <td>---</td>
                        </tr>

                </table>
                <br/>
                <a href='tabela-price.jsp'>
                        <button class='button-apagar'>Apagar</button>
                </a>
            <%}else if (s == 0 && n == 0) {%>
                <h3 style="color: red">*Preencha os campos "Saldo Devedor" e "Nº de Periodos" corretamente</h3>
            <%}else if (s == 0) {%>
                <h3 style="color: red">*Preencha o campo "Saldo Devedor" corretamente</h3>
            <%}else if (n == 0) {%>
                <h3 style="color: red">*Preencha o campo "Nº de Periodos" corretamente</h3>
            <%}%>
        <%}%>
        
        
        
          <footer align="center">
              <%@include file="WEB-INF/jspf/footer.jspf" %>
          </footer>
