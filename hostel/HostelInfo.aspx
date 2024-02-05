<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HostelInfo.aspx.cs" Inherits="hostel.WebForm3" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hostel Assignment</title>
    <link href="hostelinfoStyle.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            height: 30px;
        }
        .auto-style2 {
            height: 29px;
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

        button:hover {
            opacity: 0.8;
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
            

        .auto-style3 {
            width: 245px;
        }
        .auto-style4 {
            height: 29px;
            width: 245px;
        }
        .auto-style5 {
            width: 658px;
        }
        .auto-style6 {
            height: 26px;
        }
        .auto-style7 {
            width: 245px;
            height: 26px;
        }
        .auto-style9 {
            height: 30px;
            width: 627px;
        }
        .auto-style10 {
            width: 627px;
        }
        .auto-style11 {
            width: 627px;
            height: 26px;
        }
        .auto-style12 {
            height: 29px;
            width: 627px;
        }
            

    </style>
</head>
<body>
    <div class="topnav">
  <a class="active" href="login.aspx">Logout</a>
  <a href="#About">About</a>
  <a href="#contact">Contact</a>
  <div class="login-container">
      </div>
        </div>


    <form id="form1" runat="server">
        <div class="heading">
            <h1>Hostel Assignment Page<br />Welcome Username <asp:Label ID="lblusername" runat="server" Text=""></asp:Label>
                            </h1>
            </div>
           
           
            <div class="form1">
            <table class="auto-style5">
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="First Name" Font-Bold="True" ></asp:Label></td>
                    
                    <td class="auto-style10">
                        <asp:TextBox ID="fnametxt" runat="server" ReadOnly="True" CssClass="txt"></asp:TextBox></td>
                </tr>
                <tr>
                    <td></td><td class="auto-style10">

                             </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Last Name"></asp:Label></td>
                    <td class="auto-style10">
                        <asp:TextBox ID="lnametxt" runat="server" ReadOnly="True" CssClass="txt"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label1" runat="server" Text="Hostel Name"></asp:Label>
                    </td>
                    <td class="auto-style9">
                        <asp:DropDownList ID="ddlhostelname" runat="server" OnSelectedIndexChanged="ddlhostelname_SelectedIndexChanged" CssClass="txt">
                            <asp:ListItem>Kasturba</asp:ListItem>
                            <asp:ListItem>Sharada</asp:ListItem>
                            <asp:ListItem>Eagles</asp:ListItem>
                            <asp:ListItem>Naruto</asp:ListItem>
                        </asp:DropDownList>

                    </td>                       
                </tr>
                <tr>
                    <td></td><td class="auto-style10">

                             </td>
                </tr>
                <tr><td>
                    <asp:Label ID="Label4" runat="server" Text="Roll No."></asp:Label>
                    </td>
                    <td class="auto-style10">
                        <asp:TextBox ID="rollnotxt" runat="server" ReadOnly="True" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);" CssClass="txt"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td><td class="auto-style10">

                             </td>
                </tr>
                <tr><td>
                    <asp:Label ID="Label5" runat="server" Text="City"></asp:Label>
                    </td>
                    <td class="auto-style10">
                        <asp:TextBox ID="citytxt" runat="server" ReadOnly="True" CssClass="txt"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td><td class="auto-style10">

                             </td>
                </tr>
                <tr><td>
                    <asp:Label ID="Label6" runat="server" Text="Age"></asp:Label>
                    </td>
                    <td class="auto-style10">
                        <asp:TextBox ID="agetxt" runat="server" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);" CssClass="txt"></asp:TextBox></td><td class="auto-style3">
                        <asp:Label ID="lblage" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td></td><td class="auto-style10">

                             </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="Room Number"></asp:Label>
                    </td>
                    <td class="auto-style10">
                        <asp:TextBox ID="roomnotxt" runat="server" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);" CssClass="txt"></asp:TextBox></td>
                    <td class="auto-style3">
                        <asp:Label ID="lblroomno" runat="server" Text="" ForeColor="red" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td></td><td class="auto-style10">

                             </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="Start Date"></asp:Label></td>
                    <td class="auto-style10">
                        <asp:TextBox ID="datestart" runat="server" TextMode="Date" CssClass="txt" ></asp:TextBox></td>
                    <td class="auto-style3">
                        <asp:Label ID="lbldateError" runat="server" Text="" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td></td><td class="auto-style10">

                             </td>
                </tr>
                
                <tr><td></td>
                    <td class="auto-style10">
                        <asp:CheckBox ID="messcheckbox" runat="server" Text="Mess Facilities" OnCheckedChanged="messcheckbox_CheckedChanged" Checked="true"/>
                    </td>
                    </tr>
                    <tr>
                    <td class="auto-style6">
                        <asp:RadioButton ID="rbtworoom" runat="server"  Text="2 Room Sharing" GroupName="RoomSharing" OnCheckedChanged="rbtworoom_CheckedChanged" Checked="true"/></td>
                    <td class="auto-style11">
                        <asp:RadioButton ID="rbthreeroom" runat="server" Text="3 Room Sharing" GroupName="RoomSharing" /></td>
                    <td class="auto-style7">
                        <asp:Label ID="lblRadioButtonError" runat="server" Text="" ForeColor="Red"></asp:Label></td>
                   
                </tr>
                <tr><td>
                    <asp:Label ID="Label7" runat="server" Text="Monthly Fees"></asp:Label></td>
                    <td class="auto-style10">
                        <asp:TextBox ID="monthlybilltxt" runat="server" CssClass="txt"></asp:TextBox></td>
                </tr>
                <tr>
                    <td></td><td class="auto-style10">

                             </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label10" runat="server" Text="Total Bill Amount for a year"></asp:Label>

                    </td>
                    <td class="auto-style12">
                        <asp:TextBox ID="totalbilltxt" runat="server" OnTextChanged="totalbilltxt_TextChanged" ReadOnly="True" CssClass="txt"></asp:TextBox></td>
                    <td class="auto-style4">
                        <asp:Label ID="lblTotalBillError" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td></td><td class="auto-style10">

                             </td>
                </tr>
                <tr>
                    
                <td>
                        <asp:RadioButton ID="rdcard" runat="server" Text="Card" GroupName="PaymentGroup"  AutoPostBack="true" OnCheckedChanged="rdcard_CheckedChanged"/>
                    </td>
                    <td class="auto-style10">
                         <asp:RadioButton ID="rbcash" runat="server" Text="Cash" OnCheckedChanged="rbcash_CheckedChanged" GroupName="PaymentGroup"  AutoPostBack="true" Checked="True"/>
                    </td>
                    <td class="auto-style3">
                        <asp:Label ID="lblpaymentmethod" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td></td><td class="auto-style10">

                             </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblcard" runat="server" Text="Card No." Visible="False"></asp:Label></td>
                    <td class="auto-style10">
                        <asp:TextBox ID="cardnotxt" runat="server" Visible="false" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox></td>
                    
                <td class="auto-style3">
                    <asp:Label ID="lblcardnoError" runat="server" Text="" ForeColor="Red"></asp:Label>
                </td></tr>
                <tr>
                    <td></td><td class="auto-style10">

                             </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblcvv" runat="server" Text="Cvv No." Visible="False"></asp:Label></td>
                    <td class="auto-style10">
                        <asp:TextBox ID="cvvtxt" runat="server" Visible="False" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox></td>
                    <td class="auto-style3">
                        <asp:Label ID="lblErrorCardDetails" runat="server" Text="" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr><td> <asp:Button ID="btnTotal" runat="server" Text="Total Bill" OnClick="btnTotal_Click" CssClass="simpleshape1" Width="244px" /></td>
                    <td colspan="2">
                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" Width="218px" Visible="False" CssClass="simpleshape1"/>
                    </td>
                    
                </tr>
                <tr>
                    <td></td><td class="auto-style10">

                             </td>
                </tr>
                <tr>
                    <td></td>
                    <td class="auto-style10">
                        <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>
                    
                </tr>
                <tr>
                    <td></td><td class="auto-style10">

                             </td>
                </tr>
                <tr><td></td>
                    <td class="auto-style10">
                        <asp:Label ID="lblSuccessMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
                    </td>
                    </tr>
                
                
            </table>
        </div>
    </form>
    </body>
</html>
