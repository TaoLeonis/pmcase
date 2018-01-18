<%@ include file="../common/IncludeHead.jsp"%>
            <link href="../css/SignonForm.css" rel="stylesheet">
<%--<%@ include file="../common/IncludeNavbar.jsp"%>--%>
</head>

<body>
<div id="Content">
        <div id="Catalog">           	        
            <div class="container">
                <form class="form-signin" action='${pageContext.request.contextPath}/account/signon' method="POST">
                    <div id="sign"><span id="sign1">请登录 </span>        	
                   		<c:if test="${not empty param.error}">
			                    <span id="sign2" class="alert-error alert-heading">登录失败!</span>
			                  <%--   ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message} --%>
           				</c:if>
                    </div>  
                    <div id="label">
                    	<label for="j_username" class="sr-only">用户名</label>
                    	<input type="text" id="j_username" name='j_username' class="form-control" placeholder="用户名" required autofocus>
                    </div>    
                    <div id="label">
                    	<label for="j_password" class="sr-only">密码</label>
                    	<input type="password" id="j_password" name='j_password' class="form-control" placeholder="密码" required> 
                    </div>            
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" id="remember_me" name="remember-me"> 记住我
                        </label>
                    </div>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
                    <div class="register">新用户? <a href="${pageContext.request.contextPath}/account/newAccountForm">立即注册!</a></div>
                </form>
            </div> <!-- /container -->
            
    </div>
</div>

<%@ include file="../common/IncludeJsVendor.jsp"%>
</body>
</html>