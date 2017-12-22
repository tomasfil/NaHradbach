<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Contacts.aspx.cs" Inherits="NaHradbachApp.Contacts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    
    <link rel="stylesheet" href="Contact.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <style>
        html{
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            text-align: center;
            background-image: url(../Images/BG3.png);
        }
        p{
            font-size:20px;
        }
        
    </style>

</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div style="height: 100%; align-content:center"  class="w3-Dance">
        <div style="margin-top: 50px; margin-bottom: 50px;">
            <h2 align="center" class="w3-Dance">Adresa</h2>
            <p align="center" class="w3-Dance">Restaurace Pizzeria Na Hradbách<br>Soukenická 187<br>27401 Slaný</p>
            <h2 align="center" class="w3-Dance">Otevírací Doba</h2>
            <p align="center" class="w3-Dance">Pondělí - Čtvrek: 10:00-23:00<br>Pátek: 10:00 - 1:00<br>Neděle: 11:00 - 22:00</p>
            <h2 align="center" class="w3-Dance">Majitel</h2>
            <p align="center" class="w3-Dance">Lukáš Barbor<br>Telefon: 999 666 999<br>Email: xxxx@xxxx.xy</p>
        </div>
        <script src='https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyAw9YYcpbnO_s4a5R6tigk3Y9rBNb1LNGw'></script>
        <div align="center" style='overflow: hidden; height: 350px; width: 100%;'>
            <div align="center" id='gmap_canvas' style='height: 350px; width: 60%;'></div>
            <style>
                #gmap_canvas img {
                    max-width: none !important;
                    background: none !important
                }
            </style>
        </div>
        <a href='https://mapsiframe.com/' style="visibility: hidden;">google map in html einbinden</a>
        <script type='text/javascript' src='https://embedmaps.com/google-maps-authorization/script.js?id=45782818a67e96440dd9b05be3f4b51ded889e31'></script>
        <script type='text/javascript'>function init_map() { var myOptions = { zoom: 17, center: new google.maps.LatLng(50.23035530000001, 14.084775600000057), mapTypeId: google.maps.MapTypeId.ROADMAP }; map = new google.maps.Map(document.getElementById('gmap_canvas'), myOptions); marker = new google.maps.Marker({ map: map, position: new google.maps.LatLng(50.23035530000001, 14.084775600000057) }); infowindow = new google.maps.InfoWindow({ content: '<strong>Na Hradbách</strong><br>Soukenická 187<br>27401 Slaný<br>' }); google.maps.event.addListener(marker, 'click', function () { infowindow.open(map, marker); }); infowindow.open(map, marker); } google.maps.event.addDomListener(window, 'load', init_map);</script>
    </div>
</asp:Content>