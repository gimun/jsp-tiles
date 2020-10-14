<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- 필수, SheetJS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>
<!--필수, FileSaver savaAs 이용 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>

<script>
    //공통
    function excel_save(s) {
        let buf = new ArrayBuffer(s.length); //convert s to arrayBuffer
        let view = new Uint8Array(buf);      //create uint8array as viewer
        for (let i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF; //convert to octet
        return buf;
    }

    function fn_make_excel(fileName, sheetName, tableId) {
        let excelHandler = {
            getExcelFileName : function(){
                return fileName;
            },
            getSheetName : function(){
                return sheetName;
            },
            getExcelData : function(){
                return document.getElementById(tableId);
            },
            getWorksheet : function(){
                return XLSX.utils.table_to_sheet(this.getExcelData());
            }
        }

        return excelHandler;
    }

    function exportExcel(){
        let excelHandler = fn_make_excel('뇌/맥파 데이터.xlsx', 'Measure Sheet', 'measureTbl');
        // step 1. workbook 생성
        let wb = XLSX.utils.book_new();

        // step 2. 시트 만들기
        let newWorksheet = excelHandler.getWorksheet();

        // step 3. workbook에 새로만든 워크시트에 이름을 주고 붙인다.
        XLSX.utils.book_append_sheet(wb, newWorksheet, excelHandler.getSheetName());

        // step 4. 엑셀 파일 만들기
        let wbout = XLSX.write(wb, {bookType:'xlsx',  type: 'binary'});

        // step 5. 엑셀 파일 내보내기
        saveAs(new Blob([excel_save(wbout)],{type:"application/octet-stream"}), excelHandler.getExcelFileName());
    }
    $(document).ready(function() {
        $("#excelFileExport").click(function(){
            exportExcel();
        });
    });
</script>
</head>
<body>
<table id="measureTbl" style="border:1px solid;">
    <thead>
    <tr>
        <th>구분</th>
        <th>측정 데이터1</th>
        <th>측정 데이터2</th>
        <th>측정 데이터3</th>
        <th>측정 데이터4</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>측정</td>
        <td>1000</td>
        <td>2000</td>
        <td>3000</td>
        <td>4000</td>
    </tr>
    <tr>
        <td>비율</td>
        <td>1000</td>
        <td>2000</td>
        <td>3000</td>
        <td>4000</td>
    </tr>
    </tbody>
</table>
파일 내보내기(HTML TABLE) : <input type="button" id="excelFileExport" value="엑셀 파일 다운로드(TABLE)" />
</body>
</html>