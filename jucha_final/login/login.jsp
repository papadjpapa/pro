<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/newLoginThemeCSS.css" />
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
   <!--  <div class="fadeIn first">
      <img src="http://danielzawadzki.com/codepen/01/icon.svg" id="icon" alt="User Icon" />
    </div> -->

    <!-- Login Form -->
    <form action="<%=request.getContextPath()%>/login/loginPro.jsp">
      <input type="text" id="login" class="fadeIn second" name="id" placeholder="id">
      <input type="text" id="password" class="fadeIn third" name="pw" placeholder="password">
      <input type="submit" class="fadeIn fourth" value="Log In">
    </form>

    <!-- Remind Passowrd -->
    <div id="formFooter">
     <!--  <a class="underlineHover" href="#">Forgot Password?</a> -->
    </div>

  </div>
</div>