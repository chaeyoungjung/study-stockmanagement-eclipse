<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Suraj">
<!--meta name="_csrf" th:content="${_csrf.token}"/>
    <meta name="_csrf_header" th:content="${_csrf.headerName}"/-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/css/core/bootstrap-5.min.css"
	type="text/css" />
<link rel="stylesheet" href="/resources/css/custom.css" type="text/css" />
<link rel="stylesheet" href="/resources/css/core/flag-icon.min.css" type="text/css" />
<title>Report</title>
<script type="text/javascript" src="/resources/js/navbar-scripts.js"></script>
</head>
<body>
	<div>
		<div>
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark"
				style="position: relative;">
				<div class="container-fluid">
					<a class="navbar-brand" href="#" onclick="goToHome();">
						<h2>
							<b>조달구매시스템</b>
						</h2>
					</a>
				</div>
				<div class="collapse navbar-collapse" id="navbarSupportedContent"
					style="position: absolute; left: 250px; top: 40px;">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item" style="margin-left: 10px;"><a
							class="nav-link" href="#" id="inbound">입고처리(마감)</a></li>
						<li class="nav-item" style="margin-left: 10px;"><a
							class="nav-link" href="#" id="transactionStatement">거래명세서 발행</a>
						</li>
						<li class="nav-item" style="margin-left: 10px;"><a
							class="nav-link" href="#" id="outbound">출고처리</a></li>
						<li class="nav-item" style="margin-left: 10px;"><a
							class="nav-link" href="#" id="stockCalculation">재고산출</a></li>
						<li class="nav-item" style="margin-left: 10px;"><a
							class="nav-link" href="#" id="report">현황관리리포트(재고금액)</a></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</nav>
			<div class="area"></div>
			<nav class="main-menu">
				<ul>
					<li class="has-subnav" style="font-size: 10px;"><a href="#"
						style="height: 50px;" id="procurement">
							<div class="nav-text" style="position: relative; left: 10px;">
								조달 관리</div>
					</a></li>
					<li class="has-subnav" style="font-size: 10px;"><a href="#"
						style="height: 50px;" id="order">
							<div class="nav-text" style="position: relative; left: 10px;">
								발주 관리</div>
					</a></li>
					<li class="has-subnav" style="font-size: 10px;"><a href="#"
						style="height: 50px;" id="stock">
							<div class="nav-text" style="position: relative; left: 10px;">
								자재 관리</div>
					</a></li>
				</ul>
			</nav>
			<br />
		</div>
	</div>
	<form method="POST">
		<input type="hidden" name="loggedInUser" /> <input type="hidden"
			name="loggedInRole" />
		<div class="container">
			<ul class="nav nav-tabs" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="txn-tab" data-bs-toggle="tab"
						data-bs-target="#reportByItem" type="button" role="tab"
						aria-controls="txnReport" aria-selected="false">품목별 조회</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="invoice-tab" data-bs-toggle="tab"
						data-bs-target="#reportByDate" type="button" role="tab"
						aria-controls="invoiceReport" aria-selected="false">날짜별
						조회</button>
				</li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane fade show active" id="reportByItem"
					role="tabpanel" aria-labelledby="txn-tab">
					<div class="card">
						<div class="card-body">
							<div class="row g-3">
								<div class="col-md-3">
									<div class="input-group mb-3">
										<span class="input-group-text">산출일</span> <input type="date"
											id="txnReportStartDate" class="form-control datepicker"
											name="txnReportTransactionVO.startDate"
											aria-label="Reported Date (From)"> <span
											class="input-group-text"><img src="/resources/img/calendar3.svg"
											alt="" width="16" height="16" title="calendar" /></span>

									</div>
								</div>
								<div class="col-md-3">
									<div class="input-group mb-3">
										<label class="input-group-text" for="txnReportMakeId">품목군</label>
										<select class="form-select" id="txnReportMakeId"
											name="txnReportTransactionVO.makeId">
											<option value="" selected><-- 품목군 선택 --></option>
											<option value="1">대
											<option value="2">중
											<option value="3">소
										</select>
									</div>
								</div>
								<div class="col-md-3">
									<div class="input-group mb-3">
										<span class="input-group-text">재고금액(원)</span> <input
											type="number" id="txnReportCustomerName"
											name="txnReportTransactionVO.CustomerName"
											class="form-control" placeholder="금액 입력"
											aria-label="txnReportCustomerName"
											aria-describedby="basic-addon1"> <span
											class="input-group-text">이상</span>
									</div>
								</div>
								<div class="col-md-3">
									<button type="button" class="btn btn-primary">조회</button>
								</div>
							</div>
							<div class="col-md-6">
								<input type="checkbox" class="form-check-input"
									id="txnReportIncludes" value="true"
									name="txnReportTransactionVO.includes" /><input type="hidden"
									name="_txnReportTransactionVO.includes" value="on" /> <label
									class="form-check-label" for="includes"> 품목코드 기준 산출 </label>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="reportByDate" role="tabpanel"
					aria-labelledby="invoice-tab">
					<div class="card">
						<div class="card-body">
							<div class="row g-3">
								<div class="col-md-3">
									<div class="input-group mb-3">
										<span class="input-group-text">산출일 (From)</span> <input
											type="date" id="txnReportStartDate"
											class="form-control datepicker"
											name="txnReportTransactionVO.startDate"
											aria-label="Reported Date (From)"> <span
											class="input-group-text"><img src="/resources/img/calendar3.svg"
											alt="" width="16" height="16" title="calendar" /></span>
									</div>
								</div>
								<div class="col-md-3">
									<div class="input-group mb-3">
										<span class="input-group-text">산출일 (To)</span> <input
											type="date" id="txnReportEndDate"
											class="form-control datepicker"
											name="txnReportTransactionVO.endDate"
											aria-label="Reported Date (To)"> <span
											class="input-group-text"><img src="/resources/img/calendar3.svg"
											alt="" width="16" height="16" title="calendar" /></span>
									</div>
								</div>
								<div class="col-md-3">
									<button type="button" class="btn btn-primary">조회</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br /> <br />
			<div class="wrap">
				<div class="card">
					<div class="card-header">Report :</div>
					<iframe name="reportContent" id="reportContent" width="100%"
						height="420px" title="Report"> </iframe>
				</div>
			</div>
		</div>
	</form>
	<input type="hidden" value="4" id="flag">
	<script src="/resources/js/core/popper.min.js" type="text/javascript"></script>
	<script src="/resources/js/core/bootstrap-5.min.js" type="text/javascript"></script>
	<script>
		if (document.getElementById("flag").value == 4) {
			document.getElementById("report").style.backgroundColor = "#fff";
			document.getElementById("report").style.color = "#000000";
			document.getElementById("report").style.fontWeight = "bold";
			document.getElementById("stock").style.backgroundColor = "#fff";
			document.getElementById("stock").style.color = "#000000";
			document.getElementById("stock").style.fontWeight = "bold";

		}
	</script>
</body>
</html>


</body>
</html>