﻿	var ds = new dataset();
	$().ready( function() {	
		var jsonObj = JSON.parse(rsp.getUserInfo());
		var tenantId = jsonObj.tenantId;
		if(tenantId==''){
			return;	
		}
		$("#userInfo").html(jsonObj.shopName);
		jrtx_tj(tenantId);	//今日提醒
		bytx_tj(tenantId);	//本月提醒
		brpm_tj(tenantId);	//今日排名
		bypm_tj(tenantId);	//本月排名
		kc_tj(tenantId);	//库存提醒
		
		$("#jrtx").click(function(){
				$(this).attr("src","images/total_tab01.png");
				$("#bytx").attr("src","images/total_tab2.png");
				$("#jrtxdiv").css("display","block");
				$("#bytxdiv").css("display","none");
			});
		$("#bytx").click(function () {
				$(this).attr("src","images/total_tab02.png");
				$("#jrtx").attr("src","images/total_tab1.png");		
				$("#bytxdiv").css("display","block");
				$("#jrtxdiv").css("display","none");
			});	
		$("#brpm").click(function(){
				$(this).attr("src","images/rank_tab01.png");
				$("#bypm").attr("src","images/rank_tab2.png");
				$("#brpm_table").css("display","block");
				$("#bypm_table").css("display","none");
			});
		$("#bypm").click(function () {
				$(this).attr("src","images/rank_tab02.png");
				$("#brpm").attr("src","images/rank_tab1.png");		
				$("#bypm_table").css("display","block");
				$("#brpm_table").css("display","none");
			});						
	});
	//屏蔽右键菜单
	document.oncontextmenu = function (event){
		if(window.event){
			event = window.event;
		}try{
			var the = event.srcElement;
			if (!((the.tagName == "INPUT" && the.type.toLowerCase() == "text") || the.tagName == "TEXTAREA")){
				return false;
			}
			return true;
		}catch (e){
			return false; 
		} 
	}
	
	/****************************************************
	 *今日提醒统计
	 *****************************************************
	*/
	function jrtx_tj(tenant_id){
		try{
			var d = new Date();
			var d1 = d.format('yyyyMMdd');		//今天日期
			d.addDays(-1);
			var d2 = d.format('yyyyMMdd');		//昨天日期	
			ds.createDataSet();	
			var sql = "select A.SALES_DATE,sum(CALC_MONEY) CALC_MONEY,sum(CALC_MONEY-A.CALC_AMOUNT*B.NEW_INPRICE) as MAOLI from VIW_SALESDATA A,VIW_GOODSINFO B where A.TENANT_ID=B.TENANT_ID and A.GODS_ID=B.GODS_ID and A.TENANT_ID="+tenant_id+" and A.SALES_DATE in("+d1+","+d2+") group by A.SALES_DATE";
			ds.setSQL(sql);
			var dataset = factor.open(ds);
			var flag = ds.locate('SALES_DATE',d1);
			var jr_out_amount = "0";
			var jr_sale_money = "0";
			var jr_maoli = "0";
			var by_out_amount = "0";
			var by_sale_money = "0";
			var by_maoli = "0";		
			if(flag){
				jr_sale_money = ds.getAsString("CALC_MONEY");
				jr_maoli = ds.getAsString("MAOLI");
			}
			flag = ds.locate('SALES_DATE',d2);
			if(flag){
				by_sale_money = ds.getAsString("CALC_MONEY");
				by_maoli = ds.getAsString("MAOLI");			
			}
			var data = "<chart palette='2' caption='' shownames='1' showvalues='0' decimals='0' numberPrefix='' useRoundEdges='1' legendBorderAlpha='0'><categories><category label='今天' /><category label='昨天' /></categories><dataset seriesName='金额' color='003399' showValues='0'><set value='"+jr_sale_money+"' /><set value='"+by_sale_money+"' /></dataset><dataset seriesName='毛利' color='660000' showValues='0'><set value='"+jr_maoli+"' /><set value='"+by_maoli+"' /></dataset></chart>";
			var chart = new FusionCharts("./flash/MSColumn2D.swf", "ChartId", "250", "150", "0", "0");
		    chart.setDataXML(data);		   
		    chart.render("jrtxdiv");
			
			ds.eraseDataSet();
		}catch(e){
			alert(e.message);
			ds.eraseDataSet();
			return;
		}
	}
	
	/****************************************************
	 *本月提醒统计
	 *****************************************************
	*/
	function bytx_tj(tenant_id){
		try{
			var d = new Date();
			d = d.showMonthLastDay();		//本月最后一天日期
			var d2 = d.format('yyyyMMdd');		//本月最后一天日期	
			//上个月
			d.addMonths(-1);
			d = d.showMonthFirstDay();
			var d1 = d.format('yyyyMMdd');	//上个月第一天
			ds.createDataSet();
			var sql = "select A.SALES_DATE/100 as SALES_DATE,sum(CALC_MONEY) as CALC_MONEY,sum(CALC_MONEY-A.CALC_AMOUNT*B.NEW_INPRICE) as MAOLI from VIW_SALESDATA A,VIW_GOODSINFO B where A.TENANT_ID=B.TENANT_ID and A.GODS_ID=B.GODS_ID and A.TENANT_ID="+tenant_id+"  and A.SALES_DATE>"+d1+" and A.SALES_DATE<"+d2+" group by  SALES_DATE";
			ds.setSQL(sql);
			var dataset = factor.open(ds);		//查询数据
			var by_out_amount = "0";
			var by_sale_money = "0";
			var by_maoli = "0";
			var sy_out_amount = "0";
			var sy_sale_money = "0";
			var sy_maoli = "0";
			var flag = ds.locate('SALES_DATE',d1.substr(0,6));		//定位上个月数据
			if(flag){
				var sy_sale_money = ds.getAsString("CALC_MONEY");
				var sy_maoli = ds.getAsString("MAOLI");
			}
			var flag = ds.locate('SALES_DATE',d2.substr(0,6));		//定位本月数据			
			if(flag){
				var by_sale_money = ds.getAsString("CALC_MONEY");
				var by_maoli = ds.getAsString("MAOLI");
			}			
			ds.eraseDataSet();		//关闭数据连接
			var data = "<chart palette='2' caption='' shownames='1' showvalues='0' decimals='0' numberPrefix='' useRoundEdges='1' legendBorderAlpha='0'><categories><category label='本月' /><category label='上月' /></categories><dataset seriesName='金额' color='003399' showValues='0'><set value='"+by_sale_money+"' /><set value='"+sy_sale_money+"' /></dataset><dataset seriesName='毛利' color='660000' showValues='0'><set value='"+by_maoli+"' /><set value='"+sy_maoli+"' /></dataset></chart>";
			var chart = new FusionCharts("./flash/MSColumn2D.swf", "ChartId", "250", "150", "0", "0");
		    chart.setDataXML(data);		   
		    chart.render("bytxdiv");
		}catch(e){
			alert(e.message);
			ds.eraseDataSet();
			return;
		}
	}
	
	/****************************************************
	 *今日排名统计
	 *****************************************************
	*/
	function brpm_tj(tenant_id){
		try{
			var d = new Date();
			var d1 = d.format('yyyyMMdd');		//今天日期
			ds.createDataSet();	
			ds.setSQL("select * from (select A.GODS_ID,B.GODS_NAME,sum(CALC_AMOUNT) as CALC_AMOUNT,sum(CALC_MONEY) as CALC_MONEY from VIW_SALESDATA A,VIW_GOODSINFO B where A.TENANT_ID=B.TENANT_ID and A.GODS_ID=B.GODS_ID and A.TENANT_ID='"+tenant_id+"' and A.SALES_DATE='"+d1+"' group by A.GODS_ID,B.GODS_NAME) order by CALC_MONEY desc limit 10");
			var dataset = factor.open(ds);
			ds.first();
			var cnt = 1;
			while(!ds.eof()){
				var goods_id = ds.getAsString("GODS_ID");
				var goods_name = ds.getAsString("GODS_NAME");
				var calc_amount = ds.getAsString("CALC_AMOUNT");
				var calc_money = ds.getAsString("CALC_MONEY");
				$("#goods"+cnt+" td:nth-child(2)").html(goods_name);
				$("#goods"+cnt+" td:nth-child(3)").html(calc_amount);
				$("#goods"+cnt+" td:nth-child(4)").html(calc_money);
				ds.next();
				cnt++;
			}
			
			ds.eraseDataSet();
		}catch(e){
			alert(e.message);
			ds.eraseDataSet();
			return;
		}
	}
	
	/****************************************************
	 *本月排名统计
	 *****************************************************
	*/
	function bypm_tj(tenant_id){
		try{
			var d = new Date().showMonthFirstDay();
			var d1 = d.format('yyyyMMdd');
			d = d.showMonthLastDay();		//本月第一天日期
			var d2 = d.format('yyyyMMdd');		//本月最后一天日期
			ds.createDataSet();	
			ds.setSQL("select * from (select A.GODS_ID,B.GODS_NAME,sum(CALC_AMOUNT) as CALC_AMOUNT,sum(CALC_MONEY) as CALC_MONEY from VIW_SALESDATA A,VIW_GOODSINFO B where A.TENANT_ID=B.TENANT_ID and A.GODS_ID=B.GODS_ID and b.comm not in ('02','12') and A.TENANT_ID="+tenant_id+" and A.SALES_DATE>='"+d1+"' and A.SALES_DATE<='"+d2+"' group by A.GODS_ID,B.GODS_NAME) order by CALC_MONEY desc limit 10");
			var dataset = factor.open(ds);
			ds.first();
			var cnt = 1;
			while(!ds.eof()){
				var goods_id = ds.getAsString("GODS_ID");
				var goods_name = ds.getAsString("GODS_NAME");
				var calc_amount = ds.getAsString("CALC_AMOUNT");
				var calc_money = ds.getAsString("CALC_MONEY");
				$("#goods_"+cnt+" td:nth-child(2)").html(goods_name);
				$("#goods_"+cnt+" td:nth-child(3)").html(calc_amount);
				$("#goods_"+cnt+" td:nth-child(4)").html(calc_money);
				ds.next();
				cnt++;
			}
			
			ds.eraseDataSet();
		}catch(e){
			alert(e.message);
			ds.eraseDataSet();
			return;
		}
	}
	
	/****************************************************
	 *库存统计
	 *****************************************************
	*/
	function kc_tj(tenant_id){
		try{
			ds.createDataSet();	
			ds.setSQL("select count(distinct A.GODS_ID) as GODS_AMT,sum(A.AMOUNT) as AMOUNT,sum(A.AMOUNT*B.NEW_OUTPRICE) as AMONEY from STO_STORAGE A,VIW_GOODSINFO B where A.TENANT_ID=B.TENANT_ID and b.comm not in ('02','12') and A.GODS_ID=B.GODS_ID and A.TENANT_ID="+tenant_id);
			var dataset = factor.open(ds);
			ds.first();
			var goods_amt = ds.getAsString("GODS_AMT");
			var amount = ds.getAsString("AMOUNT");
			var amoney = ds.getAsString("AMONEY");
			$("#kctx").html("经营商品:"+goods_amt+"个<br/>库存数量:"+amount+"<br/>库存金额:"+amoney+"元。");
			ds.eraseDataSet();
		}catch(e){
			alert(e.message);
			ds.eraseDataSet();
			return;
		}
	}
	