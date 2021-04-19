<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Cake Template">
    <meta name="keywords" content="Cake, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Cake | C1220G1</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800;900&display=swap"
    rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="css/barfiller.css" type="text/css">
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>
<%--    <!-- Page Preloder -->--%>
<%--    <div id="preloder">--%>
<%--        <div class="loader"></div>--%>
<%--    </div>--%>

<!-- Offcanvas Menu Begin -->
<div class="offcanvas-menu-overlay"></div>
<div class="offcanvas-menu-wrapper">
    <div class="offcanvas__cart">
        <div class="offcanvas__cart__links">
            <div class="shop__option__search">
                <form action="/search">
                    <input name="text" type="text" placeholder="Tìm kiếm">
                    <button type="submit"><i class="fa fa-search"></i></button>
                </form>
            </div>
            <%--      <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""></a>--%>
            <%--      <a href="#"><img src="img/icon/heart.png" alt=""></a>--%>
        </div>
        <div class="offcanvas__cart__item">
            <c:if test="${sessionScope.account != null}">
                <a href="/CartServlet?userId=${account.getUserId()}"><img src="img/icon/cart.png" alt="">
                    <span>${count}</span>
                    <div class="cart__price">Giỏ hàng</div>
                </a>
            </c:if>
            <c:if test="${sessionScope.account == null}">
                <a href="login.jsp"><img src="img/icon/cart.png" alt=""> <span>C</span>
                    <div class="cart__price">Giỏ hàng</div>
                </a>
            </c:if>
            <%--      <a href="/CartServlet?userId=${account.getUserId()}"><img src="img/icon/cart.png" alt=""> <span>C</span>--%>
            <%--      <div class="cart__price">Giỏ hàng</div>--%>
            <%--      </a>--%>
        </div>
    </div>
    <div class="offcanvas__logo">
        <a href="index"><img src="img/logo.png" alt=""></a>
    </div>
    <div id="mobile-menu-wrap"></div>
    <div class="offcanvas__option">
        <ul>
            <li><a href="./login.jsp">Đăng nhập</a> <span class="arrow_carrot-down"></span></li>
        </ul>
    </div>
</div>
<!-- Offcanvas Menu End -->

<!-- Header Section Begin -->
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="header__top__inner">
                        <div class="header__top__left ">
                            <ul>
                                <c:if test="${sessionScope.account.roll}">
                                    <li><a href="/ManagerProductServlet"><b>QL Sản phẩm</b></a></li>
                                    <li><a href="/ManagerOrderServlet"><b>QL đơn hàng</b></a></li>
                                </c:if>
                                <c:if test="${sessionScope.account != null}">
                                    <li><a href="#"><b>Xin chào ${sessionScope.account.name}</b></a></li>
                                    <li><a href="/LogoutServlet">Đăng xuất</a> <span class="arrow_carrot-down"></span>
                                    </li>
                                </c:if>
                                <c:if test="${sessionScope.account == null}">
                                    <li><a href="login.jsp">Đăng nhập</a> <span class="arrow_carrot-down"></span></li>
                                </c:if>
                            </ul>
                        </div>
                        <div class="header__logo">
                            <a href="index"><img src="img/logo.png" alt=""></a>
                        </div>
                        <div class="header__top__right">
                            <div class="header__top__right__links">
                                <div class="shop__option__search">

                                    <form action="/search">
                                        <input name="text" type="text" placeholder="Tìm kiếm">
                                        <button type="submit"><i class="fa fa-search"></i></button>
                                    </form>

                                </div>
                                <%--                <a href="#"><img src="img/icon/heart.png" alt=""></a>--%>
                            </div>
                            <div class="header__top__right__cart">
                                <c:if test="${sessionScope.account != null}">
                                    <a href="/CartServlet?userId=${account.getUserId()}"><img src="img/icon/cart.png"
                                                                                              alt="">
                                        <span>${count}</span>
                                        <div class="cart__price">Giỏ hàng</div>
                                    </a>
                                </c:if>
                                <c:if test="${sessionScope.account == null}">
                                    <a href="login.jsp"><img src="img/icon/cart.png" alt=""> <span>C</span>
                                        <div class="cart__price">Giỏ hàng</div>
                                    </a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <nav class="header__menu mobile-menu">
                    <ul>
                        <li class="active"><a href="index">Trang chủ</a></li>
                        <li><a href="AboutServlet">Giới thiệu</a></li>
                        <li><a href="shop">Cửa hàng</a></li>
                        <li><a href="blog">Blog</a></li>
                        <li><a href="ContactServlet">Liên hệ</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</header>
<!-- Header Section End -->

    <!-- Contact Section Begin -->
    <section class="contact spad">
        <div class="container">
            <div class="map">
<%--                <div class="container">--%>
<%--                    <div class="row d-flex justify-content-center">--%>
<%--                        <div class="col-lg-4 col-md-7">--%>
<%--                            <div class="map__inner">--%>
<%--                                <h6>COlorado</h6>--%>
<%--                                <ul>--%>
<%--                                    <li>1000 Lakepoint Dr, Frisco, CO 80443, USA</li>--%>
<%--                                    <li>Sweetcake@support.com</li>--%>
<%--                                    <li>+1 800-786-1000</li>--%>
<%--                                </ul>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
                <div class="map__iframe">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14895.691654844091!2d105.7682175!3d21.0357702!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xe713200541b7456d!2sCodeGym!5e0!3m2!1svi!2s!4v1617441072578!5m2!1svi!2s" height="300" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                </div>
            </div>
            <div class="contact__address">
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="contact__address__item">
                            <h6>Hà Nội</h6>
                            <ul>
                                <li>
                                    <span class="icon_pin_alt"></span>
                                    <p>795 W 5th St, CA 92410, Việt Nam</p>
                                </li>
                                <li><span class="icon_headphones"></span>
                                    <p>+1 800-786-1000</p>
                                </li>
                                <li><span class="icon_mail_alt"></span>
                                    <p>Sweetcake@support.com</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="contact__address__item">
                            <h6>Nghệ An</h6>
                            <ul>
                                <li>
                                    <span class="icon_pin_alt"></span>
                                    <p>639 S Spring St, CA 90014, Việt Nam</p>
                                </li>
                                <li><span class="icon_headphones"></span>
                                    <p>+1 213-612-3000</p>
                                </li>
                                <li><span class="icon_mail_alt"></span>
                                    <p>Sweetcake@support.com</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="contact__address__item">
                            <h6>Đà Nẵng</h6>
                            <ul>
                                <li>
                                    <span class="icon_pin_alt"></span>
                                    <p>1000 Lakepoint Dr, CO 80443, Việt Nam</p>
                                </li>
                                <li><span class="icon_headphones"></span>
                                    <p>+1 800-786-1000</p>
                                </li>
                                <li><span class="icon_mail_alt"></span>
                                    <p>Sweetcake@support.com</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <div class="contact__text">
                        <h3>Liên hệ với chúng tôi</h3>
                        <ul>
                            <li>Thứ 2 - Thứ 6: 08:00 am – 08:30 pm</li>
                            <li>Thứ 7: 10:00 am – 16:30 pm</li>
                            <li>Chủ nhật: 10:00 am – 16:30 pm</li>
                        </ul>
                        <img src="img/cake-piece.png" alt="">
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="contact__form">
                        <form action="ContactServlet?action=sendContact" method="post" onsubmit="alert('Gửi tin nhắn thành công!')">
                            <div class="row">
                                <div class="col-lg-6">
                                    <input type="text" placeholder="Name" name="name">
                                </div>
                                <div class="col-lg-6">
<%--                                    <input type="text" placeholder="Email" name="email" required>--%>
                                    <input name="email" class="form-control" placeholder="Địa chỉ Email" type="email"  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required="">
                                </div>
                                <div class="col-lg-12">
                                    <textarea placeholder="Message" name="message"></textarea>
                                    <button type="submit" class="site-btn">GỬI ĐI</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Section End -->

<!-- Footer Section Begin -->
<footer class="footer set-bg" data-setbg="img/footer-bg.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="footer__widget">
                    <h6>GIỜ LÀM VIỆC</h6>
                    <ul>
                        <li>Thứ 2 - Thứ 6: 08:00 am – 08:30 pm</li>
                        <li>Thứ 7: 10:00 am – 16:30 pm</li>
                        <li>Chủ nhật: 10:00 am – 16:30 pm</li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="footer__about">
                    <div class="footer__logo">
                        <a href="#"><img src="img/footer-logo.png" alt=""></a>
                    </div>
                    <p>"Cake Shop" là một Thương hiệu của Jordan, khởi đầu là một doanh nghiệp gia đình nhỏ.
                        Chủ sở hữu là Tiến sĩ Iyad Sultan và Tiến sĩ Sereen Sharabati, được hỗ trợ bởi đội ngũ 80 nhân
                        viên.</p>
                    <div class="footer__social">
                        <a href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a>
                        <a href="https://twitter.com/"><i class="fa fa-twitter"></i></a>
                        <a href="https://www.instagram.com/"><i class="fa fa-instagram"></i></a>
                        <a href="https://www.youtube.com/"><i class="fa fa-youtube-play"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="footer__newslatter">
                    <h6>Đăng ký</h6>
                    <p>Nhận các bản cập nhật và ưu đãi mới nhất.</p>
                    <form action="ContactServlet?action=sendEmail" method="post"
                          onsubmit="alert('Gửi thông tin thành công!')">
                        <input type="email" placeholder="Địa chỉ Email" name="email"
                               pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required>
                        <button type="submit"><i class="fa fa-send-o"></i></button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="copyright">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <p class="copyright__text text-white" style="text-align: center">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                        | This website is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a
                            href="https://oidayroi.com" target="_blank">C1220G1</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </p>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- Footer Section End -->

<!-- Search Begin -->
<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch">+</div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Search here.....">
        </form>
    </div>
</div>
<!-- Search End -->

<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery.barfiller.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.nicescroll.min.js"></script>
<script src="js/main.js"></script>
</body>

</html>