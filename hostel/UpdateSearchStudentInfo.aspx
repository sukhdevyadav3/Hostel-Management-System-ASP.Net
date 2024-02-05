<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateSearchStudentInfo.aspx.cs" Inherits="hostel.UpdateSearchStudentInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>UpdateDeletePage</title>
    <link href="UpdateDeleteStyleSheet.css" rel="stylesheet" />
    <style>
         body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #8EC5FC;
    background-image: linear-gradient(62deg, #8EC5FC 0%, #E0C3FC 100%);
        }
                
         .txt {
            border: 1px solid #e5e5e5;
            padding: 4px;
            color: #333333;
            font-size: 14px;
            background-color: #ffffff;
        } 
            .txt:hover {
                border-color: #56aff1;
                background-color: #fff4d8;
            }
             .simpleshape1
{
    color: #fff;
    background-color:#2ecc71;
    padding:10px;
    border:none 0px transparent;
    font-size: 25px;
    font-weight: lighter;
    border-radius: 2px 16px 16px 16px;
    -moz-border-radius: 2px 16px 16px 16px;
    border-radius:  2px 16px 16px 16px;
}
        .simpleshape1:hover
{
    background-color: #e74c3c;
    border:solid 1px #fff;
}

.simpleshape1:focus
{
    color: #383838;
    background-color: #fff;
    border:solid 3px rgba(98,176,255,0.3);
}
        .auto-style1 {
            width: 268435488px;
        }
        .auto-style2 {
            width: 538px;
        }
        h1 {
            color: #D0F8FF;
            text-shadow: 0 0 5px #A5F1FF, 0 0 10px #A5F1FF, 0 0 20px #A5F1FF, 0 0 30px #A5F1FF, 0 0 40px #A5F1FF;
        
}
        .auto-style3 {
            width: 139px;
        }
    </style>

</head>
<body>
    <div class="topnav">
  <a class="active" href="login.aspx">Logout</a>
  <a href="ReportPage.aspx">Report</a>
  <div class="login-container">
      </div>
        </div>
    <div class="UpdateDeleteContent">
        <h1><b>Update Delete Student Info Page</b></h1>
    </div>
    <form id="form1" runat="server">
        <div class="UpdateDeleteContent">
            <table class="auto-style2">
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Roll No."></asp:Label></td>
                <td colspan="2">
                    <asp:TextBox ID="rollnotxt" runat="server" CssClass="txt" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox></td>
            </tr>
                <tr>
                    <td></td><td>

                             </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="First Name"></asp:Label>
                         
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="fnametxt" runat="server" CssClass="txt"></asp:TextBox>
                        </td>
                    <td class="auto-style1">
                        <asp:Label ID="lblfname" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>
                    
                </tr>
                <tr>
                    <td></td><td>

                             </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Last Name"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="lnametxt" runat="server" CssClass="txt"></asp:TextBox>
                        </td>
                    <td class="auto-style1">
                        <asp:Label ID="lbllname" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td></td><td>

                             </td>
                </tr>
            <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Age"></asp:Label></td>
            <td colspan="2">
                <asp:TextBox ID="agetxt" runat="server" CssClass="txt" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox></td>
                </tr>
                <tr>
                    <td></td><td>

                             </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Room No."></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="roomnotxt" runat="server" CssClass="txt" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox>
                        </td>
                    <td class="auto-style1">
                        <asp:Label ID="lblroomnoError" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td></td><td>

                             </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Mess Facility"></asp:Label></td>
                    <td colspan="2">
                        <asp:TextBox ID="messfacilitytxt" runat="server" CssClass="txt"></asp:TextBox></td>
                </tr>
                <tr>
                    <td></td><td>

                             </td>
                </tr>
                 <tr>
                 <td>
                        <asp:Label ID="Label8" runat="server" Text="Hostel Name"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="hostelnametxt" runat="server" CssClass="txt"></asp:TextBox>
                        </td>
                    <td class="auto-style1">
                        <asp:Label ID="lblhostelnameError" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>
                </tr> 
                <tr>
                    <td></td><td>

                             </td>
                </tr>
            <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Room Type"></asp:Label>
                         
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="roomtypetxt" runat="server" CssClass="txt"></asp:TextBox>
                        </td>
                    <td class="auto-style1">
                        <asp:Label ID="lblroomtypeError" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>
                    
                </tr>
                <tr>
                    <td></td><td>

                             </td>
                </tr>
            <tr><td colspan="2">
                <asp:Button ID="btnsearch" runat="server" Text="Search" OnClick="btnsearch_Click" CssClass="simpleshape1"/></td>
                <td class="auto-style3">
                    <asp:Button ID="btnupdate" runat="server" Text="Update" OnClick="btnupdate_Click" Visible="false" CssClass="simpleshape1" /></td>
                <td class="auto-style1">
                    <asp:Button ID="btndelete" runat="server" Text="Delete" OnClick="btndelete_Click"  CssClass="simpleshape1" Visible="false"/></td>
               
            </tr>
                <tr>
                    <td></td><td>

                             </td>
                </tr>
            <tr>
                
                <td colspan="2">
                <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label></td></tr>
                <tr>
                    <td>
                        <asp:Label ID="lblSuccessMessage" runat="server" Text="" ForeColor="Green"></asp:Label></td>
                </tr>
                <tr>
                    <td></td><td>

                             </td>
                </tr>
            </table>
            </div>
        <div class="UpdateDeleteContent">
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
