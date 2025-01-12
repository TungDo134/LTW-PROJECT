<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/10/2024
  Time: 10:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title> About Us </title>
    <!-- Bootstrap  -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
    />
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"
    ></script>

    <!-- jQuery  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!-- Font Awesome (cho các icon) -->
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
    />
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css"
            integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
    />
    <!-- Google Icon -->
    <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0"
    />

    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/admin/styleVoucher.css"/>
</head>
<body class="dark-theme">
<%
    String message = (String) request.getAttribute("msg");
%>

<jsp:include page="header-admin.jsp"></jsp:include>
<div id="main-content">
    <div class="main-container">
        <div class="header">
            <h1>Danh sách ảnh trang giới thiệu</h1>
        </div>
        <div id="list-reviews-container">

            <div class="list-reviews">

                <table id="myTable" class="display" style="width:100%; color: #fff">
                    <thead>
                    <tr>
                        <th>Ảnh 1</th>
                        <th>Ảnh 2</th>
                        <th>Ảnh 3</th>
                        <th>Ảnh 4</th>
                        <th>TV1</th>
                        <th>TV2</th>
                        <th>TV3</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listA}" var="o">
                        <tr>
                            <td><a href="update-img-ab?txt=${o.img1}&txtVal=img1&choice=1" style="padding: 14px 2px"><img
                                   
                                    src="<%=request.getContextPath()%>/assets/pic/Aboutus/${o.img1}"/></a>
                            </td>
                            <td><a href="update-img-ab?txt=${o.img2}&txtVal=img2&choice=1" style="padding: 14px 2px"><img
                                   
                                    src="<%=request.getContextPath()%>/assets/pic/Aboutus/${o.img2}"/></a>
                            </td>
                            <td><a href="update-img-ab?txt=${o.img3}&txtVal=img3&choice=1" style="padding: 14px 2px"><img
                                   
                                    src="<%=request.getContextPath()%>/assets/pic/Aboutus/${o.img3}"/></a>
                            </td>
                            <td><a href="update-img-ab?txt=${o.img4}&txtVal=img4&choice=1" style="padding: 14px 2px"><img
                                   
                                    src="<%=request.getContextPath()%>/assets/pic/Aboutus/${o.img4}"/></a>
                            </td>
                            <td><a href="update-img-ab?txt=${o.member1}&txtVal=member1&choice=1" style="padding: 14px 2px"><img
                                   
                                    src="<%=request.getContextPath()%>/assets/pic/Aboutus/${o.member1}"/></a>
                            </td>
                            <td><a href="update-img-ab?txt=${o.member2}&txtVal=member2&choice=1" style="padding: 14px 2px"><img
                                   
                                    src="<%=request.getContextPath()%>/assets/pic/Aboutus/${o.member2}"/></a>
                            </td>
                            <td><a href="update-img-ab?txt=${o.member3}&txtVal=member3&choice=1" style="padding: 14px 2px"><img
                                   
                                    src="<%=request.getContextPath()%>/assets/pic/Aboutus/${o.member3}"/></a>
                            </td>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

            </div>

        </div>
    </div>
</div>


</body>
</html>
