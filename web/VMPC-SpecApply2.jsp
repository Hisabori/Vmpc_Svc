<%
	  // ---------------------------------------------------------------
	  // Program Name	: VPMC 사양신청 	
	  // Program Design : Han, Jeong-Hun	
	  // Program Update : 2021-12-12
	// ---------------------------------------------------------------  
	%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	  request.setCharacterEncoding("UTF-8");
	  String id = (String)session.getAttribute("idKey");
%>
<html>
<head>
<meta charset="UTF-8">
<title>사양신청</title>
</head>
<body>
	<table cellpadding="5">
		<tr>
			<td bgcolor="#FFFFCC"></td>
				<table border="1" cellspacing="0" cellpadding="2" width="600">
		<tr bgcolor="#996600">
			<td colspan="3"><font color="#FFFFFF">사양 신청</font></td>
		</tr>
		<!-- Def_spec/ctm -->
		<tr>
			<td>사양 선택</td>
			<td>기본<input type="radio" name="def_spec" value="spec/def">
				공유<input type="radio" name="def_spec" value="spec/share">
				고급<input type="radio" name="def_spec" value="spec/premium">
				사용자 정의 사양<input type="radio" name="def_spec" value="spec/custom">
			</td>
			<td>기본 베이스 사양 선택</td>
		</tr>
		<!-- SpcUp -->
		<tr>
			<td>번경 사양 선택</td>
			<td>번경안함<input type="radio" name="custom_info" value="def">
				cpu번경<input type="radio" name="custom_info" value="custom/cpuUp">
				cpu+램 번경<input type="radio" name="custom_info" value="custom/cpu/ramUp">
				램+저장소 번경<input type="radio" name="custom_info" value="custom/ram/spaceUp">
				저장소 번경<input type="radio" name="custom_info" value="custom/spaceUp">
			</td>
		</tr>
		<!-- Cpu_Up -->	
		<tr>
			<td>cpu번경</td>
			<td>기본<input type="radio" name="custom_cpu_info" value="def">
				i3<input type="radio" name="custom_cpu_info" value="Cpu/i3">
				i5<input type="radio" name="custom_cpu_info" value="Cpu/i5">
				i7<input type="radio" name="custom_cpu_info" value="Cpu/i7">
				R3<input type="radio" name="custom_cpu_info" value="Cpu/r3">
				R5<input type="radio" name="custom_cpu_info" value="Cpu/r5">
				R7<Input type="radio" name="custom_cpu_info" value="Cpu/r7">
			</td>
		</tr>
		<!-- Ram_Up -->
		<tr>
			<td>램 번경</td>
			<td>기본	<input type="radio" name="custom_ram_info" value="def">
				램 4g추가	<input type="radio" name="custom_ram_info" value="ram4g/add">
				램 8g추가	<input type="radio" name="custom_ram_info" value="ram8g/add">
				램 16g추가<input type="radio" name="custom_ram_info" value="ram16g/add">
				램 32g추가<input type="radio" name="custom_ram_info" value="ram32g/add">
			</td>
		</tr>
		<!-- Net_Up -->
		<tr>
			<td>인터넷 사양 번경</td>
			<td>기본<input type="radio" name="custom_net_info" value="def">
				고속<input type="radio" name="custom_net_info" value="netUp/Fast">
			</td>
		</tr>
			<td colspan="3" align="center">
				<input type="button" value="사양 신청하기" onclick="inputCheck()">&nbsp;
				<input type="reset" value="신청한 사양 초기화">&nbsp;
				<input type="button" value="위 사양으로 신청하려면 이 버튼을 클릭하세요." onclick="javascript:location.href='VMPC-SpecApplyProc.jsp'">
			</td>
	</table>
		</tr>
	</table>
</body>
</html>