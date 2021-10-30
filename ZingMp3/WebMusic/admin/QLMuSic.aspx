<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Maste_Admin.Master" AutoEventWireup="true" CodeBehind="QLMuSic.aspx.cs" Inherits="WebMusic.admin.QLMuSic" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <ul class="nav nav-tabs mt-3 mb-2">
            <li>
                 <a class="nav-link "  href='QLMusic.aspx?MS=Xem'> Xem </a>
                    <a class="nav-link" href='QLMusic.aspx?MS=Sua'>Sửa</a>
                    <a class="nav-link" href='QLMusic.aspx?MS=Them'>Thêm</a> &nbsp;
            </li> 
    </ul>
<div>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server"><p> Nhập mã bài hát cần xóa : <asp:TextBox ID="txt_xoa" runat="server" Width="253px"></asp:TextBox>
            
            <asp:Button ID="btn_xoa" runat="server" Text="Xóa" onclick="btn_xoa_Click" Width="95px" BackColor="Red" ForeColor="White" Height="29px" /></p>
                          
            <asp:GridView ID="grvMusic" runat="server" AutoGenerateColumns="False" DataKeyNames="MaBH" DataSourceID="SqlMusic" Width="1264px" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="335px" CellSpacing="2">
        <Columns>
            <asp:BoundField DataField="MaBH" HeaderText="Mã Bài Hát" ReadOnly="True" SortExpression="MaBH" />
            <asp:BoundField DataField="URLBaiHat" HeaderText="URL Bài Hát" SortExpression="URLBaiHat" />
            <asp:BoundField DataField="TenBh" HeaderText="Tên Bài Hát" SortExpression="TenBh" />
            <asp:BoundField DataField="CaSi" HeaderText="Ca Sĩ" SortExpression="CaSi" />
            <asp:BoundField DataField="MaCaSi" HeaderText="Mã Ca Sĩ" SortExpression="MaCaSi" />
            <asp:BoundField DataField="Image" HeaderText="Ảnh" SortExpression="Image" />
            <asp:BoundField DataField="Matheloai" HeaderText="Mã Thể Loại" SortExpression="Matheloai" />
            <asp:BoundField DataField="NoiDung" HeaderText="Nội Dung" SortExpression="NoiDung" />
        </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle ForeColor="#8C4510" BackColor="#FFF7E7" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlMusic" runat="server" ConnectionString="<%$ ConnectionStrings:QLMUSICConnectionString %>" OnSelecting="SqlMusic_Selecting" SelectCommand="SELECT [MaBH], [URLBaiHat], [TenBh], [CaSi], [Image], [MaCaSi], [Matheloai], [NoiDung] FROM [BAIHAT]"></asp:SqlDataSource>
        </asp:View>
        <asp:View ID="View2" runat="server"><p> Nhập mã bài hát cần tìm : <asp:TextBox ID="txtTim" runat="server" Width="254px"></asp:TextBox>
             <asp:Button ID="btn_Tim" runat="server" Text="Tìm" onclick="btn_Tim_Click" Width="102px" BackColor="#FF3300" ForeColor="White" /></p>
            <table>
            <tr>
                        <td class="__left" style="height: 28px; text-align: left; background-color: #006699; color: #FFFFFF; font-style: normal; font-weight: bold;">
                            Tên Bài Hát </td>
                        <td style="text-align: left; height: 26px;">
                            <asp:TextBox ID="txt_tenbaihat" runat="server" Height="25px" Width="516px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="__left" style="text-align: left; height: 28px; background-color: #006699; color: #FFFFFF; font-style: normal; font-weight: bold;">
                            URL Bài Hát </td>
                        <td style="text-align: left">
                            <asp:TextBox ID="txt_linkurl" runat="server" Width="516px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="__left" style="height: 28px; text-align: left; background-color: #006699; color: #FFFFFF; font-style: normal; font-weight: bold;">
                            &nbsp;Mã Ca Sĩ </td>
                        <td style="text-align: left; height: 28px;">
                            <asp:TextBox ID="txt_casi" runat="server" Width="516px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="__left" style="height: 28px; text-align: left; background-color: #006699; color: #FFFFFF; font-style: normal; font-weight: bold;">
                            Ma Thể Loai </td>
                        <td style="text-align: left; height: 28px;">
                            <asp:TextBox ID="txt_matheloai" runat="server" Width="516px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="__left" style="height: 28px; text-align: left; background-color: #006699; color: #FFFFFF; font-style: normal; font-weight: bold;">
                            Ca Sĩ </td>
                        <td style="text-align: left; height: 28px;">
                            <asp:TextBox ID="txt_tencasi" runat="server" Width="516px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="__left" style="height: 28px; text-align: left; background-color: #006699; color: #FFFFFF; font-style: normal; font-weight: bold;">
                            Nội Dung </td>
                        <td style="text-align: left; height: 28px;">
                            <asp:TextBox ID="txt_noidung" runat="server" Height="67px" Width="516px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="__left" style="text-align: left; height: 28px; background-color: #006699; color: #FFFFFF; font-style: normal; font-weight: bold;">
                            Image&nbsp;</td>
                        <td style="text-align: left">
                             <asp:FileUpload ID="FileUp_hinh" runat="server" Width="522px" />
                           
                        </td>
                        
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 36px; text-align: center;">
                            <asp:Button ID="btn_Update" runat="server" Text="Cập Nhật" 
                                onclick="btn_Update_Click" Width="184px" BackColor="#FF3300" ForeColor="White"/>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                </table>
               </asp:View>

         <asp:View ID="View3" runat="server"><p> &nbsp;</p>
            <table>

                <tr>
                        <td class="__left" style="height: 28px; text-align: left; background-color: #006699; color: #FFFFFF; font-style: normal; font-weight: bold;">
                            Tên Bài Hát :</td>
                        <td style="text-align: left; height: 26px;">
                            <asp:TextBox ID="txtTenbh" runat="server" Height="25px" Width="516px"></asp:TextBox>
                        </td>
                    </tr>
            <tr>
                        <td class="__left" style="height: 28px; text-align: left; background-color: #006699; color: #FFFFFF; font-style: normal; font-weight: bold;">
                            Mã Bài Hát :</td>
                        <td style="text-align: left; height: 26px;">
                            <asp:TextBox ID="txtMabh" runat="server" Height="25px" Width="516px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="__left" style="text-align: left; height: 28px; background-color: #006699; color: #FFFFFF; font-style: normal; font-weight: bold;">
                            URL Bài Hát :</td>
                        <td style="text-align: left">
                            <asp:TextBox ID="txtUrl" runat="server" Width="516px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="__left" style="height: 28px; text-align: left; background-color: #006699; color: #FFFFFF; font-style: normal; font-weight: bold;">
                            &nbsp;Mã Ca Sĩ :</td>
                        <td style="text-align: left; height: 28px;">
                            <asp:TextBox ID="txtMacasi" runat="server" Width="516px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="__left" style="height: 28px; text-align: left; background-color: #006699; color: #FFFFFF; font-style: normal; font-weight: bold;">
                            Mã Thể Loai :</td>
                        <td style="text-align: left; height: 28px;">
                            <asp:TextBox ID="txtTheloai" runat="server" Width="516px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="__left" style="height: 28px; text-align: left; background-color: #006699; color: #FFFFFF; font-style: normal; font-weight: bold;">
                            Ca Sĩ :</td>
                        <td style="text-align: left; height: 28px;">
                            <asp:TextBox ID="txtCasi" runat="server" Width="516px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="__left" style="height: 28px; text-align: left; background-color: #006699; color: #FFFFFF; font-style: normal; font-weight: bold;">
                            Nội Dung :</td>
                        <td style="text-align: left; height: 28px;">
                            <asp:TextBox ID="txtNoidung" runat="server" Height="67px" Width="516px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="__left" style="text-align: left; height: 28px; background-color: #006699; color: #FFFFFF; font-style: normal; font-weight: bold;">
                            Image     :</td>
                        <td style="text-align: left">
                            <asp:FileUpload ID="FileUp_image" runat="server" Width="522px" />
                            
                        </td>
                         
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 36px; text-align: center;">
                            <asp:Button ID="btn_Them" runat="server" Text="Thêm" 
                                onclick="btn_Them_Click" Width="184px" BackColor="#FF3300"/>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                </table>
               </asp:View>
         </asp:MultiView>
     </div>
    
</asp:Content>


