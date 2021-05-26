<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="CovidInfo.User.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Admin/CSS/Registration.css" rel="stylesheet" />
    <link rel="stylesheet" href="../js/jquery-ui.css">
    <link rel="stylesheet" href="../js/jquery-ui.structure.css">
    <link rel="stylesheet" href="../js/jquery-ui.theme.css">
</head>
<body>
    <form id="form1" runat="server">
        <div id="main-div">
            <nav>
                <div class="logo">
                    <img src="../images/emblem.png" />
                    <p>Ministry Of Health and Family Welfare</p>
                </div>

                <div class="nav-links">
                    <a href="#">Home</a>
                    <a href="#">Registration</a>
                </div>
            </nav>
            <div id="VaccineDose">
                <section id="Dose-1">
                    <%-- <h1>Dose-1</h1>--%>
                    <asp:Button runat="server" ID="btnDose" Text="Dose-1" />
                    <div id="dose1-content">
                        <div id="Aadhar">
                            <%--<asp:Label runat="server" ID="lblAdhaar" Text="Aadhar Number"></asp:Label>--%>
                            <asp:TextBox runat="server" ID="txtAdhaar" required=""> </asp:TextBox><br />
                            <%--<input type="text" id="txtAdhaar" required="" />--%>
                            

                            <label for="txtAdhaar">Aadhar Number</label>
                            <small class="error">error</small><br />
                            <asp:Button runat="server" ID="btnCheckAadhar" Text="Check" OnClick="btnCheckAadhar_Click" />
                        </div>

                        <div id="check-success">

                            <div class="form-control">
                                <%--<asp:Label runat="server" ID="lblName" Text="Name"></asp:Label>--%>
                                <asp:TextBox runat="server" ID="txtName" required=""></asp:TextBox>
                                <label for="txtName">Name</label>
                                <small class="error">error</small>
                            </div>
                            <div class="form-controlGender">
                                <asp:Label runat="server" ID="lblGender" Text="Gender"></asp:Label>
                                <asp:RadioButtonList runat="server" ID="rdbGender" RepeatDirection="Horizontal">
                                    <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                    <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                    <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                            <div class="form-control">
                                <%--<asp:Label runat="server" ID="lblDOB" Text="DOB"></asp:Label>--%>
                                <asp:TextBox runat="server" ID="txtDOB" required=""></asp:TextBox>
                                <label for="txtDOB">Date Of Birth</label>
                                <small class="error">error</small>
                            </div>
                            <div class="form-control">
                                <%--<asp:Label runat="server" ID="lblEmail" Text="Email"></asp:Label>--%>
                                <asp:TextBox runat="server" ID="txtEmail" required=""></asp:TextBox>
                                <label for="txtEmail">Email</label>
                                <small class="error">error</small>
                            </div>

                            <div class="form-control">
                                <asp:Label runat="server" ID="lblPincode" Text="Pincode"></asp:Label>
                                <asp:DropDownList runat="server" ID="ddlPincode" OnSelectedIndexChanged="ddlPincode_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                <small class="error">error</small>
                            </div>
                            <div class="form-control">
                                <asp:Label runat="server" ID="lblHealthCenter" Text="Nearest Health Center"></asp:Label>
                                <asp:DropDownList runat="server" ID="ddlHealthCenter"></asp:DropDownList>
                                 <small class="error">error</small>
                            </div>
                            <div class="form-control">
                                <%--<asp:Label runat="server" ID="lblDate" Text="Date"></asp:Label>--%>
                                <asp:TextBox runat="server" ID="txtvaccineDate"  required=""></asp:TextBox>
                               <label for="txtvaccineDate">Date Of Vaccination</label>
                                <small class="error">error</small>
                            </div>
                            <div class="btn">
                                <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
                            </div>
                        </div>
                    </div>

                </section>
               

                <section id="Dose-2">
                    <%-- <h1>Dose-2</h1>--%>
                    <asp:Button runat="server" ID="btnDose2" Text="Dose-2" />
                    <div id="dose-2content">
                        <div id="Aadhar2">
                            <%--<asp:Label runat="server" ID="lblAdhaar2" Text="Aadhar Number"></asp:Label>--%>
                            <asp:TextBox runat="server" ID="txtAadhar2"></asp:TextBox><br />
                            <label for="txtAadhar2">Aadhar Number</label>
                            <small class="error">error</small><br />
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
                    </div>

                </section>
            </div>
        </div>
         <%-------------success message-----------%>
                <div id="success-popup">
                    <div id="popup-content">
                        <img src="../Images/close.jpg"  class="closebtn" id="closebtn"/>
                        <img src="../Images/active.png"  class="activeIcon"/>
                        <div id="text-content">
                            <label >
                                You are succesfully registered for Dose 1
                            </label>
                        </div>
                       
                    </div>
                </div>
    </form>

    <script src="../js/jQuery.js"></script>
    <script src="../js/jquery-ui.js"></script>
<%--    <script src="../Admin/JS/Registration.js"></script>--%>

    <script type="text/javascript">
        $("#txtDOB").datepicker({
            numberOfMonths: 1,
            changeYear: true, //for change year dropdown
            changeMonth: true,  //for change month dropdown
            showWeek: true,  //for show week sidebyside
            showOtherMonths: true, //fill calender to make good visible
            weekHeader: "wk no", //give header to week
            /*minDate: new Date(),*/ //give min date as today
            maxDate: new Date(2025, 0, 5) //give max date as you wish
        });
        $("#txtvaccineDate").datepicker({
            numberOfMonths: 1,
            changeYear: true, //for change year dropdown
            changeMonth: true,  //for change month dropdown
            showWeek: true,  //for show week sidebyside
            showOtherMonths: true, //fill calender to make good visible
            weekHeader: "wk no", //give header to week
            minDate: new Date(), //give min date as today
            maxDate: new Date(2025, 0, 5) //give max date as you wish
        });
        

    </script>
<%--    <script>
        document.getElementById('<%=btnDose.ClientID %>').addEventListener("click", () => {
            document.querySelector('#Aadhar').style.display = "block";
        })
    </script>--%>
  
</body>
</html>
