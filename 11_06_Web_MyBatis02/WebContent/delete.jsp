<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제화면</title>
<style type="text/css">
	a {text-decoration: none;}
	table {width: 500px; border-collapse: collapse; }
	table, th, td {border:  1px solid black; padding: 3px;}
	table{text-align: center;}
	th{background-color: skyblue}
</style>
<script type="text/javascript">
	function delete_go(f) {
		var pwd1 = "${onelist.pwd}";
		var pwd2 = f.pwd.value;
		if(pwd1 != pwd2){
			alert("패스워드가 틀림");
			f.pwd.value="";
			f.pwd.focus();
			return;
		}else{
			var chk = confirm("정말 삭제할까요?");
			if(chk){
				f.action="delete_ok.jsp";
				f.submit();
			}else{
				f.action="onelist.jsp?idx=${onelist.idx}";
				f.submit();
			}
		}
	}
</script>
</head>
<body>
	<div align="center">
		<h2>방명록 : 삭제화면</h2>
		<hr />
		<p>[<a href="list.jsp">목록으로 이동</a>]</p>
		<form method="post">
			<table>
				<tbody>
					<tr align="center">
					    <td bgcolor="#99ccff"> 비밀번호 </td>
					    <td><input type="password" name="pwd" size="20"/></td>
					</tr>
				</tbody>
				<tfoot>
					<tr align="center">
						<td colspan="2"> 
							<input type="button" value="삭제" onclick="delete_go(this.form)" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="reset" value="취소" />
							<input type="hidden" name="idx" value="${onelist.idx }" />
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>