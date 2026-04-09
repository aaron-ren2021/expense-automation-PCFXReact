# expense-automation-PCFXReact
請款單自動化，power app表單功能,目前樣式

# browserscreen1

Screens:
  BrowseScreen1:
    Properties:
      LoadingSpinnerColor: =RGBA(56, 96, 178, 1)
    Children:
      - RectQuickActionBar1:
          Control: Rectangle@2.3.0
          Properties:
            BorderColor: =RGBA(0, 18, 107, 1)
            Fill: =RGBA(56, 96, 178, 1)
            Height: =88
            Width: =Parent.Width
      - LblAppName1:
          Control: Label@2.5.1
          Properties:
            BorderColor: =RGBA(0, 0, 0, 1)
            Color: =RGBA(255, 255, 255, 1)
            Fill: =RGBA(58, 58, 58, 0)
            Font: =Font.'Open Sans'
            Height: =88
            Size: =27
            Text: ="請款單"
            Width: =Parent.Width - Self.X - IconSortUpDown1.Width - IconNewItem1.Width - IconRefresh1.Width
            Wrap: =false
            X: =20
      - IconRefresh1:
          Control: Classic/Icon@2.5.0
          Properties:
            AccessibleLabel: =Self.Tooltip
            BorderColor: =RGBA(0, 18, 107, 1)
            Color: =RGBA(255, 255, 255, 1)
            Height: =88
            Icon: =Icon.Reload
            OnSelect: =Refresh([@請款單])
            PaddingBottom: =22
            PaddingLeft: =22
            PaddingRight: =22
            PaddingTop: =22
            PressedFill: =RGBA(255, 255, 255, 0.3)
            TabIndex: =0
            Tooltip: ="重新整理清單"
            Width: =88
            X: =Parent.Width - IconNewItem1.Width - IconSortUpDown1.Width - Self.Width
      - IconSortUpDown1:
          Control: Classic/Icon@2.5.0
          Properties:
            AccessibleLabel: =Self.Tooltip
            BorderColor: =RGBA(0, 18, 107, 1)
            Color: =RGBA(255, 255, 255, 1)
            Height: =88
            Icon: =Icon.Sort
            OnSelect: |-
              =UpdateContext({SortDescending1: !SortDescending1})
            PaddingBottom: =26
            PaddingLeft: =26
            PaddingRight: =26
            PaddingTop: =26
            PressedFill: =RGBA(255, 255, 255, 0.3)
            TabIndex: =0
            Tooltip: =If(SortDescending1, "依反向的英數字母順序排序清單", "依英數字母順序排序清單")
            Width: =88
            X: =Parent.Width - IconNewItem1.Width - Self.Width
      - IconNewItem1:
          Control: Classic/Icon@2.5.0
          Properties:
            AccessibleLabel: =Self.Tooltip
            BorderColor: =RGBA(0, 18, 107, 1)
            Color: =RGBA(255, 255, 255, 1)
            DisplayMode: =If(DataSourceInfo([@請款單], DataSourceInfo.CreatePermission), DisplayMode.Edit, DisplayMode.Disabled)
            Height: =88
            Icon: =Icon.Add
            OnSelect: =NewForm(EditForm1);Navigate(EditScreen1, ScreenTransition.None)
            PaddingBottom: =24
            PaddingLeft: =24
            PaddingRight: =24
            PaddingTop: =24
            PressedFill: =RGBA(255, 255, 255, 0.3)
            TabIndex: =0
            Tooltip: ="建立新項目"
            Width: =88
            X: =Parent.Width - Self.Width
      - TextSearchBox1:
          Control: Classic/TextInput@2.3.2
          Properties:
            BorderColor: =RGBA(0, 18, 107, 1)
            BorderStyle: =BorderStyle.None
            Default: =""
            DelayOutput: =true
            Font: =Font.'Open Sans'
            Height: =68
            HintText: ="搜尋項目"
            HoverBorderColor: =RGBA(0, 18, 107, 1)
            HoverFill: =RGBA(186, 202, 226, 1)
            PaddingLeft: =70
            RadiusBottomLeft: =0
            RadiusBottomRight: =7
            RadiusTopLeft: =0
            RadiusTopRight: =7
            Width: =Parent.Width
            Y: =RectQuickActionBar1.Height
      - SearchIcon1:
          Control: Classic/Icon@2.5.0
          Properties:
            BorderColor: =RGBA(0, 18, 107, 1)
            Color: =RGBA(191, 190, 190, 1)
            Height: =Self.Width
            Icon: =Icon.Search
            PaddingBottom: =14
            PaddingLeft: =14
            PaddingRight: =14
            PaddingTop: =14
            Tooltip: ="搜尋"
            Width: =TextSearchBox1.Height
            X: =TextSearchBox1.X
            Y: =TextSearchBox1.Y
      - Rectangle11:
          Control: Rectangle@2.3.0
          Properties:
            BorderColor: =RGBA(0, 18, 107, 1)
            Fill: =RGBA(0, 18, 107, 1)
            Height: =2
            Width: =Parent.Width
            Y: =TextSearchBox1.Y + TextSearchBox1.Height
      - BrowseGallery1:
          Control: Gallery@2.15.0
          Variant: BrowseLayout_Vertical_ThreeTextVariant_ver5.0
          Properties:
            BorderColor: =RGBA(0, 18, 107, 1)
            Height: =Parent.Height - Self.Y
            Items: =SortByColumns(Filter([@請款單], StartsWith(Title, TextSearchBox1.Text)), "Title", If(SortDescending1, SortOrder.Descending, SortOrder.Ascending))
            OnSelect: =Navigate(DetailScreen1, ScreenTransition.None)
            ShowScrollbar: =false
            Width: =Parent.Width
            Y: =TextSearchBox1.Y + TextSearchBox1.Height
          Children:
            - Title1:
                Control: Label@2.5.1
                Properties:
                  BorderColor: =RGBA(0, 0, 0, 1)
                  Color: =RGBA(50, 49, 48, 1)
                  Font: =Font.'Open Sans'
                  FontWeight: =If(ThisItem.IsSelected, FontWeight.Semibold, FontWeight.Normal)
                  Height: =Self.Size * 1.8
                  OnSelect: =Select(Parent)
                  PaddingBottom: =0
                  PaddingLeft: =0
                  PaddingRight: =0
                  PaddingTop: =0
                  Size: =14
                  Text: =ThisItem.申請人.DisplayName
                  VerticalAlign: =VerticalAlign.Top
                  Width: =Parent.TemplateWidth - 86
                  X: =16
                  Y: =(Parent.TemplateHeight - (Self.Size*1.8 + Subtitle1.Size*1.8 + 2 + Body1.Size*1.8)) / 2
            - Subtitle1:
                Control: Label@2.5.1
                Properties:
                  BorderColor: =RGBA(0, 0, 0, 1)
                  Font: =Font.'Open Sans'
                  FontWeight: =If(ThisItem.IsSelected, FontWeight.Semibold, FontWeight.Normal)
                  Height: =Self.Size * 1.8
                  OnSelect: =Select(Parent)
                  PaddingBottom: =0
                  PaddingLeft: =0
                  PaddingRight: =0
                  PaddingTop: =0
                  Size: =12
                  Text: =ThisItem.申請人.Email
                  VerticalAlign: =VerticalAlign.Top
                  Width: =Title1.Width
                  X: =Title1.X
                  Y: =Title1.Y + Title1.Height
            - Body1:
                Control: Label@2.5.1
                Properties:
                  BorderColor: =RGBA(0, 0, 0, 1)
                  Font: =Font.'Open Sans'
                  FontWeight: =If(ThisItem.IsSelected, FontWeight.Semibold, FontWeight.Normal)
                  Height: =Self.Size * 1.8
                  OnSelect: =Select(Parent)
                  PaddingBottom: =0
                  PaddingLeft: =0
                  PaddingRight: =0
                  PaddingTop: =0
                  Size: =12
                  Text: =ThisItem.性質.Value
                  VerticalAlign: =VerticalAlign.Top
                  Width: =Title1.Width
                  X: =Title1.X
                  Y: =Subtitle1.Y + Subtitle1.Height
            - NextArrow1:
                Control: Classic/Icon@2.5.0
                Properties:
                  AccessibleLabel: =Self.Tooltip
                  BorderColor: =RGBA(0, 18, 107, 1)
                  Color: =RGBA(166, 166, 166, 1)
                  Height: =50
                  Icon: =Icon.ChevronRight
                  OnSelect: =Select(Parent)
                  PaddingBottom: =16
                  PaddingLeft: =16
                  PaddingRight: =16
                  PaddingTop: =16
                  Tooltip: ="檢視項目詳細資料"
                  Width: =50
                  X: =Parent.TemplateWidth - Self.Width - 12
                  Y: =(Parent.TemplateHeight / 2) - (Self.Height / 2)
            - Separator1:
                Control: Rectangle@2.3.0
                Properties:
                  BorderColor: =RGBA(0, 18, 107, 1)
                  Fill: =RGBA(255, 255, 255, 1)
                  Height: =8
                  OnSelect: =Select(Parent)
                  Width: =Parent.TemplateWidth
                  Y: =Parent.TemplateHeight - Self.Height
            - Rectangle1:
                Control: Rectangle@2.3.0
                Properties:
                  BorderColor: =RGBA(0, 18, 107, 1)
                  Fill: =RGBA(0, 18, 107, 1)
                  Height: =Parent.TemplateHeight - Separator1.Height
                  OnSelect: =Select(Parent)
                  Visible: =ThisItem.IsSelected
                  Width: =4

#  DetailScreen1
Screens:
  DetailScreen1:
    Properties:
      LoadingSpinnerColor: =RGBA(56, 96, 178, 1)
    Children:
      - RectQuickActionBar2:
          Control: Rectangle@2.3.0
          Properties:
            BorderColor: =RGBA(0, 18, 107, 1)
            Fill: =RGBA(56, 96, 178, 1)
            Height: =88
            Width: =Parent.Width
      - IconBackarrow1:
          Control: Classic/Icon@2.5.0
          Properties:
            AccessibleLabel: =Self.Tooltip
            BorderColor: =RGBA(0, 18, 107, 1)
            Color: =RGBA(255, 255, 255, 1)
            Height: =88
            Icon: =Icon.ChevronLeft
            OnSelect: =Navigate(BrowseScreen1, ScreenTransition.None)
            PaddingBottom: =24
            PaddingLeft: =24
            PaddingRight: =24
            PaddingTop: =24
            PressedFill: =RGBA(255, 255, 255, 0.3)
            TabIndex: =0
            Tooltip: ="返回清單"
            Width: =88
      - IconEdit1:
          Control: Classic/Icon@2.5.0
          Properties:
            AccessibleLabel: =Self.Tooltip
            BorderColor: =RGBA(0, 18, 107, 1)
            Color: =RGBA(255, 255, 255, 1)
            DisplayMode: =If(DataSourceInfo([@請款單], DataSourceInfo.EditPermission), DisplayMode.Edit, DisplayMode.Disabled)
            Height: =88
            Icon: =Icon.Edit
            OnSelect: =EditForm(EditForm1);Navigate(EditScreen1, ScreenTransition.None)
            PaddingBottom: =24
            PaddingLeft: =24
            PaddingRight: =24
            PaddingTop: =24
            PressedFill: =RGBA(255, 255, 255, 0.3)
            TabIndex: =0
            Tooltip: ="編輯此項目"
            Width: =88
            X: =Parent.Width - Self.Width
      - IconDelete1:
          Control: Classic/Icon@2.5.0
          Properties:
            AccessibleLabel: =Self.Tooltip
            BorderColor: =RGBA(0, 18, 107, 1)
            Color: =RGBA(255, 255, 255, 1)
            DisplayMode: =If(!IsBlank(BrowseGallery1.Selected) && DataSourceInfo([@請款單], DataSourceInfo.DeletePermission), DisplayMode.Edit, DisplayMode.Disabled)
            Height: =88
            Icon: =Icon.Trash
            OnSelect: =Remove([@請款單], BrowseGallery1.Selected); If (IsEmpty(Errors([@請款單], BrowseGallery1.Selected)), Back())
            PaddingBottom: =24
            PaddingLeft: =24
            PaddingRight: =24
            PaddingTop: =24
            PressedFill: =RGBA(255, 255, 255, 0.3)
            TabIndex: =0
            Tooltip: ="刪除此項目"
            Width: =88
            X: =Parent.Width - IconEdit1.Width - Self.Width
      - LblAppName2:
          Control: Label@2.5.1
          Properties:
            BorderColor: =RGBA(0, 0, 0, 1)
            Color: =RGBA(255, 255, 255, 1)
            Font: =Font.'Open Sans'
            Height: =88
            Size: =27
            Text: ="請款單"
            Width: =Parent.Width - Self.X - IconDelete1.Width - IconEdit1.Width
            Wrap: =false
            X: =IconBackarrow1.X + IconBackarrow1.Width
      - DetailForm1:
          Control: FormViewer@2.3.4
          Layout: Vertical
          Properties:
            BorderColor: =RGBA(0, 18, 107, 1)
            DataSource: =[@請款單]
            Height: =Parent.Height - DetailForm1.Y
            Item: =BrowseGallery1.Selected
            Width: =Parent.Width
            Y: =RectQuickActionBar2.Y + RectQuickActionBar2.Height
          Children:
            - 申請人_DataCard1:
                Control: TypedDataCard@1.0.7
                Variant: ClassicComboBoxView
                Properties:
                  BorderColor: =RGBA(0, 18, 107, 1)
                  DataField: ="OData__x7533__x8acb__x4eba__"
                  Default: =ThisItem.申請人
                  DisplayName: =DataSourceInfo([@請款單],DataSourceInfo.DisplayName,'OData__x7533__x8acb__x4eba__')
                  Required: =false
                  Update: =DataCardValue1.Selected
                  X: =0
                  Y: =0
                Children:
                  - DataCardKey1:
                      Control: Label@2.5.1
                      MetadataKey: FieldName
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =48
                        Text: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        Wrap: =false
                        X: =30
                        Y: =10
                  - DataCardValue1:
                      Control: Classic/ComboBox@2.4.0
                      MetadataKey: FieldValue
                      Properties:
                        BorderColor: =If(IsBlank(Parent.Error), Parent.BorderColor, Color.Red)
                        ChevronBackground: =RGBA(56, 96, 178, 1)
                        ChevronFill: =RGBA(255, 255, 255, 1)
                        ChevronHoverBackground: =ColorFade(RGBA(56, 96, 178, 1), -20%)
                        ChevronHoverFill: =RGBA(255, 255, 255, 1)
                        DefaultSelectedItems: =Parent.Default
                        DisplayFields: =["DisplayName"]
                        DisplayMode: =Parent.DisplayMode
                        Font: =Font.'Open Sans'
                        HoverFill: =RGBA(186, 202, 226, 1)
                        Items: =Choices([@請款單].'OData__x7533__x8acb__x4eba__')
                        PaddingBottom: =5
                        PaddingLeft: =If(Self.DisplayMode = DisplayMode.Edit, 5, 0)
                        PaddingRight: =5
                        PaddingTop: =5
                        PressedColor: =RGBA(255, 255, 255, 1)
                        PressedFill: =RGBA(0, 18, 107, 1)
                        SearchFields: =["DisplayName"]
                        SelectMultiple: =false
                        SelectionColor: =RGBA(255, 255, 255, 1)
                        SelectionFill: =RGBA(56, 96, 178, 1)
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardKey1.Y + DataCardKey1.Height + 5
                  - ErrorMessage1:
                      Control: Label@2.5.1
                      MetadataKey: ErrorMessage
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(168, 0, 0, 1)
                        Font: =Font.'Open Sans'
                        FontWeight: =FontWeight.Semibold
                        Height: =10
                        Live: =Live.Assertive
                        PaddingBottom: =0
                        PaddingLeft: =0
                        PaddingRight: =0
                        PaddingTop: =0
                        Size: =24
                        Text: =Parent.Error
                        Visible: =Parent.DisplayMode=DisplayMode.Edit
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardValue1.Y + DataCardValue1.Height
                  - StarVisible1:
                      Control: Label@2.5.1
                      MetadataKey: FieldRequired
                      Properties:
                        Align: =Align.Center
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =DataCardKey1.Height
                        Text: ="*"
                        Visible: =And(Parent.Required, Parent.DisplayMode=DisplayMode.Edit)
                        Width: =30
                        Wrap: =false
                        Y: =DataCardKey1.Y
            - 性質_DataCard1:
                Control: TypedDataCard@1.0.7
                Variant: ClassicComboBoxView
                IsLocked: true
                Properties:
                  BorderColor: =RGBA(0, 18, 107, 1)
                  DataField: ="OData__x6027__x8cea_"
                  Default: =ThisItem.性質
                  DisplayName: =DataSourceInfo([@請款單],DataSourceInfo.DisplayName,'OData__x6027__x8cea_')
                  Required: =false
                  Update: =DataCardValue2.Selected
                  X: =0
                  Y: =1
                Children:
                  - DataCardKey2:
                      Control: Label@2.5.1
                      MetadataKey: FieldName
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =48
                        Text: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        Wrap: =false
                        X: =30
                        Y: =10
                  - DataCardValue2:
                      Control: Classic/ComboBox@2.4.0
                      MetadataKey: FieldValue
                      Properties:
                        BorderColor: =If(IsBlank(Parent.Error), Parent.BorderColor, Color.Red)
                        ChevronBackground: =RGBA(56, 96, 178, 1)
                        ChevronFill: =RGBA(255, 255, 255, 1)
                        ChevronHoverBackground: =ColorFade(RGBA(56, 96, 178, 1), -20%)
                        ChevronHoverFill: =RGBA(255, 255, 255, 1)
                        DefaultSelectedItems: =Parent.Default
                        DisplayFields: =["Value"]
                        DisplayMode: =Parent.DisplayMode
                        Font: =Font.'Open Sans'
                        HoverFill: =RGBA(186, 202, 226, 1)
                        Items: =Choices([@請款單].'OData__x6027__x8cea_')
                        PaddingBottom: =5
                        PaddingLeft: =If(Self.DisplayMode = DisplayMode.Edit, 5, 0)
                        PaddingRight: =5
                        PaddingTop: =5
                        PressedColor: =RGBA(255, 255, 255, 1)
                        PressedFill: =RGBA(0, 18, 107, 1)
                        SearchFields: =["Value"]
                        SelectMultiple: =false
                        SelectionColor: =RGBA(255, 255, 255, 1)
                        SelectionFill: =RGBA(56, 96, 178, 1)
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardKey2.Y + DataCardKey2.Height + 5
                  - ErrorMessage2:
                      Control: Label@2.5.1
                      MetadataKey: ErrorMessage
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(168, 0, 0, 1)
                        Font: =Font.'Open Sans'
                        FontWeight: =FontWeight.Semibold
                        Height: =10
                        Live: =Live.Assertive
                        PaddingBottom: =0
                        PaddingLeft: =0
                        PaddingRight: =0
                        PaddingTop: =0
                        Size: =24
                        Text: =Parent.Error
                        Visible: =Parent.DisplayMode=DisplayMode.Edit
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardValue2.Y + DataCardValue2.Height
                  - StarVisible2:
                      Control: Label@2.5.1
                      MetadataKey: FieldRequired
                      Properties:
                        Align: =Align.Center
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =DataCardKey2.Height
                        Text: ="*"
                        Visible: =And(Parent.Required, Parent.DisplayMode=DisplayMode.Edit)
                        Width: =30
                        Wrap: =false
                        Y: =DataCardKey2.Y
            - 請款說明_DataCard1:
                Control: TypedDataCard@1.0.7
                Variant: ClassicTextualView
                IsLocked: true
                Properties:
                  BorderColor: =RGBA(0, 18, 107, 1)
                  DataField: ="OData__x8acb__x6b3e__x8aaa__x660e_"
                  Default: =ThisItem.請款說明
                  DisplayName: =DataSourceInfo([@請款單],DataSourceInfo.DisplayName,'OData__x8acb__x6b3e__x8aaa__x660e_')
                  Required: =false
                  X: =0
                  Y: =2
                Children:
                  - DataCardKey3:
                      Control: Label@2.5.1
                      MetadataKey: FieldName
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =48
                        Text: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        Wrap: =false
                        X: =30
                        Y: =10
                  - DataCardValue3:
                      Control: Label@2.5.1
                      MetadataKey: FieldValue
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 18, 107, 1)
                        DisplayMode: =Parent.DisplayMode
                        Font: =Font.'Open Sans'
                        Height: =40
                        PaddingLeft: =0
                        PaddingRight: =0
                        PaddingTop: =0
                        Text: =Parent.Default
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardKey3.Y + DataCardKey3.Height + 5
            - 付款方式_DataCard1:
                Control: TypedDataCard@1.0.7
                Variant: ClassicComboBoxView
                IsLocked: true
                Properties:
                  BorderColor: =RGBA(0, 18, 107, 1)
                  DataField: ="OData__x4ed8__x6b3e__x65b9__x5f0f_"
                  Default: =ThisItem.付款方式
                  DisplayName: =DataSourceInfo([@請款單],DataSourceInfo.DisplayName,'OData__x4ed8__x6b3e__x65b9__x5f0f_')
                  Required: =false
                  Update: =DataCardValue4.Selected
                  X: =0
                  Y: =3
                Children:
                  - DataCardKey4:
                      Control: Label@2.5.1
                      MetadataKey: FieldName
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =48
                        Text: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        Wrap: =false
                        X: =30
                        Y: =10
                  - DataCardValue4:
                      Control: Classic/ComboBox@2.4.0
                      MetadataKey: FieldValue
                      Properties:
                        BorderColor: =If(IsBlank(Parent.Error), Parent.BorderColor, Color.Red)
                        ChevronBackground: =RGBA(56, 96, 178, 1)
                        ChevronFill: =RGBA(255, 255, 255, 1)
                        ChevronHoverBackground: =ColorFade(RGBA(56, 96, 178, 1), -20%)
                        ChevronHoverFill: =RGBA(255, 255, 255, 1)
                        DefaultSelectedItems: =Parent.Default
                        DisplayFields: =["Value"]
                        DisplayMode: =Parent.DisplayMode
                        Font: =Font.'Open Sans'
                        HoverFill: =RGBA(186, 202, 226, 1)
                        Items: =Choices([@請款單].'OData__x4ed8__x6b3e__x65b9__x5f0f_')
                        PaddingBottom: =5
                        PaddingLeft: =If(Self.DisplayMode = DisplayMode.Edit, 5, 0)
                        PaddingRight: =5
                        PaddingTop: =5
                        PressedColor: =RGBA(255, 255, 255, 1)
                        PressedFill: =RGBA(0, 18, 107, 1)
                        SearchFields: =["Value"]
                        SelectMultiple: =false
                        SelectionColor: =RGBA(255, 255, 255, 1)
                        SelectionFill: =RGBA(56, 96, 178, 1)
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardKey4.Y + DataCardKey4.Height + 5
                  - ErrorMessage3:
                      Control: Label@2.5.1
                      MetadataKey: ErrorMessage
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(168, 0, 0, 1)
                        Font: =Font.'Open Sans'
                        FontWeight: =FontWeight.Semibold
                        Height: =10
                        Live: =Live.Assertive
                        PaddingBottom: =0
                        PaddingLeft: =0
                        PaddingRight: =0
                        PaddingTop: =0
                        Size: =24
                        Text: =Parent.Error
                        Visible: =Parent.DisplayMode=DisplayMode.Edit
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardValue4.Y + DataCardValue4.Height
                  - StarVisible3:
                      Control: Label@2.5.1
                      MetadataKey: FieldRequired
                      Properties:
                        Align: =Align.Center
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =DataCardKey4.Height
                        Text: ="*"
                        Visible: =And(Parent.Required, Parent.DisplayMode=DisplayMode.Edit)
                        Width: =30
                        Wrap: =false
                        Y: =DataCardKey4.Y
            - 實付總額(新台幣)_DataCard1:
                Control: TypedDataCard@1.0.7
                Variant: ClassicTextualView
                IsLocked: true
                Properties:
                  BorderColor: =RGBA(0, 18, 107, 1)
                  DataField: ="OData__x5be6__x4ed8__x7e3d__x984d__x00"
                  Default: =ThisItem.'實付總額(新台幣)'
                  DisplayName: =DataSourceInfo([@請款單],DataSourceInfo.DisplayName,'OData__x5be6__x4ed8__x7e3d__x984d__x00')
                  Required: =false
                  X: =0
                  Y: =4
                Children:
                  - DataCardKey5:
                      Control: Label@2.5.1
                      MetadataKey: FieldName
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =48
                        Text: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        Wrap: =false
                        X: =30
                        Y: =10
                  - DataCardValue5:
                      Control: Label@2.5.1
                      MetadataKey: FieldValue
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 18, 107, 1)
                        DisplayMode: =Parent.DisplayMode
                        Font: =Font.'Open Sans'
                        Height: =40
                        PaddingLeft: =0
                        PaddingRight: =0
                        PaddingTop: =0
                        Text: =Parent.Default
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardKey5.Y + DataCardKey5.Height + 5
            - 匯款期限日_DataCard1:
                Control: TypedDataCard@1.0.7
                Variant: ClassicTextualView
                IsLocked: true
                Properties:
                  BorderColor: =RGBA(0, 18, 107, 1)
                  DataField: ="OData__x532f__x6b3e__x671f__x9650__x65"
                  Default: =ThisItem.匯款期限日
                  DisplayName: =DataSourceInfo([@請款單],DataSourceInfo.DisplayName,'OData__x532f__x6b3e__x671f__x9650__x65')
                  Required: =false
                  X: =0
                  Y: =5
                Children:
                  - DataCardKey6:
                      Control: Label@2.5.1
                      MetadataKey: FieldName
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =48
                        Text: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        Wrap: =false
                        X: =30
                        Y: =10
                  - DataCardValue6:
                      Control: Label@2.5.1
                      MetadataKey: FieldValue
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 18, 107, 1)
                        DisplayMode: =Parent.DisplayMode
                        Font: =Font.'Open Sans'
                        Height: =40
                        PaddingLeft: =0
                        PaddingRight: =0
                        PaddingTop: =0
                        Text: =Parent.Default
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardKey6.Y + DataCardKey6.Height + 5
            - 支票到期日_DataCard1:
                Control: TypedDataCard@1.0.7
                Variant: ClassicTextualView
                IsLocked: true
                Properties:
                  BorderColor: =RGBA(0, 18, 107, 1)
                  DataField: ="OData__x652f__x7968__x5230__x671f__x65"
                  Default: =ThisItem.支票到期日
                  DisplayName: =DataSourceInfo([@請款單],DataSourceInfo.DisplayName,'OData__x652f__x7968__x5230__x671f__x65')
                  Required: =false
                  X: =0
                  Y: =6
                Children:
                  - DataCardKey7:
                      Control: Label@2.5.1
                      MetadataKey: FieldName
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =48
                        Text: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        Wrap: =false
                        X: =30
                        Y: =10
                  - DataCardValue7:
                      Control: Label@2.5.1
                      MetadataKey: FieldValue
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 18, 107, 1)
                        DisplayMode: =Parent.DisplayMode
                        Font: =Font.'Open Sans'
                        Height: =40
                        PaddingLeft: =0
                        PaddingRight: =0
                        PaddingTop: =0
                        Text: =Parent.Default
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardKey7.Y + DataCardKey7.Height + 5
            - 銀行名稱_DataCard1:
                Control: TypedDataCard@1.0.7
                Variant: ClassicTextualView
                IsLocked: true
                Properties:
                  BorderColor: =RGBA(0, 18, 107, 1)
                  DataField: ="OData__x9280__x884c__x540d__x7a31_"
                  Default: =ThisItem.銀行名稱
                  DisplayName: =DataSourceInfo([@請款單],DataSourceInfo.DisplayName,'OData__x9280__x884c__x540d__x7a31_')
                  Required: =false
                  X: =0
                  Y: =7
                Children:
                  - DataCardKey8:
                      Control: Label@2.5.1
                      MetadataKey: FieldName
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =48
                        Text: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        Wrap: =false
                        X: =30
                        Y: =10
                  - DataCardValue8:
                      Control: Label@2.5.1
                      MetadataKey: FieldValue
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 18, 107, 1)
                        DisplayMode: =Parent.DisplayMode
                        Font: =Font.'Open Sans'
                        Height: =40
                        PaddingLeft: =0
                        PaddingRight: =0
                        PaddingTop: =0
                        Text: =Parent.Default
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardKey8.Y + DataCardKey8.Height + 5
            - 案號_DataCard2:
                Control: TypedDataCard@1.0.7
                Variant: ClassicTextualView
                IsLocked: true
                Properties:
                  BorderColor: =RGBA(0, 18, 107, 1)
                  DataField: ="OData__x6848__x865f_"
                  Default: =ThisItem.案號
                  DisplayName: =DataSourceInfo([@請款單],DataSourceInfo.DisplayName,'OData__x6848__x865f_')
                  Required: =false
                  X: =0
                  Y: =8
                Children:
                  - DataCardKey26:
                      Control: Label@2.5.1
                      MetadataKey: FieldName
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =48
                        Text: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        Wrap: =false
                        X: =30
                        Y: =10
                  - DataCardValue23:
                      Control: Label@2.5.1
                      MetadataKey: FieldValue
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 18, 107, 1)
                        DisplayMode: =Parent.DisplayMode
                        Font: =Font.'Open Sans'
                        Height: =40
                        PaddingLeft: =0
                        PaddingRight: =0
                        PaddingTop: =0
                        Text: =Parent.Default
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardKey26.Y + DataCardKey26.Height + 5
            - 受款人姓名_DataCard2:
                Control: TypedDataCard@1.0.7
                Variant: ClassicTextualView
                IsLocked: true
                Properties:
                  BorderColor: =RGBA(0, 18, 107, 1)
                  DataField: ="OData__x53d7__x6b3e__x4eba__x59d3__x54"
                  Default: =ThisItem.受款人姓名
                  DisplayName: =DataSourceInfo([@請款單],DataSourceInfo.DisplayName,'OData__x53d7__x6b3e__x4eba__x59d3__x54')
                  Required: =false
                  X: =0
                  Y: =9
                Children:
                  - DataCardKey27:
                      Control: Label@2.5.1
                      MetadataKey: FieldName
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =48
                        Text: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        Wrap: =false
                        X: =30
                        Y: =10
                  - DataCardValue24:
                      Control: Label@2.5.1
                      MetadataKey: FieldValue
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 18, 107, 1)
                        DisplayMode: =Parent.DisplayMode
                        Font: =Font.'Open Sans'
                        Height: =40
                        PaddingLeft: =0
                        PaddingRight: =0
                        PaddingTop: =0
                        Text: =Parent.Default
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardKey27.Y + DataCardKey27.Height + 5
            - 受款人/支票抬頭_DataCard2:
                Control: TypedDataCard@1.0.7
                Variant: ClassicTextualView
                IsLocked: true
                Properties:
                  BorderColor: =RGBA(0, 18, 107, 1)
                  DataField: ="OData__x53d7__x6b3e__x4eba__x002f__x65"
                  Default: =ThisItem.'受款人/支票抬頭'
                  DisplayName: =DataSourceInfo([@請款單],DataSourceInfo.DisplayName,'OData__x53d7__x6b3e__x4eba__x002f__x65')
                  Required: =false
                  X: =0
                  Y: =10
                Children:
                  - DataCardKey28:
                      Control: Label@2.5.1
                      MetadataKey: FieldName
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =48
                        Text: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        Wrap: =false
                        X: =30
                        Y: =10
                  - DataCardValue25:
                      Control: Label@2.5.1
                      MetadataKey: FieldValue
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 18, 107, 1)
                        DisplayMode: =Parent.DisplayMode
                        Font: =Font.'Open Sans'
                        Height: =40
                        PaddingLeft: =0
                        PaddingRight: =0
                        PaddingTop: =0
                        Text: =Parent.Default
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardKey28.Y + DataCardKey28.Height + 5
#  EditScreen1

Screens:
  EditScreen1:
    Properties:
      LoadingSpinnerColor: =RGBA(56, 96, 178, 1)
    Children:
      - RectQuickActionBar3:
          Control: Rectangle@2.3.0
          Properties:
            BorderColor: =RGBA(0, 18, 107, 1)
            Fill: =RGBA(56, 96, 178, 1)
            Height: =88
            Width: =Parent.Width
      - IconCancel1:
          Control: Classic/Icon@2.5.0
          Properties:
            AccessibleLabel: =Self.Tooltip
            BorderColor: =RGBA(0, 18, 107, 1)
            Color: =RGBA(255, 255, 255, 1)
            Height: =88
            Icon: =Icon.Cancel
            OnSelect: =ResetForm(EditForm1);Back()
            PaddingBottom: =22
            PaddingLeft: =22
            PaddingRight: =22
            PaddingTop: =22
            PressedFill: =RGBA(255, 255, 255, 0.3)
            TabIndex: =0
            Tooltip: ="取消項目"
            Width: =88
      - IconAccept1:
          Control: Classic/Icon@2.5.0
          Properties:
            AccessibleLabel: =Self.Tooltip
            BorderColor: =RGBA(0, 18, 107, 1)
            Color: =RGBA(255, 255, 255, 1)
            Height: =88
            Icon: =Icon.Check
            OnSelect: =SubmitForm(EditForm1)
            PaddingBottom: =22
            PaddingLeft: =22
            PaddingRight: =22
            PaddingTop: =22
            PressedFill: =RGBA(255, 255, 255, 0.3)
            TabIndex: =0
            Tooltip: ="送出項目"
            Width: =88
            X: =Parent.Width - Self.Width
      - LblAppName3:
          Control: Label@2.5.1
          Properties:
            BorderColor: =RGBA(0, 0, 0, 1)
            Color: =RGBA(255, 255, 255, 1)
            Fill: =RGBA(58, 58, 58, 0)
            Font: =Font.'Open Sans'
            Height: =88
            Size: =27
            Text: ="請款單"
            Width: =Parent.Width - IconCancel1.Width - IconAccept1.Width
            Wrap: =false
            X: =IconCancel1.X + IconCancel1.Width
      - EditForm1:
          Control: Form@2.4.4
          Variant: Classic
          Layout: Vertical
          Properties:
            BorderColor: =RGBA(0, 18, 107, 1)
            DataSource: =[@請款單]
            Height: =Parent.Height - EditForm1.Y
            Item: =BrowseGallery1.Selected
            OnSuccess: =Back()
            Width: =Parent.Width
            Y: =RectQuickActionBar3.Height
          Children:
            - 申請人_DataCard2:
                Control: TypedDataCard@1.0.7
                Variant: ClassicComboBoxEdit
                Properties:
                  BorderColor: =RGBA(0, 18, 107, 1)
                  DataField: ="OData__x7533__x8acb__x4eba__"
                  Default: =ThisItem.申請人
                  DisplayName: =DataSourceInfo([@請款單],DataSourceInfo.DisplayName,'OData__x7533__x8acb__x4eba__')
                  Required: =false
                  Update: =DataCardValue9.Selected
                  X: =0
                  Y: =0
                Children:
                  - DataCardKey9:
                      Control: Label@2.5.1
                      MetadataKey: FieldName
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =48
                        Text: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        Wrap: =false
                        X: =30
                        Y: =10
                  - DataCardValue9:
                      Control: Classic/ComboBox@2.4.0
                      MetadataKey: FieldValue
                      Properties:
                        BorderColor: =If(IsBlank(Parent.Error), Parent.BorderColor, Color.Red)
                        ChevronBackground: =RGBA(56, 96, 178, 1)
                        ChevronFill: =RGBA(255, 255, 255, 1)
                        ChevronHoverBackground: =ColorFade(RGBA(56, 96, 178, 1), -20%)
                        ChevronHoverFill: =RGBA(255, 255, 255, 1)
                        DefaultSelectedItems: =Parent.Default
                        DisplayFields: =["DisplayName"]
                        DisplayMode: =Parent.DisplayMode
                        Font: =Font.'Open Sans'
                        HoverFill: =RGBA(186, 202, 226, 1)
                        Items: =Choices([@請款單].'OData__x7533__x8acb__x4eba__')
                        PaddingBottom: =5
                        PaddingLeft: =If(Self.DisplayMode = DisplayMode.Edit, 5, 0)
                        PaddingRight: =5
                        PaddingTop: =5
                        PressedColor: =RGBA(255, 255, 255, 1)
                        PressedFill: =RGBA(0, 18, 107, 1)
                        SearchFields: =["Claims"]
                        SelectMultiple: =false
                        SelectionColor: =RGBA(255, 255, 255, 1)
                        SelectionFill: =RGBA(56, 96, 178, 1)
                        Tooltip: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardKey9.Y + DataCardKey9.Height + 5
                  - ErrorMessage4:
                      Control: Label@2.5.1
                      MetadataKey: ErrorMessage
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(168, 0, 0, 1)
                        Font: =Font.'Open Sans'
                        FontWeight: =FontWeight.Semibold
                        Height: =10
                        Live: =Live.Assertive
                        PaddingBottom: =0
                        PaddingLeft: =0
                        PaddingRight: =0
                        PaddingTop: =0
                        Size: =24
                        Text: =Parent.Error
                        Visible: =Parent.DisplayMode=DisplayMode.Edit
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardValue9.Y + DataCardValue9.Height
                  - StarVisible4:
                      Control: Label@2.5.1
                      MetadataKey: FieldRequired
                      Properties:
                        Align: =Align.Center
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =DataCardKey9.Height
                        Text: ="*"
                        Visible: =And(Parent.Required, Parent.DisplayMode=DisplayMode.Edit)
                        Width: =30
                        Wrap: =false
                        Y: =DataCardKey9.Y
            - 性質_DataCard2:
                Control: TypedDataCard@1.0.7
                Variant: ClassicComboBoxEdit
                IsLocked: true
                Properties:
                  BorderColor: =RGBA(0, 18, 107, 1)
                  DataField: ="OData__x6027__x8cea_"
                  Default: =ThisItem.性質
                  DisplayName: =DataSourceInfo([@請款單],DataSourceInfo.DisplayName,'OData__x6027__x8cea_')
                  Required: =false
                  Update: =DataCardValue10.Selected
                  X: =0
                  Y: =1
                Children:
                  - DataCardKey10:
                      Control: Label@2.5.1
                      MetadataKey: FieldName
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =48
                        Text: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        Wrap: =false
                        X: =30
                        Y: =10
                  - DataCardValue10:
                      Control: Classic/ComboBox@2.4.0
                      MetadataKey: FieldValue
                      Properties:
                        BorderColor: =If(IsBlank(Parent.Error), Parent.BorderColor, Color.Red)
                        ChevronBackground: =RGBA(56, 96, 178, 1)
                        ChevronFill: =RGBA(255, 255, 255, 1)
                        ChevronHoverBackground: =ColorFade(RGBA(56, 96, 178, 1), -20%)
                        ChevronHoverFill: =RGBA(255, 255, 255, 1)
                        DefaultSelectedItems: =Parent.Default
                        DisplayFields: =["Value"]
                        DisplayMode: =Parent.DisplayMode
                        Font: =Font.'Open Sans'
                        HoverFill: =RGBA(186, 202, 226, 1)
                        Items: =Choices([@請款單].'OData__x6027__x8cea_')
                        PaddingBottom: =5
                        PaddingLeft: =If(Self.DisplayMode = DisplayMode.Edit, 5, 0)
                        PaddingRight: =5
                        PaddingTop: =5
                        PressedColor: =RGBA(255, 255, 255, 1)
                        PressedFill: =RGBA(0, 18, 107, 1)
                        SearchFields: =["Value"]
                        SelectMultiple: =false
                        SelectionColor: =RGBA(255, 255, 255, 1)
                        SelectionFill: =RGBA(56, 96, 178, 1)
                        Tooltip: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardKey10.Y + DataCardKey10.Height + 5
                  - ErrorMessage5:
                      Control: Label@2.5.1
                      MetadataKey: ErrorMessage
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(168, 0, 0, 1)
                        Font: =Font.'Open Sans'
                        FontWeight: =FontWeight.Semibold
                        Height: =10
                        Live: =Live.Assertive
                        PaddingBottom: =0
                        PaddingLeft: =0
                        PaddingRight: =0
                        PaddingTop: =0
                        Size: =24
                        Text: =Parent.Error
                        Visible: =Parent.DisplayMode=DisplayMode.Edit
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardValue10.Y + DataCardValue10.Height
                  - StarVisible5:
                      Control: Label@2.5.1
                      MetadataKey: FieldRequired
                      Properties:
                        Align: =Align.Center
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =DataCardKey10.Height
                        Text: ="*"
                        Visible: =And(Parent.Required, Parent.DisplayMode=DisplayMode.Edit)
                        Width: =30
                        Wrap: =false
                        Y: =DataCardKey10.Y
            - 請款說明_DataCard2:
                Control: TypedDataCard@1.0.7
                Variant: ClassicTextualEdit
                IsLocked: true
                Properties:
                  BorderColor: =RGBA(0, 18, 107, 1)
                  DataField: ="OData__x8acb__x6b3e__x8aaa__x660e_"
                  Default: =ThisItem.請款說明
                  DisplayName: =DataSourceInfo([@請款單],DataSourceInfo.DisplayName,'OData__x8acb__x6b3e__x8aaa__x660e_')
                  MaxLength: =DataSourceInfo([@請款單], DataSourceInfo.MaxLength, 'OData__x8acb__x6b3e__x8aaa__x660e_')
                  Required: =false
                  Update: =DataCardValue11.Text
                  X: =0
                  Y: =2
                Children:
                  - DataCardKey11:
                      Control: Label@2.5.1
                      MetadataKey: FieldName
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =48
                        Text: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        Wrap: =false
                        X: =30
                        Y: =10
                  - DataCardValue11:
                      Control: Classic/TextInput@2.3.2
                      MetadataKey: FieldValue
                      Properties:
                        BorderColor: =If(IsBlank(Parent.Error), Parent.BorderColor, Color.Red)
                        Default: =Parent.Default
                        DelayOutput: =true
                        DisplayMode: =Parent.DisplayMode
                        Font: =Font.'Open Sans'
                        HoverBorderColor: =RGBA(0, 18, 107, 1)
                        HoverFill: =RGBA(186, 202, 226, 1)
                        MaxLength: =Parent.MaxLength
                        PaddingLeft: =5
                        RadiusBottomLeft: =0
                        RadiusBottomRight: =0
                        RadiusTopLeft: =0
                        RadiusTopRight: =0
                        Tooltip: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardKey11.Y + DataCardKey11.Height + 5
                  - ErrorMessage6:
                      Control: Label@2.5.1
                      MetadataKey: ErrorMessage
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(168, 0, 0, 1)
                        Font: =Font.'Open Sans'
                        FontWeight: =FontWeight.Semibold
                        Height: =10
                        Live: =Live.Assertive
                        PaddingBottom: =0
                        PaddingLeft: =0
                        PaddingRight: =0
                        PaddingTop: =0
                        Size: =24
                        Text: =Parent.Error
                        Visible: =Parent.DisplayMode=DisplayMode.Edit
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardValue11.Y + DataCardValue11.Height
                  - StarVisible6:
                      Control: Label@2.5.1
                      MetadataKey: FieldRequired
                      Properties:
                        Align: =Align.Center
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =DataCardKey11.Height
                        Text: ="*"
                        Visible: =And(Parent.Required, Parent.DisplayMode=DisplayMode.Edit)
                        Width: =30
                        Wrap: =false
                        Y: =DataCardKey11.Y
            - 付款方式_DataCard2:
                Control: TypedDataCard@1.0.7
                Variant: ClassicComboBoxEdit
                IsLocked: true
                Properties:
                  BorderColor: =RGBA(0, 18, 107, 1)
                  DataField: ="OData__x4ed8__x6b3e__x65b9__x5f0f_"
                  Default: =ThisItem.付款方式
                  DisplayName: =DataSourceInfo([@請款單],DataSourceInfo.DisplayName,'OData__x4ed8__x6b3e__x65b9__x5f0f_')
                  Required: =false
                  Update: =DataCardValue12.Selected
                  X: =0
                  Y: =3
                Children:
                  - DataCardKey12:
                      Control: Label@2.5.1
                      MetadataKey: FieldName
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =48
                        Text: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        Wrap: =false
                        X: =30
                        Y: =10
                  - DataCardValue12:
                      Control: Classic/ComboBox@2.4.0
                      MetadataKey: FieldValue
                      Properties:
                        BorderColor: =If(IsBlank(Parent.Error), Parent.BorderColor, Color.Red)
                        ChevronBackground: =RGBA(56, 96, 178, 1)
                        ChevronFill: =RGBA(255, 255, 255, 1)
                        ChevronHoverBackground: =ColorFade(RGBA(56, 96, 178, 1), -20%)
                        ChevronHoverFill: =RGBA(255, 255, 255, 1)
                        DefaultSelectedItems: =Parent.Default
                        DisplayFields: =["Value"]
                        DisplayMode: =Parent.DisplayMode
                        Font: =Font.'Open Sans'
                        HoverFill: =RGBA(186, 202, 226, 1)
                        Items: =Choices([@請款單].'OData__x4ed8__x6b3e__x65b9__x5f0f_')
                        PaddingBottom: =5
                        PaddingLeft: =If(Self.DisplayMode = DisplayMode.Edit, 5, 0)
                        PaddingRight: =5
                        PaddingTop: =5
                        PressedColor: =RGBA(255, 255, 255, 1)
                        PressedFill: =RGBA(0, 18, 107, 1)
                        SearchFields: =["Value"]
                        SelectMultiple: =false
                        SelectionColor: =RGBA(255, 255, 255, 1)
                        SelectionFill: =RGBA(56, 96, 178, 1)
                        Tooltip: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardKey12.Y + DataCardKey12.Height + 5
                  - ErrorMessage7:
                      Control: Label@2.5.1
                      MetadataKey: ErrorMessage
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(168, 0, 0, 1)
                        Font: =Font.'Open Sans'
                        FontWeight: =FontWeight.Semibold
                        Height: =10
                        Live: =Live.Assertive
                        PaddingBottom: =0
                        PaddingLeft: =0
                        PaddingRight: =0
                        PaddingTop: =0
                        Size: =24
                        Text: =Parent.Error
                        Visible: =Parent.DisplayMode=DisplayMode.Edit
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardValue12.Y + DataCardValue12.Height
                  - StarVisible7:
                      Control: Label@2.5.1
                      MetadataKey: FieldRequired
                      Properties:
                        Align: =Align.Center
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =DataCardKey12.Height
                        Text: ="*"
                        Visible: =And(Parent.Required, Parent.DisplayMode=DisplayMode.Edit)
                        Width: =30
                        Wrap: =false
                        Y: =DataCardKey12.Y
            - 實付總額(新台幣)_DataCard2:
                Control: TypedDataCard@1.0.7
                Variant: ClassicNumberEdit
                IsLocked: true
                Properties:
                  BorderColor: =RGBA(0, 18, 107, 1)
                  DataField: ="OData__x5be6__x4ed8__x7e3d__x984d__x00"
                  Default: =ThisItem.'實付總額(新台幣)'
                  DisplayName: =DataSourceInfo([@請款單],DataSourceInfo.DisplayName,'OData__x5be6__x4ed8__x7e3d__x984d__x00')
                  Required: =false
                  Update: =Value(DataCardValue13.Text)
                  X: =0
                  Y: =4
                Children:
                  - DataCardKey13:
                      Control: Label@2.5.1
                      MetadataKey: FieldName
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =48
                        Text: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        Wrap: =false
                        X: =30
                        Y: =10
                  - DataCardValue13:
                      Control: Classic/TextInput@2.3.2
                      MetadataKey: FieldValue
                      Properties:
                        BorderColor: =If(IsBlank(Parent.Error), Parent.BorderColor, Color.Red)
                        Default: =Parent.Default
                        DelayOutput: =true
                        DisplayMode: =Parent.DisplayMode
                        Font: =Font.'Open Sans'
                        Format: =TextFormat.Number
                        HoverBorderColor: =RGBA(0, 18, 107, 1)
                        HoverFill: =RGBA(186, 202, 226, 1)
                        PaddingLeft: =5
                        RadiusBottomLeft: =0
                        RadiusBottomRight: =0
                        RadiusTopLeft: =0
                        RadiusTopRight: =0
                        Tooltip: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardKey13.Y + DataCardKey13.Height + 5
                  - ErrorMessage8:
                      Control: Label@2.5.1
                      MetadataKey: ErrorMessage
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(168, 0, 0, 1)
                        Font: =Font.'Open Sans'
                        FontWeight: =FontWeight.Semibold
                        Height: =10
                        Live: =Live.Assertive
                        PaddingBottom: =0
                        PaddingLeft: =0
                        PaddingRight: =0
                        PaddingTop: =0
                        Size: =24
                        Text: =Parent.Error
                        Visible: =Parent.DisplayMode=DisplayMode.Edit
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardValue13.Y + DataCardValue13.Height
                  - StarVisible8:
                      Control: Label@2.5.1
                      MetadataKey: FieldRequired
                      Properties:
                        Align: =Align.Center
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =DataCardKey13.Height
                        Text: ="*"
                        Visible: =And(Parent.Required, Parent.DisplayMode=DisplayMode.Edit)
                        Width: =30
                        Wrap: =false
                        Y: =DataCardKey13.Y
            - 匯款期限日_DataCard2:
                Control: TypedDataCard@1.0.7
                Variant: ClassicDateTimeEdit
                IsLocked: true
                Properties:
                  BorderColor: =RGBA(0, 18, 107, 1)
                  DataField: ="OData__x532f__x6b3e__x671f__x9650__x65"
                  Default: =ThisItem.匯款期限日
                  DisplayName: =DataSourceInfo([@請款單],DataSourceInfo.DisplayName,'OData__x532f__x6b3e__x671f__x9650__x65')
                  Required: =false
                  Update: =If(Not IsBlank(DateValue1.SelectedDate), DateTime(Year(DateValue1.SelectedDate), Month(DateValue1.SelectedDate), Day(DateValue1.SelectedDate), Value(HourValue1.Selected.Value), Value(MinuteValue1.Selected.Value), 0))
                  X: =0
                  Y: =5
                Children:
                  - DataCardKey14:
                      Control: Label@2.5.1
                      MetadataKey: FieldName
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =48
                        Text: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        Wrap: =false
                        X: =30
                        Y: =10
                  - DateValue1:
                      Control: Classic/DatePicker@2.6.0
                      MetadataKey: DateFieldValue
                      Properties:
                        BorderColor: =If(IsBlank(Parent.Error), Parent.BorderColor, Color.Red)
                        DefaultDate: =Parent.Default
                        DisplayMode: =Parent.DisplayMode
                        EndYear: =Year(Today())+100
                        Font: =Font.'Open Sans'
                        IconBackground: =RGBA(56, 96, 178, 1)
                        IconFill: =RGBA(255, 255, 255, 1)
                        IsEditable: =true
                        PaddingBottom: =0
                        PaddingLeft: =If(Self.DisplayMode = DisplayMode.Edit, 5, 0)
                        StartYear: =1899
                        Tooltip: =Parent.DisplayName
                        Width: =(Parent.Width - 60) / 2
                        X: =30
                        Y: =DataCardKey14.Y + DataCardKey14.Height + 5
                  - HourValue1:
                      Control: Classic/DropDown@2.3.1
                      MetadataKey: HourFieldValue
                      Properties:
                        BorderColor: =If(IsBlank(Parent.Error), Parent.BorderColor, Color.Red)
                        ChevronBackground: =RGBA(56, 96, 178, 1)
                        ChevronFill: =RGBA(255, 255, 255, 1)
                        ChevronHoverBackground: =ColorFade(RGBA(56, 96, 178, 1), -20%)
                        ChevronHoverFill: =RGBA(255, 255, 255, 1)
                        Default: =Text(Hour(Parent.Default),"00")
                        DisplayMode: =Parent.DisplayMode
                        Font: =Font.'Open Sans'
                        Height: =DateValue1.Height
                        HoverFill: =RGBA(186, 202, 226, 1)
                        Items: =["00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23"]
                        Items.Value: =Value
                        PaddingBottom: =5
                        PaddingLeft: =If(Self.DisplayMode = DisplayMode.Edit, 5, 0)
                        PaddingRight: =5
                        PaddingTop: =5
                        PressedColor: =RGBA(255, 255, 255, 1)
                        PressedFill: =RGBA(0, 18, 107, 1)
                        SelectionColor: =RGBA(255, 255, 255, 1)
                        SelectionFill: =RGBA(56, 96, 178, 1)
                        Tooltip: =Parent.DisplayName
                        Width: =DateValue1.Width / 2 - 10
                        X: =DateValue1.X + DateValue1.Width + 10
                        Y: =DateValue1.Y
                  - Separator2:
                      Control: Label@2.5.1
                      MetadataKey: HourMinuteSeparator
                      Properties:
                        Align: =Align.Center
                        BorderColor: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        FontWeight: =FontWeight.Bold
                        Height: =HourValue1.Height
                        PaddingBottom: =0
                        PaddingLeft: =0
                        PaddingRight: =0
                        PaddingTop: =0
                        Text: =":"
                        Width: =10
                        Wrap: =false
                        X: =HourValue1.X + HourValue1.Width
                        Y: =HourValue1.Y
                  - MinuteValue1:
                      Control: Classic/DropDown@2.3.1
                      MetadataKey: MinuteFieldValue
                      Properties:
                        BorderColor: =If(IsBlank(Parent.Error), Parent.BorderColor, Color.Red)
                        ChevronBackground: =RGBA(56, 96, 178, 1)
                        ChevronFill: =RGBA(255, 255, 255, 1)
                        ChevronHoverBackground: =ColorFade(RGBA(56, 96, 178, 1), -20%)
                        ChevronHoverFill: =RGBA(255, 255, 255, 1)
                        Default: =Text(Minute(Parent.Default),"00")
                        DisplayMode: =Parent.DisplayMode
                        Font: =Font.'Open Sans'
                        Height: =HourValue1.Height
                        HoverFill: =RGBA(186, 202, 226, 1)
                        Items: =["00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59"]
                        Items.Value: =Value
                        PaddingBottom: =5
                        PaddingLeft: =If(Self.DisplayMode = DisplayMode.Edit, 5, 0)
                        PaddingRight: =5
                        PaddingTop: =5
                        PressedColor: =RGBA(255, 255, 255, 1)
                        PressedFill: =RGBA(0, 18, 107, 1)
                        SelectionColor: =RGBA(255, 255, 255, 1)
                        SelectionFill: =RGBA(56, 96, 178, 1)
                        Tooltip: =Parent.DisplayName
                        Width: =HourValue1.Width
                        X: =HourValue1.X + HourValue1.Width + Separator2.Width
                        Y: =HourValue1.Y
                  - ErrorMessage9:
                      Control: Label@2.5.1
                      MetadataKey: ErrorMessage
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(168, 0, 0, 1)
                        Font: =Font.'Open Sans'
                        FontWeight: =FontWeight.Semibold
                        Height: =10
                        Live: =Live.Assertive
                        PaddingBottom: =0
                        PaddingLeft: =0
                        PaddingRight: =0
                        PaddingTop: =0
                        Size: =24
                        Text: =Parent.Error
                        Visible: =Parent.DisplayMode=DisplayMode.Edit
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =HourValue1.Y + HourValue1.Height
                  - StarVisible9:
                      Control: Label@2.5.1
                      MetadataKey: FieldRequired
                      Properties:
                        Align: =Align.Center
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =DataCardKey14.Height
                        Text: ="*"
                        Visible: =And(Parent.Required, Parent.DisplayMode=DisplayMode.Edit)
                        Width: =30
                        Wrap: =false
                        Y: =DataCardKey14.Y
            - 支票到期日_DataCard2:
                Control: TypedDataCard@1.0.7
                Variant: ClassicDateTimeEdit
                IsLocked: true
                Properties:
                  BorderColor: =RGBA(0, 18, 107, 1)
                  DataField: ="OData__x652f__x7968__x5230__x671f__x65"
                  Default: =ThisItem.支票到期日
                  DisplayName: =DataSourceInfo([@請款單],DataSourceInfo.DisplayName,'OData__x652f__x7968__x5230__x671f__x65')
                  Required: =false
                  Update: =If(Not IsBlank(DateValue2.SelectedDate), DateTime(Year(DateValue2.SelectedDate), Month(DateValue2.SelectedDate), Day(DateValue2.SelectedDate), Value(HourValue2.Selected.Value), Value(MinuteValue2.Selected.Value), 0))
                  X: =0
                  Y: =6
                Children:
                  - DataCardKey15:
                      Control: Label@2.5.1
                      MetadataKey: FieldName
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =48
                        Text: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        Wrap: =false
                        X: =30
                        Y: =10
                  - DateValue2:
                      Control: Classic/DatePicker@2.6.0
                      MetadataKey: DateFieldValue
                      Properties:
                        BorderColor: =If(IsBlank(Parent.Error), Parent.BorderColor, Color.Red)
                        DefaultDate: =Parent.Default
                        DisplayMode: =Parent.DisplayMode
                        EndYear: =Year(Today())+100
                        Font: =Font.'Open Sans'
                        IconBackground: =RGBA(56, 96, 178, 1)
                        IconFill: =RGBA(255, 255, 255, 1)
                        IsEditable: =true
                        PaddingBottom: =0
                        PaddingLeft: =If(Self.DisplayMode = DisplayMode.Edit, 5, 0)
                        StartYear: =1899
                        Tooltip: =Parent.DisplayName
                        Width: =(Parent.Width - 60) / 2
                        X: =30
                        Y: =DataCardKey15.Y + DataCardKey15.Height + 5
                  - HourValue2:
                      Control: Classic/DropDown@2.3.1
                      MetadataKey: HourFieldValue
                      Properties:
                        BorderColor: =If(IsBlank(Parent.Error), Parent.BorderColor, Color.Red)
                        ChevronBackground: =RGBA(56, 96, 178, 1)
                        ChevronFill: =RGBA(255, 255, 255, 1)
                        ChevronHoverBackground: =ColorFade(RGBA(56, 96, 178, 1), -20%)
                        ChevronHoverFill: =RGBA(255, 255, 255, 1)
                        Default: =Text(Hour(Parent.Default),"00")
                        DisplayMode: =Parent.DisplayMode
                        Font: =Font.'Open Sans'
                        Height: =DateValue2.Height
                        HoverFill: =RGBA(186, 202, 226, 1)
                        Items: =["00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23"]
                        Items.Value: =Value
                        PaddingBottom: =5
                        PaddingLeft: =If(Self.DisplayMode = DisplayMode.Edit, 5, 0)
                        PaddingRight: =5
                        PaddingTop: =5
                        PressedColor: =RGBA(255, 255, 255, 1)
                        PressedFill: =RGBA(0, 18, 107, 1)
                        SelectionColor: =RGBA(255, 255, 255, 1)
                        SelectionFill: =RGBA(56, 96, 178, 1)
                        Tooltip: =Parent.DisplayName
                        Width: =DateValue2.Width / 2 - 10
                        X: =DateValue2.X + DateValue2.Width + 10
                        Y: =DateValue2.Y
                  - Separator3:
                      Control: Label@2.5.1
                      MetadataKey: HourMinuteSeparator
                      Properties:
                        Align: =Align.Center
                        BorderColor: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        FontWeight: =FontWeight.Bold
                        Height: =HourValue2.Height
                        PaddingBottom: =0
                        PaddingLeft: =0
                        PaddingRight: =0
                        PaddingTop: =0
                        Text: =":"
                        Width: =10
                        Wrap: =false
                        X: =HourValue2.X + HourValue2.Width
                        Y: =HourValue2.Y
                  - MinuteValue2:
                      Control: Classic/DropDown@2.3.1
                      MetadataKey: MinuteFieldValue
                      Properties:
                        BorderColor: =If(IsBlank(Parent.Error), Parent.BorderColor, Color.Red)
                        ChevronBackground: =RGBA(56, 96, 178, 1)
                        ChevronFill: =RGBA(255, 255, 255, 1)
                        ChevronHoverBackground: =ColorFade(RGBA(56, 96, 178, 1), -20%)
                        ChevronHoverFill: =RGBA(255, 255, 255, 1)
                        Default: =Text(Minute(Parent.Default),"00")
                        DisplayMode: =Parent.DisplayMode
                        Font: =Font.'Open Sans'
                        Height: =HourValue2.Height
                        HoverFill: =RGBA(186, 202, 226, 1)
                        Items: =["00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59"]
                        Items.Value: =Value
                        PaddingBottom: =5
                        PaddingLeft: =If(Self.DisplayMode = DisplayMode.Edit, 5, 0)
                        PaddingRight: =5
                        PaddingTop: =5
                        PressedColor: =RGBA(255, 255, 255, 1)
                        PressedFill: =RGBA(0, 18, 107, 1)
                        SelectionColor: =RGBA(255, 255, 255, 1)
                        SelectionFill: =RGBA(56, 96, 178, 1)
                        Tooltip: =Parent.DisplayName
                        Width: =HourValue2.Width
                        X: =HourValue2.X + HourValue2.Width + Separator3.Width
                        Y: =HourValue2.Y
                  - ErrorMessage10:
                      Control: Label@2.5.1
                      MetadataKey: ErrorMessage
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(168, 0, 0, 1)
                        Font: =Font.'Open Sans'
                        FontWeight: =FontWeight.Semibold
                        Height: =10
                        Live: =Live.Assertive
                        PaddingBottom: =0
                        PaddingLeft: =0
                        PaddingRight: =0
                        PaddingTop: =0
                        Size: =24
                        Text: =Parent.Error
                        Visible: =Parent.DisplayMode=DisplayMode.Edit
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =HourValue2.Y + HourValue2.Height
                  - StarVisible10:
                      Control: Label@2.5.1
                      MetadataKey: FieldRequired
                      Properties:
                        Align: =Align.Center
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =DataCardKey15.Height
                        Text: ="*"
                        Visible: =And(Parent.Required, Parent.DisplayMode=DisplayMode.Edit)
                        Width: =30
                        Wrap: =false
                        Y: =DataCardKey15.Y
            - 預計結案日_DataCard1:
                Control: TypedDataCard@1.0.7
                Variant: ClassicDateEdit
                IsLocked: true
                Properties:
                  BorderColor: =RGBA(0, 18, 107, 1)
                  DataField: ="OData__x9810__x8a08__x7d50__x6848__x65"
                  Default: =ThisItem.預計結案日
                  DisplayName: =DataSourceInfo([@請款單],DataSourceInfo.DisplayName,'OData__x9810__x8a08__x7d50__x6848__x65')
                  Required: =false
                  Update: =DataCardValue15.SelectedDate
                  X: =0
                  Y: =7
                Children:
                  - DataCardKey17:
                      Control: Label@2.5.1
                      MetadataKey: FieldName
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =48
                        Text: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        Wrap: =false
                        X: =30
                        Y: =10
                  - DataCardValue15:
                      Control: Classic/DatePicker@2.6.0
                      MetadataKey: FieldValue
                      Properties:
                        BorderColor: =If(IsBlank(Parent.Error), Parent.BorderColor, Color.Red)
                        DefaultDate: =Parent.Default
                        DisplayMode: =Parent.DisplayMode
                        EndYear: =Year(Today())+100
                        Font: =Font.'Open Sans'
                        IconBackground: =RGBA(56, 96, 178, 1)
                        IconFill: =RGBA(255, 255, 255, 1)
                        IsEditable: =true
                        PaddingBottom: =0
                        PaddingLeft: =If(Self.DisplayMode = DisplayMode.Edit, 5, 0)
                        StartYear: =1899
                        Tooltip: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardKey17.Y + DataCardKey17.Height + 5
                  - ErrorMessage12:
                      Control: Label@2.5.1
                      MetadataKey: ErrorMessage
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(168, 0, 0, 1)
                        Font: =Font.'Open Sans'
                        FontWeight: =FontWeight.Semibold
                        Height: =10
                        Live: =Live.Assertive
                        PaddingBottom: =0
                        PaddingLeft: =0
                        PaddingRight: =0
                        PaddingTop: =0
                        Size: =24
                        Text: =Parent.Error
                        Visible: =Parent.DisplayMode=DisplayMode.Edit
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardValue15.Y + DataCardValue15.Height
                  - StarVisible12:
                      Control: Label@2.5.1
                      MetadataKey: FieldRequired
                      Properties:
                        Align: =Align.Center
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =DataCardKey17.Height
                        Text: ="*"
                        Visible: =And(Parent.Required, Parent.DisplayMode=DisplayMode.Edit)
                        Width: =30
                        Wrap: =false
                        Y: =DataCardKey17.Y
            - 銀行名稱_DataCard2:
                Control: TypedDataCard@1.0.7
                Variant: ClassicTextualEdit
                IsLocked: true
                Properties:
                  BorderColor: =RGBA(0, 18, 107, 1)
                  DataField: ="OData__x9280__x884c__x540d__x7a31_"
                  Default: =ThisItem.銀行名稱
                  DisplayName: =DataSourceInfo([@請款單],DataSourceInfo.DisplayName,'OData__x9280__x884c__x540d__x7a31_')
                  MaxLength: =DataSourceInfo([@請款單], DataSourceInfo.MaxLength, 'OData__x9280__x884c__x540d__x7a31_')
                  Required: =false
                  Update: =DataCardValue14.Text
                  X: =0
                  Y: =8
                Children:
                  - DataCardKey16:
                      Control: Label@2.5.1
                      MetadataKey: FieldName
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =48
                        Text: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        Wrap: =false
                        X: =30
                        Y: =10
                  - DataCardValue14:
                      Control: Classic/TextInput@2.3.2
                      MetadataKey: FieldValue
                      Properties:
                        BorderColor: =If(IsBlank(Parent.Error), Parent.BorderColor, Color.Red)
                        Default: =Parent.Default
                        DelayOutput: =true
                        DisplayMode: =Parent.DisplayMode
                        Font: =Font.'Open Sans'
                        HoverBorderColor: =RGBA(0, 18, 107, 1)
                        HoverFill: =RGBA(186, 202, 226, 1)
                        MaxLength: =Parent.MaxLength
                        PaddingLeft: =5
                        RadiusBottomLeft: =0
                        RadiusBottomRight: =0
                        RadiusTopLeft: =0
                        RadiusTopRight: =0
                        Tooltip: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardKey16.Y + DataCardKey16.Height + 5
                  - ErrorMessage11:
                      Control: Label@2.5.1
                      MetadataKey: ErrorMessage
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(168, 0, 0, 1)
                        Font: =Font.'Open Sans'
                        FontWeight: =FontWeight.Semibold
                        Height: =10
                        Live: =Live.Assertive
                        PaddingBottom: =0
                        PaddingLeft: =0
                        PaddingRight: =0
                        PaddingTop: =0
                        Size: =24
                        Text: =Parent.Error
                        Visible: =Parent.DisplayMode=DisplayMode.Edit
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardValue14.Y + DataCardValue14.Height
                  - StarVisible11:
                      Control: Label@2.5.1
                      MetadataKey: FieldRequired
                      Properties:
                        Align: =Align.Center
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =DataCardKey16.Height
                        Text: ="*"
                        Visible: =And(Parent.Required, Parent.DisplayMode=DisplayMode.Edit)
                        Width: =30
                        Wrap: =false
                        Y: =DataCardKey16.Y
            - 受款人姓名_DataCard1:
                Control: TypedDataCard@1.0.7
                Variant: ClassicTextualEdit
                IsLocked: true
                Properties:
                  BorderColor: =RGBA(0, 18, 107, 1)
                  DataField: ="OData__x53d7__x6b3e__x4eba__x59d3__x54"
                  Default: =ThisItem.受款人姓名
                  DisplayName: =DataSourceInfo([@請款單],DataSourceInfo.DisplayName,'OData__x53d7__x6b3e__x4eba__x59d3__x54')
                  MaxLength: =DataSourceInfo([@請款單], DataSourceInfo.MaxLength, 'OData__x53d7__x6b3e__x4eba__x59d3__x54')
                  Required: =false
                  Update: =DataCardValue16.Text
                  X: =0
                  Y: =9
                Children:
                  - DataCardKey18:
                      Control: Label@2.5.1
                      MetadataKey: FieldName
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =48
                        Text: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        Wrap: =false
                        X: =30
                        Y: =10
                  - DataCardValue16:
                      Control: Classic/TextInput@2.3.2
                      MetadataKey: FieldValue
                      Properties:
                        BorderColor: =If(IsBlank(Parent.Error), Parent.BorderColor, Color.Red)
                        Default: =Parent.Default
                        DelayOutput: =true
                        DisplayMode: =Parent.DisplayMode
                        Font: =Font.'Open Sans'
                        HoverBorderColor: =RGBA(0, 18, 107, 1)
                        HoverFill: =RGBA(186, 202, 226, 1)
                        MaxLength: =Parent.MaxLength
                        PaddingLeft: =5
                        RadiusBottomLeft: =0
                        RadiusBottomRight: =0
                        RadiusTopLeft: =0
                        RadiusTopRight: =0
                        Tooltip: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardKey18.Y + DataCardKey18.Height + 5
                  - ErrorMessage13:
                      Control: Label@2.5.1
                      MetadataKey: ErrorMessage
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(168, 0, 0, 1)
                        Font: =Font.'Open Sans'
                        FontWeight: =FontWeight.Semibold
                        Height: =10
                        Live: =Live.Assertive
                        PaddingBottom: =0
                        PaddingLeft: =0
                        PaddingRight: =0
                        PaddingTop: =0
                        Size: =24
                        Text: =Parent.Error
                        Visible: =Parent.DisplayMode=DisplayMode.Edit
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardValue16.Y + DataCardValue16.Height
                  - StarVisible13:
                      Control: Label@2.5.1
                      MetadataKey: FieldRequired
                      Properties:
                        Align: =Align.Center
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =DataCardKey18.Height
                        Text: ="*"
                        Visible: =And(Parent.Required, Parent.DisplayMode=DisplayMode.Edit)
                        Width: =30
                        Wrap: =false
                        Y: =DataCardKey18.Y
            - 銀行代碼_DataCard1:
                Control: TypedDataCard@1.0.7
                Variant: ClassicTextualEdit
                IsLocked: true
                Properties:
                  BorderColor: =RGBA(0, 18, 107, 1)
                  DataField: ="OData__x9280__x884c__x4ee3__x78bc_"
                  Default: =ThisItem.銀行代碼
                  DisplayName: =DataSourceInfo([@請款單],DataSourceInfo.DisplayName,'OData__x9280__x884c__x4ee3__x78bc_')
                  MaxLength: =DataSourceInfo([@請款單], DataSourceInfo.MaxLength, 'OData__x9280__x884c__x4ee3__x78bc_')
                  Required: =false
                  Update: =DataCardValue17.Text
                  X: =0
                  Y: =10
                Children:
                  - DataCardKey19:
                      Control: Label@2.5.1
                      MetadataKey: FieldName
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =48
                        Text: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        Wrap: =false
                        X: =30
                        Y: =10
                  - DataCardValue17:
                      Control: Classic/TextInput@2.3.2
                      MetadataKey: FieldValue
                      Properties:
                        BorderColor: =If(IsBlank(Parent.Error), Parent.BorderColor, Color.Red)
                        Default: =Parent.Default
                        DelayOutput: =true
                        DisplayMode: =Parent.DisplayMode
                        Font: =Font.'Open Sans'
                        HoverBorderColor: =RGBA(0, 18, 107, 1)
                        HoverFill: =RGBA(186, 202, 226, 1)
                        MaxLength: =Parent.MaxLength
                        PaddingLeft: =5
                        RadiusBottomLeft: =0
                        RadiusBottomRight: =0
                        RadiusTopLeft: =0
                        RadiusTopRight: =0
                        Tooltip: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardKey19.Y + DataCardKey19.Height + 5
                  - ErrorMessage14:
                      Control: Label@2.5.1
                      MetadataKey: ErrorMessage
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(168, 0, 0, 1)
                        Font: =Font.'Open Sans'
                        FontWeight: =FontWeight.Semibold
                        Height: =10
                        Live: =Live.Assertive
                        PaddingBottom: =0
                        PaddingLeft: =0
                        PaddingRight: =0
                        PaddingTop: =0
                        Size: =24
                        Text: =Parent.Error
                        Visible: =Parent.DisplayMode=DisplayMode.Edit
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardValue17.Y + DataCardValue17.Height
                  - StarVisible14:
                      Control: Label@2.5.1
                      MetadataKey: FieldRequired
                      Properties:
                        Align: =Align.Center
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =DataCardKey19.Height
                        Text: ="*"
                        Visible: =And(Parent.Required, Parent.DisplayMode=DisplayMode.Edit)
                        Width: =30
                        Wrap: =false
                        Y: =DataCardKey19.Y
            - 銀行帳號_DataCard1:
                Control: TypedDataCard@1.0.7
                Variant: ClassicTextualEdit
                IsLocked: true
                Properties:
                  BorderColor: =RGBA(0, 18, 107, 1)
                  DataField: ="OData__x9280__x884c__x5e33__x865f_"
                  Default: =ThisItem.銀行帳號
                  DisplayName: =DataSourceInfo([@請款單],DataSourceInfo.DisplayName,'OData__x9280__x884c__x5e33__x865f_')
                  MaxLength: =DataSourceInfo([@請款單], DataSourceInfo.MaxLength, 'OData__x9280__x884c__x5e33__x865f_')
                  Required: =false
                  Update: =DataCardValue18.Text
                  X: =0
                  Y: =11
                Children:
                  - DataCardKey20:
                      Control: Label@2.5.1
                      MetadataKey: FieldName
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =48
                        Text: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        Wrap: =false
                        X: =30
                        Y: =10
                  - DataCardValue18:
                      Control: Classic/TextInput@2.3.2
                      MetadataKey: FieldValue
                      Properties:
                        BorderColor: =If(IsBlank(Parent.Error), Parent.BorderColor, Color.Red)
                        Default: =Parent.Default
                        DelayOutput: =true
                        DisplayMode: =Parent.DisplayMode
                        Font: =Font.'Open Sans'
                        HoverBorderColor: =RGBA(0, 18, 107, 1)
                        HoverFill: =RGBA(186, 202, 226, 1)
                        MaxLength: =Parent.MaxLength
                        PaddingLeft: =5
                        RadiusBottomLeft: =0
                        RadiusBottomRight: =0
                        RadiusTopLeft: =0
                        RadiusTopRight: =0
                        Tooltip: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardKey20.Y + DataCardKey20.Height + 5
                  - ErrorMessage15:
                      Control: Label@2.5.1
                      MetadataKey: ErrorMessage
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(168, 0, 0, 1)
                        Font: =Font.'Open Sans'
                        FontWeight: =FontWeight.Semibold
                        Height: =10
                        Live: =Live.Assertive
                        PaddingBottom: =0
                        PaddingLeft: =0
                        PaddingRight: =0
                        PaddingTop: =0
                        Size: =24
                        Text: =Parent.Error
                        Visible: =Parent.DisplayMode=DisplayMode.Edit
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardValue18.Y + DataCardValue18.Height
                  - StarVisible15:
                      Control: Label@2.5.1
                      MetadataKey: FieldRequired
                      Properties:
                        Align: =Align.Center
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =DataCardKey20.Height
                        Text: ="*"
                        Visible: =And(Parent.Required, Parent.DisplayMode=DisplayMode.Edit)
                        Width: =30
                        Wrap: =false
                        Y: =DataCardKey20.Y
            - 核銷單據_DataCard1:
                Control: TypedDataCard@1.0.7
                Variant: ClassicComboBoxEdit
                IsLocked: true
                Properties:
                  BorderColor: =RGBA(0, 18, 107, 1)
                  DataField: ="OData__x6838__x92b7__x55ae__x64da_"
                  Default: =ThisItem.核銷單據
                  DisplayName: =DataSourceInfo([@請款單],DataSourceInfo.DisplayName,'OData__x6838__x92b7__x55ae__x64da_')
                  Required: =false
                  Update: =DataCardValue19.Selected
                  X: =0
                  Y: =12
                Children:
                  - DataCardKey21:
                      Control: Label@2.5.1
                      MetadataKey: FieldName
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =48
                        Text: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        Wrap: =false
                        X: =30
                        Y: =10
                  - DataCardValue19:
                      Control: Classic/ComboBox@2.4.0
                      MetadataKey: FieldValue
                      Properties:
                        BorderColor: =If(IsBlank(Parent.Error), Parent.BorderColor, Color.Red)
                        ChevronBackground: =RGBA(56, 96, 178, 1)
                        ChevronFill: =RGBA(255, 255, 255, 1)
                        ChevronHoverBackground: =ColorFade(RGBA(56, 96, 178, 1), -20%)
                        ChevronHoverFill: =RGBA(255, 255, 255, 1)
                        DefaultSelectedItems: =Parent.Default
                        DisplayMode: =Parent.DisplayMode
                        Font: =Font.'Open Sans'
                        HoverFill: =RGBA(186, 202, 226, 1)
                        Items: =Choices([@請款單].'OData__x6838__x92b7__x55ae__x64da_')
                        PaddingBottom: =5
                        PaddingLeft: =If(Self.DisplayMode = DisplayMode.Edit, 5, 0)
                        PaddingRight: =5
                        PaddingTop: =5
                        PressedColor: =RGBA(255, 255, 255, 1)
                        PressedFill: =RGBA(0, 18, 107, 1)
                        SelectMultiple: =false
                        SelectionColor: =RGBA(255, 255, 255, 1)
                        SelectionFill: =RGBA(56, 96, 178, 1)
                        Tooltip: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardKey21.Y + DataCardKey21.Height + 5
                  - ErrorMessage16:
                      Control: Label@2.5.1
                      MetadataKey: ErrorMessage
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(168, 0, 0, 1)
                        Font: =Font.'Open Sans'
                        FontWeight: =FontWeight.Semibold
                        Height: =10
                        Live: =Live.Assertive
                        PaddingBottom: =0
                        PaddingLeft: =0
                        PaddingRight: =0
                        PaddingTop: =0
                        Size: =24
                        Text: =Parent.Error
                        Visible: =Parent.DisplayMode=DisplayMode.Edit
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardValue19.Y + DataCardValue19.Height
                  - StarVisible16:
                      Control: Label@2.5.1
                      MetadataKey: FieldRequired
                      Properties:
                        Align: =Align.Center
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =DataCardKey21.Height
                        Text: ="*"
                        Visible: =And(Parent.Required, Parent.DisplayMode=DisplayMode.Edit)
                        Width: =30
                        Wrap: =false
                        Y: =DataCardKey21.Y
            - 受款人/支票抬頭_DataCard1:
                Control: TypedDataCard@1.0.7
                Variant: ClassicTextualEdit
                IsLocked: true
                Properties:
                  BorderColor: =RGBA(0, 18, 107, 1)
                  DataField: ="OData__x53d7__x6b3e__x4eba__x002f__x65"
                  Default: =ThisItem.'受款人/支票抬頭'
                  DisplayName: =DataSourceInfo([@請款單],DataSourceInfo.DisplayName,'OData__x53d7__x6b3e__x4eba__x002f__x65')
                  MaxLength: =DataSourceInfo([@請款單], DataSourceInfo.MaxLength, 'OData__x53d7__x6b3e__x4eba__x002f__x65')
                  Required: =false
                  Update: =DataCardValue20.Text
                  X: =0
                  Y: =13
                Children:
                  - DataCardKey22:
                      Control: Label@2.5.1
                      MetadataKey: FieldName
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =48
                        Text: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        Wrap: =false
                        X: =30
                        Y: =10
                  - DataCardValue20:
                      Control: Classic/TextInput@2.3.2
                      MetadataKey: FieldValue
                      Properties:
                        BorderColor: =If(IsBlank(Parent.Error), Parent.BorderColor, Color.Red)
                        Default: =Parent.Default
                        DelayOutput: =true
                        DisplayMode: =Parent.DisplayMode
                        Font: =Font.'Open Sans'
                        HoverBorderColor: =RGBA(0, 18, 107, 1)
                        HoverFill: =RGBA(186, 202, 226, 1)
                        MaxLength: =Parent.MaxLength
                        PaddingLeft: =5
                        RadiusBottomLeft: =0
                        RadiusBottomRight: =0
                        RadiusTopLeft: =0
                        RadiusTopRight: =0
                        Tooltip: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardKey22.Y + DataCardKey22.Height + 5
                  - ErrorMessage17:
                      Control: Label@2.5.1
                      MetadataKey: ErrorMessage
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(168, 0, 0, 1)
                        Font: =Font.'Open Sans'
                        FontWeight: =FontWeight.Semibold
                        Height: =10
                        Live: =Live.Assertive
                        PaddingBottom: =0
                        PaddingLeft: =0
                        PaddingRight: =0
                        PaddingTop: =0
                        Size: =24
                        Text: =Parent.Error
                        Visible: =Parent.DisplayMode=DisplayMode.Edit
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardValue20.Y + DataCardValue20.Height
                  - StarVisible17:
                      Control: Label@2.5.1
                      MetadataKey: FieldRequired
                      Properties:
                        Align: =Align.Center
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =DataCardKey22.Height
                        Text: ="*"
                        Visible: =And(Parent.Required, Parent.DisplayMode=DisplayMode.Edit)
                        Width: =30
                        Wrap: =false
                        Y: =DataCardKey22.Y
            - 預計核銷日期_DataCard1:
                Control: TypedDataCard@1.0.7
                Variant: ClassicDateTimeEdit
                IsLocked: true
                Properties:
                  BorderColor: =RGBA(0, 18, 107, 1)
                  DataField: ="OData__x9810__x8a08__x6838__x92b7__x65"
                  Default: =ThisItem.預計核銷日期
                  DisplayName: =DataSourceInfo([@請款單],DataSourceInfo.DisplayName,'OData__x9810__x8a08__x6838__x92b7__x65')
                  Required: =false
                  Update: =If(Not IsBlank(DateValue3.SelectedDate), DateTime(Year(DateValue3.SelectedDate), Month(DateValue3.SelectedDate), Day(DateValue3.SelectedDate), Value(HourValue3.Selected.Value), Value(MinuteValue3.Selected.Value), 0))
                  X: =0
                  Y: =14
                Children:
                  - DataCardKey23:
                      Control: Label@2.5.1
                      MetadataKey: FieldName
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =48
                        Text: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        Wrap: =false
                        X: =30
                        Y: =10
                  - DateValue3:
                      Control: Classic/DatePicker@2.6.0
                      MetadataKey: DateFieldValue
                      Properties:
                        BorderColor: =If(IsBlank(Parent.Error), Parent.BorderColor, Color.Red)
                        DefaultDate: =Parent.Default
                        DisplayMode: =Parent.DisplayMode
                        EndYear: =Year(Today())+100
                        Font: =Font.'Open Sans'
                        IconBackground: =RGBA(56, 96, 178, 1)
                        IconFill: =RGBA(255, 255, 255, 1)
                        IsEditable: =true
                        PaddingBottom: =0
                        PaddingLeft: =If(Self.DisplayMode = DisplayMode.Edit, 5, 0)
                        StartYear: =1899
                        Tooltip: =Parent.DisplayName
                        Width: =(Parent.Width - 60) / 2
                        X: =30
                        Y: =DataCardKey23.Y + DataCardKey23.Height + 5
                  - HourValue3:
                      Control: Classic/DropDown@2.3.1
                      MetadataKey: HourFieldValue
                      Properties:
                        BorderColor: =If(IsBlank(Parent.Error), Parent.BorderColor, Color.Red)
                        ChevronBackground: =RGBA(56, 96, 178, 1)
                        ChevronFill: =RGBA(255, 255, 255, 1)
                        ChevronHoverBackground: =ColorFade(RGBA(56, 96, 178, 1), -20%)
                        ChevronHoverFill: =RGBA(255, 255, 255, 1)
                        Default: =Text(Hour(Parent.Default),"00")
                        DisplayMode: =Parent.DisplayMode
                        Font: =Font.'Open Sans'
                        Height: =DateValue3.Height
                        HoverFill: =RGBA(186, 202, 226, 1)
                        Items: =["00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23"]
                        Items.Value: =Value
                        PaddingBottom: =5
                        PaddingLeft: =If(Self.DisplayMode = DisplayMode.Edit, 5, 0)
                        PaddingRight: =5
                        PaddingTop: =5
                        PressedColor: =RGBA(255, 255, 255, 1)
                        PressedFill: =RGBA(0, 18, 107, 1)
                        SelectionColor: =RGBA(255, 255, 255, 1)
                        SelectionFill: =RGBA(56, 96, 178, 1)
                        Tooltip: =Parent.DisplayName
                        Width: =DateValue3.Width / 2 - 10
                        X: =DateValue3.X + DateValue3.Width + 10
                        Y: =DateValue3.Y
                  - Separator4:
                      Control: Label@2.5.1
                      MetadataKey: HourMinuteSeparator
                      Properties:
                        Align: =Align.Center
                        BorderColor: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        FontWeight: =FontWeight.Bold
                        Height: =HourValue3.Height
                        PaddingBottom: =0
                        PaddingLeft: =0
                        PaddingRight: =0
                        PaddingTop: =0
                        Text: =":"
                        Width: =10
                        Wrap: =false
                        X: =HourValue3.X + HourValue3.Width
                        Y: =HourValue3.Y
                  - MinuteValue3:
                      Control: Classic/DropDown@2.3.1
                      MetadataKey: MinuteFieldValue
                      Properties:
                        BorderColor: =If(IsBlank(Parent.Error), Parent.BorderColor, Color.Red)
                        ChevronBackground: =RGBA(56, 96, 178, 1)
                        ChevronFill: =RGBA(255, 255, 255, 1)
                        ChevronHoverBackground: =ColorFade(RGBA(56, 96, 178, 1), -20%)
                        ChevronHoverFill: =RGBA(255, 255, 255, 1)
                        Default: =Text(Minute(Parent.Default),"00")
                        DisplayMode: =Parent.DisplayMode
                        Font: =Font.'Open Sans'
                        Height: =HourValue3.Height
                        HoverFill: =RGBA(186, 202, 226, 1)
                        Items: =["00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59"]
                        Items.Value: =Value
                        PaddingBottom: =5
                        PaddingLeft: =If(Self.DisplayMode = DisplayMode.Edit, 5, 0)
                        PaddingRight: =5
                        PaddingTop: =5
                        PressedColor: =RGBA(255, 255, 255, 1)
                        PressedFill: =RGBA(0, 18, 107, 1)
                        SelectionColor: =RGBA(255, 255, 255, 1)
                        SelectionFill: =RGBA(56, 96, 178, 1)
                        Tooltip: =Parent.DisplayName
                        Width: =HourValue3.Width
                        X: =HourValue3.X + HourValue3.Width + Separator4.Width
                        Y: =HourValue3.Y
                  - ErrorMessage18:
                      Control: Label@2.5.1
                      MetadataKey: ErrorMessage
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(168, 0, 0, 1)
                        Font: =Font.'Open Sans'
                        FontWeight: =FontWeight.Semibold
                        Height: =10
                        Live: =Live.Assertive
                        PaddingBottom: =0
                        PaddingLeft: =0
                        PaddingRight: =0
                        PaddingTop: =0
                        Size: =24
                        Text: =Parent.Error
                        Visible: =Parent.DisplayMode=DisplayMode.Edit
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =HourValue3.Y + HourValue3.Height
                  - StarVisible18:
                      Control: Label@2.5.1
                      MetadataKey: FieldRequired
                      Properties:
                        Align: =Align.Center
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =DataCardKey23.Height
                        Text: ="*"
                        Visible: =And(Parent.Required, Parent.DisplayMode=DisplayMode.Edit)
                        Width: =30
                        Wrap: =false
                        Y: =DataCardKey23.Y
            - 附件_DataCard1:
                Control: TypedDataCard@1.0.7
                Variant: ClassicAttachmentsEdit
                IsLocked: true
                Properties:
                  BorderColor: =RGBA(0, 18, 107, 1)
                  DataField: ="{Attachments}"
                  Default: =ThisItem.附件
                  DisplayName: =DataSourceInfo([@請款單],DataSourceInfo.DisplayName,'{Attachments}')
                  Required: =false
                  Update: =DataCardValue22.Attachments
                  X: =0
                  Y: =15
                Children:
                  - DataCardKey25:
                      Control: Label@2.5.1
                      MetadataKey: FieldName
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =48
                        Text: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        Wrap: =false
                        X: =30
                        Y: =10
                  - DataCardValue22:
                      Control: Attachments@2.3.0
                      MetadataKey: FieldValue
                      Properties:
                        BorderColor: =If(IsBlank(Parent.Error), Parent.BorderColor, Color.Red)
                        DisplayMode: =Parent.DisplayMode
                        Font: =Font.'Open Sans'
                        HoverFill: =RGBA(186, 202, 226, 1)
                        ItemColor: =RGBA(255, 255, 255, 1)
                        ItemFill: =RGBA(56, 96, 178, 1)
                        ItemHoverFill: =RGBA(186, 202, 226, 1)
                        Items: =Parent.Default
                        PaddingBottom: =5
                        PaddingLeft: =If(Self.DisplayMode = DisplayMode.Edit, 5, 0)
                        PaddingRight: =5
                        PaddingTop: =5
                        PressedColor: =RGBA(255, 255, 255, 1)
                        PressedFill: =RGBA(0, 18, 107, 1)
                        Tooltip: =Parent.DisplayName
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardKey25.Y + DataCardKey25.Height + 5
                  - ErrorMessage20:
                      Control: Label@2.5.1
                      MetadataKey: ErrorMessage
                      Properties:
                        AutoHeight: =true
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(168, 0, 0, 1)
                        Font: =Font.'Open Sans'
                        FontWeight: =FontWeight.Semibold
                        Height: =10
                        Live: =Live.Assertive
                        PaddingBottom: =0
                        PaddingLeft: =0
                        PaddingRight: =0
                        PaddingTop: =0
                        Size: =24
                        Text: =Parent.Error
                        Visible: =Parent.DisplayMode=DisplayMode.Edit
                        Width: =Parent.Width - 60
                        X: =30
                        Y: =DataCardValue22.Y + DataCardValue22.Height
                  - StarVisible20:
                      Control: Label@2.5.1
                      MetadataKey: FieldRequired
                      Properties:
                        Align: =Align.Center
                        BorderColor: =RGBA(0, 0, 0, 1)
                        Color: =RGBA(0, 18, 107, 1)
                        Font: =Font.'Open Sans'
                        Height: =DataCardKey25.Height
                        Text: ="*"
                        Visible: =And(Parent.Required, Parent.DisplayMode=DisplayMode.Edit)
                        Width: =30
                        Wrap: =false
                        Y: =DataCardKey25.Y
