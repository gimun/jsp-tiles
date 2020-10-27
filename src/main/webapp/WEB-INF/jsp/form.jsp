<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Index Page</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<br/>
<form name="form" id="form" method="post" action="/test_reg">
    이름 : <input type="text" id="name" name="name" value="한기문"/> <br/>
    나이 : <input type="text" id="year" name="year" value="31" numberOnly />&nbsp;<br/>
    버전 : <input type="text" id="version" name="version" value=""  /><br/>
    커피 :
    <select name="coffee" id="coffee">
        <option value="0">아메리카노</option>
        <option value="1" selected>카페라떼</option>
        <option value="2">카페모카</option>
    </select>
    <br/>
    <div class="custom-file">
        <input type="file" class="custom-file-input" name="uploadFile" id="uploadFile" alt="" data-display-target="uploadFileLabel" required />
        <label class="custom-file-label" for="uploadFile" id="uploadFileLabel" data-browse="찾아보기">이미지 업로드 파일 선택</label>
    </div>

    메모<br />
    <textarea name="memo" id="memo" cols="50" rows="10">테스트</textarea>
</form>
<input type="button" onclick="fn_reset();" value="초기화"/>&nbsp;&nbsp;
<input type="button" onclick="fn_save();" value="저장"/>
<input type="button" onclick="fn_check();" value="포멧 확인"/>

<script>
    $(document).ready(function () {
        console.log("ready!");
        originalFormData = $('#form').serializeObject();

        $("input:text[numberOnly]").on("keyup", function() {
            $(this).val($(this).val().replace(/[^0-9]/g,""));
        });
        //숫자만 체크 정규식
        // var regExp = /^[0-9]+$/;
    });

    function fn_check() {
        let year = $("#year").val();
        let version = $("#version").val();

        if(only_number_format_check(year)) {
            alert("숫자만 입력 가능해요!!");
        }

        if(version_format_check(version)) {
            alert("버전 포멧 확인해요!!");
        }
    }

    // 포멧이 맞으면 false, 잘못된 포멧이면 true
    function only_number_format_check(number) {
        let isCheck = false;

        let regExp = /^[0-9]+$/;
        if(!regExp.test(number)) {
            isCheck = true;
        }

        return isCheck;
    }

    // 포멧이 맞으면 false, 잘못된 포멧이면 true
    function version_format_check(version) {
        let isCheck = false;

        let regExp = /^(?:(?:[0-9]?[0-9][0-9]?)\.){2}(?:[0-9]?[0-9][0-9]?)$/;
        if(!regExp.test(version)) {
            isCheck = true;
        }

        return isCheck;
    }

    $.fn.serializeObject = function() {
        "use strict"
        let result = {}
        let extend = function(i, element) {
            let node = result[element.name]
            if ("undefined" !== typeof node && node !== null) {
                if ($.isArray(node)) {
                    node.push(element.value);
                } else {
                    result[element.name] = [node, element.value];
                }
            } else {
                result[element.name] = element.value;
            }
        }

        $.each(this.serializeArray(), extend);
        return result;
    }

    let originalFormData;



    // name 과 id 속성의 이름이 같아야 한다.
    // 사용 가능 Tag : input, select, textarea
    // 사용 불가 Tag : radio
    function fn_reset() {
        let changedFormData = $('#form').serializeArray();

        jQuery.each(changedFormData, function(idx, item){
            //var tagName = $("#"+item.name).prop('tagName');
            //console.log(tagName);
            $("#"+item.name).val(originalFormData[item.name]);
        });
    }

    function fn_save() {
        if(fn_form_change_check('form') === true){
            alert("변했어요!!!");
            return;
        }

        console.log("************** 페이지 이동 **************");
        $("#form").submit();
    }



    // name 속성 필수
    // 변화된 값이 있으면 true, 없으면 false
    function fn_form_change_check(formId){
        let isChanged = new Boolean(false);
        let changedFormData = $('#'+formId).serializeArray();

        jQuery.each(changedFormData, function(idx, item){
            if(originalFormData[item.name] !== item.value){
                isChanged = true;
            }
        });

        return isChanged;
    }

    $("#uploadFile").change(function () {
        let file = $(this).val().split('\\').pop();
        file = file.substring(file.lastIndexOf(".") + 1).toLowerCase();
        if ($.inArray(file, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {
            jsAlert.alert("알림", "gif, png, jpg, jpeg 의 파일만 등록 가능합니다.", $(this));
            $(this).val("");
        } else {
            let o = $(this).parent().parent();
            let id = $(this).attr('id');
            let file = document.getElementById(id).files[0];
            let reader = new FileReader();
            console.log(reader);
            // reader.onload = function (e) {
            //     $(o).css('background-image', 'url(\"' + e.target.result + '\")');
            // }
            reader.readAsDataURL(file);
        }

        return false;
    });

</script>
</body>
</html>
