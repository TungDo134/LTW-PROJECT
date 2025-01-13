<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Contact Us</title>
    <!-- Link BOOTSRAP -->
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
    <!-- Link BOOTSRAP -->
    <!-- Link FontAwsome -->
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
    />
    <!-- Link jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="assets/css/styleContactUs.css"/>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<main id="contact-us-container">
    <div class="contact spad">
        <div class="container">
            <div class="row align-items-center">
                <div class="col_contact_1 col">
                    <div class="contact_text">
                        <div class="section-title">
                            <span>Thông tin</span>
                            <h2>Liên hệ với chúng tôi</h2>
                            <p>
                                Chúng tôi sẽ đáp ứng những yêu cầu tốt nhất như bạn mong đợi, chúng
                                tôi đặc biệt chú ý đến trải nghiệm cũng như chất lượng sản
                                phẩm
                            </p>
                        </div>
                        <ul>
                            <li>
                                <h4>TP.Hồ Chí Minh</h4>
                                <p>
                                    23 Phạm Văn Đồng, Phường Hiệp Bình Chánh, Quận Thủ Đức
                                    <br/>+84 982-314-0958
                                </p>
                            </li>
                            <li>
                                <h4>Hà Nội</h4>
                                <p>
                                    19 Nguyễn Trãi, Phường Thanh Xuân Trung, Quận Thanh Xuân
                                    <br/>+84 345-423-9893
                                </p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col_contact_2 col">
                    <div><h5
                            class="text-primary">
                        <%=request.getAttribute("msg") != null ? request.getAttribute("msg") : ""  %>
                    </h5></div>
                    <div class="contact_form">
                        <form action="feedback" method="post">
                            <div class="row_second">
                                <div class="col_contact_3">
                                    <input type="text" name="customerName" placeholder="Tên của bạn" required=""/>
                                    <input type="text" name="email" placeholder="Email" required=""/>
                                </div>
                                <div class="col_contact_5">
                                    <textarea name="fContent" placeholder="Bạn muốn nói gì với chúng tôi"
                                              required=""></textarea>
                                    <button type="submit" class="site-btn">
                                        Gửi tin nhắn
                                    </button>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="faq">
        <div class="head-title-faq">
            <p class="content-title-faq" style="font-size: 2rem !important">
                CÂU HỎI THƯỜNG GẶP
            </p>
        </div>
        <!--  -->

        <div class="faq-content">
            <!--  -->
            <div class="ques-as" onclick="toggleFAQ(this)">
                <div class="question-content">
                    <p>Làm sao để tôi có thể liên lạc được với TVK?</p>
                    <i
                            class="fa-solid fa-chevron-down icon-down"
                            style="transform: rotateX(0deg)"
                    ></i>
                </div>
                <div class="answer">
                    <p>
                        Lorem ipsum dolor sit amet consectetur adipisicing elit.
                        Pariatur, repellendus!
                    </p>
                </div>
            </div>

            <!--  -->
            <div class="ques-as" onclick="toggleFAQ(this)">
                <div class="question-content">
                    <p>
                        Tôi có thể mong đợi phản hồi nhanh như thế nào nếu tôi liên hệ
                        với dịch vụ khách hàng TVK?
                    </p>
                    <i
                            class="fa-solid fa-chevron-down icon-down"
                            style="transform: rotateX(0deg)"
                    ></i>
                </div>
                <div class="answer">
                    <p>
                        Lorem ipsum dolor sit amet consectetur adipisicing elit.
                        Pariatur, repellendus!
                    </p>
                </div>
            </div>
            <!--  -->

            <div class="ques-as" onclick="toggleFAQ(this)">
                <div class="question-content">
                    <p>Làm cách nào để liên hệ với một cửa hàng cụ thể?</p>
                    <i
                            onclick="toggleFAQ(this)"
                            class="fa-solid fa-chevron-down icon-down"
                            style="transform: rotateX(0deg)"
                    ></i>
                </div>
                <div class="answer" onclick="toggleFAQ(this)">
                    <p>
                        Lorem ipsum dolor sit amet consectetur adipisicing elit.
                        Pariatur, repellendus!
                    </p>
                </div>
            </div>
            <!--  -->

            <div class="ques-as" onclick="toggleFAQ(this)">
                <div class="question-content">
                    <p>
                        Bạn có cung cấp dịch vụ khách hàng bằng nhiều ngôn ngữ không?
                    </p>
                    <i
                            onclick="toggleFAQ(this)"
                            class="fa-solid fa-chevron-down icon-down"
                            style="transform: rotateX(0deg)"
                    ></i>
                </div>
                <div class="answer">
                    <p>
                        Lorem ipsum dolor sit amet consectetur adipisicing elit.
                        Pariatur, repellendus!
                    </p>
                </div>
            </div>
            <!--  -->
        </div>
    </div>
</main>
<jsp:include page="footer.jsp"></jsp:include>

<script src="assets/js/main.js"></script>
</body>
</html>
