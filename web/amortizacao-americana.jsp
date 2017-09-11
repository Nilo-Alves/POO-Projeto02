<%-- 
    Document   : amortizacao-americana
    Created on : 06/09/2017, 22:57:48
    Author     : Nilo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/styles.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Americano</title>
    </head>
    <body>
        <header align="center">
            <%@include file="WEB-INF/jspf/menu.jspf" %>
        </header>
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
        
        <hr/>
        <h1>Sistema de Amortização Americano (SAA)</h1>
        <hr/>
        <br/>
        
        <form>
            Saldo Devedor:
            <input type="number" name="saldo" value="<%=sal%>"/><br/><br/>
            Juros:
            <input type="number" name="juros" value="<%=tax%>"/><br/><br/>
            Período:
            <input type="number" name="tempo" value="<%=n%>"/><br/><br/>
            <input type="submit" name="acao" value="Calcular">
        </form>
        <br/>
        
        <%if (table != null) {%>
            <table border="1">

                    <tr><th>Período</th><th>Prestação</th><th>Juros</th><th>Amortização</th><th>Saldo Devedor</th></tr>
                    <tr><td>0</td><td></td><td></td><td></td><td><%=sal%></td></tr>

                    <% 
                       double jur = sal * (tax/100);
                       double amort = 0, tjur = 0, tamort = 0, tprest = 0;

                       for(int c = 1; c <= n; c++) { 
                        if (c == n){
                           amort = sal;     
                        }
                    %>
                        <tr>
                            <td><%=c%></td>
                            <td><%=(jur + amort)%></td>
                            <%tprest = tprest + (jur + amort);%>
                            <td><%=jur%></td>
                            <%tjur = tjur + jur;%>
                            <td><%=amort%></td>
                            <%tamort = tamort + amort;%>
                            <td><%=sal%></td>
                            <%sal = sal - amort;%>
                        </tr>
                    <%}%>

                    <tr><td>Total</td><td><%=tprest%></td><td><%=tjur%></td><td><%=tamort%></td><td>---</td></tr>

            </table>
            <br/>
        <%}%>
        
        <footer align="center">
            <%@include file="WEB-INF/jspf/footer.jspf" %>
        </footer>
    </body>
</html>
