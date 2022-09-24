<%--
  Created by IntelliJ IDEA.
  User: han
  Date: 2022-09-12
  Time: 5:33 p.m.
  To change this template use File | Settings | File Templates.
--%>

<%--change to bootstrap--%>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    request.setCharacterEncoding("UTF-8");
    String id = (String)session.getAttribute("idKey");
%>
<html>
<head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap demo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

    <header>
        <nav class="navbar navbar-expand-lg bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">VMPC</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Link</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Dropdown
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="VMPC-MemberLogout.jsp"><%=id %>님 로그아웃</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled">Disabled</a>
                        </li>
                    </ul>
                    <form class="d-flex" role="search">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>
    </header>


    <title>회원 가입</title>
    <!-- ID체크 -->
    <link href="VMPC-UI.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="VMPC-MemberApplyCheck.js"></script>
    <script type="text/javascript">
        function idCheck(id) {
            Frm = document.RegFrm;
            if (id == "") {
                alert("Insert your id.");
                Frm.id.focus();
                return;
            }
            url = "VMPC-MemberIdCheck.jsp?id=" + id;
            window.open(url, "IDCheck", "width=300,height=150");
        }




    </script>


</head>

<!-- ID 중복확인  -->
<body background-color="#FFFFCC" onLoad="RegFrm.id.focus()">
<div align="center">
    <br /><br />
    <form name="RegFrm" method="post" action="VMPC-MemberApplyProc.jsp">
        <table class="simple_table2" cellpadding="5">
            <tr>
            <tr>
                <th colspan="3" ><font color="black"><b>회원 가입</b></font></th>
            </tr>,
            <tr>
                <td background-color="#ffffff" width="20%">id</td>
                <td width="50%" bgcolor=#ffffff>
                    <input name="id" size="15">
                    <input type="button" value="여기를 눌러 id 중복확인 " onClick="idCheck(this.form.id.value)">
                </td>
                <td width="30%" background-color=#ffffff>id를 입력해 주세요</td>
            </tr>
            <tr>
                <td bgcolor=#ffffff>비밀번호</td>
                <td bgcolor=#ffffff><input type="password" name="pwd" size="20"></td>
                <td bgcolor=#ffffff>비밀번호를 입력합니다</td>
            </tr>
            <tr>
                <td bgcolor=#ffffff>비밀번호 재입력</td>
                <td bgcolor=#ffffff><input type="password" name="repwd" size="20"></td>
                <td bgcolor=#ffffff>비밀번호가 일치하는지 확인합니다</td>
            </tr>
            <tr>
                <td bgcolor=#ffffff>이름</td>
                <td bgcolor=#ffffff><input name="name" size="15">
                </td>
                <td bgcolor=#ffffff>고객님의 이름을 적어 주세요.</td>
            </tr>
            <tr>
                <td bgcolor=#ffffff>성별</td>
                <td bgcolor=#ffffff>
                    M<input type="radio" name="gender" value="1" checked>
                    F<input type="radio" name="gender" value="2">
                </td>
                <td bgcolor=#ffffff>성별을 입력해 주세요.</td>
            </tr>
            <tr>
                <td bgcolor=#ffffff>생년월일</td>
                <td bgcolor=#ffffff><input name="birthday" size="6">
                    ex)830815</td>
                <td bgcolor=#ffffff>생년월일을 입력해 주세요.</td>
            </tr>
            <tr>
                <td bgcolor=#ffffff>Email</td>
                <td bgcolor=#ffffff><input name="email" size="30">
                </td>
                <td bgcolor=#ffffff>이메일을 입력해 주세요</td>
            </tr>
            <tr>
                <td bgcolor= #ffffff>주소</td>
                <td bgcolor= #ffffff><input name="address" size="45"></td>
                <td bgcolor= #ffffff>주소를 입력해 주세요.</td>
            </tr>
            <tr>
                <td bgcolor=#ffffff>취미</td>
                <td bgcolor=#ffffff>인터넷<input type="checkbox" name="hobby" value="Internet">
                    여행<input type="checkbox" name="hobby" value="travel"> 게임<input
                            type="checkbox" name="hobby" value="game"> 영화 관람<input
                            type="checkbox" name="hobby" value="movie"> 운동<input
                            type="checkbox" name="hobby" value="Exercise">
                </td>
                <td bgcolor=#ffffff>취미를 입력해 주세요.</td>
            </tr>

            <tr>
                <td bgcolor=#ffffff>직업</td>
                <td bgcolor=#ffffff><select name=job>
                    <option value="0" selected>선택
                    <option value="직장인">직장인
                    <option value="연구원">연구원
                    <option value="학생">학생
                    <option value="사장/자영업자/1인기업">사장/자영업자/1인기업
                    <option value="공인">공인
                    <option value="의료계열 종사자">의료계열 종사자
                    <option value="법계 종사자">법계 종사자
                    <option value="아티스트">아티스트
                    <option value="농부">농부
                    <option value="배우자">배우자
                    <option value="없음">없음
                    <option value="기타">
                </select></td>
                <td bgcolor=#ffffff>직업을 선택해 주세요.</td>
            </tr>

            <!-- 신청 -->
            <tr bgcolor=#ffffff>
                <td colspan="3" align="center">
                    <input type="button" value="가입" onClick="inputCheck('REG');">
                    &nbsp; &nbsp;
                    <input type="reset" value="다시 입력">
                    &nbsp; &nbsp;
                    <input type="button" value="로그인" onClick="javascript:location.href='VMPC-MemberLogin.jsp'">
                </td>
            </tr>
        </table>
        </td>
        </tr>
        </table>
    </form>
</div>
</body>
</html>