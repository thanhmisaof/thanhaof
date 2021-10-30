<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Maste_Admin.Master" AutoEventWireup="true" CodeBehind="QLTheLoai.aspx.cs" Inherits="WebMusic.admin.QLTheLoai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class='menu'>
<ul>
<li><a href='QLTheLoai.aspx?Theloai=Xem'>Xem Thể Loại</a></li>
<li><a href='QLTheLoai.aspx?Theloai=Sua'>Sửa Thể Loại</a></li>
<li><a href='QLTheLoai.aspx?Theloai=Them'>Thêm Thể Loại</a></li>
</ul>
</div>
<div>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server"><p> Nhập vào số Mã Thể Loại cần xóa :
            <asp:TextBox ID="txt_xoa_theloai" runat="server" Width="170px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button 
                ID="btn_xoa_theloai" runat="server" Text="Xóa" 
                onclick="btn_xoa_theloai_Click" BackColor="#FF3300" ForeColor="White" Width="109px"  /></p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                CellPadding="3" CellSpacing="2" DataKeyNames="MaTL" 
                DataSourceID="SqlTheLoai" Width="63%">
                <Columns>
                    <asp:BoundField DataField="MaTL" HeaderText="Mã Thể Loại" InsertVisible="False" 
                        ReadOnly="True" SortExpression="MaTL" />
                    <asp:BoundField DataField="TenTL" HeaderText="Tên Thể Loại" 
                        SortExpression="TenTL" />
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
            <asp:SqlDataSource ID="SqlTheLoai" runat="server" ConnectionString="<%$ ConnectionStrings:QLMUSICConnectionString %>" SelectCommand="SELECT [MaTL], [TenTL] FROM [THELOAI]"></asp:SqlDataSource>
        </asp:View>
        <asp:View ID="View2" runat="server">
        <p> Nhập vào số Mã Thể Loại cần Tìm&nbsp;
            <asp:TextBox ID="txt_matim_theloai" runat="server" Width="163px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_tim_theloai" runat="server" Text="Tìm" onclick="btn_tim_theloai_Click" BackColor="#FF3300" Font-Bold="True" ForeColor="White" Width="77px"/></p>
        <table border="0" style="width: 50%">
                    <tr>
                        <td class="__left" style="height: 26px; text-align: left; width: 98px;">
                            Tên Thể Loại :</td>
                        <td style="text-align: left; height: 26px; width: 14px;">
                            <asp:TextBox ID="txt_tentheloai" runat="server" style="margin-left: 0px" Width="164px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 36px; text-align: left; margin-left: 120px;">

                            <asp:Button ID="btn_Update_theloai" runat="server" BackColor="#FF3300" Font-Bold="True" ForeColor="White" Text="Cập Nhật" OnClick="btn_Update_theloai_Click1" />
                        </td>
                    </tr>
                </table>
        </asp:View>
        <asp:View ID="View3" runat="server">
        <table border="0" style="width: 80%">
                    <tr>
                        <td class="__left" style="height: 26px; text-align: left; width: 275px;">
                            Mã Thể Loại Cần Thêm</td>
                        <td style="text-align: left; height: 26px;">
                            <asp:TextBox ID="txt_matheloai" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 26px; text-align: left; width: 275px;" class="__left">
                            Tên Thể Loại
                        </td>
                        <td style="text-align: left; height: 26px;">
                            <asp:TextBox ID="txt_TenTL" runat="server"></asp:TextBox>
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
