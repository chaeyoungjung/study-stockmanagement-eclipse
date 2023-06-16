package com.overc1ock.mapper;

import java.util.List;

import com.overc1ock.domain.OutBoundVO;
import com.overc1ock.domain.ProcurementPlanVO;
import com.overc1ock.domain.ProductionPlanVO;
import com.overc1ock.domain.PurchaseOrderVO;
import com.overc1ock.domain.ReportVO;
import com.overc1ock.domain.RequestTransactionStatementDTO;
import com.overc1ock.domain.StockCalculationVO;
import com.overc1ock.domain.TransactionStatementVO;
import com.overc1ock.domain.Criteria;
import com.overc1ock.domain.InBoundVO;

public interface StockManagementMapper {
	
	//출고처리
	List<ProductionPlanVO>getOutboundListWithCriteria(Criteria cri);
	List<ProductionPlanVO>getProductNameList();
	Integer insertOutbound(List<OutBoundVO> list);
	
	//재고금액현황관리리포트
	List<ReportVO> chartItemCategory(Criteria cri);
	List<ReportVO> chartDate(Criteria cri);
	
	//재고산출
	List<StockCalculationVO> getStockCalculationList(Criteria cri);
	
	//입고처리(마감)
	List<ProcurementPlanVO> getOrderItemList(Criteria cri);
	List<Integer> checkOrderList();
	List<ProcurementPlanVO> getProcurementPlanList(Integer po_code);
	Integer insertInbound(InBoundVO vo);
	Integer updateProcurementPlanStatus(InBoundVO vo);
	
	//거래명세서 발행
	List<PurchaseOrderVO> getPurchaseOrderListAtTransactionStatement(Criteria cri);
	List<TransactionStatementVO> getTransactionStatement(Integer po_code);
	Integer insertTransactionStatement(RequestTransactionStatementDTO dto);
	Integer deleteTransactionStatement(Integer po_code);
	
	
	
	
}
