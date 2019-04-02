<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원 정보 삽입 </title>
<style type="text/css">
	table { width:  70%;}
	table, th, td {border: 1px solid black ;text-align: center;}
	th { background-color: skyblue; }
</style>
<script type="text/javascript">
    // 회원가입
	function add_go(f) {
		f.action="add.do";
		f.submit();
	}
    // 전체회원
	function all_go(f) {
		f.action="/";
		f.submit();
	}
    // 아이디검색
	function select_go(f) {
		f.action="onelist.do";
		f.submit();
	}
    // 아이디삭제
	function delete_go(f) {
		f.action="delete.do";
		f.submit();
	}
    // 아이디호출
	function update_go(f) {
		f.action="update.do";
		f.submit();
	}
</script>
</head>
<body>
	<div align="center">
		<h1> 회원 정보 삽입 </h1>
		<form method="post">
			<table>
				<tbody>
					<tr>
						<th>번 호</th>
						<td><input type="number" name="no" size="20" /> </td>
					</tr>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="id" size="20" /> </td>
					</tr>
					<tr>
						<th>비  번</th>
						<td><input type="text" name="pw" size="20" /> </td>
					</tr>
					<tr>
						<th>이  름</th>
						<td><input type="text" name="name" size="20" /> </td>
					</tr>
					<tr>
						<th>나  이</th>
						<td><input type="text" name="age" size="20" /> </td>
					</tr>
					<tr>
						<th>주  소</th>
						<td><input type="text" name="addr" size="20" /> </td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<input type="button"  value="회원가입" onclick="add_go(this.form)" />
							<input type="button"  value="전체검색" onclick="all_go(this.form)" />
							<input type="button"  value="아이디_검색" onclick="select_go(this.form)" />
							<input type="button"  value="아이디_삭제" onclick="delete_go(this.form)" />
							<input type="button"  value="아이디_호출" onclick="update_go(this.form)" />
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>