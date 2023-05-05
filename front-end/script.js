function login() {
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    var role = document.querySelector('input[name="role"]:checked').value;
  
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "login", true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function() {
      if (xhr.readyState == 4 && xhr.status == 200) {
        if (xhr.responseText == "success") {
          if (role == "teacher") {
            window.location.href = "/teacher.html";
          } else if (role == "student") {
            window.location.href = "/student.html";
          }
        } else {
          alert("Login failed. Please try again.");
        }
      }
    }
    xhr.send("username=" + username + "&password=" + password + "&role=" + role);
  }
  