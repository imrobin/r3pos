program Shop;
uses
  Forms,
  Windows,
  SysUtils,
  MultInst,
  uGlobal in '..\..\BASIC\uGlobal.pas' {Global: TDataModule},
  ufrmMain in '..\..\BASIC\ufrmMain.pas' {frmMain},
  ufrmDesk in '..\..\BASIC\ufrmDesk.pas' {frmDesk},
  udmIcon in '..\..\BASIC\udmIcon.pas' {dmIcon: TDataModule},
  uResOpr in '..\..\PUB\uResOpr.pas',
  GIFImage in '..\..\PUB\GIFIMAGE.PAS',
  ufrmBasic in '..\..\Basic\ufrmBasic.pas' {frmBasic},
  uShopGlobal in 'uShopGlobal.pas' {ShopGlobal: TDataModule},
  uframeMDForm in 'Frame\uframeMDForm.pas' {frameMDForm},
  uframeDialogForm in 'Frame\uframeDialogForm.pas' {frameDialogForm},
  uShopUtil in 'Frame\uShopUtil.pas',
  uXDictFactory in 'Frame\uXDictFactory.pas',
  uframeToolForm in 'Frame\uframeToolForm.pas' {frameToolForm},
  ObjCommon in 'Obj\ObjCommon.pas',
  ufrmInstall in 'Update\ufrmInstall.pas' {frmInstall},
  uDevFactory in 'App\uDevFactory.pas',
  ufrmPswModify in 'ufrmPswModify.pas' {frmPswModify},
  ufrmLogin in 'ufrmLogin.pas' {frmLogin},
  ObjMeaUnits in 'Obj\ObjMeaUnits.pas',
  ufrmMeaUnits in 'App\ufrmMeaUnits.pas' {frmMeaUnits},
  ufrmTenant in 'App\ufrmTenant.pas' {frmTenant},
  ufrmDutyInfo in 'App\ufrmDutyInfo.pas' {frmDutyInfo},
  ufrmDutyInfoList in 'App\ufrmDutyInfoList.pas' {frmDutyInfoList},
  ufrmRoleInfo in 'App\ufrmRoleInfo.pas' {frmRoleInfo},
  ufrmRoleInfoList in 'App\ufrmRoleInfoList.pas' {frmRoleInfoList},
  ufrmUsers in 'App\ufrmUsers.pas' {frmUsers},
  ufrmUsersInfo in 'App\ufrmUsersInfo.pas' {frmUsersInfo},
  ObjDutyInfo in 'Obj\ObjDutyInfo.pas',
  ObjRoleInfo in 'Obj\ObjRoleInfo.pas',
  ObjUsers in 'Obj\ObjUsers.pas',
  ObjTenant in 'Obj\ObjTenant.pas',
  uCaFactory in 'App\uCaFactory.pas',
  ufrmDeptInfo in 'App\ufrmDeptInfo.pas' {frmDeptInfo},
  ufrmDeptInfoList in 'App\ufrmDeptInfoList.pas' {frmDeptInfoList},
  ufrmGoodssort in 'App\ufrmGoodssort.pas' {frmGoodssort},
  uframeSelectGoods in 'Frame\uframeSelectGoods.pas' {frameSelectGoods},
  uframeDialogProperty in 'Frame\uframeDialogProperty.pas' {frameDialogProperty},
  uframeOrderForm in 'Frame\uframeOrderForm.pas' {frameOrderForm},
  uframeOrderToolForm in 'Frame\uframeOrderToolForm.pas' {frameOrderToolForm},
  ufrmStkRetuOrder in 'App\ufrmStkRetuOrder.pas' {frmStkRetuOrder},
  ufrmStkRetuOrderList in 'App\ufrmStkRetuOrderList.pas' {frmStkRetuOrderList},
  ObjStkRetuOrder in 'Obj\ObjStkRetuOrder.pas',
  ObjSalRetuOrder in 'Obj\ObjSalRetuOrder.pas',
  ufrmSalRetuOrder in 'App\ufrmSalRetuOrder.pas' {frmSalRetuOrder},
  ufrmSalRetuOrderList in 'App\ufrmSalRetuOrderList.pas' {frmSalRetuOrderList},
  ObjChangeOrder in 'Obj\ObjChangeOrder.pas',
  ufrmChangeOrder in 'App\ufrmChangeOrder.pas' {frmChangeOrder},
  ufrmChangeOrderList in 'App\ufrmChangeOrderList.pas' {frmChangeOrderList},
  ufrmClient in 'App\ufrmClient.pas' {frmClient},
  ufrmClientInfo in 'App\ufrmClientInfo.pas' {frmClientInfo},
  ufrmGoodsSortTree in 'App\ufrmGoodsSortTree.pas' {frmGoodsSortTree},
  ufrmSupplier in 'App\ufrmSupplier.pas' {frmSupplier},
  ufrmSupplierInfo in 'App\ufrmSupplierInfo.pas' {frmSupplierInfo},
  ObjClient in 'Obj\ObjClient.pas',
  ObjDeptInfo in 'Obj\ObjDeptInfo.pas',
  ObjGoodsSort in 'Obj\ObjGoodsSort.pas',
  ObjShop in 'Obj\ObjShop.pas',
  ufrmGoodsInfo in 'App\ufrmGoodsInfo.pas' {frmGoodsInfo},
  ufrmGoodsInfoList in 'App\ufrmGoodsInfoList.pas' {frmGoodsInfoList},
  ObjGoodsInfo in 'Obj\ObjGoodsInfo.pas',
  ObjGetPrice in 'Obj\ObjGetPrice.pas',
  ObjPayOrder in 'Obj\ObjPayOrder.pas',
  ObjBondOrder in 'Obj\ObjBondOrder.pas',
  ufrmCodeInfo in 'App\ufrmCodeInfo.pas' {frmCodeInfo},
  ObjCodeInfo in 'Obj\ObjCodeInfo.pas',
  uframeTreeFindDialog in 'Frame\uframeTreeFindDialog.pas' {frameTreeFindDialog},
  uframeListDialog in 'Frame\uframeListDialog.pas' {frameListDialog},
  ufrmPayOrder in 'App\ufrmPayOrder.pas' {frmPayOrder},
  ufrmPayOrderList in 'App\ufrmPayOrderList.pas' {frmPayOrderList},
  ufrmRecvPosOrder in 'App\ufrmRecvPosOrder.pas' {frmRecvPosOrder},
  ufrmRecvPosList in 'App\ufrmRecvPosList.pas' {frmRecvPosList},
  ufrmSelectGoodSort in 'App\ufrmSelectGoodSort.pas' {frmSelectGoodSort},
  Des in '..\..\Pub\des.pas',
  ufrmSalIndentOrder in 'App\ufrmSalIndentOrder.pas' {frmSalIndentOrder},
  ufrmSalIndentOrderList in 'App\ufrmSalIndentOrderList.pas' {frmSalIndentOrderList},
  ObjDbOrder in 'Obj\ObjDbOrder.pas',
  ObjStockOrder in 'Obj\ObjStockOrder.pas',
  ufrmPosPrice in 'App\ufrmPosPrice.pas' {frmPosPrice},
  ufrmPosMain in 'App\ufrmPosMain.pas' {frmPosMain},
  uframeSelectCustomer in 'Frame\uframeSelectCustomer.pas' {frameSelectCustomer},
  ufrmShowDibs in 'App\ufrmShowDibs.pas' {frmShowDibs},
  ufrmCardNoInput in 'App\ufrmCardNoInput.pas' {frmCardNoInput},
  ufrmDibsOption in 'App\ufrmDibsOption.pas' {frmDibsOption},
  ufrmHangUpFile in 'App\ufrmHangUpFile.pas' {frmHangUpFile},
  ufrmPriceGradeInfo in 'App\ufrmPriceGradeInfo.pas' {frmPriceGradeInfo},
  ufrmRoleRights in 'App\ufrmRoleRights.pas' {frmRoleRights},
  ufrmUserRights in 'App\ufrmUserRights.pas' {frmUserRights},
  ObjPRICEGRADEInfo in 'Obj\ObjPriceGradeInfo.pas',
  ObjRoleRights in 'Obj\ObjRoleRights.pas',
  ObjUserRights in 'Obj\ObjUserRights.pas',
  ufrmDbOrder in 'App\ufrmDbOrder.pas' {frmDbOrder},
  ufrmDbOrderList in 'App\ufrmDbOrderList.pas' {frmDbOrderList},
  ObjSalIndentOrder in 'Obj\ObjSalIndentOrder.pas',
  ufrmChangeLocusOrder in 'App\ufrmChangeLocusOrder.pas' {frmChangeLocusOrder},
  ufrmOutLocusOrderList in 'App\ufrmOutLocusOrderList.pas' {frmOutLocusOrderList},
  ObjStkIndentOrder in 'Obj\ObjStkIndentOrder.pas',
  ufrmInvoice in 'App\ufrmInvoice.pas' {frmInvoice},
  ufrmInvoiceInfo in 'App\ufrmInvoiceInfo.pas' {frmInvoiceInfo},
  ObjInvoice in 'Obj\ObjInvoice.pas',
  ObjSupplier in 'Obj\ObjSupplier.pas',
  ObjCustomer in 'Obj\ObjCustomer.pas',
  ufrmCustomer in 'App\ufrmCustomer.pas' {frmCustomer},
  ufrmCustomerInfo in 'App\ufrmCustomerInfo.pas' {frmCustomerInfo},
  ufrmCostCalc in 'App\ufrmCostCalc.pas' {frmCostCalc},
  ObjSysDefine in 'Obj\ObjSysDefine.pas',
  ufrmSysDefine in 'App\ufrmSysDefine.pas' {frmSysDefine},
  ufrmPrcCompList in 'App\ufrmPrcCompList.pas' {frmPrcCompList},
  ufrmPriceOrder in 'App\ufrmPriceOrder.pas' {frmPriceOrder},
  ufrmPriceOrderList in 'App\ufrmPriceOrderList.pas' {frmPriceOrderList},
  ObjPriceOrder in 'Obj\ObjPriceOrder.pas',
  ObjPrintOrder in 'Obj\ObjPrintOrder.pas',
  uframeSelectCompany in 'Frame\uframeSelectCompany.pas' {frameSelectCompany},
  ufrmBatchPmdPrice in 'App\ufrmBatchPmdPrice.pas' {frmBatchPmdPrice},
  ufrmPosMenu in 'App\ufrmPosMenu.pas' {frmPosMenu},
  ufrmCloseForDay in 'App\ufrmCloseForDay.pas' {frmCloseForDay},
  ObjCloseForDay in 'Obj\ObjCloseForDay.pas',
  ufrmCheckOrderList in 'App\ufrmCheckOrderList.pas' {frmCheckOrderList},
  ufrmCheckOrder in 'App\ufrmCheckOrder.pas' {frmCheckOrder},
  ufrmCheckAudit in 'App\ufrmCheckAudit.pas' {frmCheckAudit},
  ufrmCheckTask in 'App\ufrmCheckTask.pas' {frmCheckTask},
  ufrmSelectCheckGoods in 'App\ufrmSelectCheckGoods.pas',
  ObjIoroOrder in 'Obj\ObjIoroOrder.pas',
  ufrmSalesOrder in 'App\ufrmSalesOrder.pas' {frmSalesOrder},
  ObjSalesOrder in 'Obj\ObjSalesOrder.pas',
  ufrmSalesOrderList in 'App\ufrmSalesOrderList.pas' {frmSalesOrderList},
  ufrmDbOkDialog in 'App\ufrmDbOkDialog.pas' {frmDbOkDialog},
  ufrmShopInfo in 'App\ufrmShopInfo.pas' {frmShopInfo},
  ufrmShopInfoList in 'App\ufrmShopInfoList.pas' {frmShopInfoList},
  ufrmAccount in 'App\ufrmAccount.pas' {frmAccount},
  ufrmAccountInfo in 'App\ufrmAccountInfo.pas' {frmAccountInfo},
  ObjAccount in 'Obj\ObjAccount.pas',
  ufrmTransOrder in 'App\ufrmTransOrder.pas' {frmTransOrder},
  ufrmTransOrderList in 'App\ufrmTransOrderList.pas' {frmTransOrderList},
  ObjTransOrder in 'Obj\ObjTransOrder.pas',
  ufrmDevFactory in 'App\ufrmDevFactory.pas' {frmDevFactory},
  ufrmIoroOrder in 'App\ufrmIoroOrder.pas' {frmIoroOrder},
  ufrmRckMng in 'App\ufrmRckMng.pas' {frmRckMng},
  ufrmCheckTablePrint in 'App\ufrmCheckTablePrint.pas',
  ufrmClientSort in 'App\ufrmClientSort.pas' {frmClientSort},
  ufrmTicketPrint in 'App\ufrmTicketPrint.pas' {frmTicketPrint},
  uframeBaseReport in 'Frame\uframeBaseReport.pas' {frameBaseReport},
  uframeFindDialog in 'Frame\uframeFindDialog.pas' {frameFindDialog},
  ufrmIoroOrderList in 'App\ufrmIoroOrderList.pas' {frmIoroOrderList},
  ufrmJxcTotalReport in 'App\ufrmJxcTotalReport.pas' {frmJxcTotalReport},
  ufrmStockDayReport in 'App\ufrmStockDayReport.pas' {frmStockDayReport},
  ufrmBatchCloseForDay in 'App\ufrmBatchCloseForDay.pas' {frmBatchCloseForDay},
  ufrmChangeDayReport in 'App\ufrmChangeDayReport.pas' {frmChangeDayReport},
  ufrmSaleDayReport in 'App\ufrmSaleDayReport.pas' {frmSaleDayReport},
  uSyncFactory in 'App\uSyncFactory.pas',
  ufrmStorageDayReport in 'App\ufrmStorageDayReport.pas' {frmStorageDayReport},
  ufrmRckDayReport in 'App\ufrmRckDayReport.pas' {frmRckDayReport},
  ufrmJoinRelation in 'App\ufrmJoinRelation.pas' {frmJoinRelation},
  ufrmRelation in 'App\ufrmRelation.pas' {frmRelation},
  ufrmRelationInfo in 'App\ufrmRelationInfo.pas' {frmRelationInfo},
  objRelation in 'Obj\objRelation.pas',
  ObjSyncFactory in 'Obj\ObjSyncFactory.pas',
  ufrmPayDayReport in 'App\ufrmPayDayReport.pas' {frmPayDayReport},
  ufrmRecvDayReport in 'App\ufrmRecvDayReport.pas' {frmRecvDayReport},
  ufrmRecvAbleReport in 'App\ufrmRecvAbleReport.pas' {frmRecvAbleReport},
  ufrmPayAbleReport in 'App\ufrmPayAbleReport.pas' {frmPayAbleReport},
  ufrmFindOrder in 'App\ufrmFindOrder.pas' {frmFindOrder},
  ufrmDbDayReport in 'App\ufrmDbDayReport.pas' {frmDbDayReport},
  ufrmGodsRunningReport in 'App\ufrmGodsRunningReport.pas' {frmGodsRunningReport},
  CaProductService in 'App\CaProductService.pas',
  CaTenantService in 'App\CaTenantService.pas',
  CaServiceLineService in 'App\CaServiceLineService.pas',
  ufrmBarCodePrint in 'App\ufrmBarCodePrint.pas' {frmBarCodePrint},
  ufrmIORODayReport in 'App\ufrmIORODayReport.pas' {frmIORODayReport},
  RspDownloadService in 'App\RspDownloadService.pas',
  ufrmHintMsg in 'App\ufrmHintMsg.pas' {frmHintMsg},
  ufrmMessage in 'App\ufrmMessage.pas' {frmMessage},
  ufrmMessageInfo in 'App\ufrmMessageInfo.pas' {frmMessageInfo},
  ufrmNewsPaperReader in 'App\ufrmNewsPaperReader.pas' {frmNewPaperReader},
  objMessage in 'Obj\objMessage.pas',
  ufrmPublishMessage in 'App\ufrmPublishMessage.pas' {frmPublishMessage},
  ufrmHostDialog in 'App\ufrmHostDialog.pas' {frmHostDialog},
  ufrmStkIndentOrderList in 'App\ufrmStkIndentOrderList.pas' {frmStkIndentOrderList},
  ufrmStkIndentOrder in 'App\ufrmStkIndentOrder.pas' {frmStkIndentOrder},
  ufrmQuestionnaire in 'App\ufrmQuestionnaire.pas' {frmQuestionnaire},
  ObjQuestionnaire in 'Obj\ObjQuestionnaire.pas',
  ufrmRelationUpdateMode in 'App\ufrmRelationUpdateMode.pas' {frmRelationUpdateMode},
  ufrmLocusNoProperty in 'App\ufrmLocusNoProperty.pas' {frmLocusNoProperty},
  ufrmStockOrderList in 'App\ufrmStockOrderList.pas' {frmStockOrderList},
  ufrmStockOrder in 'App\ufrmStockOrder.pas' {frmStockOrder},
  ufrmInLocusOrderList in 'App\ufrmInLocusOrderList.pas' {frmInLocusOrderList},
  ufrmStkRetuLocusOrder in 'App\ufrmStkRetuLocusOrder.pas' {frmStkRetuLocusOrder},
  ufrmIntegralGlide in 'App\ufrmIntegralGlide.pas' {frmIntegralGlide},
  ufrmSalRetuLocusOrder in 'App\ufrmSalRetuLocusOrder.pas' {frmSalRetuLocusOrder},
  ufrmDbInLocusOrder in 'App\ufrmDbInLocusOrder.pas' {frmDbInLocusOrder},
  ufrmStkLocusOrder in 'App\ufrmStkLocusOrder.pas' {frmStkLocusOrder},
  ufrmSalLocusOrder in 'App\ufrmSalLocusOrder.pas' {frmSalLocusOrder},
  ufrmIntegralGlide_Add in 'App\ufrmIntegralGlide_Add.pas' {frmIntegralGlide_Add},
  ufrmDeposit in 'App\ufrmDeposit.pas' {frmDeposit},
  ufrmCustomerExt in 'App\ufrmCustomerExt.pas' {frmCustomerExt: TFrame},
  ObjImpeach in 'Obj\ObjImpeach.pas',
  uPrainpowerJudge in 'App\uPrainpowerJudge.pas',
  ufrmDownStockOrder in 'App\ufrmDownStockOrder.pas' {frmDownStockOrder},
  ufrmBondOrderList in 'App\ufrmBondOrderList.pas' {frmBondOrderList},
  ufrmBondOrder in 'App\ufrmBondOrder.pas' {frmBondOrder},
  ufrmImpeach in 'App\ufrmImpeach.pas' {frmImpeach},
  PubMemberService in 'App\PubMemberService.pas',
  ufrmNewCard in 'App\ufrmNewCard.pas' {frmNewCard},
  ufrmPassWord in 'App\ufrmPassWord.pas' {frmPassWord},
  ufrmReturn in 'App\ufrmReturn.pas' {frmReturn},
  ufrmCancelCard in 'App\ufrmCancelCard.pas' {frmCancelCard},
  ufrmDefineStateInfo in 'App\ufrmDefineStateInfo.pas' {frmDefineStateInfo},
  ObjDefineGodsState in 'Obj\ObjDefineGodsState.pas',
  ufrmClearData in 'App\ufrmClearData.pas' {frmClearData},
  ufrmStorageTracking in 'App\ufrmStorageTracking.pas' {frmStorageTracking},
  ufrmLossCard in 'App\ufrmLossCard.pas' {frmLossCard},
  uframeBaseAnaly in 'Frame\uframeBaseAnaly.pas' {frameBaseAnaly},
  ufrmSaleAnaly in 'App\ufrmSaleAnaly.pas',
  ufrmExcelFactory in 'App\ufrmExcelFactory.pas' {frmExcelFactory},
  uReportFactory in 'App\uReportFactory.pas',
  ufrmOptionDefine in 'App\ufrmOptionDefine.pas' {frmOptionDefine},
  ufrmSaleManSaleReport in 'App\ufrmSaleManSaleReport.pas' {frmSaleManSaleReport},
  ufrmClientSaleReport in 'App\ufrmClientSaleReport.pas' {frmClientSaleReport},
  ufrmTenantInfo in 'App\ufrmTenantInfo.pas' {frmTenantInfo},
  uTimerFactory in 'App\uTimerFactory.pas',
  ufrmStgTotalReport in 'App\ufrmStgTotalReport.pas' {frmStgTotalReport},
  ufrmDefineReport in 'App\ufrmDefineReport.pas' {frmDefineReport},
  ObjDefineReport in 'Obj\ObjDefineReport.pas',
  ufrmStockTotalReport in 'App\ufrmStockTotalReport.pas' {frmStockTotalReport},
  ufrmSaleTotalReport in 'App\ufrmSaleTotalReport.pas' {frmSaleTotalReport},
  ufrmPrgBar in '..\..\Basic\ufrmPrgBar.pas' {frmPrgBar},
  objHandSetRelation in 'Obj\objHandSetRelation.pas',
  ufrmRelationHandSet in 'App\ufrmRelationHandSet.pas' {frmRelationHandSet},
  ufrmFieldSort in 'App\ufrmFieldSort.pas' {frmFieldSort},
  ufrmAllRckReport in 'App\ufrmAllRckReport.pas' {frmAllRckReport},
  ufrmInitialRights in 'App\ufrmInitialRights.pas' {frmInitialRights},
  ufrmShopMain in 'ufrmShopMain.pas' {frmShopMain},
  ufrmShopDesk in 'ufrmShopDesk.pas' {frmShopDesk},
  ufrmInitGuide in 'App\ufrmInitGuide.pas' {frmInitGuide},
  uLoginFactory in 'App\uLoginFactory.pas',
  objGoodsMonth in 'Obj\objGoodsMonth.pas',
  ufrmGoodsMonth in 'App\ufrmGoodsMonth.pas' {frmGoodsMonth},
  ufrmDemandOrder in 'App\ufrmDemandOrder.pas' {frmDemandOrder},
  ufrmDemandOrderList in 'App\ufrmDemandOrderList.pas' {frmDemandOrderList},
  ObjDemandOrder in 'Obj\ObjDemandOrder.pas',
  ufrmMktTaskOrder in 'App\ufrmMktTaskOrder.pas' {frmMktTaskOrder},
  ufrmMktTaskOrderList in 'App\ufrmMktTaskOrderList.pas' {frmMktTaskOrderList},
  ufrmKpiIndex in 'App\ufrmKpiIndex.pas' {frmKpiIndex},
  ufrmKpiIndexInfo in 'App\ufrmKpiIndexInfo.pas' {frmKpiIndexInfo},
  uframeContractForm in 'Frame\uframeContractForm.pas' {frameContractForm},
  uframeContractToolForm in 'Frame\uframeContractToolForm.pas' {frameContractToolForm},
  ObjKpiIndex in 'Obj\ObjKpiIndex.pas',
  ObjMktTaskOrder in 'Obj\ObjMktTaskOrder.pas',
  ObjMktRequOrder in 'Obj\ObjMktRequOrder.pas',
  ufrmDateControl in 'App\ufrmDateControl.pas' {frmDateControl: TFrame},
  ufrmSalRetuMenu in 'App\ufrmSalRetuMenu.pas' {frmSalRetuMenu},
  ufrmRecvOrder in 'App\ufrmRecvOrder.pas' {frmRecvOrder},
  ufrmRecvOrderList in 'App\ufrmRecvOrderList.pas' {frmRecvOrderList},
  ufrmMktRequOrder in 'App\ufrmMktRequOrder.pas' {frmMktRequOrder},
  ufrmMktRequOrderList in 'App\ufrmMktRequOrderList.pas' {frmMktRequOrderList},
  ObjRecvOrder in 'Obj\ObjRecvOrder.pas',
  ufrmMktPlanOrder in 'App\ufrmMktPlanOrder.pas' {frmMktPlanOrder},
  ufrmMktPlanOrderList in 'App\ufrmMktPlanOrderList.pas' {frmMktPlanOrderList},
  ObjMktPlanOrder in 'Obj\ObjMktPlanOrder.pas',
  ufrmMktKpiResultList in 'App\ufrmMktKpiResultList.pas' {frmMktKpiResultList},
  ufrmMktKpiCalculate in 'App\ufrmMktKpiCalculate.pas' {frmMktKpiCalculate},
  ufrmMktKpiResult in 'App\ufrmMktKpiResult.pas' {frmMktKpiResult},
  uKpiCalculate in 'App\uKpiCalculate.pas',
  ObjMktKpiResult in 'Obj\ObjMktKpiResult.pas',
  ufrmBondRequReport in 'App\ufrmBondRequReport.pas' {frmBondRequReport},
  ufrmMktRequReport in 'App\ufrmMktRequReport.pas' {frmMktRequReport},
  ufrmMktCostTotalReport in 'App\ufrmMktCostTotalReport.pas' {frmMktCostTotalReport},
  ufrmMktKpiTotalReport in 'App\ufrmMktKpiTotalReport.pas' {frmMktKpiTotalReport},
  ufrmMktActiveList in 'App\ufrmMktActiveList.pas' {frmMktActiveList},
  ObjMktActiveList in 'Obj\ObjMktActiveList.pas',
  uUIFactory in '..\..\Basic\uUIFactory.pas',
  ufrmBomOrder in 'App\ufrmBomOrder.pas' {frmBomOrder},
  ufrmBomOrderList in 'App\ufrmBomOrderList.pas' {frmBomOrderList},
  ObjBomOrder in 'Obj\ObjBomOrder.pas',
  ufrmPriceLevelSet in 'App\ufrmPriceLevelSet.pas' {frmPriceLevelSet},
  ufrmSalInvoice in 'App\ufrmSalInvoice.pas' {frmSalInvoice},
  ufrmSalInvoiceList in 'App\ufrmSalInvoiceList.pas' {frmSalInvoiceList},
  ObjInvoiceOrder in 'Obj\ObjInvoiceOrder.pas',
  ufrmShowPanel in 'App\ufrmShowPanel.pas' {frmShowPanel},
  uN26Factory in 'App\uN26Factory.pas' {N26Factory: TDataModule},
  uGodsFactory in 'App\uGodsFactory.pas',
  uSyncThread in 'App\uSyncThread.pas',
  uWelcome in 'App\uWelcome.pas',
  LCContrllerLib in 'App\LCContrllerLib.pas',
  uCommand in 'App\uCommand.pas',
  ufrmOrderHandSet in 'App\ufrmOrderHandSet.pas' {frmOrderHandSet},
  ufrmDbLocusOrder in 'App\ufrmDbLocusOrder.pas' {frmDbLocusOrder},
  ufrmPosMainList in 'App\ufrmPosMainList.pas' {frmPosMainList},
  ufrmProfitAnaly in 'App\ufrmProfitAnaly.pas' {frmProfitAnaly: TFrame},
  ufrmPotenAnaly in 'App\ufrmPotenAnaly.pas' {frmPotenAnaly: TFrame},
  ufrmPwdViewer in 'App\ufrmPwdViewer.pas' {frmPwdViewer},
  ufrmSaleMonthTotalReport in 'App\ufrmSaleMonthTotalReport.pas' {frmSaleMonthTotalReport},
  ufrmKpiRatioSet in 'App\ufrmKpiRatioSet.pas' {frmKpiRatioSet},
  ufrmKpiSeqNoSet in 'App\ufrmKpiSeqNoSet.pas' {frmKpiSeqNoSet},
  ufrmKpiTimes in 'App\ufrmKpiTimes.pas' {frmKpiTimes},
  ufrmClientKpiReport in 'App\ufrmClientKpiReport.pas' {frmClientKpiReport},
  ufrmManKpiReport in 'App\ufrmManKpiReport.pas' {frmManKpiReport},
  ufrmMktMarketCostOrderList in 'App\ufrmMktMarketCostOrderList.pas' {frmMktMarketCostOrderList},
  ufrmMktMarketCostOrder in 'App\ufrmMktMarketCostOrder.pas' {frmMktMarketCost},
  ObjCostCalc in 'Obj\ObjCostCalc.pas',
  ufrmMktGodsReport in 'App\ufrmMktGodsReport.pas' {frmMktGodsReport},
  ufrmMktBudgOrder in 'App\ufrmMktBudgOrder.pas' {frmMktBudgOrder},
  ufrmMktBudgOrderList in 'App\ufrmMktBudgOrderList.pas' {frmMktBudgOrderList},
  ufrmMktBudgReport in 'App\ufrmMktBudgReport.pas' {frmMktBudgReport},
  ObjMktBudgOrder in 'Obj\ObjMktBudgOrder.pas',
  ufrmFindRequOrder in 'App\ufrmFindRequOrder.pas' {frmFindRequOrder},
  ufrmMktPlanOrder3 in 'App\ufrmMktPlanOrder3.pas' {frmMktPlanOrder3},
  ufrmMktPlanOrderList3 in 'App\ufrmMktPlanOrderList3.pas' {frmMktPlanOrderList3},
  ObjMktPlanOrder3 in 'Obj\ObjMktPlanOrder3.pas',
  ufrmStkInvoiceList in 'App\ufrmStkInvoiceList.pas' {frmStkInvoiceList},
  ufrmStkInvoice in 'App\ufrmStkInvoice.pas' {frmStkInvoice},
  ObjStkInvoiceOrder in 'Obj\ObjStkInvoiceOrder.pas',
  ufrmMktAtthOrder in 'App\ufrmMktAtthOrder.pas' {frmMktAtthOrder},
  ufrmMktAtthOrderList in 'App\ufrmMktAtthOrderList.pas' {frmMktAtthOrderList},
  ObjMktAtthOrder in 'Obj\ObjMktAtthOrder.pas',
  ufrmSalIndentDayReport in 'App\ufrmSalIndentDayReport.pas' {frmSalIndentDayReport},
  ufrmMktKpiModify in 'App\ufrmMktKpiModify.pas' {frmMktKpiModify},
  ObjMktKpiModify in 'Obj\ObjMktKpiModify.pas',
  ufrmFvchCalc in 'App\ufrmFvchCalc.pas' {frmFvchCalc},
  ufrmFvchFrame in 'App\ufrmFvchFrame.pas' {frmFvchFrame},
  ufrmFvchFrameDefine in 'App\ufrmFvchFrameDefine.pas' {frmFvchFrameDefine},
  ufrmFvchFrameInfo in 'App\ufrmFvchFrameInfo.pas' {frmFvchFrameInfo},
  ObjFvchFrame in 'Obj\ObjFvchFrame.pas',
  ufrmFvchOrder in 'App\ufrmFvchOrder.pas' {frmFvchOrder},
  ufrmFvchOrderList in 'App\ufrmFvchOrderList.pas' {frmFvchOrderList},
  ObjFvchOrder in 'Obj\ObjFvchOrder.pas',
  ufvchDataSQL in 'App\ufvchDataSQL.pas',
  ufrmInvoiceTotalReport in 'App\ufrmInvoiceTotalReport.pas' {frmInvoiceTotalReport},
  ufrmVhLeadOrder in 'App\ufrmVhLeadOrder.pas' {frmVhLeadOrder},
  ufrmVhLeadOrderList in 'App\ufrmVhLeadOrderList.pas' {frmVhLeadOrderList},
  ufrmVhPayGlide in 'App\ufrmVhPayGlide.pas' {frmVhPayGlide},
  ufrmVhSendOrder in 'App\ufrmVhSendOrder.pas' {frmVhSendOrder},
  ufrmVhSendOrderList in 'App\ufrmVhSendOrderList.pas' {frmVhSendOrderList},
  ufrmVoucherOrder in 'App\ufrmVoucherOrder.pas' {frmVoucherOrder},
  ufrmVoucherOrderList in 'App\ufrmVoucherOrderList.pas' {frmVoucherOrderList},
  ObjFvchIntfSet in 'Obj\ObjFvchIntfSet.pas',
  ObjFvchPosting in 'Obj\ObjFvchPosting.pas',
  ObjVhLeadOrder in 'Obj\ObjVhLeadOrder.pas',
  ObjVhPayGlide in 'Obj\ObjVhPayGlide.pas',
  ObjVhSendOrder in 'Obj\ObjVhSendOrder.pas',
  ObjVoucherOrder in 'Obj\ObjVoucherOrder.pas',
  ufrmFvchIntfSet in 'App\ufrmFvchIntfSet.pas' {frmFvchIntfSet},
  ufrmBusinessIncomeDayReport in 'App\ufrmBusinessIncomeDayReport.pas' {frmBusinessIncomeDayReport},
  ufrmSvcServiceInfo in 'App\ufrmSvcServiceInfo.pas' {frmSvcServiceInfo},
  ufrmSvcServiceList in 'App\ufrmSvcServiceList.pas' {frmSvcServiceList},
  ObjSvcServiceInfo in 'Obj\ObjSvcServiceInfo.pas',
  ufrmFilterUser in 'App\ufrmFilterUser.pas' {frmFilterUser},
  ufrmSizeGroupInfo in 'App\ufrmSizeGroupInfo.pas' {frmSizeGroupInfo},
  ufrmColorGroupInfo in 'App\ufrmColorGroupInfo.pas' {frmColorGroupInfo},
  ufrmSizeInfo in 'App\ufrmSizeInfo.pas' {frmSizeInfo},
  ufrmColorInfo in 'App\ufrmColorInfo.pas' {frmColorInfo},
  ObjColorInfo in 'Obj\ObjColorInfo.pas',
  ObjSizeInfo in 'Obj\ObjSizeInfo.pas',
  ufrmInputNumber in 'App\ufrmInputNumber.pas' {frmInputNumber},
  ufrmBatchAdjustPrice in 'App\ufrmBatchAdjustPrice.pas' {frmBatchAdjustPrice},
  ufrmPriceingInfo in 'App\ufrmPriceingInfo.pas' {frmPriceingInfo},
  ufrmGodsComPare in 'App\ufrmGodsComPare.pas' {frmGodsComPare};

{$R *.res}
var
  f:TextFile;
  handle:THandle;
  Msg:Integer;
begin
  Application.Initialize;
  DBVersion := '1.0.3.4';
  Application.Title := 'R3零售终端管理系统';
  Application.CreateForm(TdmIcon, dmIcon);
  Application.CreateForm(TShopGlobal, ShopGlobal);
  Application.CreateForm(TfrmShopMain, frmShopMain);
  Application.CreateForm(TfrmShopDesk, frmShopDesk);
  Application.ShowMainForm := false;
  if not Runed then //如果已经运行
  begin
    PostMessage(frmShopMain.Handle,WM_LOGIN_REQUEST,1,1);
  end;
  Application.Run;

end.
