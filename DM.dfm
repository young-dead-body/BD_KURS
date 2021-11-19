object dmFACULT: TdmFACULT
  OldCreateOrder = False
  Height = 599
  Width = 687
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = dbFACULT
    Left = 128
    Top = 24
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = dbFACULT
    Left = 224
    Top = 24
  end
  object dbFACULT: TpFIBDatabase
    Connected = True
    DBName = 'sqledu02:F:\JOB\7 '#1089#1077#1084#1072#1082'\'#1041#1044'\'#1057#1059#1041#1044'\database for DBMS\FACULT026.FDB'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = WriteTransaction
    SQLDialect = 1
    Timeout = 0
    LibraryName = 'C:\Program Files (x86)\Firebird\Firebird_2_5\bin\fbclient.dll'
    WaitForRestoreConnect = 0
    Left = 32
    Top = 24
  end
  object dstPD: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE PD'
      'SET '
      '    NPD = :NPD,'
      '    NDIS = :NDIS,'
      '    NTEACH = :NTEACH'
      'WHERE'
      '    NPD = :OLD_NPD'
      '    and NDIS = :OLD_NDIS'
      '    and NTEACH = :OLD_NTEACH'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    PD'
      'WHERE'
      '        NPD = :OLD_NPD'
      '    and NDIS = :OLD_NDIS'
      '    and NTEACH = :OLD_NTEACH'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO PD('
      '    NPD,'
      '    NDIS,'
      '    NTEACH'
      ')'
      'VALUES('
      '    :NPD,'
      '    :NDIS,'
      '    :NTEACH'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    NPD,'
      '    NDIS,'
      '    NTEACH'
      'FROM'
      '    PD '
      'WHERE(  NTEACH = :NTEACH'
      '     ) and (     PD.NPD = :OLD_NPD'
      '    and PD.NDIS = :OLD_NDIS'
      '    and PD.NTEACH = :OLD_NTEACH'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    NPD,'
      '    NDIS,'
      '    NTEACH'
      'FROM'
      '    PD '
      'WHERE NTEACH = :NTEACH')
    AutoUpdateOptions.UpdateTableName = 'PD'
    AutoUpdateOptions.KeyFields = 'NPD'
    AutoUpdateOptions.GeneratorName = 'GEN_PD_ID'
    Transaction = ReadTransaction
    Database = dbFACULT
    UpdateTransaction = WriteTransaction
    AutoCommit = True
    DataSource = dsTeacher
    Left = 32
    Top = 88
    object dstPDNPD: TFIBIntegerField
      FieldName = 'NPD'
    end
    object dstPDNDIS: TFIBIntegerField
      FieldName = 'NDIS'
    end
    object dstPDNTEACH: TFIBIntegerField
      FieldName = 'NTEACH'
    end
    object dstPDNameDis: TStringField
      FieldKind = fkLookup
      FieldName = 'NameDis'
      LookupDataSet = dstDiscipline
      LookupKeyFields = 'NDIS'
      LookupResultField = 'NAME'
      KeyFields = 'NDIS'
      Size = 30
      Lookup = True
    end
    object dstPDSurnameTeach: TStringField
      FieldKind = fkLookup
      FieldName = 'SurnameTeach'
      LookupDataSet = dstTeacher
      LookupKeyFields = 'NTEACH'
      LookupResultField = 'SURNAME'
      KeyFields = 'NTEACH'
      Size = 30
      Lookup = True
    end
  end
  object dsPD: TDataSource
    DataSet = dstPD
    Left = 128
    Top = 88
  end
  object dstTeacher: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TEACHER'
      'SET '
      '    NTEACH = :NTEACH,'
      '    SURNAME = :SURNAME,'
      '    NAME = :NAME,'
      '    OTHESTVO = :OTHESTVO,'
      '    ACADDEGREE = :ACADDEGREE,'
      '    TITLE = :TITLE'
      'WHERE'
      '    NTEACH = :OLD_NTEACH'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    TEACHER'
      'WHERE'
      '        NTEACH = :OLD_NTEACH'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO TEACHER('
      '    NTEACH,'
      '    SURNAME,'
      '    NAME,'
      '    OTHESTVO,'
      '    ACADDEGREE,'
      '    TITLE'
      ')'
      'VALUES('
      '    :NTEACH,'
      '    :SURNAME,'
      '    :NAME,'
      '    :OTHESTVO,'
      '    :ACADDEGREE,'
      '    :TITLE'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    NTEACH,'
      '    SURNAME,'
      '    NAME,'
      '    OTHESTVO,'
      '    ACADDEGREE,'
      '    TITLE'
      'FROM'
      '    TEACHER '
      ''
      ' WHERE '
      '        TEACHER.NTEACH = :OLD_NTEACH'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    NTEACH,'
      '    SURNAME,'
      '    NAME,'
      '    OTHESTVO,'
      '    ACADDEGREE,'
      '    TITLE'
      'FROM'
      '    TEACHER ')
    AutoUpdateOptions.UpdateTableName = 'TEACHER'
    AutoUpdateOptions.KeyFields = 'NTEACH'
    AutoUpdateOptions.GeneratorName = 'GEN_TEACHER_ID'
    Transaction = ReadTransaction
    Database = dbFACULT
    UpdateTransaction = WriteTransaction
    AutoCommit = True
    Left = 32
    Top = 152
    object dstTeacherNTEACH: TFIBIntegerField
      FieldName = 'NTEACH'
    end
    object dstTeacherSURNAME: TFIBStringField
      FieldName = 'SURNAME'
      Size = 30
      Transliterate = False
      EmptyStrToNull = True
    end
    object dstTeacherNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 15
      Transliterate = False
      EmptyStrToNull = True
    end
    object dstTeacherOTHESTVO: TFIBStringField
      FieldName = 'OTHESTVO'
      Size = 30
      Transliterate = False
      EmptyStrToNull = True
    end
    object dstTeacherACADDEGREE: TFIBStringField
      FieldName = 'ACADDEGREE'
      Transliterate = False
      EmptyStrToNull = True
    end
    object dstTeacherTITLE: TFIBStringField
      FieldName = 'TITLE'
      Size = 10
      Transliterate = False
      EmptyStrToNull = True
    end
  end
  object dsTeacher: TDataSource
    DataSet = dstTeacher
    Left = 128
    Top = 152
  end
  object dstDiscipline: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE DISCIPLINE'
      'SET '
      '    NAME = :NAME,'
      '    TTIME = :TTIME'
      'WHERE'
      '    NDIS = :OLD_NDIS'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    DISCIPLINE'
      'WHERE'
      '        NDIS = :OLD_NDIS'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO DISCIPLINE('
      '    NDIS,'
      '    NAME,'
      '    TTIME'
      ')'
      'VALUES('
      '    :NDIS,'
      '    :NAME,'
      '    :TTIME'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    NDIS,'
      '    NAME,'
      '    TTIME'
      'FROM'
      '    DISCIPLINE '
      ''
      ' WHERE '
      '        DISCIPLINE.NDIS = :OLD_NDIS'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    NDIS,'
      '    NAME,'
      '    TTIME'
      'FROM'
      '    DISCIPLINE ')
    AutoUpdateOptions.UpdateTableName = 'DISCIPLINE'
    AutoUpdateOptions.KeyFields = 'NDIS'
    AutoUpdateOptions.GeneratorName = 'GEN_DISCIPLINE_ID'
    Transaction = ReadTransaction
    Database = dbFACULT
    UpdateTransaction = WriteTransaction
    AutoCommit = True
    Left = 32
    Top = 216
    object dstDisciplineNDIS: TFIBIntegerField
      FieldName = 'NDIS'
    end
    object dstDisciplineNAME: TFIBStringField
      FieldName = 'NAME'
      Transliterate = False
      EmptyStrToNull = True
    end
    object dstDisciplineTTIME: TFIBIntegerField
      FieldName = 'TTIME'
    end
  end
  object dsDiscipline: TDataSource
    DataSet = dstDiscipline
    Left = 128
    Top = 216
  end
  object dsSelectQueryTeacher: TDataSource
    DataSet = dstSelectQueryTeacher
    Left = 167
    Top = 408
  end
  object dstSelectQueryTeacher: TpFIBDataSet
    Transaction = ReadTransaction
    Database = dbFACULT
    UpdateTransaction = WriteTransaction
    Left = 48
    Top = 408
  end
  object dstStudent: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE STUD'
      'SET '
      '    FAM = :FAM,'
      '    NUMGROUPS = :NUMGROUPS'
      'WHERE'
      '    NSTUD = :OLD_NSTUD'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    STUD'
      'WHERE'
      '        NSTUD = :OLD_NSTUD'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO STUD('
      '    NSTUD,'
      '    FAM,'
      '    NUMGROUPS'
      ')'
      'VALUES('
      '    :NSTUD,'
      '    :FAM,'
      '    :NUMGROUPS'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    NSTUD,'
      '    FAM,'
      '    NUMGROUPS'
      'FROM'
      '    STUD '
      ''
      ' WHERE '
      '        STUD.NSTUD = :OLD_NSTUD'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    NSTUD,'
      '    FAM,'
      '    NUMGROUPS'
      'FROM'
      '    STUD ')
    AutoUpdateOptions.UpdateTableName = 'STUD'
    AutoUpdateOptions.KeyFields = 'NSTUD'
    AutoUpdateOptions.GeneratorName = 'GEN_STUD_ID'
    Transaction = ReadTransaction
    Database = dbFACULT
    UpdateTransaction = WriteTransaction
    AutoCommit = True
    Left = 32
    Top = 280
    object dstStudentNSTUD: TFIBIntegerField
      FieldName = 'NSTUD'
    end
    object dstStudentFAM: TFIBStringField
      FieldName = 'FAM'
      Size = 30
      Transliterate = False
      EmptyStrToNull = True
    end
    object dstStudentNUMGROUPS: TFIBStringField
      FieldName = 'NUMGROUPS'
      Size = 5
      Transliterate = False
      EmptyStrToNull = True
    end
  end
  object dsStudent: TDataSource
    DataSet = dstStudent
    Left = 128
    Top = 280
  end
  object dstApplic: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE APPLIC'
      'SET '
      '    NPD = :NPD,'
      '    NDIS = :NDIS,'
      '    NTEACH = :NTEACH'
      'WHERE'
      '    NAPPLIC = :OLD_NAPPLIC'
      '    and NSTUD = :OLD_NSTUD'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    APPLIC'
      'WHERE'
      '        NAPPLIC = :OLD_NAPPLIC'
      '    and NSTUD = :OLD_NSTUD'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO APPLIC('
      '    NAPPLIC,'
      '    NSTUD,'
      '    NPD,'
      '    NDIS,'
      '    NTEACH'
      ')'
      'VALUES('
      '    :NAPPLIC,'
      '    :NSTUD,'
      '    :NPD,'
      '    :NDIS,'
      '    :NTEACH'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    NAPPLIC,'
      '    NSTUD,'
      '    NPD,'
      '    NDIS,'
      '    NTEACH'
      'FROM'
      '    APPLIC '
      'WHERE(  NSTUD = :NSTUD'
      '     ) and (     APPLIC.NAPPLIC = :OLD_NAPPLIC'
      '    and APPLIC.NSTUD = :OLD_NSTUD'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    NAPPLIC,'
      '    NSTUD,'
      '    NPD,'
      '    NDIS,'
      '    NTEACH'
      'FROM'
      '    APPLIC '
      'WHERE NSTUD = :NSTUD')
    AutoUpdateOptions.UpdateTableName = 'APPLIC'
    AutoUpdateOptions.KeyFields = 'NAPPLIC'
    AutoUpdateOptions.GeneratorName = 'GEN_APPLIC_ID'
    Transaction = ReadTransaction
    Database = dbFACULT
    UpdateTransaction = WriteTransaction
    AutoCommit = True
    DataSource = dsStudent
    Left = 32
    Top = 344
    object dstApplicNAPPLIC: TFIBIntegerField
      FieldName = 'NAPPLIC'
    end
    object dstApplicNSTUD: TFIBIntegerField
      FieldName = 'NSTUD'
    end
    object dstApplicNPD: TFIBIntegerField
      FieldName = 'NPD'
    end
    object dstApplicNDIS: TFIBIntegerField
      FieldName = 'NDIS'
    end
    object dstApplicNTEACH: TFIBIntegerField
      FieldName = 'NTEACH'
    end
    object dstApplicNameDis: TStringField
      FieldKind = fkLookup
      FieldName = 'NameDis'
      LookupDataSet = dstDiscipline
      LookupKeyFields = 'NDIS'
      LookupResultField = 'NAME'
      KeyFields = 'NDIS'
      Size = 30
      Lookup = True
    end
    object dstApplicSurnameTeacher: TStringField
      FieldKind = fkLookup
      FieldName = 'SurnameTeacher'
      LookupDataSet = dstTeacher
      LookupKeyFields = 'NTEACH'
      LookupResultField = 'SURNAME'
      KeyFields = 'NTEACH'
      Size = 30
      Lookup = True
    end
  end
  object dsApplic: TDataSource
    DataSet = dstApplic
    Left = 128
    Top = 344
  end
  object dstPDTEACH: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE PD'
      'SET '
      '    NPD = :NPD,'
      '    NDIS = :NDIS,'
      '    NTEACH = :NTEACH'
      'WHERE'
      '    NPD = :OLD_NPD'
      '    and NDIS = :OLD_NDIS'
      '    and NTEACH = :OLD_NTEACH'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    PD'
      'WHERE'
      '        NPD = :OLD_NPD'
      '    and NDIS = :OLD_NDIS'
      '    and NTEACH = :OLD_NTEACH'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO PD('
      '    NPD,'
      '    NDIS,'
      '    NTEACH'
      ')'
      'VALUES('
      '    :NPD,'
      '    :NDIS,'
      '    :NTEACH'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    NPD,'
      '    NDIS,'
      '    NTEACH'
      'FROM'
      '    PD '
      'WHERE(  NDIS =:NDIS'
      '     ) and (     PD.NPD = :OLD_NPD'
      '    and PD.NDIS = :OLD_NDIS'
      '    and PD.NTEACH = :OLD_NTEACH'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    NPD,'
      '    NDIS,'
      '    NTEACH'
      'FROM'
      '    PD '
      'WHERE NDIS =:NDIS')
    AutoUpdateOptions.UpdateTableName = 'PD'
    AutoUpdateOptions.KeyFields = 'NPD'
    AutoUpdateOptions.GeneratorName = 'GEN_PD_ID'
    Transaction = ReadTransaction
    Database = dbFACULT
    UpdateTransaction = WriteTransaction
    AutoCommit = True
    DataSource = dsDiscipline
    Left = 24
    Top = 472
    object dstPDTEACHNPD: TFIBIntegerField
      FieldName = 'NPD'
    end
    object dstPDTEACHNDIS: TFIBIntegerField
      FieldName = 'NDIS'
    end
    object dstPDTEACHNTEACH: TFIBIntegerField
      FieldName = 'NTEACH'
    end
    object dstPDTEACHSurnameTeach: TStringField
      FieldKind = fkLookup
      FieldName = 'SurnameTeach'
      LookupDataSet = dstTeacher
      LookupKeyFields = 'NTEACH'
      LookupResultField = 'SURNAME'
      KeyFields = 'NTEACH'
      Size = 30
      Lookup = True
    end
    object dstPDTEACHNameDis: TStringField
      FieldKind = fkLookup
      FieldName = 'NameDis'
      LookupDataSet = dstDiscipline
      LookupKeyFields = 'NDIS'
      LookupResultField = 'NAME'
      KeyFields = 'NDIS'
      Size = 30
      Lookup = True
    end
  end
  object dsPDTEACH: TDataSource
    DataSet = dstPDTEACH
    Left = 128
    Top = 472
  end
  object frxReport1: TfrxReport
    Version = '2021.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44506.836781574070000000
    ReportOptions.LastChange = 44518.748609965270000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 520
    Top = 24
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 34.015770000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 173.858380000000000000
          Width = 234.330860000000000000
          Height = 26.456710000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            #1057#1087#1080#1089#1086#1082' '#1089#1090#1091#1076#1077#1085#1090#1086#1074' '#1086#1090)
          ParentFont = False
        end
        object Date: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 381.732530000000000000
          Width = 124.724490000000000000
          Height = 26.456710000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 41.574830000000000000
        Top = 173.858380000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Line: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 7.559060000000000000
          Width = 79.370130000000000000
          Height = 30.236240000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Line#]')
          ParentFont = False
        end
        object frxDBDataset1FAM: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 222.992270000000000000
          Top = 7.559060000000000000
          Width = 238.110390000000000000
          Height = 30.236240000000000000
          DataField = 'FAM'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."FAM"]')
          ParentFont = False
        end
        object frxDBDataset1NUMGROUPS: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 566.929500000000000000
          Top = 7.559060000000000000
          Width = 124.724490000000000000
          Height = 30.236240000000000000
          DataField = 'NUMGROUPS'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."NUMGROUPS"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 275.905690000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 113.385900000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Width = 151.181200000000000000
          Height = 30.236240000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #1053#1086#1084#1077#1088' '#1089#1090#1091#1076#1077#1085#1090#1072)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 222.992270000000000000
          Width = 173.858380000000000000
          Height = 30.236240000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #1060#1072#1084#1080#1083#1080#1103' '#1089#1090#1091#1076#1077#1085#1090#1072)
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 566.929500000000000000
          Width = 136.063080000000000000
          Height = 30.236240000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #1059#1095#1077#1073#1085#1072#1103' '#1075#1088#1091#1087#1087#1072)
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = dstStudent
    BCDToCurrency = False
    DataSetOptions = []
    Left = 592
    Top = 24
  end
  object dstAPPLICSTUD: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE APPLIC'
      'SET '
      '    NAPPLIC = :NAPPLIC,'
      '    NSTUD = :NSTUD,'
      '    NPD = :NPD,'
      '    NDIS = :NDIS,'
      '    NTEACH = :NTEACH'
      'WHERE'
      '    NAPPLIC = :OLD_NAPPLIC'
      '    and NSTUD = :OLD_NSTUD'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    APPLIC'
      'WHERE'
      '        NAPPLIC = :OLD_NAPPLIC'
      '    and NSTUD = :OLD_NSTUD'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO APPLIC('
      '    NAPPLIC,'
      '    NSTUD,'
      '    NPD,'
      '    NDIS,'
      '    NTEACH'
      ')'
      'VALUES('
      '    :NAPPLIC,'
      '    :NSTUD,'
      '    :NPD,'
      '    :NDIS,'
      '    :NTEACH'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    NAPPLIC,'
      '    NSTUD,'
      '    NPD,'
      '    NDIS,'
      '    NTEACH'
      'FROM'
      '    APPLIC '
      'WHERE(  NDIS = :NDIS'
      '     ) and (     APPLIC.NAPPLIC = :OLD_NAPPLIC'
      '    and APPLIC.NSTUD = :OLD_NSTUD'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    NAPPLIC,'
      '    NSTUD,'
      '    NPD,'
      '    NDIS,'
      '    NTEACH'
      'FROM'
      '    APPLIC '
      'WHERE NDIS = :NDIS')
    AutoUpdateOptions.UpdateTableName = 'APPLIC'
    AutoUpdateOptions.KeyFields = 'NAPPLIC'
    AutoUpdateOptions.GeneratorName = 'GEN_APPLIC_ID'
    Transaction = ReadTransaction
    Database = dbFACULT
    UpdateTransaction = WriteTransaction
    AutoCommit = True
    DataSource = dsDiscipline
    Left = 32
    Top = 536
    object dstAPPLICSTUDNAPPLIC: TFIBIntegerField
      FieldName = 'NAPPLIC'
    end
    object dstAPPLICSTUDNSTUD: TFIBIntegerField
      FieldName = 'NSTUD'
    end
    object dstAPPLICSTUDNPD: TFIBIntegerField
      FieldName = 'NPD'
    end
    object dstAPPLICSTUDNDIS: TFIBIntegerField
      FieldName = 'NDIS'
    end
    object dstAPPLICSTUDNTEACH: TFIBIntegerField
      FieldName = 'NTEACH'
    end
    object dstAPPLICSTUDFAMSTUD: TStringField
      FieldKind = fkLookup
      FieldName = 'FAMSTUD'
      LookupDataSet = dstStudent
      LookupKeyFields = 'NSTUD'
      LookupResultField = 'FAM'
      KeyFields = 'NSTUD'
      Size = 30
      Lookup = True
    end
    object dstAPPLICSTUDDisName: TStringField
      FieldKind = fkLookup
      FieldName = 'DisName'
      LookupDataSet = dstDiscipline
      LookupKeyFields = 'NDIS'
      LookupResultField = 'NAME'
      KeyFields = 'NDIS'
      Size = 30
      Lookup = True
    end
  end
  object dsAPPLICSTUD: TDataSource
    DataSet = dstAPPLICSTUD
    Left = 128
    Top = 536
  end
  object frxReport2: TfrxReport
    Version = '2021.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44507.038975717590000000
    ReportOptions.LastChange = 44518.745360960650000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 520
    Top = 80
    Datasets = <
      item
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 30.236240000000000000
          Width = 298.582870000000000000
          Height = 34.015770000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #1057#1087#1080#1089#1086#1082' '#1089#1090#1091#1076#1077#1085#1090#1086#1074' '#1087#1086#1089#1077#1097#1072#1102#1097#1080#1093':')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 574.488560000000000000
          Width = 30.236240000000000000
          Height = 34.015770000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #1086#1090)
          ParentFont = False
        end
        object Date: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 600.945270000000000000
          Width = 105.826840000000000000
          Height = 34.015770000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object frxDBDataset2DisName: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 332.598640000000000000
          Width = 238.110390000000000000
          Height = 34.015770000000000000
          DataField = 'DisName'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset2."DisName"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 34.015770000000000000
        Top = 170.078850000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
        RowCount = 0
        object frxDBDataset2FAMSTUD: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 238.110390000000000000
          Top = 3.779530000000000000
          Width = 238.110390000000000000
          Height = 26.456710000000000000
          DataField = 'FAMSTUD'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset2."FAMSTUD"]')
          ParentFont = False
        end
        object Line: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 26.456710000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Line#]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 264.567100000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 117.165430000000000000
        Width = 718.110700000000000000
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Width = 139.842610000000000000
          Height = 26.456710000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #1053#1086#1084#1077#1088' '#1089#1090#1091#1076#1077#1085#1090#1072)
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 238.110390000000000000
          Width = 158.740260000000000000
          Height = 26.456710000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #1060#1072#1084#1080#1083#1080#1103' '#1089#1090#1091#1076#1077#1085#1090#1072)
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    DataSource = dsAPPLICSTUD
    BCDToCurrency = False
    DataSetOptions = []
    Left = 592
    Top = 80
  end
  object frxReport3: TfrxReport
    Version = '2021.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44518.561197152800000000
    ReportOptions.LastChange = 44518.568263750000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 520
    Top = 136
    Datasets = <
      item
        DataSet = frxDBDataset3
        DataSetName = 'frxDBDataset3'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 60.472480000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Width = 480.000310000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#1087#1080#1089#1086#1082' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1077#1081', '#1087#1088#1077#1087#1086#1076#1072#1102#1097#1080#1093)
          ParentFont = False
        end
        object frxDBDataset3NameDis: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 370.393940000000000000
          Width = 313.700990000000000000
          Height = 30.236240000000000000
          DataField = 'NameDis'
          DataSet = frxDBDataset3
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset3."NameDis"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 566.929500000000000000
          Top = 34.015770000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #1086#1090':')
          ParentFont = False
        end
        object Date: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 593.386210000000000000
          Top = 34.015770000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 45.354360000000000000
        Top = 196.535560000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset3
        DataSetName = 'frxDBDataset3'
        RowCount = 0
        object frxDBDataset3SurnameTeach: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 275.905690000000000000
          Top = 3.779530000000000000
          Width = 283.464750000000000000
          Height = 30.236240000000000000
          DataField = 'SurnameTeach'
          DataSet = frxDBDataset3
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset3."SurnameTeach"]')
          ParentFont = False
        end
        object Line: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Line#]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 302.362400000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 34.015770000000000000
        Top = 102.047310000000000000
        Width = 718.110700000000000000
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Width = 181.417440000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -19
          Font.Name = 'times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #1053#1086#1084#1077#1088' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1103)
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 275.905690000000000000
          Width = 211.653680000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -19
          Font.Name = 'times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #1060#1072#1084#1080#1083#1080#1103' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1103)
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset3: TfrxDBDataset
    UserName = 'frxDBDataset3'
    CloseDataSource = False
    DataSource = dsPDTEACH
    BCDToCurrency = False
    DataSetOptions = []
    Left = 592
    Top = 136
  end
end
