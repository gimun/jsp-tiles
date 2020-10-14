<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- 필수, SheetJS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>
<!--필수, FileSaver savaAs 이용 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>

<script>
    //공통
    function s2ab(s) {
        var buf = new ArrayBuffer(s.length); //convert s to arrayBuffer
        var view = new Uint8Array(buf);  //create uint8array as viewer
        for (var i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF; //convert to octet
        return buf;
    }
    function exportExcel(){
        // step 1. workbook 생성
        var wb = XLSX.utils.book_new();

        // step 2. 시트 만들기
        var newWorksheet = excelHandler.getWorksheet();

        // step 3. workbook에 새로만든 워크시트에 이름을 주고 붙인다.
        XLSX.utils.book_append_sheet(wb, newWorksheet, excelHandler.getSheetName());

        // step 4. 엑셀 파일 만들기
        var wbout = XLSX.write(wb, {bookType:'xlsx',  type: 'binary'});

        // step 5. 엑셀 파일 내보내기
        saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), excelHandler.getExcelFileName());
    }
    $(document).ready(function() {
        $("#excelFileExport").click(function(){
            exportExcel();
        });
    });
</script>
<script>
    var excelHandler = {
        getExcelFileName : function(){
            return 'table-test.xlsx';
        },
        getSheetName : function(){
            return 'Table Test Sheet';
        },
        getExcelData : function(){
            return document.getElementById('tableData');
        },
        getWorksheet : function(){
            return XLSX.utils.table_to_sheet(this.getExcelData());
        }
    }
</script>
</head>
<body>
<table id="tableData" style="border:1px solid #dddddd">
    <thead>
    <tr>
        <th>이름</th>
        <th>CP</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>망나뇽</td>
        <td>4000</td>
    </tr>
    <tr>
        <td>마기라스</td>
        <td>3900</td>
    </tr>
    <tr>
        <td>해피너스</td>
        <td>3800</td>
    </tr>
    </tbody>
</table>
파일 내보내기(HTML TABLE) : <input type="button" id="excelFileExport" value="엑셀 파일 다운로드(TABLE)" />
</body>
</html>