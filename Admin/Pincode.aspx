<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pincode.aspx.cs" Inherits="CovidInfo.Admin.Pincode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href=" //cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="CSS/Pincode.css" rel="stylesheet" />

    <style>
          .suc {
            background-color: #5cb85c;
            font-size: 12px;
            color: #ffffff;
            padding: 3px 6px 3px 6px;
        }

        .fail {
            background-color: #ed4e2a;
            font-size: 12px;
            color: #ffffff;
            padding: 3px 6px 3px 6px;
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">
        <%------add pincode-------%>
        <div id="container">


            <div id="addPincode">
                <asp:Label runat="server" ID="lblPincode" Text="Pincode"></asp:Label>
                <asp:TextBox runat="server" ID="txtPincode" placeholder="enter pincode here" ></asp:TextBox>
                <small>Error Message</small>
                <asp:Label ID="message" runat="server"></asp:Label>
              <%--<small id="message"></small>--%>
                <div id="btn">
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click1" OnClientClick="javascript: return validate()"  />
                    
                </div>
            </div>
            <hr />
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


    <script src="../js/jQuery.js"></script>
    <script type="text/javascript">
        function validate() {
            let pincode = document.getElementById('<%=txtPincode.ClientID %>');
            if (pincode.value === "") {
                //alert("enetr value");
                onError(pincode, "pincode cannot be empty");
                return false;


            }


            else if (!isValidPincode(pincode.value.trim())) {
                onError(pincode, "pincode not valid");
                return false;

            }
            else {
                onSuccess(pincode);
                //return true;
            }


            //else {
            //    alert("val");
            //}


        }
        //------success message-------------------------------------
        function onSuccess(input) {
            let parent = input.parentElement;
            let messageElement = parent.querySelector("small");
            messageElement.style.visibility = "hidden";
            messageElement.innerText = "";
            //---add success class-----
            parent.classList.add("success");
            parent.classList.remove("error");
        }
        //----------error message------------------------------
        function onError(input, message) {
            let parent = input.parentElement;
            let messageElement = parent.querySelector("small");
            messageElement.style.visibility = "visible";
            messageElement.innerText = message;
            //---add error class-------
            parent.classList.add("error");
            parent.classList.remove("success");
        }
        //------pincode regular expression-----
        function isValidPincode(pincode) {
            return /^\d{6}$/.test(
                pincode
            );
        }
    </script>
    <%--------check pincode availability------%>
    <%--<script type="text/javascript">
        function CheckAvailability() {
            var pincode = $('<%=txtPincode.ClientID %>').val();
            var message = $('<%=message.ClientID %>');
            $.ajax({
                type: "POST",
                async: true,
                url: 'Pincode.aspx/CheckPincode',
                data: '{pincode:"' + pincode + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d != "0") {
                        //alert('Username has already been taken')
                        message.html('Username has already been taken');
                        message.removeClass("suc").addClass("fail");
                        return false;
                    }
                    else {
                        //alert('Available')
                        message.html('Available');
                        message.removeClass("fail").addClass("suc");
                        return true;
                    }
                }

            });
        }--%>


       <%-- function CheckAvailability() {
            var pincode = $('<%=txtPincode.ClientID %>').val();
            $.ajax({
                type: "POST",
                url: "Pincode.aspx/CheckPincode",
                data: '{pincode:"' + pincode + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                   
                
                   var message = $('<%=message.ClientID %>');
                    if (response.d) {
                        //message.css("color", "green");
                        message.html("Username is available");
                    }
                    else {
                        
                        //message.css("color", "red");
                        message.html("Username is NOT available");
                    }
                }

            });
        }--%>
        <%--function ClearMessage() {
            $('<%=message.ClientID %>').html("");
        };--%>
    </script>
</body>

</html>
 

