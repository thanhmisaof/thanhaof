<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Play.aspx.cs" Inherits="WebMusic.Play" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <asp:DataList ID="Music__" runat="server" Width="100%">
        <ItemTemplate>
        <div class="Music___">
                <asp:HyperLink ID="cl2" runat="server" 
                    NavigateUrl='<%# Eval("MaBaiHat","~/Play.aspx?M={0}") %>' 
                    Text='<%# Eval("TenBaiHat") %>'></asp:HyperLink>
                
                
                </div>
        </ItemTemplate>
    </asp:DataList>


</asp:Content>
