<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" type="text/css"/>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js" type="text/javascript" ></script>
</head>
<body>

    <table id="myTable">
        <thead>
        <tr>
            <th>컬럼1</th>
            <th>컬럼2</th>
        </tr>
        </thead>
    </table>

    <button onclick="fn_change_option();">테스트</button>
<script>
    let table = $('#myTable').DataTable({
        ajax: {
            'url':'/table/list',
            'type': 'POST',
            'dataSrc':'data'
        },
        columns: [
            {"data": "name"},
            {"data": "year"}
        ],
        "destroy": true,        //테이블 재생성
        "paging": true,         //페이징처리
        "ordering": true,       //칼럼별 정렬기능
        "autoWidth": false,     //가로자동
        "lengthChange": true,   //데이터건수 변경
        "pageLength": 5, //기본 데이터건수
        "lengthMenu": [[5, 10, 1000], [5, 10, "Max(1000)"]], //데이터건수옵션
    });

    function fn_change_option() {
        console.log("!!");
        console.log(table);
        console.log(table);
        table.paging = false;

       // table.paging(false).draw();
    }
</script>
</body>
</html>
