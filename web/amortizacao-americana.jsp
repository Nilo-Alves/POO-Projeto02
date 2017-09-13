<%-- 
    Document   : amortizacao-americana
    Created on : 06/09/2017, 22:57:48
    Author     : Nilo
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/styles.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Americana</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <%
            double sal = 0, tax = 0; 
            int n = 0;
            String table;
            
            try {sal = Double.parseDouble(request.getParameter("saldo"));}
            catch(Exception ex){}
            try {tax = Double.parseDouble(request.getParameter("juros"));}
            catch(Exception ex){}
            try {n = Integer.parseInt(request.getParameter("tempo"));}
            catch(Exception ex){}
            table = request.getParameter("acao");
        %>
        <h2>Sistema de Amortização Americana</h2>
        
        <form>
            <label>Saldo Devedor:</label>
            <input id="input" type="text" name="saldo" value="<%=new DecimalFormat("0").format(sal)%>"/><br/><br/>
            <label>Taxa de Juros (%):</label>
            <input id="input" type="text" name="juros" value="<%=new DecimalFormat("0").format(tax)%>"/><br/><br/>
            <label>Nº de Períodos:</label>
            <input id="input" type="number" name="tempo" value="<%=n%>"/><br/><br/>
            <input class='button' type="submit" name="acao" value="Calcular">
        </form>
        <br/>
        
        <%if (table != null) {%>
            <%if (sal != 0 && n != 0) {%>
            <table align="center" border="1">

                    <tr><th>Período</th><th>Prestação</th><th>Juros</th><th>Amortização</th><th>Saldo Devedor</th></tr>
                    <tr><th>0</th><td></td><td></td><td></td><td>R$ <%=new DecimalFormat("0.00").format(sal)%></td></tr>

                    <% 
                       double jur = sal * (tax/100);
                       double amort = 0, tjur = 0, tamort = 0, tprest = 0;

                       for(int c = 1; c <= n; c++) { 
                        if (c == n){
                           amort = sal;     
                        }
                    %>
                        <tr>
                            <th><%=c%></th>
                            <td>R$ <%=new DecimalFormat("0.00").format(jur + amort)%></td>
                            <%tprest = tprest + (jur + amort);%>
                            <td>R$ <%=new DecimalFormat("0.00").format(jur)%></td>
                            <%tjur = tjur + jur;%>
                            <td>R$ <%=new DecimalFormat("0.00").format(amort)%></td>
                            <%tamort = tamort + amort;%>
                            <td>R$ <%=new DecimalFormat("0.00").format(sal)%></td>
                            <%sal = sal - amort;%>
                        </tr>
                    <%}%>

                    <tr><th>Total</th>
                        <td>R$ <%=new DecimalFormat("0.00").format(tprest)%></td>
                        <td>R$ <%=new DecimalFormat("0.00").format(tjur)%></td>
                        <td>R$ <%=new DecimalFormat("0.00").format(tamort)%></td>
                        <td>---</td>
                    </tr>

            </table>
            
            <a href='amortizacao-americana.jsp'>
                    <button class='button-apagar'>Apagar</button>
            </a>
            <%}else if (sal == 0 && n == 0) {%>
                <h3 style="color: red">*Preencha os campos "Saldo Devedor" e "Nº de Periodos" corretamente</h3>
            <%}else if (sal == 0) {%>
                <h3 style="color: red">*Preencha o campo "Saldo Devedor" corretamente</h3>
            <%}else if (n == 0) {%>
                <h3 style="color: red">*Preencha o campo "Nº de Periodos" corretamente</h3>
            <%}%>
        <%}%>
        
        <footer align="center">
            <%@include file="WEB-INF/jspf/footer.jspf" %>
        </footer>
    </body>
</html>
