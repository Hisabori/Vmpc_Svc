<%
	  // ---------------------------------------------------------------
	  // Program Name	: VPMC 회원로그인 	
	  // Program Design : Han, Jeong-Hun	
	  // Program Update : 2021-12-12
	// ---------------------------------------------------------------  
	%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey");
%>

<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
	<meta name="generator" content="Hugo 0.101.0">
	<title>Signin Template · Bootstrap v5.2</title>

	<link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/sign-in/">
 

 
<title>로그인</title>
<link href="bootstrap.min.css" rel="stylesheet">

	<ul class="nav justify-content-center">
		<li class="nav-item">
			<a class="nav-link active" aria-current="page" href="#">Active</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="#">Link</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="#">Link</a>
		</li>
		<li class="nav-item">
			<a class="nav-link disabled">Disabled</a>
		</li>
	</ul>


	<style>
		.bd-placeholder-img {
			font-size: 1.125rem;
			text-anchor: middle;
			-webkit-user-select: none;
			-moz-user-select: none;
			user-select: none;
		}

		@media (min-width: 768px) {
			.bd-placeholder-img-lg {
				font-size: 3.5rem;
			}
		}

		.b-example-divider {
			height: 3rem;
			background-color: rgba(0, 0, 0, .1);
			border: solid rgba(0, 0, 0, .15);
			border-width: 1px 0;
			box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
		}

		.b-example-vr {
			flex-shrink: 0;
			width: 1.5rem;
			height: 100vh;
		}

		.bi {
			vertical-align: -.125em;
			fill: currentColor;
		}

		.nav-scroller {
			position: relative;
			z-index: 2;
			height: 2.75rem;
			overflow-y: hidden;
		}

		.nav-scroller .nav {
			display: flex;
			flex-wrap: nowrap;
			padding-bottom: 1rem;
			margin-top: -1px;
			overflow-x: auto;
			text-align: center;
			white-space: nowrap;
			-webkit-overflow-scrolling: touch;
		}
	</style>
	<script type="text/javascript" src="SpecSummit.js"></script>
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript">
	function loginCheck() {
		if (document.loginFrm.id.value == "") {
			alert("ID를 입력하세요");
			document.loginFrm.id.focus();
			return;
		}
		if (document.loginFrm.pwd.value == "") {
			alert("비밀번호를 입력하세요");
			document.loginFrm.pwd.focus();
			return;
		}
		document.loginFrm.submit();
	}
</script>
<!-- Custom styles for this template -->
	<link href="signin.css" rel="stylesheet">
</head>
<body class="text-center">

<main class="form-signin w-100 m-auto">
	<form>
		<img class="mb-4" src="bootstrap-5.2.0-examples/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">
		<h1 class="h3 mb-3 fw-normal">사용자 로그인</h1>

		<div class="form-floating">
			<input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
			<label for="floatingInput">아이디</label>
		</div>
		<div class="form-floating">
			<input type="password" class="form-control" id="floatingPassword" placeholder="Password">
			<label for="floatingPassword">비밀번호</label>
		</div>

		<div class="checkbox mb-3">
			<label>
				<input type="checkbox" value="remember-me"> 로그인 정보 저장하기
			</label>
		</div>
		<button class="w-100 btn btn-lg btn-primary"  type="submit"  onClick="loginCheck()>Sign in">로그인</button>
		<p></p>
		<button class="w-100 btn btn-lg btn-primary"  type="submit"  onClick="javascript:location.href='VMPC-MemberApply.jsp'">가입</button>
		<p class="mt-5 mb-3 text-muted">&copy; 2017–2022, 20180786 JEONGHUN HAN</p>
	</form>
</main>


	<div>
		<form name="loginFrm" input type="button" method="post" action="VMPC-MemberLoginProc.jsp">
			<table>
				<tr>
					<td><span style="color:black"> <h4>로그인</h4></span></td>
				</tr>
			</table>
			<table>
				<tr>
					<td><span style="color:black">ID</span></td>
					<td><input name="id"></td>
				</tr>
				<tr>
					<td><span style="color:black">비밀번호</span></td>
					<td><input type="password" name="pwd"></td>
				</tr>
			</table>
			<table>
			 <tr>
					<td colspan="2">
						<div align="right">
							<input type="button"  value="🔒로그인" onClick="loginCheck()
							"></button>&nbsp;
							<input type="button"  value="🛠회원가입" onClick="javascript:location.href='VMPC-MemberApply.jsp'"></button>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>