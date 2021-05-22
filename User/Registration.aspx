<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="CovidInfo.User.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="main-div">
            <section id="Dose-1">
                <h1>Dose-1</h1>
                <asp:Button runat="server" ID="btnDose" Text="Dose-1" />
                
                <div class="Aadhar">
                    <asp:Label runat="server" ID="lblAdhaar" Text="Aadhar Number"></asp:Label>
                    <asp:TextBox runat="server" ID="txtAdhaar"></asp:TextBox>
                    <asp:Button runat="server" ID="btnCheckAadhar" Text="Check" OnClick="btnCheckAadhar_Click" />
                </div>


                <div class="form-control">
                    <asp:Label runat="server" ID="lblName" Text="Name"></asp:Label>
                    <asp:TextBox runat="server" ID="txtName"></asp:TextBox>
                </div>
                <div class="form-control">
                    <asp:Label runat="server" ID="lblGender" Text="Gender"></asp:Label>
                    <asp:RadioButtonList runat="server" ID="rdbGender" RepeatDirection="Horizontal">
                        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <div class="form-control">
                    <asp:Label runat="server" ID="lblDOB" Text="DOB"></asp:Label>
                    <asp:TextBox runat="server" ID="txtDOB" TextMode="Date"></asp:TextBox>
                </div>
                <div class="form-control">
                    <asp:Label runat="server" ID="lblEmail" Text="Email"></asp:Label>
                    <asp:TextBox runat="server" ID="txtEmail" TextMode="Email"></asp:TextBox>
                </div>
                
                <div class="form-control">
                    <asp:Label runat="server" ID="lblPincode" Text="Pincode"></asp:Label>
                    <asp:DropDownList runat="server" ID="ddlPincode" OnSelectedIndexChanged="ddlPincode_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                </div>
                <div class="form-control">
                    <asp:Label runat="server" ID="lblHealthCenter" Text="Nearest Health Center"></asp:Label>
                    <asp:DropDownList runat="server" ID="ddlHealthCenter"></asp:DropDownList>
                </div>
                <div class="form-control">
                    <asp:Label runat="server" ID="lblDate" Text="Date"></asp:Label>
                   <asp:TextBox runat="server" ID="txtvaccineDate" TextMode="Date"></asp:TextBox>
                </div>
                <div class="btn">
                    <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
                </div>

            </section>

            <section id="Dose-2">
                <h1>Dose-2</h1>
                <asp:Button runat="server" ID="btnDose2" Text="Dose-2" />
                
                <div class="Aadhar">
                    <asp:Label runat="server" ID="lblAdhaar2" Text="Aadhar Number"></asp:Label>
                    <asp:TextBox runat="server" ID="txtAadhar2"></asp:TextBox>
                    <asp:Button runat="server" ID="btnCheckAdhar2" Text="Check" OnClick="btnCheckAdhar2_Click" />
                </div>


                <div class="form-control">
                    <asp:Label runat="server" ID="lblName2" Text="Name"></asp:Label>
                    <asp:TextBox runat="server" ID="txtName2"></asp:TextBox>
                </div>
                <div class="form-control">
                    <asp:Label runat="server" ID="lblGender2" Text="Gender"></asp:Label>
                    <asp:RadioButtonList runat="server" ID="rdbGender2" RepeatDirection="Horizontal">
                        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <div class="form-control">
                    <asp:Label runat="server" ID="lblDOB2" Text="DOB"></asp:Label>
                    <asp:TextBox runat="server" ID="txtDOB2" TextMode="Date"></asp:TextBox>
                </div>
                <div class="form-control">
                    <asp:Label runat="server" ID="lblEmail2" Text="Email"></asp:Label>
                    <asp:TextBox runat="server" ID="txtEmail2" TextMode="Email"></asp:TextBox>
                </div>
                
                <div class="form-control">
                    <asp:Label runat="server" ID="lblPincode2" Text="Pincode"></asp:Label>
                    <asp:DropDownList runat="server" ID="ddlPincode2" OnSelectedIndexChanged="ddlPincode_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                </div>
                <div class="form-control">
                    <asp:Label runat="server" ID="lblHealthcenter2" Text="Nearest Health Center"></asp:Label>
                    <asp:DropDownList runat="server" ID="ddlHealthCenter2"></asp:DropDownList>
                </div>
                <div class="form-control">
                    <asp:Label runat="server" ID="lblDate2" Text="Date"></asp:Label>
                   <asp:TextBox runat="server" ID="txtDate2" TextMode="Date"></asp:TextBox>
                </div>
                <div id="btn">
                    <asp:Button ID="btnRegister2" runat="server" Text="Register" OnClick="btnRegister_Click" />
                </div>

            </section>
        </div>
    </form>
</body>
</html>
