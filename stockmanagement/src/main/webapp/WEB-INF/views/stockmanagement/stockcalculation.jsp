<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
<link rel="stylesheet" href="/resources/css/core/flag-icon.min.css"
	type="text/css" />
<title>재고산출</title>
<script type="text/javascript" src="/resources/js/navbar-scripts.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.9.1/jquery.tablesorter.min.js"></script>
  
<style>
select option[value=""][disabled] {
	display: none;
}
</style>
</head>
<body>
	<div>
		<div>
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark"
				style="position: relative;">
				<div class="container-fluid">
					<a class="navbar-brand" href="/">
						<h2>
							<b>조달구매시스템</b>
						</h2>
					</a>
				</div>
				<div class="collapse navbar-collapse" id="navbarSupportedContent"
					style="position: absolute; left: 250px; top: 40px;">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item" style="margin-left: 10px;"><a
							class="nav-link" href="inbound" id="inbound">입고처리(마감)</a></li>
						<li class="nav-item" style="margin-left: 10px;"><a
							class="nav-link" href="transactionstatementmain"
							id="transactionStatement">거래명세서 발행</a></li>
						<li class="nav-item" style="margin-left: 10px;"><a
							class="nav-link" href="outbound" id="outbound">출고처리</a></li>
						<li class="nav-item" style="margin-left: 10px;"><a
							class="nav-link" href="stockcalculation" id="stockCalculation">재고산출</a></li>
						<li class="nav-item" style="margin-left: 10px;"><a
							class="nav-link" href="report" id="report">현황관리리포트(재고금액)</a></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</nav>
			<div class="area"></div>
			<nav class="main-menu">
				<ul>
					<li class="has-subnav" style="font-size: 10px;"><a
						href="/orderplanning/iteminfo" style="height: 50px;"
						id="procurement">
							<div class="nav-text" style="position: relative; left: 10px;">
								조달 관리</div>
					</a></li>
					<li class="has-subnav" style="font-size: 10px;"><a
						href="/purchaseorder/issue" style="height: 50px;" id="order">
							<div class="nav-text" style="position: relative; left: 10px;">
								발주 관리</div>
					</a></li>
					<li class="has-subnav" style="font-size: 10px;"><a
						href="/stockmanagement/inbound" style="height: 50px;" id="stock">
							<div class="nav-text" style="position: relative; left: 10px;">
								자재 관리</div>
					</a></li>
					<li class="has-subnav" style="font-size: 10px;"><a
						href="/registerinfo/subcontractor" style="height: 50px;"
						id="register">
							<div class="nav-text" style="position: relative; left: 10px;">
								정보 등록</div>
					</a></li>
				</ul>
			</nav>
			<br />
		</div>
	</div>

	<form action="stockcalculation" method="get">
		<div class="container"
			style="position: absolute; left: 250px; width: 3000px;">
			<div class="wrap">
				<div class="card">
					<div class="card-header">
						<b>재고산출 조회</b>
					</div>
					<div class="card-body">
						<div class="row g-3">
							<div class="col-md-3">
								<div class="input-group mb-3">
									<span class="input-group-text">날짜</span> <input type="date"
										id="txnReportStartDate" class="form-control datepicker"
										name="startDate" aria-label="Reported Date (From)" value="${cri.startDate}"> <span
										class="input-group-text"><img
										src="/resources/img/calendar3.svg" alt="" width="16"
										height="16" title="calendar" /></span>
								</div>
							</div>
							<div class="col-md-3">
								<div class="input-group mb-3">
									<label for="makeId" class="input-group-text">검색</label> <select
										id="makeId" class="form-select" tabindex="1"
										onchange="changeTheModel();" name="category"
										style="width: 90px;">
										<option value="" disabled selected>선택</option>
										<option value="name">품목명</option>
										<option value="mc">대분류
										<option value="sc">중분류
										<option value="std">규격
										<option value="mat">재질
									</select> <input type="text" class="form-control" id="customerName"
										name="word" value="${cri.word}" style="width: 150px";>
								</div>
							</div>
							<div class="col-md-3">
								<button type="submit" class="btn btn-primary">조회</button>
							</div>
						</div>
					</div>
				</div>
				<br /> <br />
				<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
                <symbol id="check-circle-fill" fill="currentColor"
						viewBox="0 0 16 16">
                    <path
						d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
                </symbol>
                <symbol id="info-fill" fill="currentColor"
						viewBox="0 0 16 16">
                    <path
						d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z" />
                </symbol>
                <symbol id="exclamation-triangle-fill"
						fill="currentColor" viewBox="0 0 16 16">
                    <path
						d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                </symbol>
            </svg>

				<table id='myTable'
					class="table table-bordered table-striped table-hover caption-top">
					<caption style="color: black;">
						<b>재고산출 목록</b>
					</caption>

					<thead class="table-dark">
						<tr>
							<th scope="col" style="text-align: center;">품목코드</th>
							<th scope="col" style="text-align: center;">품목명</th>
							<th scope="col" style="text-align: center;">대분류</th>
							<th scope="col" style="text-align: center;">중분류</th>
							<th scope="col" style="text-align: center;">규격</th>
							<th scope="col" style="text-align: center;">재질</th>
							<th scope="col" style="text-align: center;">입고수량</th>
							<th scope="col" style="text-align: center;">출고수량</th>
							<th scope="col" style="text-align: center;">재고수량</th>
							<th scope="col" style="text-align: center;">재고단가</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${scList}">
							<tr>
								<td style="text-align: center;"><span>${list.item_code}</span></td>
								<td style="text-align: center;"><span>${list.item_name}</span></td>
								<td style="text-align: center;"><span>${list.mc_name}</span></td>
								<td style="text-align: center;"><span>${list.sc_name}</span></td>
								<td style="text-align: center;"><span>${list.standard}</span></td>
								<td style="text-align: center;"><span>${list.material}</span></td>
								<td style="text-align: center;"><span><fmt:formatNumber value="${list.inbound_amount}" pattern="#,###"/></span></td>
								<td style="text-align: center;"><span><fmt:formatNumber value="${list.outbound_amount}" pattern="#,###"/></span></td>
								<td style="text-align: center;"><span><fmt:formatNumber value="${list.stock_amount}" pattern="#,###"/></span></td>
								<td style="text-align: center;"><span><fmt:formatNumber value="${list.stock_price}" pattern="#,###"/></span></td>
									</span></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>
	</form>

	<input type="hidden" value="3" id="flag">
	<script src="/resources/js/core/popper.min.js" type="text/javascript"></script>
	<script src="/resources/js/core/bootstrap-5.min.js"
		type="text/javascript"></script>
	<script>
		if (document.getElementById("flag").value == 3) {
			document.getElementById("stockCalculation").style.backgroundColor = "#fff";
			document.getElementById("stockCalculation").style.color = "#000000";
			document.getElementById("stockCalculation").style.fontWeight = "bold";
			document.getElementById("stock").style.backgroundColor = "#fff";
			document.getElementById("stock").style.color = "#000000";
			document.getElementById("stock").style.fontWeight = "bold";

		}
	</script>

	<script>
    $(document).ready(function() {
        $('#myTable').tablesorter();
      });
	</script>
</body>
</html>
