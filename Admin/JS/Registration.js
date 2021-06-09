
//-------display aahdar div by clicking dose1 button------

document.getElementById('btndose').addeventlistener("click", () => {
    document.queryselector('#aadhar').style.display = "block";
})
////-------display checksuccess div by clicking check here button----
//document.getElementById('btncheckaadhar').addeventlistener("click", () => {
//    document.queryselector('#check-success').style.display = "block";
//})
//----success message for dose 1 registration--------------
document.getElementById('btnregister').addeventlistener("click", () => {
    document.queryselector('#success-popup').style.display = "flex";
    document.queryselector('#main-div').style.display = "none";
})
//--return back to registration page by clicking close button---------
document.getElementById('closebtn').addeventlistener("click", () => {
    document.queryselector('#success-popup').style.display = "none";
    document.queryselector('#main-div').style.display = "block";
})

//------aadhar validation for dose 1-------------
function validateaadhar() {
    let aadhar = document.getElementById('txtadhaar');
    if (!isvalidaadhar(aadhar.value.trim())) {
        onerror(aadhar, "aadhar must be 12 numbers");
        return false;

    }
    else {
        onsuccess(aadhar);
        document.queryselector('#check-success').style.display = "block";
    }

}
//----------error message------------------------------
function onError(input, message) {
    let parent = input.parentelement;
    let messageelement = parent.queryselector("small");
    messageelement.style.visibility = "visible";
    messageelement.innertext = message;
    //---add error class-------
    //parent.classlist.add("error");
    //parent.classlist.remove("success");
}
//----------success message------------------------------
function onsuccess(input) {
    let parent = input.parentelement;
    let messageelement = parent.queryselector("small");
    messageelement.style.visibility = "hidden";
    messageelement.innertext = "";
    //---add success class-----
    //parent.classlist.add("success");
    //parent.classlist.remove("error");
}
function isvalidaadhar(aadhar) {
    return /^\d{12}$/.test(
        aadhar
    );
}








//----aadhar availability-------------------------------

function CheckAvailability() {
    //var aadhar = document.getElementById("txtAdhaar").value;
    //var request;
    //var messages = document.getElementById("smallCheckAdhaar");
    //if (aadhar.value.trim() == "") {
    //    messages.style.color = "red";
    //    messages.innerHTML = "not valid";
    //}
    ////else if (!isvalidaadhar(aadhar.value.trim())) {
    ////    onerror(aadhar, "aadhar must be 12 numbers");
    ////    return false;
    ////}
    //else if (aadhar.value.length < 12) {
    //    messages.style.color = "red";
    //    messages.innerHTML = "12 numbers needed";
    //}
    var aadhar = document.getElementById("txtAdhaar").value;
    var request;



        //var request;
        if (window.XMLHttpRequest) {
            //New browsers.
            request = new XMLHttpRequest();
        }
        else if (window.ActiveXObject) {
            //Old IE Browsers.
            request = new ActiveXObject("Microsoft.XMLHTTP");
        }
        if (request != null) {
            var url = "Registration.aspx/CheckAadhar";
            request.open("POST", url, false);
            var sendStr = "{aadhar: '" + aadhar + "'}";
            request.setRequestHeader("Content-Type", "application/json");
            request.onreadystatechange = function () {
                if (request.readyState == 4 && request.status == 200) {
                    var messages = document.getElementById("smallCheckAdhaar");
                    var checksuccess = document.getElementById("check-success");
                    if (JSON.parse(request.responseText).d) {
                        //Username available.
                        //alert("success");


                        messages.style.color = "green";
                        messages.innerHTML = "Aadhar is available";
                        checksuccess.style.display = "block";








                    }
                    else {

                        //Username not available.
                        messages.style.color = "red";
                        messages.innerHTML = "Aadhar is NOT available";
                    }
                }
            };
            request.send(sendStr);
        }
    
}
//validate(CheckAvailability);
function ClearMessage() {

    document.getElementById("smallCheckAdhaar").innerHTML = "";

}

function AadharValidation() {

    var Adhar = document.getElementById("txtAdhaar").value;
    var errormsg = document.getElementById("smallCheckAdhaar");
    if (Adhar.value.length > 3) {
        alert("hii");

    }

}