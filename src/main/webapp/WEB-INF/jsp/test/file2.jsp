<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<style>
    .itemBox {
        border:solid 1px black;
        width:200px;
        height:130px;
        padding:10px;
        margin-bottom:10px;
    }
    .itemBoxHighlight {
        border:solid 1px black;
        width:400px;
        height:50px;
        padding:10px;
        margin-bottom:10px;
        background-color:yellow;
    }
    .deleteBox {
        float:right;
        display:none;
        cursor:pointer;
    }
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" ></script>
<script>
    let fileBuffer = new Array();
    $(function(){
        $('#files').change(function(){
            const target = $('#files');

            $.each(target[0].files, function(index, file){
                fileBuffer.push(file);
            });

            let html = '';
            $.each(fileBuffer, function(index, file){
                const fileName = file.name;
                html += '<div class="itemBox" style="margin: 20px;">';
                html +=     '<img src="'+URL.createObjectURL(file)+'" style="height:100px;" ><br>'
                html +=     '<span class="itemNum"></span>';
                html +=     '<a href="#" id="removeImg">╳</a>';
                html +=     '<div class="deleteBox">[삭제]</div>';
                html += '</div>';
                const fileEx = fileName.slice(fileName.indexOf(".") + 1).toLowerCase();
                if(fileEx != "jpg" && fileEx != "png" &&  fileEx != "gif"){
                    alert("파일은 (jpg, png, gif) 형식만 등록 가능합니다.");
                    return false;
                }
            });

            $('#uploadedList').html(html);
        });

        $(document).on('click', '#removeImg', function(){
            const fileIndex = $(this).parent().index();
            fileBuffer.splice(fileIndex, 1);
            $('.uploadedList>div:eq('+fileIndex+')').remove();
        });

        $(document).on('hover', '.itemBox', function(){
            $(this).find('.deleteBox').show();
        });

        $("#uploadedList").sortable({
            placeholder:"itemBoxHighlight",
            start: function(event, ui) {
                ui.item.data('start_pos', ui.item.index());
            },
            stop: function(event, ui) {
                let spos = ui.item.data('start_pos');
                let epos = ui.item.index();
                reorder();

                /** 파일배열열 순서 변경 */
               let tmp = fileBuffer[spos];
                fileBuffer[spos] = fileBuffer[epos];
                fileBuffer[epos] = tmp;
            }
        });
    });

    /** 아이템 순서 조정 */
    function reorder() {
        $(".itemBox").each(function(i, box) {
            $(box).find(".itemNum").html(i + 1);
        });
    }
</script>
<!-- 섹션 -->


<div class="content-wrapper" style="margin: 100px;">
    <div class="card-footer text-muted">
        <div class="form-group ">
            <!-- input type="file" 이라고 꼭 저어줘야 함 -->
            <input type="file" multiple="multiple" name="files[]" id="files" />
            <button onclick="insertNotice()" class="btn btn-success pull-right" style='margin-right: 15px;'><i class="fa fa-send-o">
            </i> SEND</button>
        </div><br>

        <!-- enctype="multipart/form-data" 이라고 꼭 저어줘야 함 -->
        <form id="formContent" enctype="multipart/form-data">
            <div class="form-group ">
                <!-- 업로드된 파일 목록을 출력할 영역 -->
                <div class="uploadedList" id="uploadedList"></div>
            </div>
        </form>


    </div>
</div>
