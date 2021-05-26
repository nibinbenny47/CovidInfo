
//-------display aahdar div by clicking dose1 button------
document.getelementbyid('btndose').addeventlistener("click", () => {
    document.queryselector('#aadhar').style.display = "block";
})
////-------display checksuccess div by clicking check here button----
//document.getelementbyid('btncheckaadhar').addeventlistener("click", () => {
//    document.queryselector('#check-success').style.display = "block";
//})
//----success message for dose 1 registration--------------
document.getelementbyid('btnregister').addeventlistener("click", () => {
    document.queryselector('#success-popup').style.display = "flex";
    document.queryselector('#main-div').style.display = "none";
})
//--return back to registration page by clicking close button---------
document.getelementbyid('closebtn').addeventlistener("click", () => {
    document.queryselector('#success-popup').style.display = "none";
    document.queryselector('#main-div').style.display = "block";
})

//------aadhar validation for dose 1-------------
function validateaadhar() {
    let aadhar = document.getelementbyid('txtadhaar');
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
function onerror(input, message) {
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
