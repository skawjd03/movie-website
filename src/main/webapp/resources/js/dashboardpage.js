/**
 * 
 */
$
		.ajax({
			type : "get",
			url : "/civ/statistics/dashboard.json",
			success : function(data) {
				var sales = data.salesInfo;
				var reserveRate = data.reserveRateInfo;
				var rRate = {
					movieName : [],
					rSeat : [],
					tSeat : [],
					rPer : [],
					tPer : []
				};

				for (var i = 0; i < reserveRate.length; i++) {
					rRate.movieName.push(reserveRate[i].movieName);
					rRate.rSeat.push(reserveRate[i].reserveseat);
					rRate.tSeat.push(reserveRate[i].totalseat);
					rRate.tPer.push(100);
					rRate.rPer.push(rRate.rSeat[i] / rRate.tSeat[i] * 100);
				}

				var visitorCount = data.visitorCountInfo;

				var vCount = [];
				var color5 = [ "#25a6f7", "#f3950d", "#ad6bae", "#4e74c0",
						"#e62163" ];
				var dateList = [ "01:00", "02:00", "03:00", "04:00", "05:00",
						"06:00", "07:00", "08:00", "09:00", "10:00", "11:00",
						"12:00", "13:00", "14:00", "15:00", "16:00", "17:00",
						"18:00", "19:00", "20:00", "21:00", "22:00", "23:00",
						"24:00" ];
				for (var i = 0; i < visitorCount.length; i++) {
					var text = visitorCount[i].logDate;
					var vList = visitorCount[i].visitorData;
					var vListTimeList = [];
					var timeList = [];
					for (var j = 0; j < vList.length; j++) {
						vListTimeList.push(vList[j].time);
					}
					var cnt = 0;
					for (var z = 0; z < dateList.length; z++) {
						if (vListTimeList.indexOf(dateList[z]) == -1) {
							timeList.push(0);
						} else {
							timeList.push(vList[cnt].visitorCount);
							cnt++;
						}
					}
					console.log(timeList);

					vCount.push({
						"values" : timeList,
						"text" : text,
						"line-color" : color5[i],
						"line-width" : "2px",
						"shadow" : 0,
						"marker" : {
							"background-color" : "#fff",
							"size" : 3,
							"border-width" : 1,
							"border-color" : color5[i],
							"shadow" : 0
						},
						"palette" : (i + 1)
					});
				}

				function zingChartData(sales, rRate, vCount) {
					this.sales = sales;
					this.rRate = rRate;
					this.vCount = vCount;
				}
				zingChartData.prototype.getChartData = function() {
					ajaxd = null;
					$
							.ajax({
								type : "get",
								url : "/civ/resources/JSON/zingchart.json",
								async : false,
								success : function(data) {
									data.graphset[0]["series"][0].values = [
											sales[0].money, sales[1].money,
											sales[2].money, sales[3].money,
											sales[4].money, sales[5].money,
											sales[6].money ];
									data.graphset[0]["scale-x"].values = [
											sales[0].resTime, sales[1].resTime,
											sales[2].resTime, sales[3].resTime,
											sales[4].resTime, sales[5].resTime,
											sales[6].resTime ];

									data.graphset[1]["scale-x"].values = rRate.movieName;
									data.graphset[1]["series"][0].values = rRate.rPer;
									data.graphset[1]["series"][0]["data-rvalues"] = rRate.rSeat;
									data.graphset[1]["series"][1].values = rRate.tPer;
									data.graphset[1]["series"][1]["data-rvalues"] = rRate.tSeat;

									data.graphset[2]["series"] = vCount;

									ajaxd = data;
								}
							});
					return ajaxd;
				};

				var d = new zingChartData(sales, rRate, vCount).getChartData();
				drawZingChart(d);

				var joinUserCount = data.joinUserCountInfo;
				var googlechartData = [];

				for (var i = 0; i < joinUserCount.length; i++) {
					var forDate = joinUserCount[i].joinDate.split('/');
					googlechartData.push([
							new Date(forDate[0], forDate[1], forDate[2]),
							joinUserCount[i].male, 'male',
							joinUserCount[i].female, 'female',
							joinUserCount[i].total, 'total' ]);
				}

				google.charts.load('current', {
					'packages' : [ 'annotationchart' ]
				});
				google.charts.setOnLoadCallback(function() {
					drawGoogleChart(googlechartData)
				});

				var genderPer = data.genderInfo;

				var chart = new CanvasJS.Chart("chartContainer", {
					theme : "light2",
					exportEnabled : true,
					animationEnabled : true,
					title : {
						text : "사이트 이용객 성비"
					},
					data : [ {
						type : "pie",
						startAngle : 25,
						toolTipContent : "<b>{label}</b>: {y}%",
						showInLegend : "true",
						legendText : "{label}",
						indexLabelFontSize : 16,
						indexLabel : "{label} - {y}%",
						dataPoints : [ {
							y : genderPer[0].value + 1,
							label : genderPer[0].gender
						}, {
							y : genderPer[1].value,
							label : genderPer[1].gender
						} ]
					} ]
				});
				chart.render();
			}
		});

function drawZingChart(d) {
	ZC.LICENSE = [ "b55b025e438fa8a98e32482b5f768ff5" ];
	zingchart.THEME = "classic";
	var myConfig = d;

	zingchart.render({
		id : 'zingChart',
		data : myConfig,
		height : 1000,
		width : '90%'
	});
}

function drawGoogleChart(googlechartData) {
	var data = new google.visualization.DataTable();
	data.addColumn('date', '날짜');
	data.addColumn('number', '남자');
	data.addColumn('string', 'male');
	data.addColumn('number', '여자');
	data.addColumn('string', 'female');
	data.addColumn('number', '총합');
	data.addColumn('string', 'total');
	data.addRows(googlechartData);

	var chart = new google.visualization.AnnotationChart(document
			.getElementById('chart_div'));

	var options = {
		displayAnnotations : true
	};

	chart.draw(data, options);
}