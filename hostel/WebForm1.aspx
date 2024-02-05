<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="hostel.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>
    <link href="StyleReg.css" rel="stylesheet" />
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #8EC5FC;
    background-image: linear-gradient(62deg, #8EC5FC 0%, #E0C3FC 100%);
        }
        txt {
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
h1 {
            color: #D0F8FF;
            text-shadow: 0 0 5px #A5F1FF, 0 0 10px #A5F1FF, 0 0 20px #A5F1FF, 0 0 30px #A5F1FF, 0 0 40px #A5F1FF;
        
}
   
    </style>
</head>
<body>
    <div class="topnav">
  <a class="active" href="login.aspx">Login</a>
  <a href="#About">About</a>
  <a href="#contact">Contact</a>
  <div class="login-container">
      </div>
        </div>
    <div>
    <h1 class="registration">Registration</h1>
     </div>
    <form id="form1" runat="server">
        <div>
            <asp:HiddenField ID="hfuserID" runat="server" />
             <table>
                
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="First Name"></asp:Label>
                         
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="fnametxt" runat="server"></asp:TextBox>
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
                        <asp:TextBox ID="lnametxt" runat="server"></asp:TextBox>
                        <asp:Label ID="lbllname" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td></td><td>

                             </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Gender"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:DropDownList ID="ddlgender" runat="server">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="lblddlgender" runat="server" Text="" ForeColor="Red"></asp:Label>
                        </td>
                </tr>
                 <tr>
                    <td></td><td>

                             </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="city"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="citytxt" runat="server"></asp:TextBox>
                        <asp:Label ID="lblcity" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>
                </tr> 
                 <tr>
                    <td></td><td>

                             </td>
                </tr>
                 <tr>
                 <td>
                        <asp:Label ID="Label8" runat="server" Text="Pincode" ></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="pincodetxt" runat="server" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox>
                        <asp:Label ID="lblpincode" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>
                </tr> 
                 <tr>
                    <td></td><td>

                             </td>
                </tr>
                <tr><td colspan="3">
                    <hr />
                    </td></tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Username/Email"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="unametxt" runat="server"  ></asp:TextBox><asp:Label ID="lblerroruname" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        <asp:Label ID="lbluname" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                
                 <tr>
                    <td></td><td>

                             </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Password"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="pswdtxt" runat="server" TextMode="Password"></asp:TextBox><asp:Label ID="lblerrorpswd" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        <asp:Label ID="lblpswd" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td></td><td>

                             </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Confirm Password"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="cpswdtxt" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:Label ID="lblcpwsd" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td></td><td>

                             </td>
                </tr>
                <tr>
                    <td class="auto-style1"></td>
                    <td colspan="2" class="auto-style1">
                        <br />
                        <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" CssClass="simpleshape1"/>
                    </td>
                </tr>
                 <tr>
                    <td></td><td>

                             </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">
                        <asp:Label ID="lblSuccessMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
                    </td>
                </tr>
                
                <tr>
                    <td></td>
                    <td colspan="2">
                        <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                     
            </table>
            
        </div>
    </form>
</body>
</html>
