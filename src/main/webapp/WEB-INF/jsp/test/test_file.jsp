<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    span {
        margin-right: 10px;
    }

    .fileName {
        margin-top: 30px;
        margin-bottom: 30px;
    }
</style>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
    const fileBuffer = [];
    $(document).ready(function () {
        $('.uploadFile').change(function(){
            const fileList = document.getElementsByName('uploadFile');
            console.log("******************** forEach!! ********************");
            fileBuffer.length = 0 ; // 파일 배열 초기화
            $.each(fileList, function (idx, fileTag) {
                if(fileTag.files[0] != null){
                    fileBuffer.push(fileTag.files[0]);
                }
            });
            console.log();
            fn_draw_fileNames();
            //Array.prototype.push.apply(fileBuffer, target[0].files);
        });
    });

function fn_add_file() {
    console.log("************* 추가요~ *************");
}

function fn_del_file() {
    console.log("************* 삭제요~ *************");
}
function fn_draw_fileNames(){
    console.log("******************** fn_draw_fileNames!! ********************");
    $("#fileNames").empty();
    let fileNamesTag = "";
    $.each(fileBuffer, function (index, file) {
        fileNamesTag += "<span>"+file.name+"</span>";
    });
    $("#fileNames").append(fileNamesTag);
}
</script>

<div class="fileName" id="fileNames">
    <p>No files selected!</p>
</div>

<div id="fileArea">
    <input type="file" class="uploadFile" name="uploadFile" id="uploadFile1" />
    <input type="button" onclick="fn_add_file();" value="추가"/> <input type="button" onclick="fn_del_file();" value="삭제"/><br/><br/>
    <input type="file" class="uploadFile" name="uploadFile" id="uploadFile2" /><br/><br/>
    <input type="file" class="uploadFile" name="uploadFile" id="uploadFile3" />
</div>


<br><br><br><br>