$(function() {
    $('#join').submit(function() {
        var user_id = $('input[name="user_id"]').val();
        var user_pw = $('input[name="user_pw"]').val();

        if(!user_id) {
            alert("아이디를 입력하세요.");
            $('input[name="user_id"]').focus();
            return false;
        } // if

        if(!user_pw) {
            alert("비밀번호를 입력하세요.");
            $('input[name="user_pw"]').focus();
            return false;
        } // if

        if( !$('input[name="gender"]').is(':checked') ) {
            alert("성별을 입력하세요.")

            //radio는 배열로 받는다.
            // document.form1.gender[0].checked = true;
            $('input[name="gender"]:eq(0)').attr('checked',true)

        } // if

        var email = $('input[name="email"]').val();
        if(!email) {
            alert("이메일을 입력하세요.");
            $('input[name="email"]').focus();
            return false;
        } // if

        var url = $('input[name="url"]').val();
        if(!url) {
            alert("URL을 입력하세요.");
            $('input[name="url"]').focus();
            return false;
        } // if

        var phone = $('input[name="phone"]').val();
        if(!phone) {
            alert("핸드폰 번호를 입력하세요.");
            $('input[name="phone"]').focus();
            return false;
        } // if

        
        if( !$('input[name="hobby"]').is(':checked') ) {
            alert("취미를 선택하세요.")
            $('input[name="hobby"]:eq(1)').attr('checked',true)

            return false;
        } // if

        if( $('select[name="job"] > option:selected').index() == 0 ) {
            alert("직업을 선택하세요.")

            $('select[name="job"] > option:eq(1)').attr('selected', true)
            return false;
        } // if

        
        // 입력한 내용을 화면에 출력
        var gender = $('input[name="gender"]:checked').val();
        


        return false;
    });

});