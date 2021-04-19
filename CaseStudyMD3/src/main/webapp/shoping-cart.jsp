<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__text">
                        <h2>Shopping cart</h2>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__links">
<%--                        <a href="/index?action=showProductCategory&id=1">Home</a>--%>
                        <a href="index">Home</a>
                        <span>Shopping cart</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="shopping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th>Sản phẩm</th>
                                    <th>Số lượng</th>
                                    <th>Tổng</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>

                            <c:forEach items='${requestScope["carts"]}' var="cart">
                                <tr>
                                    <td class="product__cart__item">
                                        <div class="product__cart__item__pic">
                                            <img src="${cart.getThumbnail()}" alt="" width="90" height="90">
                                        </div>
                                        <div class="product__cart__item__text">
                                            <h6><c:out value="${cart.getProductName()}"/></h6>
                                            <h5><c:out value="${cart.getProductPrice()}"/></h5>
                                        </div>
                                    </td>
                                    <td class="quantity__item">
                                        <form action="CartServlet?action=update&id=${cart.getCartId()}&userId=${account.getUserId()}" method="post">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                    <input type="text" name="quantity" value="${cart.getQuantity()}">
                                            </div>
                                        </div>
                                        <input type="submit" value=" Update "/>
                                        </form>
                                    </td>
                                    <td class="cart__price">$ <c:out value="${cart.getProductPrice()*cart.getQuantity()}"/></td>
                                    <td class="cart__close"><a href="/CartServlet?action=delete&id=${cart.getCartId()}&userId=${account.getUserId()}"><span class="icon_close"></span></a></td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="continue__btn">
                                <a href="shop">Continue Shopping</a>
                            </div>
                        </div>
<%--                        <div class="col-lg-6 col-md-6 col-sm-6">--%>
<%--                            <div class="continue__btn update__btn">--%>
<%--                                <a href="#"><i class="fa fa-spinner"></i> Update cart</a>--%>
<%--&lt;%&ndash;                                    <input type="submit" value="Update cart"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <button type="submit">Update cart</button>&ndash;%&gt;--%>
<%--                            </div>--%>
<%--                        </div>--%>
                    </div>
                </div>
                <div class="col-lg-4">
<%--                    <div class="cart__discount">--%>
<%--                        <h6>Discount codes</h6>--%>
<%--                        <form action="#">--%>
<%--                            <input type="text" placeholder="Coupon code">--%>
<%--                            <button type="submit">Apply</button>--%>
<%--                        </form>--%>
<%--                    </div>--%>
                    <div class="cart__total">
                        <h6>Tổng giỏ hàng</h6>
                        <ul>
                            <c:set var = "total" value = "${0}"/>
                            <c:forEach items='${requestScope["carts"]}' var="cart">
                                <span hidden>${total = total + cart.getProductPrice()*cart.getQuantity()}</span>
                            </c:forEach>
                            <li>Tạm tính <span>$ <c:out value = "${total}"/></span></li>
                            <li>Tổng <span>$ <c:out value = "${total}"/></span></li>
                        </ul>
                        <a href="/CheckoutServlet?userId=${account.getUserId()}" class="primary-btn">TIẾN HÀNH THANH TOÁN</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->

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