<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportPage.aspx.cs" Inherits="hostel.ReportPage" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .topnav {
    overflow: hidden;
    background-color: #e9e9e9;
}

    .topnav a {
        float: left;
        display: block;
        color: black;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
        font-size: 17px;
    }

        .topnav a:hover {
            background-color: #ddd;
            color: black;
        }

        .topnav a.active {
            background-color: #2196F3;
            color: white;
        }

    .topnav .login-container {
        float: right;
    }

    .topnav input[type=text] {
        padding: 6px;
        margin-top: 8px;
        font-size: 17px;
        border: none;
        width: 120px;
    }

    .topnav .login-container button {
        float: right;
        padding: 6px 10px;
        margin-top: 8px;
        margin-right: 16px;
        background-color: #555;
        color: white;
        font-size: 17px;
        border: none;
        cursor: pointer;
    }

        .topnav .login-container button:hover {
            background-color: green;
        }

@media screen and (max-width: 600px) {
    .topnav .login-container {
        float: none;
    }

        .topnav a, .topnav input[type=text], .topnav .login-container button {
            float: none;
            display: block;
            text-align: left;
            width: 100%;
            margin: 0;
            padding: 14px;
        }

    .topnav input[type=text] {
        border: 1px solid #ccc;
    }
}
.topnav {
    overflow: hidden;
    background-color: #e9e9e9;
}

    .topnav a {
        float: left;
        display: block;
        color: black;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
        font-size: 17px;
    }

        .topnav a:hover {
            background-color: #ddd;
            color: black;
        }

        .topnav a.active {
            background-color: #2196F3;
            color: white;
        }

    .topnav .login-container {
        float: right;
    }

    .topnav input[type=text] {
        padding: 6px;
        margin-top: 8px;
        font-size: 17px;
        border: none;
        width: 120px;
    }

    .topnav .login-container button {
        float: right;
        padding: 6px 10px;
        margin-top: 8px;
        margin-right: 16px;
        background-color: #555;
        color: white;
        font-size: 17px;
        border: none;
        cursor: pointer;
    }

        .topnav .login-container button:hover {
            background-color: green;
        }

@media screen and (max-width: 600px) {
    .topnav .login-container {
        float: none;
    }

        .topnav a, .topnav input[type=text], .topnav .login-container button {
            float: none;
            display: block;
            text-align: left;
            width: 100%;
            margin: 0;
            padding: 14px;
        }

    .topnav input[type=text] {
        border: 1px solid #ccc;
    }
}
    </style>
</head>
<body>
    <div class="topnav">
  <a class="active" href="login.aspx">Logout</a>
  <a href="UpdateSearchStudentInfo.aspx">Manage Data</a>
  
  <div class="login-container">
      </div>
        </div>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" Width="70%">
            <LocalReport ReportPath="ReportrRDLCview.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="DataSet1" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="hostel.ReportViewTableAdapters.hostelinfoTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_userid1" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Jod_ID" Type="Int32" />
                <asp:Parameter Name="Payment" Type="String" />
                <asp:Parameter Name="fname" Type="String" />
                <asp:Parameter Name="lname" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="age" Type="String" />
                
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Company Name" Type="String" />
                 <asp:Parameter Name="Payment" Type="String" />
                <asp:Parameter Name="fname" Type="String" />
                <asp:Parameter Name="lname" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="roomno" Type="String" />
                <asp:Parameter Name="age" Type="String" />
               
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="hostel.ReportViewTableAdapters.hostelinfoTableAdapter"></asp:ObjectDataSource>
    </form>
    </body>
</html>
