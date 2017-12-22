<%@ Page Title="" EnableEventValidation="false" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DiningMenu.aspx.cs" Inherits="NaHradbachApp.DiningMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
   
    <link rel="stylesheet" href="DiningMenu.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
    html{
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        text-align: center;
        background-image: url(../Images/BG4.png);
    }
    #MainContent_foodGridView {
        margin-left: auto;
        margin-right: auto;
        font-size: 20px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="Panel2" runat="server" HorizontalAlign="Center" Height="900px" Width="100%" Style="position: relative;">

        <asp:Panel ID="Panel3" runat="server" Style="position: absolute; left: 0px; top: 0px;">
            <asp:Repeater ID="kategorieRepeater" runat="server" OnItemCreated="KategorieRepeaterItemCreated">
                <ItemTemplate>

                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Kategorie") %>' Text='<%# Eval("Kategorie") %>' Width="150px"
                        Height="50px" ForeColor="Black" OnClick="kategorieButton_Click" />
                    <br />
                </ItemTemplate>
            </asp:Repeater>
        </asp:Panel>
        <asp:GridView ID="foodGridView" runat="server" HorizontalAlign="Center" Width="75%" RowStyle-Height="100px" CellSpacing="15" BorderStyle="None" GridLines="None" ShowHeader="False"></asp:GridView>
    </asp:Panel>
</asp:Content>