inherited ShopGlobal: TShopGlobal
  OldCreateOrder = True
  Left = 274
  Top = 116
  Height = 594
  Width = 692
  object SYS_DEFINE: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select * from SYS_DEFINE where TENANT_ID=0 or TENANT_ID=:TENANT_' +
        'ID and COMM not in ('#39'02'#39','#39'12'#39')')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 136
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object CA_RIGHTS: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      'select '#39'0'#39' as MID,'#39'0'#39' as CHK ')
    Params = <>
    Left = 136
    Top = 160
  end
  object CA_USERS: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select USER_ID,USER_SPELL,USER_NAME,ACCOUNT,DUTY_IDS,ROLE_IDS,SH' +
        'OP_ID from VIW_USERS where COMM not in ('#39'02'#39','#39'12'#39')'
      'and TENANT_ID=:TENANT_ID order by ACCOUNT')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 136
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object CA_SHOP_INFO: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select SHOP_ID,SHOP_NAME,SHOP_SPELL,SEQ_NO from CA_SHOP_INFO whe' +
        're TENANT_ID=:TENANT_ID and COMM not in ('#39'02'#39','#39'12'#39') order by SEQ' +
        '_NO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 136
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object CA_DUTY_INFO: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select DUTY_ID,DUTY_SPELL,DUTY_NAME,LEVEL_ID from CA_DUTY_INFO w' +
        'here COMM not in ('#39'02'#39','#39'12'#39')'
      'and TENANT_ID=:TENANT_ID order by LEVEL_ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 240
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object CA_ROLE_INFO: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select ROLE_ID,ROLE_SPELL,ROLE_NAME from CA_ROLE_INFO where COMM' +
        ' not in ('#39'02'#39','#39'12'#39')'
      'and TENANT_ID=:TENANT_ID order by ROLE_ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 240
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object CA_TENANT: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select * from CA_TENANT where TENANT_ID=:TENANT_ID and COMM not ' +
        'in ('#39'02'#39','#39'12'#39')')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 48
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object PUB_REGION_INFO: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select CODE_ID,CODE_NAME,CODE_SPELL from PUB_CODE_INFO where COD' +
        'E_TYPE=8 and COMM not in ('#39'02'#39','#39'12'#39')')
    Params = <>
    Left = 240
    Top = 152
  end
  object PUB_PAYMENT: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select CODE_ID,CODE_NAME,CODE_SPELL from VIW_PAYMENT where TENAN' +
        'T_ID=:TENANT_ID and  COMM not in ('#39'02'#39','#39'12'#39')')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 240
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object PUB_GOODSINFO: TZQuery
    SortedFields = 'GODS_ID'
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select J.GODS_ID as GODS_ID,GODS_CODE,BARCODE,GODS_SPELL,GODS_NA' +
        'ME,CALC_UNITS,SMALL_UNITS,BIG_UNITS,SMALLTO_CALC,BIGTO_CALC,'
      
        '       case when C.NEW_INPRICE is null then J.NEW_INPRICE else C' +
        '.NEW_INPRICE end as NEW_INPRICE,'
      
        '       case when C.NEW_INPRICE is null then J.NEW_INPRICE*J.SMAL' +
        'LTO_CALC else C.NEW_INPRICE1 end as NEW_INPRICE1,'
      
        '       case when C.NEW_INPRICE is null then J.NEW_INPRICE*J.BIGT' +
        'O_CALC else C.NEW_INPRICE2 end as NEW_INPRICE2,'
      '       NEW_OUTPRICE,'
      '       NEW_OUTPRICE1,'
      '       NEW_OUTPRICE2,'
      '       NEW_LOWPRICE,'
      
        '       SORT_ID7,SORT_ID8,USING_BARTER,BARTER_INTEGRAL,USING_BATC' +
        'H_NO,USING_LOCUS_NO'
      'from ('
      
        'select * from VIW_GOODSPRICE where POLICY_TYPE=2 and SHOP_ID=:SH' +
        'OP_ID and TENANT_ID=:TENANT_ID'
      'union all'
      'select A.* from VIW_GOODSPRICE A,VIW_GOODSPRICE B '
      
        'where B.POLICY_TYPE=1 and A.TENANT_ID=B.TENANT_ID and A.GODS_ID=' +
        'B.GODS_ID and B.SHOP_ID=:SHOP_ID and A.SHOP_ID=:SHOP_ID_ROOT and' +
        ' A.TENANT_ID=:TENANT_ID'
      
        ') J left join PUB_GOODSINFOEXT C on J.GODS_ID=C.GODS_ID and J.TE' +
        'NANT_ID=C.TENANT_ID'
      'where J.COMM not in ('#39'02'#39','#39'12'#39') order by J.GODS_CODE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'SHOP_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SHOP_ID_ROOT'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'GODS_ID Asc'
    Left = 136
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SHOP_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SHOP_ID_ROOT'
        ParamType = ptUnknown
      end>
  end
  object PUB_CLIENTINFO: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select CLIENT_ID,LICENSE_CODE,CLIENT_CODE,CLIENT_NAME,CLIENT_SPE' +
        'LL,ADDRESS,IC_CARDNO,SETTLE_CODE,INVOICE_FLAG,TAX_RATE,PRICE_ID'
      ' from VIW_CLIENTINFO '
      'where COMM not in ('#39'02'#39','#39'12'#39')  and CLIENT_TYPE='#39'2'#39
      'and TENANT_ID=:TENANT_ID order by CLIENT_CODE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 136
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object PUB_CUSTOMER: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select CLIENT_ID,LICENSE_CODE,CLIENT_CODE,CLIENT_NAME,LINKMAN,CL' +
        'IENT_SPELL,ADDRESS,TELEPHONE2,IC_CARDNO,SETTLE_CODE,INVOICE_FLAG' +
        ',TAX_RATE,PRICE_ID'
      ' from VIW_CUSTOMER'
      'where COMM not in ('#39'02'#39','#39'12'#39')  and CLIENT_TYPE='#39'2'#39
      'and TENANT_ID=:TENANT_ID order by CLIENT_CODE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 136
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object PUB_MEAUNITS: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select UNIT_ID,UNIT_NAME,UNIT_SPELL from VIW_MEAUNITS where COMM' +
        ' not in ('#39'02'#39','#39'12'#39') and TENANT_ID=:TENANT_ID  order by SEQ_NO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 240
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object PUB_PARAMS: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select CODE_ID,CODE_NAME,TYPE_CODE from PUB_PARAMS order by  TYP' +
        'E_CODE,CODE_ID')
    Params = <>
    Left = 240
    Top = 360
  end
  object CA_DEPT_INFO: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select  DEPT_ID,DEPT_NAME,DEPT_SPELL,LEVEL_ID,TELEPHONE,LINKMAN,' +
        'FAXES,REMARK,SEQ_NO '
      'from CA_DEPT_INFO where TENANT_ID=:TENANT_ID order by LEVEL_ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 136
    Top = 480
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object PUB_BRAND_INFO: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select '#39'#'#39' as SORT_ID,'#39#26080#21697#29260#39' as SORT_NAME,'#39'W'#39' as SORT_SPELL,0 as ' +
        'SEQ_NO from CA_TENANT'
      'where TENANT_ID=:TENANT_ID'
      'union all'
      'select SORT_ID,SORT_NAME,SORT_SPELL,SEQ_NO from VIW_GOODSSORT '
      
        'where  TENANT_ID=:TENANT_ID and  COMM not in ('#39'02'#39','#39'12'#39') and SOR' +
        'T_TYPE='#39'4'#39
      'order  by  4')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 352
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object PUB_GOODSSORT: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      'select SORT_ID,SORT_NAME,SORT_SPELL,LEVEL_ID,'
      
        'RELATION_ID,RELATION_NAME from VIW_GOODSSORT where COMM not in (' +
        #39'02'#39','#39'12'#39') and SORT_TYPE=1 and TENANT_ID=:TENANT_ID '
      'order by RELATION_ID DESC,LEVEL_ID,SEQ_NO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 352
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object PUB_CATE_INFO: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select '#39'#'#39' as SORT_ID,'#39#26080#31867#21035#39' as SORT_NAME,'#39'W'#39' as SORT_SPELL,0 as ' +
        'SEQ_NO from CA_TENANT'
      'where TENANT_ID=:TENANT_ID'
      'union all'
      'select SORT_ID,SORT_NAME,SORT_SPELL,SEQ_NO from VIW_GOODSSORT '
      
        'where  TENANT_ID=:TENANT_ID and  COMM not in ('#39'02'#39','#39'12'#39') and SOR' +
        'T_TYPE='#39'2'#39
      'order  by  4')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 352
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object PUB_IMPT_INFO: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select '#39'#'#39' as SORT_ID,'#39#26080#39' as SORT_NAME,'#39'W'#39' as SORT_SPELL,0 as SE' +
        'Q_NO from CA_TENANT'
      'where TENANT_ID=:TENANT_ID'
      'union all'
      'select SORT_ID,SORT_NAME,SORT_SPELL,SEQ_NO from VIW_GOODSSORT '
      
        'where  TENANT_ID=:TENANT_ID and  COMM not in ('#39'02'#39','#39'12'#39') and SOR' +
        'T_TYPE='#39'5'#39
      'order  by  4')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 352
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object PUB_COLOR_GROUP: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select '#39'#'#39' as SORT_ID,'#39#19981#20998#33394#39' as SORT_NAME,'#39'W'#39' as SORT_SPELL,0 as ' +
        'SEQ_NO from CA_TENANT'
      'where TENANT_ID=:TENANT_ID'
      'union all'
      'select SORT_ID,SORT_NAME,SORT_SPELL,SEQ_NO from VIW_GOODSSORT '
      
        'where  TENANT_ID=:TENANT_ID and  COMM not in ('#39'02'#39','#39'12'#39') and SOR' +
        'T_TYPE='#39'7'#39
      'order  by  4')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 352
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object PUB_SIZE_GROUP: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select '#39'#'#39' as SORT_ID,'#39#19981#20998#30721#39' as SORT_NAME,'#39'W'#39' as SORT_SPELL,0 as ' +
        'SEQ_NO from CA_TENANT'
      'where TENANT_ID=:TENANT_ID'
      'union all'
      'select SORT_ID,SORT_NAME,SORT_SPELL,SEQ_NO from VIW_GOODSSORT '
      
        'where  TENANT_ID=:TENANT_ID and  COMM not in ('#39'02'#39','#39'12'#39') and SOR' +
        'T_TYPE='#39'8'#39
      'order  by  4')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 352
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object PUB_AREA_INFO: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select '#39'#'#39' as SORT_ID,'#39#26080#39' as SORT_NAME,'#39'W'#39' as SORT_SPELL,0 as SE' +
        'Q_NO from CA_TENANT'
      'where TENANT_ID=:TENANT_ID'
      'union all'
      'select SORT_ID,SORT_NAME,SORT_SPELL,SEQ_NO from VIW_GOODSSORT '
      
        'where  TENANT_ID=:TENANT_ID and  COMM not in ('#39'02'#39','#39'12'#39') and SOR' +
        'T_TYPE='#39'6'#39
      'order  by  4')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 352
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object PUB_COLOR_INFO: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select COLOR_ID,COLOR_NAME,COLOR_SPELL,SORT_ID7S,SEQ_NO from VIW' +
        '_COLOR_INFO '
      'where  TENANT_ID=:TENANT_ID and  COMM not in ('#39'02'#39','#39'12'#39') '
      'order  by SEQ_NO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 456
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object PUB_SIZE_INFO: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select SIZE_ID,SIZE_NAME,SIZE_SPELL,SORT_ID8S,SEQ_NO from VIW_SI' +
        'ZE_INFO '
      'where  TENANT_ID=:TENANT_ID and  COMM not in ('#39'02'#39','#39'12'#39') '
      'order  by SEQ_NO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 456
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object PUB_BARCODE: TZQuery
    SortedFields = 'BARCODE'
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select GODS_ID,BARCODE,PROPERTY_01,PROPERTY_02,BATCH_NO,UNIT_ID,' +
        'BARCODE_TYPE from VIW_BARCODE '
      'where COMM not in ('#39'02'#39','#39'12'#39')'
      'and TENANT_ID=:TENANT_ID order by BARCODE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'BARCODE Asc'
    Left = 240
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object PUB_IDNTYPE_INFO: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      'select CODE_ID,CODE_NAME,CODE_SPELL,SEQ_NO from PUB_CODE_INFO'
      
        'where COMM not in ('#39'02'#39','#39'12'#39') and TENANT_ID in (0,:TENANT_ID) an' +
        'd CODE_TYPE='#39'11'#39' order by SEQ_NO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 240
    Top = 478
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object PUB_SALE_STYLE: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select CODE_ID,CODE_NAME,CODE_SPELL from PUB_CODE_INFO where TEN' +
        'ANT_ID=:TENANT_ID and CODE_TYPE=2 and COMM not in ('#39'02'#39','#39'12'#39')')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 456
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object PUB_BANK_INFO: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select CODE_ID,CODE_NAME,CODE_SPELL from PUB_CODE_INFO where COD' +
        'E_TYPE=7 and TENANT_ID in (0,:TENANT_ID ) and COMM not in ('#39'02'#39',' +
        #39'12'#39')')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 456
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object PUB_CLIENTSORT: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select '#39'#'#39' as CODE_ID,'#39#26080#39' as CODE_NAME,'#39'W'#39' as CODE_SPELL,0 as SE' +
        'Q_NO '
      'union all'
      
        'select CODE_ID,CODE_NAME,CODE_SPELL,SEQ_NO from PUB_CODE_INFO wh' +
        'ere CODE_TYPE=5 and TENANT_ID=:TENANT_ID and COMM not in ('#39'02'#39','#39 +
        '12'#39')'
      'order by SEQ_NO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 456
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object PUB_PRICEGRADE: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select * from PUB_PRICEGRADE where TENANT_ID=:TENANT_ID and COMM' +
        ' not in ('#39'02'#39','#39'12'#39')')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 456
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object ACC_ACCOUNT_INFO: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select * from VIW_ACCOUNT_INFO where TENANT_ID=:TENANT_ID and CO' +
        'MM not in ('#39'02'#39','#39'12'#39')')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 456
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object ACC_ITEM_INFO: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select * from VIW_ITEM_INFO where TENANT_ID=:TENANT_ID and COMM ' +
        'not in ('#39'02'#39','#39'12'#39')')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 456
    Top = 472
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object PUB_MONTH_PAY_INFO: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      'select CODE_ID,CODE_NAME,CODE_SPELL,SEQ_NO from PUB_CODE_INFO'
      
        'where COMM not in ('#39'02'#39','#39'12'#39') and TENANT_ID in (0,:TENANT_ID) an' +
        'd CODE_TYPE='#39'13'#39' order by SEQ_NO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 584
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object PUB_DEGREES_INFO: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      'select CODE_ID,CODE_NAME,CODE_SPELL,SEQ_NO from PUB_CODE_INFO'
      
        'where COMM not in ('#39'02'#39','#39'12'#39') and TENANT_ID in (0,:TENANT_ID) an' +
        'd CODE_TYPE='#39'14'#39' order by SEQ_NO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 584
    Top = 352
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object PUB_OCCUPATION_INFO: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      'select CODE_ID,CODE_NAME,CODE_SPELL,SEQ_NO from PUB_CODE_INFO'
      
        'where COMM not in ('#39'02'#39','#39'12'#39') and TENANT_ID in (0,:TENANT_ID) an' +
        'd CODE_TYPE='#39'15'#39' order by SEQ_NO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 584
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object ZQuery1: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select '#39'#'#39' as CODE_ID,'#39#26080#39' as CODE_NAME,'#39'W'#39' as CODE_SPELL,0 as SE' +
        'Q_NO '
      'union all'
      
        'select CODE_ID,CODE_NAME,CODE_SPELL,SEQ_NO from PUB_CODE_INFO wh' +
        'ere CODE_TYPE=5 and TENANT_ID=:TENANT_ID and COMM not in ('#39'02'#39','#39 +
        '12'#39')'
      'order by SEQ_NO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 584
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
end
