<%-- 
    Document   : amortizacao-constante
    Created on : 06/09/2017, 22:57:33
    Author     : Nilo
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header align="center">
            <%@include file="WEB-INF/jspf/menu.jspf" %>
        </header>
        
        <%
            double s = 0, saux = 0, i = 0, p = 0, j = 0, a = 0, cont = 0, total = 0, aux = 0;
            int n = 0;
            
            try {s = Double.parseDouble(request.getParameter("saldo"));}
            catch(Exception ex){}
            try {i = Double.parseDouble(request.getParameter("indice"));}
            catch(Exception ex){}
            try {n = Integer.parseInt(request.getParameter("tempo"));}
            catch(Exception ex){}
        %>
        
        <h1>Sistema de Amortização Constante (SAC)</h1><br/>
        <hr/>
        
        <form>
            Saldo Devedor:
            <input type="number" name="saldo" value="<%=s%>"/>
            Juros:
            <input type="number" name="indice" value="<%=i%>"/>
            Período:
            <input type="number" name="tempo" value="<%=n%>"/>
            <input type="submit" value="Calcular">
        </form>
            
            <table border="1">
                <%=saux = s%>
                <%=a = s / n%>
                <%=j = (i/100)%>
                <tr><th>Período</th><th>Prestação</th><th>Juros</th><th>Amortização</th><th>Saldo Devedor</th></tr>
                <tr><td>0</td><td></td><td></td><td></td><td><%=s%></td></tr>
                                
                <%for (int k=1; k<=n; k++) {%>
                    <tr>
                        <td><%=k%></td>
                        <td><%=a+(j*saux)%></td>
                        <%=aux = aux + (a+(j*saux))%>
                        <td><%=j * saux%></td>
                        <%=cont = cont + (j*saux)%>
                        <td><%=a%></td>
                        <td><%=saux = saux - a%></td>
                    </tr>
                    <%=total = s + j%>
                    
                <%}%>
                <tr><td>Total</td><td><%=aux%></td><td><%=cont%></td><td><%=s%></td><td>---</td></tr>
                   
            </table>
        
        <footer align="center">
            © 06/09 - 13/09. Todos os direitos reservados
        </footer>
    </body>
</html>
