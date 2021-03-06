<%--
  Created by IntelliJ IDEA.
  User: Le Minh Duc
  Date: 09/04/2021
  Time: 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Bootstrap Simple Login Form</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    <style>
        .divider-text {
            position: relative;
            text-align: center;
            margin-top: 15px;
            margin-bottom: 15px;
        }
        .divider-text span {
            padding: 7px;
            font-size: 12px;
            position: relative;
            z-index: 2;
        }
        .divider-text:after {
            content: "";
            position: absolute;
            width: 100%;
            border-bottom: 1px solid #ddd;
            top: 55%;
            left: 0;
            z-index: 1;
        }

        .btn-facebook {
            background-color: #405D9D;
            color: #fff;
        }
        .btn-twitter {
            background-color: #42AEEC;
            color: #fff;
        }
    </style>
</head>
<body>
<form action="/RegisterServlet" class="needs-validation" onsubmit="return removeSpace()" novalidate method="post">
    <div class="card bg-light">
        <article class="card-body mx-auto" style="max-width: 400px;">
            <h4 class="card-title mt-3 text-center">????ng k?? t??i kho???n</h4>
            <div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                </div>
                <input name="userName" class="form-control" placeholder="H??? v?? t??n" type="text"
                       pattern="^[a-zA-Z??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????\\s|_ ]+$"
                       required="" id="userName"  maxlength="30">
                <div class="invalid-feedback" id="invalid-name">
                    T??n b???n nh???p ch??a ????ng!
                </div>
            </div> <!-- form-group// -->
            <div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                </div>
                <input name="email" class="form-control" placeholder="?????a ch??? Email" type="email"  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required="">
                <div class="invalid-feedback">
                    Email b???n nh???p ch??a ????ng!
                </div>
            </div> <!-- form-group// -->
            <div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
                </div>
                <input name="phone" class="form-control" placeholder="S??? ??i???n tho???i" type="tel" pattern="[0]{1}[1-9]{9}" required >
                <div class="invalid-feedback">
                    S??? ??i???n tho???i b???n nh???p ch??a ????ng!
                </div>
            </div> <!-- form-group// -->
            <div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"> <i class="fa fa-road"></i> </span>
                </div>
                <input name="address" class="form-control" placeholder="?????a ch???" type="address" required>
                <div class="invalid-feedback">
                    ?????a ch??? b???n nh???p ch??a ????ng
                </div>
            </div> <!-- form-group end.// -->
            <div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                </div>
                <input name="password" class="form-control" placeholder="M???t kh???u" type="password" required>
                <div class="invalid-feedback">
                    H??y ??i???n ?????y ????? m???t kh???u !
                </div>
            </div> <!-- form-group// -->
            <div class="form-group">
                <button type="submit" class="btn btn-primary btn-block">T???o t??i kho???n </button>
            </div> <!-- form-group// -->
            <p class="text-center">B???n ???? c?? t??i kho???n? <a href="login.jsp">????ng nh???p</a> </p>
        </article>
    </div>
</form>

</div>
<script>
    function removeSpace(){
        var string = document.getElementById("userName").value;
        string = string.replace(/\s+/g, " ");
        document.getElementById("userName").value = string.trim();
        console.log( document.getElementById("userName").value);
        return true;
    }


    (function () { // effect validation bootstrap
        'use strict'
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.querySelectorAll('.needs-validation')

        // Loop over them and prevent submission
        Array.prototype.slice.call(forms).forEach(function (form) {
            form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                    event.preventDefault() // ???????c s??? d???ng ????? ng??n ch???n x??? l?? m???c ?????nh c???a tr??nh duy???t khi x???y ra s??? ki???n.
                    event.stopPropagation() //???????c s??? d???ng ????? ng??n kh??ng cho s??? ki???n lan to??? l??n c??c ph???n t??? cha c???a ph???n t??? di???n ra s??? ki???n.
                }
                form.classList.add('was-validated')
            }, false)
        })
    })()

</script>
</body>
</html>