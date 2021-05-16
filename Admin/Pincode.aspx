<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pincode.aspx.cs" Inherits="CovidInfo.Admin.Pincode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <%------add pincode-------%>
        <div id="container">


            <div id="addPincode">
                <asp:Label runat="server" ID="lblPincode" Text="Pincode"></asp:Label>
                <asp:TextBox runat="server" ID="txtPincode"></asp:TextBox>
                <div id="btn">
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click1" />

                </div>
            </div>
            <div id="displayTable">
               <asp:GridView runat="server" ID="grdPincode" AutoGenerateColumns="false" OnRowCommand="grdPincode_RowCommand">
                <Columns>
                    <asp:BoundField HeaderText="Pincode" DataField="pincode_number" />
                    <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" runat="server" CommandArgument='<%# Eval("pincode_id") %>' CommandName="del" Text="Delete" />
                                <asp:Button ID="btnEdit" runat="server" CommandArgument='<%# Eval("pincode_id") %>' CommandName="ed" Text="Edit" />
                            </ItemTemplate>
                        </asp:TemplateField>
                </Columns>
            </asp:GridView>
            </div>
        </div>
    </form>

    
</body>
</html>
