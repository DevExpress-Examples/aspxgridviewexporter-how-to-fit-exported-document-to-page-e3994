<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>


 

 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
 <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head id="Head1" runat="server">
    <title>Custom Export Sample</title>
</head>
<body>
    <form id="Form1" runat="server">

    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
        SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]">
    </asp:AccessDataSource>
    <dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="ASPxButton1_Click" 
        Text="Export to PDF">
    </dx:ASPxButton>
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" 
        GridViewID="ASPxGridView1">
    </dx:ASPxGridViewExporter>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1"
        KeyFieldName="CategoryID" OnCustomSummaryCalculate="ASPxGridView1_CustomSummaryCalculate"
        OnHtmlFooterCellPrepared="ASPxGridView1_HtmlFooterCellPrepared">
        <Columns>
                    <dx:GridViewDataTextColumn FieldName="CategoryID"  />
                    <dx:GridViewDataTextColumn FieldName="CategoryName" />
                      <dx:GridViewDataTextColumn FieldName="Description" />
                    <dx:GridViewDataTextColumn FieldName="CategoryName" />
                      <dx:GridViewDataTextColumn FieldName="CategoryID" />
                    <dx:GridViewDataTextColumn FieldName="CategoryName" />
                      <dx:GridViewDataTextColumn FieldName="Description"/>
                    <dx:GridViewDataTextColumn FieldName="CategoryName" />
                    <dx:GridViewDataTextColumn FieldName="Description" />
                    <dx:GridViewDataTextColumn FieldName="CategoryName"/>
                      <dx:GridViewDataTextColumn FieldName="CategoryID"/>
                </columns>
    </dx:ASPxGridView>
        </form>
</body>
</html>
