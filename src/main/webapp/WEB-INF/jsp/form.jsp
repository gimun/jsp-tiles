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
    나이 : <input type="text" id="year" name="year" value="31"/>&nbsp;
    커피 :
    <select name="coffee" id="coffee">
        <option value="0">아메리카노</option>
        <option value="1" selected>카페라떼</option>
        <option value="2">카페모카</option>
    </select>

    <div class="custom-file">
        <input type="file" class="custom-file-input" name="uploadFile" id="uploadFile" alt="" data-display-target="uploadFileLabel" required />
        <label class="custom-file-label" for="uploadFile" id="uploadFileLabel" data-browse="찾아보기">이미지 업로드 파일 선택</label>
    </div>

    메모<br />
    <textarea name="memo" id="memo" cols="50" rows="10">테스트</textarea>
</form>
<input type="button" onclick="fn_reset();" value="초기화"/>&nbsp;&nbsp;
<input type="button" onclick="fn_save();" value="저장"/>

<script>
    $.fn.serializeObject = function() {
        "use strict"
        var result = {}
        var extend = function(i, element) {
            var node = result[element.name]
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

    var originalFormData;

    $(document).ready(function () {
        console.log("ready!");
        originalFormData = $('#form').serializeObject();
    });

    // name 과 id 속성의 이름이 같아야 한다.
    // 사용 가능 Tag : input, select, textarea
    // 사용 불가 Tag : radio
    function fn_reset() {
        var changedFormData = $('#form').serializeArray();

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
        var isChanged = new Boolean(false);
        var changedFormData = $('#'+formId).serializeArray();

        jQuery.each(changedFormData, function(idx, item){
            if(originalFormData[item.name] !== item.value){
                isChanged = true;
            }
        });

        return isChanged;
    }

    $("#uploadFile").change(function () {
        var file = $(this).val().split('\\').pop();
        file = file.substring(file.lastIndexOf(".") + 1).toLowerCase();
        console.log(file);
        if ($.inArray(file, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {
            jsAlert.alert("알림", "gif, png, jpg, jpeg 의 파일만 등록 가능합니다.", $(this));
            $(this).val("");
        }else{
            var o = $(this).parent().parent();
            var id = $(this).attr('id');
            var file = document.getElementById(id).files[0];
            console.log(o);
            console.log(id);
            console.log(file);
            var reader = new FileReader();
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
