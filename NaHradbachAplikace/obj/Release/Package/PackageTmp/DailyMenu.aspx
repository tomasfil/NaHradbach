<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DailyMenu.aspx.cs" Inherits="NaHradbachApp.DailyMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
  
    <link rel="stylesheet" href="DailyMenu.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
    html{
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        text-align: center;
        background-image: url(../Images/BG2.png);
    }
    #MainContent_foodGridView {
        margin-left: auto;
        margin-right: auto;
        margin-top: 100px;
        font-size:20px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="Panel2" runat="server" HorizontalAlign="Center" Height="600px" Width="100%">

        <asp:SqlDataSource ID="DailyDataSource"
            runat="server"
            SelectCommand="select CONVERT(VARCHAR(10), Datum, 104), Hmotnost, Popis, Cena from Poledni_menu order by Datum"
            ProviderName="System.Data.SqlClient"
            ConnectionString="<%$ ConnectionStrings:conString %>"></asp:SqlDataSource>

        <asp:GridView ID="foodGridView" runat="server" HorizontalAlign="Center" Width="75%" RowStyle-Height="100px" CellSpacing="15" BorderStyle="None" GridLines="None" DataSourceID="DailyDataSource" ShowHeader="False"></asp:GridView>
    </asp:Panel>
</asp:Content>