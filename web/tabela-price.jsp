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
        <title>JSP Page</title>
    </head>
    <body>
        <header align="center">
            <%@include file="WEB-INF/jspf/menu.jspf" %>
        </header>
        
        <%
            double s = 0, saux = 0, i = 0, p = 0, j = 0, a = 0, cont = 0, total = 0, aux = 0, pmt = 0, ji = 0, auxi = 0;
            int n = 0, valor = 0; String table;
            
            try {s = Double.parseDouble(request.getParameter("saldo"));}
            catch(Exception ex){}
            try {i = Double.parseDouble(request.getParameter("indice"));}
            catch(Exception ex){}
            try {n = Integer.parseInt(request.getParameter("tempo"));}
            catch(Exception ex){}
            table = request.getParameter("acao");
            
            
            

%>
        
        <h1>Tabela Price</h1>
        
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
                
                <%pmt = (s*(i/100)) / (1-(1 / (Math.pow((1+ji), i))));%>
                <%saux = s;%>
                <%ji = 1/100;%>
                <%j = (i/100)*saux;%>
                <%a = pmt-j;%>
                
                
                
                <tr><th>Período</th><th>Saldo Devedor</th><th>Parcela</th><th>Juros</th><th>Amortização</th></tr>
                <tr><td>0</td><td><%=s%></td><td></td><td></td><td></td></tr>
                                
                <%for (int k=1; k<=n; k++) {%>
                    <tr>
                        <td><%=k%></td>     <!--Período  OK-->
                        
                        <td><%=saux = saux-a%></td>    <!--Saldo devedor-->
                        <%aux = s -saux;%>
                        
                        <td><%=new DecimalFormat("0.00").format(pmt)%></td>   <!--Parcela-->
                        <%cont = cont + (j*saux);%>
                        
                        <td><%=j%></td>     <!--Juros-->
                        
                        <td><%=a%></td>     <!--Amortização-->
                    </tr>
                    <%total = s + j;%>
                    
                <%}%>
                
                   
            </table>
            <br/>
            <a href='tabela-price.jsp'>
                    <button class='button-apagar'>Apagar</button>
            </a>
        <%}%>
        
        
        
        <footer align="center">
            <%@include file="WEB-INF/jspf/footer.jspf" %>
        </footer>
    </body>
</html>
