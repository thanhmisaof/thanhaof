<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Maste_Admin.Master" AutoEventWireup="true" CodeBehind="QLCASI.aspx.cs" Inherits="WebMusic.admin.QLCASI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class='menu'>
<ul>
<li><a href='QLCASI.aspx?Casi=Xem' >Xem Ca Sĩ</a></li>
<li><a href='QLCASI.aspx?Casi=Sua' >Sửa Ca Sĩ</a></li>
<li><a href='QLCASI.aspx?Casi=Them' >Thêm Ca Sĩ</a></li>
</ul>
</div>
<div>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server"><p> Nhập vào số Mã Ca Sĩ cần xóa :
            <asp:TextBox ID="txt_xoa_casi" runat="server" Width="170px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button 
                ID="btn_casi_theloai" runat="server" Text="Xóa" 
                onclick="btn_xoa_casi_Click" BackColor="#FF3300" ForeColor="White" Width="109px"  /></p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                CellPadding="3" CellSpacing="2" DataKeyNames="MaCS" 
                DataSourceID="SQLSinger" Width="63%">
                <Columns>
                    <asp:BoundField DataField="MaCS" HeaderText="Mã Ca Sĩ" 
                        ReadOnly="True" SortExpression="MaCS" />
                    <asp:BoundField DataField="TenCS" HeaderText="Tên Ca Sĩ" 
                        SortExpression="TenCS" />
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>
            <asp:SqlDataSource ID="SQLSinger" runat="server" ConnectionString="<%$ ConnectionStrings:QLMUSICConnectionString %>" SelectCommand="SELECT [MaCS], [TenCS] FROM [CASI]"></asp:SqlDataSource>
        </asp:View>
        <asp:View ID="View2" runat="server">
        <p> Nhập vào số Mã Ca Sĩ cần Tìm&nbsp;
            <asp:TextBox ID="txt_matim_casi" runat="server" Width="225px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_tim_casi" runat="server" Text="Tìm" onclick="btn_tim_casi_Click" BackColor="#FF3300" Font-Bold="True" ForeColor="White" Width="77px"/></p>
        <table border="0" style="width: 56%">
                    <tr>
                        <td class="__left" style="height: 26px; text-align: left; width: 98px;">
                            Tên Ca Sĩ :</td>
                        <td style="text-align: left; height: 26px; width: 14px;">
                            <asp:TextBox ID="txt_tencasi" runat="server" style="margin-left: 0px" Width="227px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 36px; text-align: left; margin-left: 120px;">

                            <asp:Button ID="btn_Update" runat="server" BackColor="#FF3300" Font-Bold="True" ForeColor="White" Text="CẬP NHẬT" OnClick="btn_Update_Click" />
                        </td>
                    </tr>
                </table>
        </asp:View>
        <asp:View ID="View3" runat="server">
        <table border="0" style="width: 80%">
                    <tr>
                        <td class="__left" style="height: 26px; text-align: left; width: 275px;">
                            Mã Ca Sĩ Cần Thêm</td>
                        <td style="text-align: left; height: 26px; width: 1067px;">
                            <asp:TextBox ID="txt_macasi" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 26px; text-align: left; width: 275px;" class="__left">
                            Tên Ca Sĩ
                        </td>
                        <td style="text-align: left; height: 26px; width: 1067px;">
                            <asp:TextBox ID="txt_TenCS" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 36px; text-align: center;">
                            <asp:Button ID="btn_them" runat="server" BackColor="#FF3300" Font-Bold="True" ForeColor="White" OnClick="btn_them_Click" Text="THÊM" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                    </tr>
                </table>         
            <br />
        </asp:View>
    </asp:MultiView>
</div>
</asp:Content>
