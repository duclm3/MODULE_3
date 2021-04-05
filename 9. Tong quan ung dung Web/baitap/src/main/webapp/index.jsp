<%--
  Created by IntelliJ IDEA.
  User: Le Minh Duc
  Date: 05/04/2021
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  </head>
  <body>
    <form method="post" action="/ServletDiscount"  style="width: 500px">
      <div class="form-group">
        <label for="formGroupExampleInput">Product Description</label>
        <input type="text" class="form-control" id="formGroupExampleInput" name="prodescription">
      </div>
      <div class="form-group">
        <label for="formGroupExampleInput2">List Price</label>
        <input type="number" class="form-control" id="formGroupExampleInput2" name="listprice">
      </div>
      <div class="form-group">
        <label for="formGroupExampleInput2">Discount Percent</label>
        <input type="number" class="form-control" id="formGroupExampleInput3" name="discountpercent">
      </div>
      <button type="submit" class="btn btn-primary">Calculate Discount</button>
    </form>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
  </body>
</html>
