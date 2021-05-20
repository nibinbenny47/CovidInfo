<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HealthCenter.aspx.cs" Inherits="CovidInfo.Admin.HealthCenter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="container">
            <div id="form-control">
                <asp:Label runat="server" Text="Pincode  "></asp:Label>

                <asp:DropDownList runat="server" ID="ddlPincode"></asp:DropDownList>
                <asp:Label runat="server" Text="Health Center "></asp:Label>
                <asp:TextBox runat="server" ID="txtHealthCenter" ></asp:TextBox>
                <asp:Label runat="server" Text="Give Password "></asp:Label>

                <asp:TextBox runat="server" ID="txtPassword"  TextMode="Password"></asp:TextBox>

                <div id="btn">
                    <asp:Button runat="server" ID="btnSave" Text="Save"  OnClick="btnSave_Click" />
                </div>
            </div>

        </div>
    </form>
</body>
</html>
