﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdminTools.aspx.cs" Inherits="NaHradbachApp.AdminPage.AdminTools" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server" ViewStateMode="Enabled">

    <asp:Panel ID="anonymousPanel" runat="server">
        Tato stránka je přístupná pouze pro přihlášené osoby.
    </asp:Panel>

    <asp:Panel ID="loggedInPanel" runat="server" Visible="False" Width="100%" HorizontalAlign="Center">
        <br />
        Přidání/Odebrání kategorie:<br />

        &nbsp;

        <br />
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:Panel ID="Panel2" runat="server" DefaultButton="addCategoryButton" Width="95%" HorizontalAlign="Right">
                        <asp:TextBox ID="kategorieTextBox" runat="server" placeholder="Kategorie"></asp:TextBox>
                        <asp:Button ID="addCategoryButton" runat="server" OnClick="addCategoryButton_Click" Text="Přidat" />
                    </asp:Panel>
                </td>
                <td>
                    <asp:Panel ID="Panel4" runat="server" DefaultButton="removeCategoryButton" Width="95%" HorizontalAlign="Left">
                        <asp:DropDownList ID="kategorieDropDownList" runat="server" ViewStateMode="Enabled">
                        </asp:DropDownList>
                        <asp:Button ID="removeCategoryButton" runat="server" OnClick="removeCategoryButton_Click" Text="Odebrat" />
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <br />
        &nbsp;<br />
        <asp:Panel ID="Panel3" runat="server" DefaultButton="addFoodButton">
            <asp:DropDownList ID="kategorieDropDownList2" runat="server" ViewStateMode="Enabled"></asp:DropDownList>
            <asp:TextBox ID="weightTextBox" runat="server" placeholder="Hmotnost/Počet Kusů"></asp:TextBox>
            <asp:TextBox ID="nameTextBox" runat="server" placeholder="Název"></asp:TextBox>
            <asp:TextBox ID="descriptionTextBox" runat="server" placeholder="Popis"></asp:TextBox>
            <asp:TextBox ID="priceTextBox" runat="server" placeholder="Cena"></asp:TextBox>
            <asp:Button ID="addFoodButton" runat="server" Text="Přidat pokrm" OnClick="addFoodButton_Click" />
        </asp:Panel>
        <asp:SqlDataSource ID="FoodDataSource"
            runat="server"
            SelectCommand="select * from Pokrmy order by Kategorie, Název"
            ProviderName="System.Data.SqlClient"
            ConnectionString="<%$ ConnectionStrings:conString %>"
            UpdateCommand="UPDATE Pokrmy Set [Kategorie]=@Kategorie, [Hmotnost]=@Hmotnost, [Název]=@Název, [Popis]=@Popis, [Cena]=@Cena where [id]=@id"
            DeleteCommand="DELETE FROM Pokrmy WHERE [id]=@id"></asp:SqlDataSource>
        <br />

        <asp:GridView ID="foodGridView"
            runat="server"
            DataSourceID="FoodDataSource"
            AutoGenerateDeleteButton="True"
            AutoGenerateEditButton="True"
            HorizontalAlign="Center"
            DataKeyNames="id">
        </asp:GridView>

        <br />
        Polední Menu:<br />

        <br />

        <br />
        <asp:Panel ID="Panel6" runat="server" DefaultButton="addDailyFoodButton" HorizontalAlign="Center" Style="align-content: center;">
            <asp:Calendar Style="align-self: center; display: inline-block;" ID="dailyCalendar" runat="server"></asp:Calendar>
            <asp:TextBox ID="dailyWeightTextBox" runat="server" placeholder="Hmotnost/Počet Kusů"></asp:TextBox>
            <asp:TextBox ID="dailyDescriptionTextBox" runat="server" placeholder="Popis"></asp:TextBox>
            <asp:TextBox ID="dailyPriceTextBox" runat="server" placeholder="Cena"></asp:TextBox>
            <asp:Button ID="addDailyFoodButton" runat="server" Text="Přidat pokrm" OnClick="addDailyFoodButton_Click" />
        </asp:Panel>
        <asp:SqlDataSource ID="DailyDataSource"
            runat="server"
            SelectCommand="select id, CONVERT(VARCHAR(10), Datum, 104), Hmotnost, Popis, Cena from Poledni_menu order by Datum"
            ProviderName="System.Data.SqlClient"
            ConnectionString="<%$ ConnectionStrings:conString %>"
            UpdateCommand="UPDATE Poledni_menu Set [Datum]=@Column1, [Hmotnost]=@Hmotnost, [Popis]=@Popis, [Cena]=@Cena where [id]=@id"
            DeleteCommand="DELETE FROM Poledni_menu WHERE [id]=@id"></asp:SqlDataSource>
        <br />

        <asp:GridView ID="DailyFoodGridView"
            runat="server"
            DataSourceID="DailyDataSource"
            AutoGenerateDeleteButton="True"
            AutoGenerateEditButton="True"
            HorizontalAlign="Center"
            DataKeyNames="id">
        </asp:GridView>
        <br />
        <br />
        <br />
    </asp:Panel>
</asp:Content>