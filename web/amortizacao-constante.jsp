<%-- 
    Document   : amortizacao-constante
    Created on : 06/09/2017, 22:57:33
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
        <title>Amortização Constante</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <%
            double s = 0, saux = 0, i = 0, p = 0, j = 0, a = 0, cont = 0, total = 0, aux = 0;
            int n = 0; String table;
            
            try {s = Double.parseDouble(request.getParameter("saldo"));}
            catch(Exception ex){}
            try {i = Double.parseDouble(request.getParameter("indice"));}
            catch(Exception ex){}
            try {n = Integer.parseInt(request.getParameter("tempo"));}
            catch(Exception ex){}
            table = request.getParameter("acao");
        %>
        <h2>Sistema de Amortização Constante</h2>
        
        <form>
            <label>Saldo Devedor:</label>
            <input type="number" name="saldo" value="<%=s%>"/><br/><br/>
            <label>Juros:</label>
            <input type="number" name="indice" value="<%=i%>"/><br/><br/>
            <label>Período:</label>
            <input type="number" name="tempo" value="<%=n%>"/><br/><br/>
            <input class='button' type="submit" name="acao" value="Calcular">
        </form>
        <br/>
        
        <%if (table != null) {%>
            <table align="center" border="1">
                <%saux = s;%>
                <%a = s / n;%>
                <%j = (i/100);%>
                <tr><th>Período</th><th>Prestação</th><th>Juros</th><th>Amortização</th><th>Saldo Devedor</th></tr>
                <tr><th>0</th><td></td><td></td><td></td><td><%=new DecimalFormat("0.00").format(s)%></td></tr>
                                
                <%for (int k=1; k<=n; k++) {%>
                    <tr>
                        <th><%=new DecimalFormat("0.00").format(k)%></th>
                        <td><%=new DecimalFormat("0.00").format(a+(j*saux))%></td>
                        <%aux = aux + (a+(j*saux));%>
                        <td><%=new DecimalFormat("0.00").format(j * saux)%></td>
                        <%cont = cont + (j*saux);%>
                        <td><%=new DecimalFormat("0.00").format(a)%></td>
                        <td><%=new DecimalFormat("0.00").format(saux = saux - a)%></td>
                    </tr>
                    <%total = s + j;%>
                    
                <%}%>
                <tr><th>Total</th>
                    <td><%=new DecimalFormat("0.00").format(aux)%></td>
                    <td><%=new DecimalFormat("0.00").format(cont)%></td>
                    <td><%=new DecimalFormat("0.00").format(s)%></td>
                    <td>---</td>
                </tr>
                   
            </table>
            
            <a href='amortizacao-constante.jsp'>
                    <button class='button-apagar'>Apagar</button>
            </a>
            <br/>
            <%}%>
        
        <footer align="center">
            <%@include file="WEB-INF/jspf/footer.jspf" %>
        </footer>
    </body>
</html>
