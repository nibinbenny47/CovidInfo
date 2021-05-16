<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pincode.aspx.cs" Inherits="CovidInfo.Admin.Pincode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="addPincode">
            <asp:Label runat="server" ID="lblPincode" Text="Pincode"></asp:Label>
            <asp:TextBox runat="server" ID="txtPincode"></asp:TextBox>
            <div id="btn">
                <asp:Button ID="btnSave" runat="server"  Text="Save" OnClick="btnSave_Click1" />

            </div>
        </div>
    </form>
</body>
</html>
