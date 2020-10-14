<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Index Page</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script>
        let prodList = new Array();
        let prodMap = new Map();
        <c:forEach var="i" items="${data}">
            prodMap.set('${i.prod}', ${i.price});
        </c:forEach>
        console.log("********** TEST **********");
        console.log(prodMap);
        $(document).ready(function () {
            $("#test1").on("input", function(){
                var checkAmount = $("#test1").val();
                checkAmount = checkAmount.replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,''); //한글지우기
                checkAmount = removeComma(checkAmount);

                if(checkAmount == ""){
                    checkAmount = 0;
                }
                if(checkAmount[0] == 0 && checkAmount[1] != "."){
                    checkAmount = parseFloat(checkAmount);
                }
                if(checkAmount >= 1000){
                    checkAmount = makeComma(checkAmount);
                }
                $("#test1").val(checkAmount);
            });

            $("#test1").keyup(function () {
                var test1 = removeComma($("#test1").val());
                $("#test1").val(makeComma(test1));
                fn_cal_tot();
            });

            $("#test2").keyup(function () {
                fn_cal_tot();
            });


        });

        function fn_cal_tot(){
            var num1 = ($("#test1").val() != null) ? Number($("#test1").val()) : 0;
            var num2 = ($("#test2").val() != null) ? Number($("#test2").val()) : 0;
            var num3 = (prodMap.get('상품_5') != null) ? prodMap.get('상품_5') : 0;
            console.log(num1);
            console.log(num2);
            console.log(num3);
            $("#test3").val(num1 * num2 * num3);
        }

        function isAmountKey(evt){
            var charCode = (evt.which) ? evt.which : event.keyCode;
            if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)){
                return false;
            }
            // Textbox value
            var _value = removeComma(event.srcElement.value);

            // 소수점(.)이 두번 이상 나오지 못하게
            var _pattern0 = /^\d*[.]\d*$/; // 현재 value값에 소수점(.) 이 있으면 . 입력불가
            if (_pattern0.test(_value)) {
                if (charCode == 46) {
                    return false;
                }
            }
            var _pattern2 = getStorage("coinId") == "TUSD" ? /^\d*[.]\d{5}$/ : /^\d*[.]\d{9}$/;
            if (_pattern2.test(_value)) {
                var text = document.getSelection();
                if(text.toString() == ""){
                    return false;
                }
            }
            return true;
        }

        //3자리 콤마
        function makeComma(val) {
            var str = String(val);
            var minusCheck = false;
            if(val < 0){
                str = str.replace("-","");
                minusCheck = true;
            }
            var _pattern0 = /^\d*[.]\d*$/; // 현재 value값에 소수점(.) 이 있으면
            if (_pattern0.test(str)) {
                str = str.split(".")[0].replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,') +"."+str.split(".")[1];
            } else {
                str = str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
            }
            if(minusCheck) str = "-"+str;
            return str;
        }

        //콤마풀기
        function removeComma(str) {
            str = String(str);
            return str.replace(/,/g, '');
        }


    </script>
</head>
<body>

    <input type="text" name="test1" id="test1" /><br/><br/>
    <input type="text" name="test2" id="test2" /><br/><br/>
    <input type="text" name="test3" id="test3" />

    <table border="1">
            <th>상품</th>
            <th>가격</th>
        <c:forEach var="i" items="${data}">
            <tr>
                <td>${i.prod}</td>
                <td>${i.price}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>