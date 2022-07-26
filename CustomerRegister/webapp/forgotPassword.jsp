<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Forgot Password</title>
    <link rel="stylesheet" href= "https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
    <script src ="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
    <script src ="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>

        @import "https://fonts.googleapis.com/css?family=Raleway";

        body {

          margin: 0;
          padding: 0;
          background: #333;
          font-family: Raleway;
          text-transform: uppercase;
          font-size: 11px;
        }
        h1{ margin: 0; }
        #contact {
          -webkit-user-select: none; /* Chrome/Safari */
          -moz-user-select: none; /* Firefox */
          -ms-user-select: none; /* IE10+ */
          margin: 4em auto;
          width: 100px;
          height: 30px;
          line-height: 30px;
          background: teal;
          color: white;
          font-weight: 700;
          text-align: center;
          cursor: pointer;
          border: 1px solid white;
          position: absolute;
          left: 158px;
          top: 92px;
        }

        #contact:hover { background: #666; }
        #contact:active { background: #444; }


        #contactForm {
         display: none;
            border: 3px solid black;
            border-radius: 10px;
          padding: 2em;
          width: 400px;
          text-align: center;
          background: #fff;
          position: fixed;
          top:50%;
          left:50%;
          visibility : hidden;
          opacity : 0;
          transform: translate(-50%,-50%);
          -webkit-transform: translate(-50%,-50%)

        }

        input, textarea {
          margin: .8em auto;
          font-family: inherit;
          text-transform: inherit;
          font-size: inherit;

          display: block;
          width: 280px;
          padding: .4em;
        }
        textarea { height: 80px; resize: none; }

        .formBtn {
          width: 140px;
          display: inline-block;

          background: teal;
          color: #fff;
          font-weight: 100;
          font-size: 1.2em;
          border: none;
          height: 30px;
        }

        .row#blur.active
        {
            filter : blur(10px);
        }

        body {
            background-position: center;
            background-color: #eee;
            background-repeat: no-repeat;
            background-size: cover;
            color: #505050;
            font-family: "Rubik",Helvetica,Arial,sans-serif;
            font-size: 14px;
            font-weight: normal;
            line-height: 1.5;
            text-transform: none;
        }

        .forgot{
	        background-color: #fff;
            padding: 12px;
            border: 5px solid #dfdfdf;
        }

        .card-body{
            background-color: #fff;
            padding: 12px;
            border: 5px solid #dfdfdf;
        }

        .padding-bottom-3x {
            padding-bottom: 72px !important;
        }

        .card-footer{
	        background-color: #fff;
	        background-color: #fff;
            padding: 12px;
            border: 5px solid #dfdfdf;
        }

        .btn{
    	    font-size: 13px;
        }

        .form-control:focus {
            color: #495057;
            background-color: #fff;
            border-color: #76b7e9;
            outline: 0;
            box-shadow: 0 0 0 0px #28a745;
        }

        #contactForm.active
        {

            visibility : visible;
            opacity : 1;

        }

    </style>
    <script>
            function validateForm()
            {
                let a = document.forms["passwordForm"]["email"].value;
                	if (a == "" || a == null )
                    {
                        alert("email must be filled out");
                        return false;
                    }
                    else
                    {
                        alert("OTP sent successfully !!!\n"+"CLick Ok .");
                        }
            }
            $(function() {

              // contact form animations
              $('#contact').click(function() {
                $('#contactForm').fadeToggle();
              })
              $(document).mouseup(function (e) {
                var container = $("#contactForm");

                if (!container.is(e.target) // if the target of the click isn't the container...
                    && container.has(e.target).length === 0) // ... nor a descendant of the container
                {
                    container.fadeOut();
                }
              });

            });
            function toggle(){
                var blur =document.getElementById('blur');
                blur.classList.toggle('active');
                var popup =document.getElementById('contactForm');
                popup.classList.toggle('active');
            }

    </script>
</head>
<body>

     <div class="container padding-bottom-3x mb-2 mt-5">
      <div class="row justify-content-center" id ="blur">
        <div class="col-lg-8 col-md-10">
          <div class="forgot">

          	<h2>Forgot your password?</h2>
          <p>Change your password in three easy steps. This will help you to secure your password!</p>
          <ol class="list-unstyled">
            <li><span class="text-primary text-medium">1. </span>Enter your email address below.</li>
            <li><span class="text-primary text-medium">2. </span>Our system will send you an OTP to your registered email address.</li>
            <li><span class="text-primary text-medium">3. </span>Use the OTP to reset your password through verify button.</li>
          </ol>

          </div>

          <form class="card mt-4" name = "passwordForm"  onsubmit="return validateForm()" action="ForgotPassword" method ="post">
            <div class="card-body">
              <div class="form-group">
                <label for="email-for-pass">Enter your email address</label>
                <input class="form-control" type="email" name = "email" id="email-for-pass" placeholder = "Enter Your Email Here" >
              </div>
            </div>
            <div class="card-footer">
              <button class="btn btn-success" type="submit">Get OTP</button>
              <div id="contact" onclick = "toggle()">Verify</div>
            </div>
          </form>
        </div>
      </div>
      <div id="contactForm">

                    <h1>Create New Password !</h1>

                    <form action="/UpdatePassword" method="post">
                      <input placeholder="OTP" name = "userOtp" type="text" required />
                      <input placeholder="New Password" name="password" id="password" type="password" />
                      <button class="formBtn" type="submit" >Submit</button>
                      <a href="#" onclick = "toggle()"><button class="formBtn">Close</button></a>

                    </form>
                  </div>
      <div class="d-flex justify-content-center home mb-4">
                        <a href="home.jsp"><button type="submit" class="btn1">Home</button></a>
                  </div>
    </div>
</body>
</html>