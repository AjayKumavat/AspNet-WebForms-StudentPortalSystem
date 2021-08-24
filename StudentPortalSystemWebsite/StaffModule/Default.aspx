<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="StudentPortalSystemWebsite.StaffModule.Default" %>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">


    <!-- character encoding NOTE: we must include this in every website -->
        <meta charset="utf-8"/>
        
        <!-- ESSENTIAL PART WHEN BUILDING A RESPONSIVE WEBSITE -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
       
        <!-- Description of the website will be displayed below the link after it occur in the search result -->
        <meta name="description" content="Login Page"/>
        
        <!-- THIS FILE DOWNLOAD FROM GOOGLE "normalize.css"-->
        <!-- normalize.css render all element more consistently, It precisely targets only the styles that need normalizing. -->
        <!-- Its like a reset CSS, Which will make CSS look same in all browser -->
        <link rel="stylesheet" type="text/css" href="../vendors/css/normalize.css" runat="server"/>
        
        <!-- grid css -->
        <link rel="stylesheet" type="text/css" href="../vendors/css/grid.css" runat="server"/>
        
        <!-- ionicons css -->
        <link rel="stylesheet" type="text/css" href="../vendors/css/ionicons.min.css" runat="server"/>
        
        <!-- animate.css-->
        <link rel="stylesheet" type="text/css" href="../vendors/css/animate.css" runat="server"/>
        
        <!-- Linking CSS file(My created CSS file) -->
        <link rel="stylesheet" type="text/css" href="../resources/css/style.css" runat="server"/>
        
        
        <!-- Font : LATO
            STYLE : Thin 100
                    Light 300 
                    Light 300 italic
                    Regular 400
                    Regular 400 italic
                    Bold 700-->
        <!-- NOTE : DON'T DOWNLOAD THE WHOLE FONT FAMILY BECAUSE THIS WILL DIRECTLY AFFECT THE PAGE LOAD SPEED -->
        <link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;1,300;1,400&display=swap" rel="stylesheet"/>

    <style>

        /* ------------------------------------------ */
/* LOGIN PAGE */
/* ------------------------------------------ */
/* NOTHING */
.section-login-page {
}

/* ------------------------------------------ */
/* ROW WIDTH */
/* ------------------------------------------ */

/* LOGIN PAGE ROW STYLING */
.login-page-width {
    overflow: hidden;
    display: block;
    max-width: 90%;
    height: 490px;
    margin: 0 auto;
}
/* ------------------------------------------ */
/* ------------------------------------------ */

/* ------------------------------------------ */
/* IMAGE */
/* ------------------------------------------ */

/* IMAGE PROPERTIES */
.login-image-panel img {
    width: 100%;
    height: auto;
    margin-top: -50px; /* Only in Student Login page */
    vertical-align: middle;
    transform: scale(0.8);
    transition: transform 0.5s;
}

    .login-image-panel img:hover {
        transform: scale(0.7);
        transition: transform 0.5s;
    }
/* xxxxxxx IMAGE xxxxxxxx */
/* ------------------------------------------ */
/* ------------------------------------------ */

/* ------------------------------------------ */
/* LOGIN PAGE - FORM */
/* ------------------------------------------ */

/* LOGIN PAGE BOTH PANEL (LEFT AND RIGHT BOTH) */
/* Removing the important from the below class is changing the position of login form so keep it here only */
.login-both-panel {
    margin-top: 110px !important;
}

/* Whole form properties */
.login-form-panel div {
    display: block;
    margin: 0 auto;
    text-align: center;
    margin-top: 15px;
}

/* Form panel - right side */
.login-form-panel {
    height: 330px;
    margin: 0 auto;
}

.login-form-panel {
    border-left: 2px solid #e67e22;
}

.login-button-div {
    margin-top: 26px !important;
}

/* xxxxxxx LOGIN PAGE - FORM xxxxxxx */
/* ------------------------------------------ */
/* ------------------------------------------ */

/* ------------------------------------------ */
/* LOGIN PAGE TEXT BOXES */
/* ------------------------------------------ */

/* REASON FOR USING !IMPORTANT*/
/* this styling were not making any affect on the username textbox that's why i have used !important */
.login-textbox {
    width: 300px !important;
    height: 50px !important;
    border-radius: 30px !important;
    border: 1px solid #cccccc !important;
    padding-left: 50px !important;
}

/* ICON */
/* Fitting icon inside the textbox */
.login-form-icon {
    transform: translateX(59px);
    font-size: 130%;
}

/* TextBox */
/* centering the textbox */
.login-input {
    margin-left: -52px !important;
}
/* ------------------------------------------ */
/* ------------------------------------------ */
    </style>

    <title>Staff Login Page</title>


</head>

<body>

    <form id="form1" runat="server">
    
        <header>

            <nav class="sticky login-js--wp-1">
               
                <div class="row">
                    
                    <a href="../Homepage.aspx">
                        <img src="../resources/img/1LogoBlack.png" alt="College logo" class="logo-black"/>
                    </a>

                    <!-- MAIN NAVIGATION BAR -->
                    <ul class="main-nav js--main-nav">
                        <!-- we will create some anchors inside href attributes (id = #idname)-->
                        <li><a href="../Homepage.aspx">Home</a></li>
                        <li><a href="../StudentModule/Default.aspx">Student login</a></li>
                        <li><a href="Default.aspx">Staff login</a></li>
                        <li><a href="../AdminModule/Default.aspx">Admin login</a></li>
                    </ul>
                    
                </div>
                
            </nav>

        </header>


        <section class="section-login-page">
        <div class="login-page-width">

            <!-- ----------------------------------- -->
            <!-- LEFT PANEL -->
            <!-- ----------------------------------- -->
            <div class="col span-1-of-2  login-both-panel login-image-panel login-js--wp-2">

                <img src="resources/img/Staff_ideas_flow.svg" alt="Admin Login Page" />

            </div>

             <!-- ----------------------------------- -->
            <!-- RIGHT PANEL -->
            <!-- ----------------------------------- -->
            <div class="col span-1-of-2 login-both-panel login-form-panel">
                <div class="login-right-panel-form  login-js--wp-3">

                    <!-- HEADING -->
                    <div>
                        <h2>Staff Login</h2>
                    </div>

                    <!-- USERNAME -->
                    <div class="login-input">
                        <i class="ion-android-person icon-small login-form-icon"></i>

                        <asp:TextBox ID="TextBox1" CssClass="login-textbox" runat="server" placeholder="Username" Width="300px" TextMode="SingleLine" Height="50px"></asp:TextBox>
                    </div>

                    <!-- PASSWORD -->
                    <div class="login-input">
                        <i class="ion-android-lock icon-small login-form-icon"></i>

                            <asp:TextBox ID="TextBox2" CssClass="login-textbox" runat="server" placeholder="Password" Width="300px" TextMode="Password" Height="50px"></asp:TextBox>
                    </div>

                    <!-- SIGN IN BUTTON -->
                    <div class="login-button-div">
                            <asp:Button ID="Button1" CssClass="btn btn-full login-btn" runat="server" Text="Login" OnClick="Button1_Click" />
                    </div>

                </div> <!-- login-right-panel-form -->

            </div> <!-- LOGIN FORM - RIGHT -->

        </div> <!-- LOGIN WIDTH -->

    </section>


    </form> <!-- FORM ENDS HERE -->
        
        <!-- ******************************************************************************** -->
        <!-- TO MAKE OUR WEBSITE LOOK THE SAME IN OLDER BROWSER OR THE OLDER VERSIONS WE'LL USE THE JAVASCRIPT FILES WHICH ARE DOWNLOADED FROM jsdelivr.com -->
        <!-- ******************************************************************************** -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

    <script src="../vendors/js/respond.min.js"></script>
    <script src="../vendors/js/html5shiv.min.js"></script>
    <script src="../vendors/js/selectivizr.min.js"></script>
    <script src="../vendors/js/jquery.waypoints.min.js"></script>
    <script src="../resources/js/script.js"></script>

</body>
</html>