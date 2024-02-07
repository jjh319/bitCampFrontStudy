// window.onload=function(){} => javascript 방식
//jQuery 방식
$(function(){
    $('#join').submit(function(){
        //user_id 변수 지정
        var user_id = $('input[name="user_id"]').val();  //val()::밸류값 함수
        //만약 user_id에 값이 있으면 T, 없으면 F :: 유효성 검사
        if(!user_id){
            alert("아이디를 입력하세요.");
            $('input[name="user_id"]').focus();
            return false;
        }

        //user_pw 변수 지정
        var user_pwd = $('input[name="user_pwd"]').val();
        //만약 user_pw에 값이 있으면 T, 없으면 F
        if(!user_pwd){
            alert("비밀번호를 입력하세요.");
            $('input[name="user_pw"]').focus();
            return false;
        }

        //gender 변수 지정
        var gender = $('input[name="gender"]');
        //gender 선택을 하지 않았다면
        if(!gender.is(':checked')){
            alert("성별을 선택하세요.")
            
            //radio는 배열로 받는다
            // document.form1.gender[0].checked = true; javascript 방식
            $(gender)[0].checked = true;
        }

        //email 변수 지정
        var email = $('input[name="email"]').val();
        //email에 값이 없으면 alert, focus
        if(!email){
            alert("이메일을 입력하세요.");
            $(email).focus();
            return false;
        }

        //url에 변수 지정
        var url = $('input[name=url]').val();
        //url에 값이 없으면 alert, focus
        if(!url){
            alert("url을 입력하세요.");
            $(url).focus();
            return false;
        }

        //phone에 변수 지정
        var phone = $('input[name="phone"').val();
        //phone에 값이 없으면 alert, focus
        if(!phone){
            alert("전화번호를 입력하세요.");
            $(phone).focus();
            return false;
        }

        //hobby에 변수 지정
        var hobby = $('input[name="hobby"]');
        //hobby에 선택이 없다면 alert
        if(!hobby.is(':checked')){
            alert("취미를 선택하세요");
            
            //농구가 선택되도록 설정
            $(hobby)[1].checked=true;
            // $('input[name="hobby"]:eq(1)').attr('checked',true);
            return false;
        }

        var job = $('select[name="job"]');
        if($(job).children('option:first-child').is(':selected')){ 
            alert("직업을 선택하세요");

            $(job).children('option:eq(1)').selected=true;
            return false;
        }

        //입력한 내용을 화면에 출력

        
        var gender = $('input[name="gender"]:checked').val();
        var hobby = $('input[name="hobby"]:checked');
        
        var hobby_val = '';
        
        hobby.each(function(){
            hobby_val += $(this).val();//hobby_val = hobby_val + $(this).val;
        }); // 반복문의 역할을 한다


        var job = $('select[name="job"] > option:selected').val();

        var result = '<ul>'
                    + '<li> 아이디 : ' + user_id + '</li>'
                    + '<li> 비밀번호 : ' + user_pwd + '</li>'
                    + '<li> 성별 : ' + gender + '</li>'
                    + '<li> 이메일 : ' + email + '</li>'
                    + '<li> 홈페이지 : ' + url + '</li>'
                    + '<li> 핸드폰 : ' + phone + '</li>'
                    + '<li> 취미 : ' + hobby_val + '</li>'
                    + '<li> 직업 : ' + job + '</li>'
                    + '</ul>';

        
        var result2 = `<ul>
                    <li> 아이디 :  `+ user_id + `</li>
                    <li> 비밀번호 : ` + user_pwd + `</li>
                    <li> 성별 :  `+ gender + `</li>
                    <li> 이메일 :  `+ email +` </li>
                    <li> 홈페이지 : ` + url + `</li>
                    <li> 핸드폰 : ` + phone + `</li>
                    <li> 취미 : ` + hobby_val + `</li>
                    <li> 직업 :  `+ job + `</li>
                    </ul>`;  


        $('body').html(result2);

        return false;
    }); // form태그 끝에 submit이 있기 때문
    
 });

// $(function(){
//     $('#join').submit(function(){
//         var user_id = $('input[name="user_id"]').val()
//         if(!user_id) {
//             alert("아이디 입력하세요");
//             $('input[name="user_id"]').focus();
//             return false;
//         }

//         var user_pwd = $('input[name="user_pwd"]').val()
//         if(!user_pwd) {
//             alert("비밀번호 입력하세요");
//             $('input[name="user_pwd"]').focus();
//             return false;
//         }

//         if(!$('input[name="gender"]').is(':checked') ){
//             alert('성별을 입력하세요')
//             //radio는 배열로받음
//             //document.form1.gender[0] = true; or
//             $('input[name="gender"]:eq(1)').attr('checked',true);
//             return false;
//         }

//         var email = $('input[name="email"]').val()
//         if(!email) {
//             alert("email를 입력하세요");
//             $('input[name="email"]').focus();
//             return false;
//         }

//         var url = $('input[name="url"]').val()
//         if(!url) {
//             alert("URL을 입력하세요");
//             $('input[name="url"]').focus();
//             return false;
//         }

//         var phone = $('input[name="phone"]').val()
//         if(!phone) {
//             alert("핸드폰 번호를 입력하세요");
//             $('input[name="phone"]').focus();
//             return false;
//         }

//         if(!$('input[name="hobby"]').is(':checked') ){
//             alert('취미를 입력하세요');
//             //radio는 배열로받음
//             //document.form1.hobby[0] = true; or
//             $('input[name="hobby"]:eq(1)').attr('checked',true);
//             return false;
//         }

//         if( $('select[name="job"] > option:selected').index() == 0){ //맨처음 선택(선택하세요)되어있으면
//             alert("직업을 선택하세요");
//             $('select[name="job"] > option:eq(1)').attr('selected', true);
//             return false;
//         }

//         //입력한 내용을 화면에 출력

//         var gender = $('input[name="gender"]:checked').val();

//         var hobby = $('input[name="hobby"]:checked'); 
//         var hobby_val = '';
//         hobby.each(function(){
//             hobby_val += $(this).val();//hobby_val = hobby_val + $(this).val;
//         });

//         var job = $('select[name="job"] > option:selected').val();

//         var result = '<ul>'
//                     + '<li> 아이디 : ' + user_id + '</li>'
//                     + '<li> 비밀번호 : ' + user_pwd + '</li>'
//                     + '<li> 성별 : ' + gender + '</li>'
//                     + '<li> 이메일 : ' + email + '</li>'
//                     + '<li> 홈페이지 : ' + url + '</li>'
//                     + '<li> 핸드폰 : ' + phone + '</li>'
//                     + '<li> 취미 : ' + hobby_val + '</li>'
//                     + '<li> 직업 : ' + job + '</li>'
//                     + '</ul>';
                    
//         var result2 = `<ul>
//                      <li> 아이디 :  `+ user_id + `</li>
//                      <li> 비밀번호 : ` + user_pwd + `</li>
//                      <li> 성별 :  `+ gender + `</li>
//                      <li> 이메일 :  `+ email +` </li>
//                      <li> 홈페이지 : ` + url + `</li>
//                      <li> 핸드폰 : ` + phone + `</li>
//                      <li> 취미 : ` + hobby_val + `</li>
//                      <li> 직업 :  `+ job + `</li>
//                      </ul>`;             

//         $('body').html(result);

//         return false;

//     });
// });