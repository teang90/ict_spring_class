<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>	
<style type="text/css">
	table {
	margin: auto;
	text-align: center;
	border: 1px solid #eee;
	}

</style>
<script type="text/javascript">

//전체 조회
function select_list(f) {
	f.action="/"; /* 컨트롤러 리스트 메소드에서 시작페이지를 /로 받았기 때문에 */
	f.submit();
}

//회원 검색()
function search(f) {
	f.action="onelist.do";
	f.submit();
}

// 회원 삭제
function del(f) {
	f.action="del.do";
	f.submit();
}

// 회원 한 사람 정보 보기(검색)
function selectone(f) {
	f.action="update.do";
	f.submit();
}

</script>
</head>
<body>
	<div align="center">
		<h3>회원정보 추가</h3>
		<form action="add.do" method="post">
				<table>
					<tbody>	
						<tr>
							<th>아이디</th>
							<td><input type="text" name="id"></td>
						</tr>
						
						<tr>
							<th>비번</th>
							<td><input type="text" name="pw"></td>
						</tr>
						
						<tr>
							<th>이름</th>
							<td><input type="text" name="name"></td>
						</tr>
						
						<tr>
							<th>나이</th>
							<td><input type="text" name="age"></td>
						</tr>
						
						<tr>
							<th>주소</th>
							<td><input type="text" name="addr"></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" value="가입">
				<input type="button" value="전체검색" onclick="select_list(this.form)">
				<input type="button" value="아이디검색" onclick="search(this.form)">
				<input type="button" value="아이디삭제" onclick="del(this.form)">
				<input type="button" value="아이디호출" onclick="selectone(this.form)">
		</form>
	</div>
	
	
	
	
</body>
</html>