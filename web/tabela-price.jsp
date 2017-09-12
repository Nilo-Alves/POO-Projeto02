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
            
            try {s = Double.parseDouble(request.getParameter("saldo"));}
            catch(Exception ex){}
            try {i = Double.parseDouble(request.getParameter("indice"));}
            catch(Exception ex){}
            try {n = Integer.parseInt(request.getParameter("tempo"));}
            catch(Exception ex){}
            table = request.getParameter("acao");
%>        
        <h2>Tabela Price</h2>
        
        <form>
            <label>Saldo Devedor:</label>
            <input type="text" name="saldo" value="<%=s%>"/><br/><br/>
            <label>Juros:</label>
            <input type="text" name="indice" value="<%=i%>"/><br/><br/>
            <label>Período:</label>
            <input type="number" name="tempo" value="<%=n%>"/><br/><br/>
            <input class='button' type="submit" name="acao" value="Calcular">
        </form>
        <br/>
        
        <%if (table != null) {%>
            <table align="center" border="1">
                
                <%double aux=i/100, a=0, ta = 0, juros = 0, tjuros = 0 , tpmt = 0;%>
                <%double pmt=(s*aux)/(1- (1/(Math.pow(1+aux,n))));%>
                <%saux = s;%>
                <%juros = (i/100)*s;%>
                <%a = pmt-juros;%>
                
                <tr><th>Período</th><th>Parcela</th><th>Juros</th><th>Amortização</th><th>Saldo Devedor</th></tr>
                <tr><th>0</th><td></td><td></td><td></td><td><%=new DecimalFormat("0.00").format(s)%></td></tr>
                                
                <%for (int k=1; k<=n; k++) {%>
                    <tr>
                        <th><%=k%></th>     <!--Período  OK-->
                        
                        <td><%=new DecimalFormat("0.00").format(pmt)%></td>   <!--Parcela-->
                        <%tpmt = tpmt + pmt;%>
                       
                        <td><%=new DecimalFormat("0.00").format(juros = (aux)*saux)%></td>     <!--Juros-->
                        <%tjuros = tjuros + juros;%>
                        
                        <td><%=new DecimalFormat("0.00").format(a = pmt-juros)%></td>     <!--Amortização-->
                        <%ta = ta + a;%>
                        
                        <td><%=new DecimalFormat("0.00").format(saux = saux - a)%></td>    <!--Saldo devedor-->                                                
                    </tr>                                        
                <%}%>
                    <tr><th>Total</th>
                        <td><%=new DecimalFormat("0.00").format(tpmt)%></td>
                        <td><%=new DecimalFormat("0.00").format(tjuros)%></td>
                        <td><%=new DecimalFormat("0.00").format(ta)%></td>
                        <td>---</td>
                    </tr>
                   
            </table>
            <br/>
            <a href='tabela-price.jsp'>
                    <button class='button-apagar'>Apagar</button>
            </a>
        <%}%>
        
        
        
          <footer align="center">
              <%@include file="WEB-INF/jspf/footer.jspf" %>
          </footer>
