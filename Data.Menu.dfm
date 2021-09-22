object DataMenu: TDataMenu
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object fdmtMenu: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 103
    Top = 40
    object fdmtMenuITEM_TYPE: TWordField
      FieldName = 'ITEM_TYPE'
    end
    object fdmtMenuITEM_NAME: TStringField
      FieldName = 'ITEM_NAME'
      Size = 255
    end
    object fdmtMenuITEM_DESC: TStringField
      FieldName = 'ITEM_DESC'
      Size = 500
    end
    object fdmtMenuITEM_IMG: TBlobField
      FieldName = 'ITEM_IMG'
    end
  end
end
