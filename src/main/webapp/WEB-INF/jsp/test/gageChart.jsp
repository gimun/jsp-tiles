<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <%--
        <link href="https://naver.github.io/billboard.js/release/latest/dist/billboard.css" rel="stylesheet" type="text/css">
    --%>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/billboard.js/2.1.2/billboard.min.js" ></script>
    <script>
        var chart = bb.generate({
            data: {
                columns: [
                    ["data", 91.4]
                ],
                type: "gauge", // for ESM specify as: gauge()
                onclick: function(d, i) {
                    console.log("onclick", d, i);
                },
                onover: function(d, i) {
                    console.log("onover", d, i);
                },
                onout: function(d, i) {
                    console.log("onout", d, i);
                }
            },
            gauge: {},
            color: {
                pattern: [
                    "#FF0000",
                    "#F97600",
                    "#F6C600",
                    "#60B044"
                ],
                threshold: {
                    values: [
                        30,
                        60,
                        90,
                        100
                    ]
                }
            },
            size: {
                height: 180
            },
            bindto: "#gaugeChart"
        });

        setTimeout(function() {
            chart.load({
                columns: [["data", 10]]
            });
        }, 1000);

        setTimeout(function() {
            chart.load({
                columns: [["data", 50]]
            });
        }, 2000);

        setTimeout(function() {
            chart.load({
                columns: [["data", 70]]
            });
        }, 3000);

        setTimeout(function() {
            chart.load({
                columns: [["data", 0]]
            });
        }, 4000);

        setTimeout(function() {
            chart.load({
                columns: [["data", 100]]
            });
        }, 5000);
    </script>
</head>
<body>
<div id="gaugeChart"></div>
</body>
</html>
