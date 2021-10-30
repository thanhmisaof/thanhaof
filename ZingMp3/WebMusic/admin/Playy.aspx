<%@ Page Title="NhacCuaTUi" Language="C#" MasterPageFile="~/admin/Maste_Admin.Master" AutoEventWireup="true" CodeFile="Playy.aspx.cs" Inherits="WebMusic.admin.Playy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Playy" runat="server" ></div>
        <asp:DataList ID="Music__" runat="server" Width="100%" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SQLMUSIC" GridLines="Both" OnSelectedIndexChanged="Music___SelectedIndexChanged" DataKeyField="MaBH">
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <ItemStyle BackColor="White" ForeColor="#003399" />
        <ItemTemplate>
         
            TenBh:
            <asp:Label ID="TenBhLabel" runat="server" Text='<%# Eval("TenBh") %>' />
            <br />
            CaSi:
            <asp:Label ID="CaSiLabel" runat="server" Text='<%# Eval("CaSi") %>' />
            <br />
            Image:
            <asp:Label ID="ImageLabel" runat="server" Text='<%# Eval("Image") %>' />
            <br />
            URLBaiHat:
            <asp:Label ID="URLBaiHatLabel" runat="server" Text='<%# Eval("URLBaiHat") %>' />
            <br />
           
            MaBH:
            <asp:Label ID="MaBHLabel" runat="server" Text='<%# Eval("MaBH","~/admin/Playy.aspx?M={0}") %>' />
            
            <br />
            <br />
        </ItemTemplate>
            <SelectedItemStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
    </asp:DataList>

<asp:SqlDataSource ID="SQLMUSIC" runat="server" ConnectionString="<%$ ConnectionStrings:QLMUSICConnectionString %>" SelectCommand="SELECT [TenBh], [CaSi], [Image], [URLBaiHat], [MaBH] FROM [BAIHAT]"></asp:SqlDataSource>

</asp:Content>
