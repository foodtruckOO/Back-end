<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${WHERE eq 'REGISTER' }">
		<c:if test="${isFirst eq 'Y'}">
			<c:set var="SUC_MSG" value="회원가입에 성공했습니다. 첫 가입자이므로 자동으로 마스터 권한이 부여됩니다"/>
		</c:if>
		<c:if test="${isFirst eq 'N'}">
			<c:set var="SUC_MSG" value="회원가입에 성공했습니다. 마스터 관리자의 승인 전 까지는 접속이 불가능하니 마스터 관리자에게 문의하세요"/>
		</c:if>
		<c:if test="${DUPLE eq 'YES'}">
			<c:set var="FAIL_MSG" value="아이디가 중복되었습니다."/>
		</c:if>
		<c:if test="${DUPLE eq 'NO' }">
			<c:set var="FAIL_MSG" value="화원가입에 실패했습니다."/>
		</c:if>
		<c:set var="SUC_URL" value="/Back/Login.do"/>
	</c:when>
	<c:when test="${WHERE eq 'USEREDIT'}">
		<c:set var="SUC_MSG" value="계정 정보 수정 성공"/>
		<c:set var="FAIL_MSG" value="계정 정보 수정 실패"/>
		<c:set var="SUC_URL" value="/Back/UserList.do?user=admin"/>
	</c:when>
	<c:when test="${WHERE eq 'CUSTOMEREDIT'}">
		<c:set var="SUC_MSG" value="수정 성공"/>
		<c:set var="FAIL_MSG" value="수정 실패"/>
		<c:set var="SUC_URL" value="/Back/UserList.do?user=customer"/>
	</c:when>
	<c:when test="${WHERE eq 'SELLEREDIT'}">
		<c:set var="SUC_MSG" value="수정 성공"/>
		<c:set var="FAIL_MSG" value="수정 실패"/>
		<c:set var="SUC_URL" value="/Back/UserList.do?user=seller"/>
	</c:when>
	<c:when test="${WHERE eq 'EVENTWRITE'}">
		<c:set var="SUC_MSG" value="글 작성 성공"/>
		<c:set var="FAIL_MSG" value="글 작성 실패"/>
		<c:set var="SUC_URL" value="/Back/Board.do?type=admin&board=${boardtype}"/>
	</c:when>
	<c:when test="${WHERE eq 'EVENTEDIT'}">
		<c:set var="SUC_MSG" value="글 수정 성공"/>
		<c:set var="FAIL_MSG" value="글 수정 실패"/>
		<c:set var="SUC_URL" value="/Back/EventView.do?eno=${eno}"/>
	</c:when>
	<c:when test="${WHERE eq 'EVENTDELETE'}">
		<c:set var="SUC_MSG" value="글 삭제 성공"/>
		<c:set var="FAIL_MSG" value="글 삭제 실패"/>
		<c:set var="SUC_URL" value="/Back/Board.do?type=admin&board=1"/>	
	</c:when>
	<c:when test="${WHERE eq 'NOMEMBERREGISTER'}">
		<c:set var="SUC_MSG" value="등록 성공"/>
		<c:set var="FAIL_MSG" value="등록 실패"/>
		<c:set var="SUC_URL" value="/Back/NoMemberRegister.do"/>	
	</c:when>
	<c:when test="${WHERE eq 'NOMEMBEREDIT'}">
		<c:set var="SUC_MSG" value="수정 성공"/>
		<c:set var="FAIL_MSG" value="수정 실패"/>
		<c:set var="SUC_URL" value="/Back/Map.do"/>	
	</c:when>
	<c:when test="${WHERE eq 'TRUCKDELETE'}">
		<c:set var="SUC_MSG" value="삭제 성공"/>
		<c:set var="FAIL_MSG" value="삭제 실패"/>
		<c:set var="SUC_URL" value="/Back/Map.do"/>	
	</c:when>		

	<c:otherwise>
		<c:set var="SUC_MSG" value="계정 삭제 성공"/>
		<c:set var="FAIL_MSG" value="계정 삭제 실패"/>
		<c:set var="SUC_URL" value="/Back/UserList.do"/>
	</c:otherwise>
</c:choose>

<script>
	<c:choose>
		<c:when test="${SUC_FAIL == 1}">
			alert("${SUC_MSG }");
			location.replace("<c:url value='${SUC_URL}'/>");
		</c:when>
		<c:when test="${SUC_FAIL == 0}">
			alert("${FAIL_MSG }");
			history.back();	
		</c:when>
	</c:choose>
</script>