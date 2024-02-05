<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="hostel.Student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="PayementStyleCSS.css" rel="stylesheet" />
    <style>
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
h1 {
            color: #D0F8FF;
            text-shadow: 0 0 5px #A5F1FF, 0 0 10px #A5F1FF, 0 0 20px #A5F1FF, 0 0 30px #A5F1FF, 0 0 40px #A5F1FF;
        
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
   
        .auto-style1 {
            width: 281px;
        }
        .auto-style2 {
            width: 176px;
        }
        .auto-style3 {
            width: 565px;
        }
   
    </style>
</head>
<body>
     <div class="topnav">
  <a class="active" href="login.aspx">Logout</a>
  <a href="#">About</a>
  <a href="#">Contact</a>
  <div class="login-container">
      </div>
        </div>
    <div class="StudentDetails">
        <h1>Payment Page
            <br />
            Welcome <asp:Label ID="lblname" runat="server" Text=""></asp:Label>
        </h1></div>
    <form id="form1" runat="server">
        <div class="StudentDetails">
            <table class="auto-style3">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Roll No."></asp:Label></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="rollnotxt" runat="server" ReadOnly="true" CssClass="txt"></asp:TextBox></td>
                   </tr>
                <tr>
                    <td></td><td class="auto-style2">

                             </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="nametxt" runat="server" ReadOnly="true" CssClass="txt"></asp:TextBox></td>
                   </tr>
                <tr>
                    <td></td><td class="auto-style2">

                             </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Room No"></asp:Label></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="roomnotxt" runat="server" ReadOnly="true" CssClass="txt"></asp:TextBox></td>
                   </tr>
                <tr>
                    <td></td><td class="auto-style2">

                             </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Age"></asp:Label></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="agetxt" runat="server" ReadOnly="true" CssClass="txt"></asp:TextBox></td>
                   </tr>
                <tr>
                    <td></td><td class="auto-style2">

                             </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Hostel Name"></asp:Label></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="hostelnametxt" runat="server" ReadOnly="true" CssClass="txt"></asp:TextBox></td>
                   </tr>
                <tr>
                    <td></td><td class="auto-style2">

                             </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Payment Due"></asp:Label></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="totalfeetxt" runat="server" ReadOnly="true" CssClass="txt"></asp:TextBox>
                    </td>
                    </tr>
                <tr>
                    <td></td><td class="auto-style2">

                             </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Payment Amount"></asp:Label></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="paymentamounttxt" runat="server" ReadOnly="true" CssClass="txt"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    
                <td>
                        <asp:RadioButton ID="rdcard" runat="server" Text="Card" GroupName="PaymentGroup"  AutoPostBack="true" OnCheckedChanged="rdcard_CheckedChanged"/>
                    </td>
                    <td class="auto-style2">
                         <asp:RadioButton ID="rbcash" runat="server" Text="Cash" OnCheckedChanged="rbcash_CheckedChanged" GroupName="PaymentGroup"  AutoPostBack="true" Checked="True"/>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="lblpaymentmethod" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td></td><td class="auto-style2">

                             </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="lblcard" runat="server" Text="Card No." Visible="False"></asp:Label></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="cardnotxt" runat="server" Visible="false" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox></td>
                    
                <td class="auto-style1">
                    <asp:Label ID="lblcardnoError" runat="server" Text="" ForeColor="Red"></asp:Label>
                </td></tr>
                <tr>
                    <td></td><td class="auto-style2">

                             </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblcvv" runat="server" Text="Cvv No." Visible="False"></asp:Label></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="cvvtxt" runat="server" Visible="False" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox></td>
                    <td class="auto-style1">
                        <asp:Label ID="lblErrorCardDetails" runat="server" Text="" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                   
                    <td>
                        <asp:Button ID="btnsearch" runat="server" Text="Search" OnClick="btnsearch_Click" Height="54px" Width="123px" CssClass="simpleshape1" Visible="False"/></td>
                
                    <td class="auto-style2">
                    <asp:Button ID="btnpayment" runat="server" Text="Payment" OnClick="btnpayment_Click" Height="60px" Width="116px" CssClass="simpleshape1"/>
                        <br />
                 </td>
                    </tr>
                <tr>
                    <td></td><td class="auto-style2">

                             </td>
                </tr>

                <tr><td></td>
                    <td class="auto-style2">
                        <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label></td>

                </tr>
                <tr>
                    <td></td><td class="auto-style2">

                             </td>
                </tr>
                
            </table>
        </div>
        <div class="StudentDetails">
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
