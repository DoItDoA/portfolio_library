function CheckUpdate()
{
	var ID = document.getElementById("id");
	var PW = document.getElementById("password");
	var PWC = document.getElementById("password_confirm");
	var PHONE = document.getElementById("phone");
		
	if( !check(/^[a-z|A-Z]/, ID) )
	{
		alert("회원아이디를 영문으로 시작하세요(회원아이디 검사오류)");
		return false;
	}
	
		
	if( !check(/[a-zA-Z0-9]{4,19}/, ID) )
	{
		alert("회원아이디를 최소 4글자 이상 입력하세요(회원아이디 검사오류)");
		return false;
	}
	
		
	if( !check(/^[0-9a-zA-Z|!|@|#|$|%|^|&|*|_|~|?]{8,20}$/, PW) )
	{
		alert("비밀번호는 문자,숫자,특수문자의 조합으로 8자 이상으로 입력해주세요.");
		return false;
	}
	
	if( !check(/[0-9]{1,}/, PW) )
	{
		alert("비밀번호는 문자,숫자,특수문자의 조합으로 8자 이상으로 입력해주세요.");
		return false;
	}
	
	if( !check(/[a-zA-Z]{1,}/, PW) )
	{
		alert("비밀번호는 문자,숫자,특수문자의 조합으로 8자 이상으로 입력해주세요.");
		return false;
	}
	
	if( !check(/[!|@|#|$|%|^|&|*|_|~|?]{1,}/, PW) )
	{
		alert("비밀번호는 문자,숫자,특수문자의 조합으로 8자 이상으로 입력해주세요.");
		return false;
	}
	
	if(PW.value != PWC.value)
	{
		alert("입력하신 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		e.select();
		e.focus();
		return false;
	}
	
	if( !check(/^\d{10,11}$/, PHONE) )
	{
		alert("휴대폰번호를 양식에 맞게 입력해 주십시오.(휴대폰번호 체크 오류)");
		return false;
	}
	
		
	function check(regExp, e)
	{
		if(regExp.test(e.value))
		{
			return true;
		}
		
		e.select();
		e.focus();
		return false;
	
	}			
	
	document.updateMember.submit();
}