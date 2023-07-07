function myFunctionConfPass() {
    var x = document.getElementById("confirmPassword");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
}