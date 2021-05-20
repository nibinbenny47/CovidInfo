<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HealthCenter.aspx.cs" Inherits="CovidInfo.Admin.HealthCenter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href=" //cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css" rel="stylesheet" />
    <style>
        .active{
            color:green;
        }
        .inactive{
            color:red;
        }
        .active-img{
            width:20px;
            mix-blend-mode: multiply;
        }
    </style>
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
            
            <hr />
            <div id="grd-control">
                <asp:GridView runat="server" ID="grdHealthCenter" OnRowCommand="grdHealthCenter_RowCommand"  AutoGenerateColumns="false" OnRowDataBound="grdHealthCenter_RowDataBound" DataKeyNames="healthcenter_availstatus">
                    <Columns>
                        <asp:BoundField HeaderText="Name" DataField="healthcenter_name" />
                        <asp:BoundField HeaderText="Pincode" DataField="pincode_number" />
                        <asp:TemplateField>
                            <HeaderTemplate>
                                Status
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblActive" Visible="false" Text="active">Active<img src="../images/active.png" class="active-img" /></asp:Label>
                               
                                <asp:Label runat="server" ID="lblInActive" Visible="false">InActive<img src="../images/inactive.png" class="active-img" /></asp:Label>
                                <asp:HiddenField runat="server" ID="hdnStatus" Value='<%# Eval("healthcenter_availstatus") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                Actions
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" runat="server" CommandArgument='<%# Eval("healthcenter_id") %>' CommandName="del" Text="Delete" />
                                <asp:Button ID="btnEdit" runat="server" CommandArgument='<%# Eval("healthcenter_id") %>' CommandName="ed" Text="Edit" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </form>

      <script src="../js/jQuery.js"></script>
        <script src="//cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
   <script>
       $(document).ready(function () {
           $('#grdHealthCenter').DataTable();
       });
   </script>
</body>
</html>
