<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="NaHradbachApp.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    
    <link rel="stylesheet" href="CSS/Home.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
    p {
    font-size:25px;
    margin-bottom:25px;
      margin-left: 15%;
    margin-right: 15%;
}
    #slideshow {
    margin: 50px auto;
    position: relative;
    width: 350px;
    height: 250px;
    box-shadow: 0 0 20px rgba(0,0,0,0.4);
}
    #slideshow div {
    position: absolute;
}
     #slideshow div img {
     width: 350px;
     height: 250px;
}
           
    </style>
  

</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="HomeBody" class="w3-Dance">
        <h1 class="w3-Dance">To nejlepší z Italské kuchyně</h1>

       <p class="Hometext">
             Připravujeme těstoviny, gnocchi a rizota, vynikající pizzy a saláty.
       </p>
       <p class="Hometext">
        Dále nabízíme masové a rybí speciality. Samozřejmě nechybí i domácí dezerty,
        jejichž nabídku pravidelně obměňujeme.
       </p>
       <p class="Hometext">
        Nabízíme široký výbě alkoholických a nealkoholických 
        nápojů,kvalitní italská vína a koktejly. 
       </p>
       <p class="Hometext">
        Každý den připravujeme polední menu,
        které si můžete vychutnat i na naší venkovní zahrádce.
       </p>
       <p class="Hometext">
        Čepujeme pivo Budweiser Budvar. K dezertům připravujeme značkovou kávu Coari
        caffe. 
       </p>
    

              <div id="slideshow" >
            <div>
                <img src="Images/Jídlo1.jpg" />
            </div>
            <div>
                <img src="Images/Jídlo2.jpg" />
            </div>
            <div>
                <img src="Images/Jídlo3.jpg" />
            </div>
            <div>
                <img src="Images/Jídlo4.jpg" />
            </div>
            <div>
                <img src="Images/Jídlo5.jpg" />
            </div>
        </div>
        <script src="Scripts/Slideshow.js"></script>
        <h1 class="w3-Dance">Oslavte to u nás!</h1>
        <p>
            Prostředí naší stylové restaurace je ideální pro pořádání akcí všeho druhu. Přijďte s rodinou,
        kamarády nebo kolegy. V letních měsících můžete posedět na naší venkovní zahrádce s gril barem.
        </p>
    </div>
</asp:Content>