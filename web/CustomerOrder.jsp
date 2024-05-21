<%-- 
    Document   : Order.jsp
    Created on : May 19, 2024, 11:05:11 AM
    Author     : lenovo
--%>

<%@page import="model.Order"%>
<%@page import="model.OrderManager"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .showing-container {
                display: inline-flex;
                justify-content: center;
                list-style: none;
                padding: 0;
                margin-left: 250px;
            }
            .item-status {
                display: flex;
                flex-direction: column;
                align-items: center;
                margin: 10px;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                flex-basis: 20%;
                transition: transform 0.3s ease;
            }

            .item-status:hover {
                transform: translateY(-5px);
                box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
            }
        </style>
    </head>
    <body>
        <%
            Account acc = (Account) session.getAttribute("account");
            String name = acc.getName();
            if (acc == null) {
        %><h1>Hello World!</h1>
        <%
        } else {
        %><h1><%=name%>'s Order</h1>
        <%}%>
        <div>
            <section class="section-yellow " style="border-radius: 20px">
                <ul class="showing-container">

                    <li class="item-status available active-os" selected="1">
                        <div class="statusOrder">Checking</div>

                    </li>
                    <li class="item-status available" selected="2">
                        <div class="statusOrder">Preparing</div>
                    </li>
                    <li class="item-status available" selected="3">
                        <div class="statusOrder">OnTheWay</div>
                    </li>
                    <li class="item-status available" selected="4">
                        <div class="statusOrder">Delivered</div>
                    </li>
                    <li class="item-status available" selected="5">
                        <div class="statusOrder">Completed</div>
                    </li>
                    <li class="item-status available" selected="6">
                        <div class="statusOrder">Canceled</div>
                    </li>
                </ul>
            </section> 
            <div class="contentBot">
                <section class="section-white">
                    <div class="box" content="1" >      
                        <div><%
                            OrderManager om = new OrderManager();
                            for (Order od : om.getList()) {

                            %>
                            <a href="Chat.jsp?idO=<%=od.getOrder_id()%>"><%=od.getOrder_id()%></a><br>
                            <%
                                }
                            %></div>
                    </div>
                    <div class="box" content="2" style="display: none">      
                        <div>xin chao2</div>
                    </div>
                    <div class="box" content="3" style="display: none">      
                        <div>xin chao3</div>
                    </div>
                    <div class="box" content="4" style="display: none">      
                        <div>xin chao4</div>
                    </div>
                    <div class="box" content="5" style="display: none">      
                        <div>xin chao5</div>
                    </div>
                    <div class="box" content="6" style="display: none">      
                        <div>xin chao6</div>
                    </div>
                </section>
            </div>
        </div>
        <script>
            var dayShowingItems = document.querySelectorAll('.item-status');
            dayShowingItems.forEach(function (item) {
                item.addEventListener('click', function () {
                    dayShowingItems.forEach(function (item) {
                        item.classList.remove('active-os');
                    });
                    this.classList.add('active-os');

                    var selected = this.getAttribute('selected');
                    var movieTimeLines = document.querySelectorAll('.box');

                    movieTimeLines.forEach(function (movieTimeLine) {
                        var Chosse = movieTimeLine.getAttribute('content');
                        if (Chosse === selected) {
                            movieTimeLine.style.display = 'block';
                        } else {
                            movieTimeLine.style.display = 'none';
                        }
                    });
                });
            });
        </script>
    </body>
</html>
