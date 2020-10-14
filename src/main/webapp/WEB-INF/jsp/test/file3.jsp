<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    var fileBuffer = [];

    $(function(){
        window.URL = window.URL || window.webkitURL;

        const fileSelect = document.getElementById("fileSelect"),
            fileElem = document.getElementById("fileElem"),
            fileList = document.getElementById("fileList");

        fileSelect.addEventListener("click", function (e) {
            if (fileElem) {
                fileElem.click();
            }
            e.preventDefault(); // prevent navigation to "#"
        }, false);

        //dropbox
        let dropbox;

        dropbox = document.getElementById("dropbox");
        dropbox.addEventListener("dragenter", dragenter, false);
        dropbox.addEventListener("dragover", dragover, false);
        dropbox.addEventListener("drop", drop, false);

        //이미지 삭제
        $(document).on('click', '.removeImg', function(){
            const fileIndex = $(this).parent().parent().index();
            fileBuffer.splice(fileIndex,1);
            $('#fileList>div:eq('+fileIndex+')').remove();
        });
    });

    function handleFiles(files) {

        Array.prototype.push.apply(fileBuffer, files);

        if (!fileBuffer.length || fileBuffer.length == 0) {
            fileList.innerHTML = "<p>No files selected!</p>";
        } else {
            fileList.innerHTML = "";

            for (let i = 0; i < fileBuffer.length; i++) {
                const div = document.createElement("div");
                div.innerHTML = "<br>"
                fileList.appendChild(div);

                const img = document.createElement("img");
                img.src = window.URL.createObjectURL(fileBuffer[i]);
                img.height = 60;
                img.onload = function() {
                    window.URL.revokeObjectURL(this.src);
                }
                div.appendChild(img);
                const info = document.createElement("span");
                info.innerHTML = "<br>" + fileBuffer[i].name + " (" + fileBuffer[i].size + " bytes) <a href='#' class='removeImg'> X </a>";
                div.appendChild(info);
            }
        }
    }

    function insertNotice() {
        var subject = $("#subject").val();
        var comments = $("#comments").val();

        var formData=new FormData();
        formData.append("subject",subject);
        formData.append("comments",comments);

        for (var i=0; i<fileBuffer.length; i++){
            formData.append("file",fileBuffer[i]);
        }

        $.ajax({
            type: "post",
            url: "/notice/uploadAjax",
            data: formData,
            dataType: "text",
            processData: false,
            contentType: false,
            success: function(result){
                if(result == '200'){
                    alert("성공하였습니다.");
                    location.href = "/notice/noticeList";
                } else {
                    alert("실패하였습니다.");
                }
            }
        });
    }


    function dragenter(e) {
        e.stopPropagation();
        e.preventDefault();
    }

    function dragover(e) {
        e.stopPropagation();
        e.preventDefault();
    }

    function drop(e) {
        e.stopPropagation();
        e.preventDefault();

        const dt = e.dataTransfer;
        const files = dt.files;

        handleFiles(files);
    }
</script>

<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <div class="row">

            <div class="col-lg-12 ds" style="background: white;">
                <!--COMPLETED ACTIONS DONUTS CHART-->

                <div class="content-wrapper" style="height:100%">
                    <div class="card-footer text-muted">
                        <form id="formContent" enctype="multipart/form-data">
                            <div class="card-header">
                                <i class="fa fa-table"></i>
                                <span>공지사항 글쓰기</span>
                            </div>
                            <div class="form-group" style="margin-top: 1%;">
                                <label>제목</label>
                                <input class="form-control" id="subject" name="subject" placeholder="공지사항 제목을 입력하세요.">
                            </div>
                            <div class="form-group ">
                                <label style="clear: both;">내용</label>
                                <textarea class="form-control" placeholder="공지사항 내용을 입력하세요." rows="15" id="comments" name="comments"></textarea>
                            </div>
                            <div class="form-group ">
                                <input type="file" id="fileElem" name="files[]" multiple accept="image/*" style="display:none" onchange="handleFiles(this.files)">
                                <a href="#" id="fileSelect">Select some files</a>

                                <!-- dropfile 영역 -->

                                <div id="dropbox" style="width:100%; height:100px; border: 1px dotted blue; margin-top:10px;"></div>
                                <!-- 업로드된 파일 목록을 출력할 영역 -->
                                <div id="fileList" style="margin-top:10px;">
                                    <p>No files selected!</p>
                                </div>
                            </div>
                        </form>
                        <div class="form-group ">
                            <button onclick="insertNotice()" class="btn btn-success pull-right" style='margin-right: 15px;'><i class="fa fa-send-o">
                            </i> SEND</button>
                            <br>
                        </div>

                    </div>
                </div>



            </div>
            <!-- /col-lg-12 -->
        </div>
        <!-- /row -->
    </section>
</section>