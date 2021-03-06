object dllGlobal: TdllGlobal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 192
  Top = 130
  Height = 509
  Width = 703
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
  object CA_SHOP_INFO: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select SHOP_ID,SHOP_NAME,LICENSE_CODE,SHOP_SPELL,SEQ_NO,REGION_I' +
        'D,LINKMAN,TELEPHONE,ADDRESS from CA_SHOP_INFO where TENANT_ID=:T' +
        'ENANT_ID and COMM not in ('#39'02'#39','#39'12'#39') order by SEQ_NO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 160
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object SYS_DEFINE: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select * from SYS_DEFINE where (TENANT_ID=0 or TENANT_ID=:TENANT' +
        '_ID) and COMM not in ('#39'02'#39','#39'12'#39')')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 48
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object CA_USERS: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select USER_ID,USER_SPELL,USER_NAME,ACCOUNT,DUTY_IDS,ROLE_IDS,SH' +
        'OP_ID,MM,DEPT_ID from VIW_USERS where COMM not in ('#39'02'#39','#39'12'#39')'
      'and TENANT_ID=:TENANT_ID and USER_ID<>'#39'system'#39' order by ACCOUNT')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 48
    Top = 136
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
        ',TAX_RATE,PRICE_ID,FLAG'
      ' from VIW_CUSTOMER'
      'where COMM not in ('#39'02'#39','#39'12'#39')  and CLIENT_TYPE='#39'2'#39
      'and TENANT_ID=:TENANT_ID order by CLIENT_CODE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 160
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object PUB_CLIENTINFO: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select CLIENT_ID,LICENSE_CODE,CLIENT_CODE,CLIENT_NAME,CLIENT_SPE' +
        'LL,LINKMAN,TELEPHONE2,ADDRESS,IC_CARDNO,SETTLE_CODE,INVOICE_FLAG' +
        ',TAX_RATE,SHOP_ID,PRICE_ID,FLAG'
      ' from VIW_CLIENTINFO '
      'where COMM not in ('#39'02'#39','#39'12'#39')  and CLIENT_TYPE='#39'1'#39
      'and TENANT_ID=:TENANT_ID order by CLIENT_CODE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 48
    Top = 248
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
      'select'
      '  0 as A,GODS_ID,GODS_CODE,BARCODE,GODS_NAME,GODS_SPELL,'
      '  UNIT_ID,CALC_UNITS,SMALL_UNITS,BIG_UNITS,SMALLTO_CALC,'
      '  BIGTO_CALC,SORT_ID7,SORT_ID8,USING_BARTER,BARTER_INTEGRAL,'
      '  USING_BATCH_NO,USING_LOCUS_NO,RELATION_ID,'
      '  NEW_INPRICE,NEW_LOWPRICE,NEW_OUTPRICE'
      'from  VIW_GOODSPRICEEXT'
      'where TENANT_ID=:TENANT_ID'
      '      and SHOP_ID=:SHOP_ID'
      '      and COMM not in ('#39'02'#39','#39'12'#39')'
      'order by GODS_CODE'
      ' '
      ' '
      ' ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SHOP_ID'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'GODS_ID Asc'
    Left = 48
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SHOP_ID'
        ParamType = ptUnknown
      end>
  end
  object PUB_MEAUNITS: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select UNIT_ID,UNIT_NAME,UNIT_SPELL,RELATION_FLAG from VIW_MEAUN' +
        'ITS where COMM not in ('#39'02'#39','#39'12'#39') and TENANT_ID=:TENANT_ID  orde' +
        'r by SEQ_NO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 160
    Top = 192
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
    Left = 272
    Top = 192
  end
  object PUB_PRICEGRADE: TZQuery
    Tag = 1
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
    Left = 160
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object CA_RELATIONS: TZQuery
    Tag = 1
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select A.RELATION_ID as RELATION_ID ,CHANGE_PRICE,SINGLE_LIMIT,S' +
        'ALE_LIMIT,USING_MODULE,RELATION_NAME,A.TENANT_ID as P_TENANT_ID,' +
        'B.TENANT_ID,A.RELATION_TYPE from CA_RELATIONS A,CA_RELATION B  '
      
        'where A.RELATION_ID=B.RELATION_ID and A.RELATI_ID=:TENANT_ID ord' +
        'er by A.RELATION_ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 272
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object PUB_UNION_INFO: TZQuery
    Tag = 1
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select TENANT_ID,UNION_ID,UNION_NAME from PUB_UNION_INFO where U' +
        'NION_ID in (select PRICE_ID from PUB_PRICEGRADE where TENANT_ID ' +
        'in (select TENANT_ID from CA_RELATIONS where RELATION_ID=1000006' +
        ' and RELATI_ID=:TENANT_ID) and COMM not in ('#39'02'#39','#39'12'#39')) and COMM' +
        ' not in ('#39'02'#39','#39'12'#39')')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 384
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object PUB_PAYMENT: TZQuery
    Tag = 1
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select CODE_ID,CODE_NAME,CODE_SPELL from VIW_PAYMENT where TENAN' +
        'T_ID=:TENANT_ID and  COMM not in ('#39'02'#39','#39'12'#39')'
      'order by CODE_ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 160
    Top = 80
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
    Left = 272
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
        'E_TYPE='#39'8'#39' and COMM not in ('#39'02'#39','#39'12'#39')')
    Params = <>
    Left = 272
    Top = 248
  end
  object PUB_STAT_INFO: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      'select CODE_ID,CODE_NAME,SEQ_NO from ('
      
        'select j.CODE_ID,case when b.CODE_NAME is null then j.CODE_NAME ' +
        'else b.CODE_NAME end as CODE_NAME,'
      
        'case when b.SEQ_NO is null then 0 else b.SEQ_NO end as SEQ_NO fr' +
        'om PUB_PARAMS j left outer join '
      
        '(select CODE_ID,CODE_NAME,SEQ_NO from  PUB_CODE_INFO where TENAN' +
        'T_ID=:TENANT_ID and CODE_TYPE='#39'16'#39' ) b on j.CODE_ID=b.CODE_ID '
      'where j.TYPE_CODE='#39'SORT_TYPE'#39')'
      
        'g where not(CODE_NAME like '#39#33258#23450#20041'%'#39') order by SEQ_NO, cast(CODE_ID' +
        ' as int)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 272
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
  object PUB_GOODS_INDEXS: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select SORT_ID,SORT_NAME,SORT_SPELL,SEQ_NO,SORT_TYPE,LEVEL_ID fr' +
        'om VIW_GOODSSORT '
      'where  TENANT_ID=:TENANT_ID and  COMM not in ('#39'02'#39','#39'12'#39') '
      'order  by SORT_TYPE,LEVEL_ID,SEQ_NO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
    Left = 384
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TENANT_ID'
        ParamType = ptUnknown
      end>
  end
end
