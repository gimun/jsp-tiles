<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.bundle.min.js"></script>
<script type="text/javascript" charset="utf-8"
        src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
<script type="text/javascript">
var num = Math.round(1 /3 * 100);

var data = {
    labels: ["pink", "red"],
    datasets: [{data: [70, 30], backgroundColor: ["#FF6384"], hoverBackgroundColor: ["#FF6384"]}]
};

window.onload = function () {
    var ctx8 = $('#chart8').get(0).getContext("2d");
    window.theChart8 = new Chart(ctx8, {
        type: 'doughnut',
        data: data,
        options: {
            responsive: true,
            legend: {
                display: false
            },
            tooltips: {
                enabled: false,
            },
            showPercentage: true, //Enables percentages on the pie
            maintainAspectRatio: false,
            cutoutPercentage: 70,
            //animation: false,
            rotation: 160,
            //circumference: 1 * Math.PI
        }
    });
}

</script>
<div style="width:150px">
    <canvas id="chart8"></canvas>
</div>
</body>
</html>
