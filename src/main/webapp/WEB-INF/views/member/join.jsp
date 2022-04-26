<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/member/join.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>

	<div class="wrapper">
		<form action="/member/join/" method="post">
			<div class="wrap">
				<div class="subject">
					<span>회원가입</span>
				</div>
				<div class="id_wrap">
					<div class="id_name">아이디</div>
					<div class="id_input_box">
						<input class="id_input" name="memberId">
					</div>
					<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
					<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
				</div>
				<div class="pw_wrap">
					<div class="pw_name">비밀번호</div>
					<div class="pw_input_box">
						<input class="pw_input" name="memberPw">
					</div>
				</div>
				<div class="pwck_wrap">
					<div class="pwck_name">비밀번호 확인</div>
					<div class="pwck_input_box">
						<input class="pwck_input">
					</div>
				</div>
				<div class="user_wrap">
					<div class="user_name">이름</div>
					<div class="user_input_box">
						<input class="user_input" name="memberName">
					</div>
				</div>
				<div class="mail_wrap">
					<div class="mail_name">이메일</div>
					<div class="mail_input_box">
						<input class="mail_input" name="memberMail">
					</div>
					<div class="mail_check_wrap">
						<div class="mail_check_input_box" id="mail_check_input_box_false">
							<input class="mail_check_input" disabled="disabled">
						</div>
						<div class="mail_check_button">
							<span>인증번호 전송</span>
						</div>
						<div class="clearfix"></div>
						<span id="mail_check_input_box_warn"></span>
					</div>
				</div>
				<div class="address_wrap">
					<div class="address_name">주소</div>
					<div class="address_input_1_wrap">
						<div class="address_input_1_box">
							<input class="address_input_1" name="memberAddr1">
						</div>
						<div class="address_button">
							<span>주소 찾기</span>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="address_input_2_wrap">
						<div class="address_input_2_box">
							<input class="address_input_2" name="memberAddr2">
						</div>
					</div>
					<div class="address_input_3_wrap">
						<div class="address_input_3_box">
							<input class="address_input_3" name="memberAddr3">
						</div>
					</div>
				</div>
				<div class="join_button_wrap">
					<input type="submit" class="join_button" value="가입하기">
				</div>
			</div>
		</form>
	</div>

<script>

var code = "";		//이메일 인증번호 저장을 위한 변수

//아이디 중복검사
	$('.id_input').on("propertychange change keyup paste input", function(){
		var memberId = $('.id_input').val();	//.id_input 에 입력되는 값
		var data = {memberId : memberId};	//컨트롤에 넘길 데이터 이름: 데이터(.id_input 에 입력되는 값)
		
		$.ajax({
			type : "post",
			url : "/member/memberIdChk",
			data : data,
			success: function(result) {
				if(result != 'fail') {
					$('.id_input_re_1').css("display", "inline-block");
					$('.id_input_re_2').css("display", "none");
				} else {
					$('.id_input_re_2').css("display", "inline-block");
					$('.id_input_re_1').css("display", "none");
				}
			}
		});
	});
	
//이메일 인증번호 전송
	$('.mail_check_button').click(function(){
		var email = $(".mail_input").val();
		var checkBox = $(".mail_check_input");
		var boxWrap = $(".mail_check_input_box");
		
		$.ajax({
			type : "GET",
			url : "mailCheck?email=" + email,
			success:function(data){
				checkBox.attr("disabled", false);
				boxWrap.attr("id", "mail_check_input_box_true");
				code = data;		//code 변수에 전송된 인증번호값을 저장
			}
		});
	});

//인증번호 비교
$(".mail_check_input").blur(function(){
	var inputCode = $(".mail_check_input").val();		//인증번호 입력값
	var checkResult = $("#mail_check_input_box_warn");	//인증번호 비교결과
	
	if(inputCode == code) {								//인증번호가 일치
		checkResult.html("인증번호가 일치합니다.");
		checkResult.css("color", "green");
	} else {											//인증번호 불일치
		checkResult.html("인증번호를 다시 확인해주세요");
		checkResult.css("color", "red");
	}
});
	

</script>


</body>
</html>