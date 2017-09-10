<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calculador de Amortização</title>
    </head>
    <body>
        <header align="center">
            <%@include file="WEB-INF/jspf/menu.jspf" %>
            <link rel="stylesheet" type="text/css" href="css/styles.css">
        </header>
        
        <hr/>
        <h1>Sistemas de Amortização</h1>
        <hr/>
        
        
            <p id="text-1"> Amortização é um processo de extinção de uma dívida através
                de pagamentos periódicos, que são realizados em função de um
                planejamento, de modo que cada prestação corresponde à soma
                do reembolso do capital ou do pagamento dos juros do saldo
                devedor, podendo ser o reembolso de ambos, sendo que os juros
                são sempre calculados sobre o saldo devedor.</p>
        
            <div id='home-col1'>
                <h2>Amortização Constante</h2>
                <p class="p-1"> Sistema de Amortização Constante (SAC) é uma forma de 
                    amortização de um empréstimo por prestações que incluem 
                    os juros, amortizando assim partes iguais do valor total
                    do empréstimo. Neste sistema o saldo devedor é reembolsado
                    em valores de amortização iguais. Desta forma, no sistema
                    SAC o valor das prestações é decrescente, já que os juros
                    diminuem a cada prestação. O valor da amortização é 
                    dividindo-se o valor do principal pelo número de períodos de
                    pagamento, ou seja, de parcelas.</p><br/>
                <a href='amortizacao-constante.jsp'>
                    <button class='home-button'>Calcular</button>
                </a>
            </div>
            <div id='home-col3'>
                <h2>Tabela Price</h2>
                <p class="p-1"> Tabela Price, também chamado de sistema francês de 
                    amortização, é um método usado em amortização de empréstimo 
                    cuja principal característica é apresentar prestações (ou 
                    parcelas) iguais. O método foi apresentado em 1771 por 
                    Richard Price em sua obra "Observações sobre Pagamentos 
                    Remissivos". Este modelo usa o regime de juros compostos 
                    para calcular o valor das parcelas de um empréstimo e, dessa
                    parcela, há uma proporção relativa ao pagamento de juros e 
                    amortização do valor emprestado.</p><br/>
                <a href='tabela-price.jsp'>
                    <button class='home-button'>Calcular</button>
                </a>
            </div>
            <div id='home-col2'> 
                <h2>Amortização Americano</h2>
                <p class="p-1"> O Sistema de Amortização Americano é uma forma de pagamento 
                    de empréstimos que se caracteriza pelo pagamento apenas dos 
                    juros da dívida,deixando o valor da dívida constante, que 
                    pode ser paga em apenas um único pagamento. Esse sistema de 
                    amortização tem a vantagem em relação ao sistema de pagamento 
                    único, pois nele não há incidência de juros sobre juros. Os 
                    juros sempre incidem sobre o valor original da dívida. Com 
                    isso o devedor pode quitar sua dívida quando quiser.</p><br/>
                <a href='amortizacao-americana.jsp'>
                    <button class='home-button'>Calcular</button>
                </a>
            </div>
        <footer id="footer" align="center">
            <%@include file="WEB-INF/jspf/footer.jspf" %>
        </footer>
    </body>
</html>
