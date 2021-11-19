object fmQueryListSTUDdisTEACH: TfmQueryListSTUDdisTEACH
  Left = 0
  Top = 0
  Caption = 
    #1057#1087#1080#1089#1086#1082' '#1089#1090#1091#1076#1077#1085#1090#1086#1074', '#1087#1086#1089#1077#1097#1072#1102#1097#1080#1093' '#1076#1072#1085#1085#1091#1102' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1091' '#1091' '#1076#1072#1085#1085#1086#1075#1086' '#1087#1088#1077#1087#1086#1076#1072 +
    #1074#1072#1090#1077#1083#1103
  ClientHeight = 241
  ClientWidth = 544
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 544
    Height = 200
    Align = alClient
    DataSource = dmFACULT.dsStudent
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'SURNAMESTUD'
        Title.Caption = #1057#1090#1091#1076#1077#1085#1090#1099
        Width = 80
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 200
    Width = 544
    Height = 41
    Align = alBottom
    TabOrder = 1
    object buExit: TButton
      Left = 338
      Top = 6
      Width = 75
      Height = 25
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 0
      OnClick = buExitClick
    end
    object DBLCNTEACH: TDBLookupComboBox
      Left = 171
      Top = 6
      Width = 145
      Height = 21
      KeyField = 'NTEACH'
      ListField = 'SURNAME'
      ListSource = dmFACULT.dsTeacher
      TabOrder = 1
    end
    object DBLCNDIS: TDBLookupComboBox
      Left = 8
      Top = 6
      Width = 145
      Height = 21
      KeyField = 'NDIS'
      ListField = 'NAME'
      ListSource = dmFACULT.dsDiscipline
      TabOrder = 2
    end
  end
  object dstApplic: TpFIBDataSet
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
      'WHERE(  (NDIS = :NDIS) AND (NTEACH =:NTEACH)'
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
      'WHERE (NDIS = :NDIS) AND (NTEACH =:NTEACH)')
    AutoUpdateOptions.UpdateTableName = 'APPLIC'
    AutoUpdateOptions.KeyFields = 'NAPPLIC'
    AutoUpdateOptions.GeneratorName = 'GEN_APPLIC_ID'
    Transaction = dmFACULT.ReadTransaction
    Database = dmFACULT.dbFACULT
    UpdateTransaction = dmFACULT.WriteTransaction
    AutoCommit = True
    DataSource = dmFACULT.dsApplic
    Left = 432
    Top = 195
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
    object dstApplicSURNAMESTUD: TStringField
      FieldKind = fkLookup
      FieldName = 'SURNAMESTUD'
      LookupDataSet = dmFACULT.dstStudent
      LookupKeyFields = 'NSTUD'
      LookupResultField = 'FAM'
      KeyFields = 'NSTUD'
      Size = 30
      Lookup = True
    end
  end
end
