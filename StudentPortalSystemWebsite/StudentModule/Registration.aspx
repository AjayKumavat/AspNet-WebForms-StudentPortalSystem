<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="StudentPortalSystemWebsite.StudentModule.Registration" %>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">

    <!-- character encoding NOTE: we must include this in every website -->
        <meta charset="utf-8"/>
        
        <!-- ESSENTIAL PART WHEN BUILDING A RESPONSIVE WEBSITE -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
       
        <!-- THIS FILE DOWNLOAD FROM GOOGLE "normalize.css"-->
        <!-- normalize.css render all element more consistently, It precisely targets only the styles that need normalizing. -->
        <!-- Its like a reset CSS, Which will make CSS look same in all browser -->
    <link href="../vendors/css/normalize.css" rel="stylesheet" type="text/css" runat="server"/>
        
        <!-- grid css -->
    <link href="../vendors/css/grid.css" rel="stylesheet" runat="server"/>
        
        <!-- ionicons css -->
    <link href="../vendors/css/ionicons.min.css" rel="stylesheet" runat="server"/>
        
        <!-- animate.css-->
    <link href="../vendors/css/animate.css" rel="stylesheet" runat="server"/>

        <!-- Linking CSS file(My created CSS file) -->
    <link href="../resources/css/style.css" rel="stylesheet" runat="server"/>
    
        <!-- Custom Student Style Sheet -->
    <link href="resources/css/StudentStyleSheet.css" rel="stylesheet" />


    <!-- BOOTSTRAP -->
    <!-- bootstrap.css -->
    <link href="../vendors/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <!-- XXXXX  BOOTSTRAP XXXXX -->
        
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

            /* TEXTBOX SETTINGS */
            .add-staff-textbox {
                width: 100%;
                border-radius: 3px;
                padding: 7px;
                height: 40px;
                border: 1px solid #ccc;
            }

        </style>

        <title>Registration</title>
        
</head>


<body>
    
    <form id="form1" runat="server">
        <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
    <header>

        <!-- NAVIGATION -->
        <nav class="sticky login-js--wp-1">
            
                <div class="row">
                    
                    <a href="../Homepage.aspx">
                        <img src="../resources/img/1LogoBlack.png" alt="College logo" class="logo-black"/>
                    </a>

                    <!-- MAIN NAVIGATION BAR -->
                    <ul class="main-nav js--main-nav">
                        <!-- we will create some anchors inside href attributes (id = #idname)-->
                        <li><a href="../Homepage.aspx">Home</a></li>
                        <li><a href="Default.aspx">Student login</a></li>
                        <li><a href="../StaffModule/Default.aspx">Staff login</a></li>
                        <li><a href="../AdminModule/Default.aspx">Admin login</a></li>
                    </ul>
                    
                </div>
                
            </nav>

    </header>

    <!-- section-add-staff is used to use those css styles -->
 <div id="sectionRegistration" runat="server">  <!-- HIDE/SHOW -->

    <section class="section-add-staff section-registration login-js--wp-1">
        <div class="row">
            <h2>Registration</h2>
        </div>

        <div class="row">

            <!-- ADD USER DETAILS -->
            <div class="registration-form">
                <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>--%>


                <!-- USER ID -->
                <div class="row">
                    
                    <div class="col span-1-of-3">
                        <label class="registration-form-labels" for="user_id">User ID</label>
                    </div>

                    <div class="col span-2-of-3">
                        <div class="col span-11-of-12">
                            <asp:TextBox ID="TextBox1" runat="server" placeholder="User ID" CssClass="add-staff-textbox" TextMode="Number" Width="100%" ReadOnly="True"></asp:TextBox>
                        </div>
                    </div>

                </div>

                <!-- USER FULL NAME -->
                <div class="row">
                    <div class="col span-1-of-3">
                        <label class="registration-form-labels" for="name">Full name</label>
                    </div>
                    <div class="col span-2-of-3">
                        <div class="col span-11-of-12">
                            <asp:TextBox ID="TextBox2" runat="server" placeholder="Enter Full name" CssClass="add-staff-textbox"></asp:TextBox>
                        </div>
                        <div class="col span-1-of-12">
                            
                        </div>
                    </div>
                </div>

                <!-- ADDRESS -->
                <div class="row">
                    <div class="col span-1-of-3">
                        <label class="registration-form-labels" for="address">Address</label>
                    </div>

                    <div class="col span-2-of-3">
                        <div class="col span-11-of-12">
                            <asp:TextBox ID="TextBox3" runat="server" placeholder="Enter Address" Height="90px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                        </div>
                        <div class="col span-1-of-12">
                            
                        </div>
                        
                    </div>
                        
                </div>

                <!--  CONTACT NO -->
                <div class="row">
                    <div class="col span-1-of-3">
                        <label class="registration-form-labels" for="contact_no">Contact No.</label>
                    </div>

                    <div class="col span-2-of-3">
                        <div class="col span-11-of-12">
                            <asp:TextBox ID="TextBox4" runat="server" placeholder="Contact no." TextMode="Number" Width="100%" CssClass="add-staff-textbox"></asp:TextBox>
                        </div>
                        <div class="col span-1-of-12">
                           
                        </div>
                    </div>
                        
                </div>
                
                <!--  EMAIL ID -->
                <div class="row">
                    <div class="col span-1-of-3">
                        <label class="registration-form-labels" for="email">Email</label>
                    </div>

                    <div class="col span-2-of-3">
                        <div class="col span-11-of-12">
                            <asp:TextBox ID="TextBox5" runat="server" placeholder="example@gmail.com" TextMode="Email" Width="100%" CssClass="add-staff-textbox"></asp:TextBox>
                        </div>
                        <div class="col span-1-of-12">
                            
                        </div>
                    </div>
                        
                </div>
                

                <!--  GENDER -->
                <div class="row">

                    <div class="col span-1-of-3">
                        <label class="registration-form-labels" for="gender">Gender</label>
                    </div>

                    <div class="col span-2-of-3">
                        <div class="col span-11-of-12">
                            <asp:DropDownList ID="DropDownList1" runat="server" Width="100%" CssClass="add-staff-textbox">
                                <asp:ListItem>--Select--</asp:ListItem>
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                </div>

                <!-- STREAM -->
                <div class="row">

                    <div class="col span-1-of-3">
                        <label class="registration-form-labels" for="stream">Stream</label>
                    </div>

                    <div class="col span-2-of-3">
                        <div class="col span-11-of-12">
                            <asp:DropDownList ID="DropDownList2" runat="server" Width="100%" CssClass="add-staff-textbox" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem>--Select--</asp:ListItem>
                                <asp:ListItem>Science</asp:ListItem>
                                <asp:ListItem>Commerce</asp:ListItem>
                                <asp:ListItem>Arts</asp:ListItem>
                            </asp:DropDownList>
                         </div>
                    </div>

                </div>

                <!--  SUB STREAM -->
                <div class="row">

                    <div class="col span-1-of-3">
                        <label class="registration-form-labels" for="sub_stream">Sub Stream</label>
                    </div>

                    <div class="col span-2-of-3">
                        <div class="col span-11-of-12">
                            <asp:DropDownList ID="DropDownList3" runat="server" placeholder="-Select-" Width="100%" CssClass="add-staff-textbox">
                                
                            </asp:DropDownList>
                        </div>
                    </div>

                </div>

                <!-- SEMESTER -->
                <div class="row">

                    <div class="col span-1-of-3">
                        <label class="registration-form-labels" for="semester">Semester</label>
                    </div>

                    <div class="col span-2-of-3">
                        <div class="col span-11-of-12">
                            <asp:DropDownList ID="DropDownList4" runat="server" Width="100%" CssClass="add-staff-textbox">
                                <asp:ListItem>--Select--</asp:ListItem>
                                <asp:ListItem>Semester 1</asp:ListItem>
                                <asp:ListItem>Semester 2</asp:ListItem>
                                <asp:ListItem>Semester 3</asp:ListItem>
                                <asp:ListItem>Semester 4</asp:ListItem>
                                <asp:ListItem>Semester 5</asp:ListItem>
                                <asp:ListItem>Semester 6</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                </div>

                <!-- ENROLLMENT NO -->
                <div class="row">
                    <div class="col span-1-of-3">
                        <label class="registration-form-labels" for="enrollment_no">Enrollment No</label>
                    </div>
                    <div class="col span-2-of-3">
                        
                        <div class="col span-11-of-12">
                            <asp:TextBox ID="TextBox6" runat="server" placeholder="Enrollment No" CssClass="add-staff-textbox" TextMode="Number" Width="100%"></asp:TextBox>
                        </div>
                        <div class="col span-1-of-12">
                            
                        </div>
                    </div>
                </div>

                <!-- USERNAME -->
                <div class="row">
                    <div class="col span-1-of-3">
                        <label class="registration-form-labels" for="username">Username</label>
                    </div>

                    <div class="col span-2-of-3">
                        
                        <div class="col span-11-of-12">
                            <asp:TextBox ID="TextBox7" runat="server" placeholder="Username" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox"></asp:TextBox>
                        </div>
                        <div class="col span-1-of-12">
                            
                        </div>
                    </div>
                        
                </div>

                <!-- PASSWORD -->
                <div class="row">
                    <div class="col span-1-of-3">
                        <label class="registration-form-labels" for="password">Password</label>
                    </div>

                    <div class="col span-2-of-3">
                        <div class="col span-11-of-12">
                            <asp:TextBox ID="TextBox8" runat="server" placeholder="Password" TextMode="Password" Width="100%" CssClass="add-staff-textbox"></asp:TextBox>
                        </div>
                        <div class="col span-1-of-12">
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="TextBox8" CssClass="required-field-validator"></asp:RequiredFieldValidator>--%>
                        </div>
                        
                    </div>
                        
                </div>

                <!-- RETYPE PASSWORD -->
                <div class="row">
                    <div class="col span-1-of-3">
                        <label class="registration-form-labels" for="confirm-password">Confirm Password</label>
                    </div>

                    <div class="col span-2-of-3">
                        <div class="col span-11-of-12">
                            <asp:TextBox ID="TextBox9" runat="server" placeholder="Confirm Password" TextMode="Password" Width="100%" CssClass="add-staff-textbox"></asp:TextBox>
                        </div>
                        <div class="col span-1-of-12">
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="TextBox8" CssClass="required-field-validator"></asp:RequiredFieldValidator>--%>
                        </div>
                        
                    </div>
                        
                </div>
               

                <!-- CHANGE STATUS - BUTTON -->
                <div class="row">
                        <!-- Smaller column -->
                        <div class="col span-1-of-3">
                            <label>&nbsp;</label>    
                        </div>
                        
                        <!-- Bigger column -->
                        <div class="col span-2-of-3" style="margin-top: 20px">
                            <asp:Button ID="Button1" runat="server" Text="Sign up" CssClass="btn btn-full" OnClick="Button1_Click" />
                            <asp:Button ID="Button4" runat="server" Text="Clear" CssClass="btn btn-full" OnClick="Button4_Click"/>
                        </div>    
                </div>
                
                    <%--</ContentTemplate>
                </asp:UpdatePanel>--%>
            </div> <!-- FORM ENDS HERE -->

        </div> <!-- row -->

    </section>

</div>  <!-- HIDE/SHOW -->

<!-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
<!-- ONE TIME PASSWORD SECTION -->
<!-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
   <div id="divOneTimePassword" runat="server">
    <section class="section-add-staff section-otp">
        <div class="row">
            <h2>One Time Password</h2>
        </div>

        <div class="row">
            <!-- form width -->
            <div class="registration-form">

                <div class="row">
                    <div class="col span-1-of-3">
                        <label class="registration-form-labels" for="email">Email ID</label>
                    </div>

                    <div class="col span-2-of-3">
                        <div class="col span-11-of-12">
                            <asp:TextBox ID="TextBox11" runat="server" placeholder="Email ID" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                        </div>
                    </div>
                        
                </div>

                <!-- ENTER OTP -->
                <div class="row">

                    <!-- LABEL -->
                    <div class="col span-1-of-3">
                        <label class="registration-form-labels" for="enter_otp">Enter OTP</label>
                    </div>

                    <!-- TEXTBOX & RESEND BUTTON -->
                    <div class="col span-2-of-3">
                        <div class="col span-11-of-12">
                        <div class="col span-1-of-2">
                            <asp:TextBox ID="TextBox10" runat="server" placeholder="Enter OTP" CssClass="add-staff-textbox" Width="100%" ReadOnly="False"></asp:TextBox>
                        </div>

                        <div class="col span-1-of-2">
                            <asp:Button ID="Button2" runat="server" Text="Re-send OTP" Style="width: 100%; font-size:95%; display: inline-block; background-color:#48b04f;border: 2px solid #48b04f; padding: 7px 20px; font-weight: 300; border-radius: 3px; text-decoration: none; transition: background-color 0.2s, border 0.2s, color 0.2s;" OnClick="Button2_Click"/>
                        </div>
                    </div>
                    </div>
                </div>

                <!-- SUBMIT BUTTON -->
                <div class="row">
                        <!-- Smaller column -->
                        <div class="col span-1-of-3">
                            <label>&nbsp;</label>    
                        </div>
                        
                        <!-- Bigger column -->
                        <div class="col span-2-of-3" style="margin-top: 20px">
                            <asp:Button ID="Button3" runat="server" Text="Submit" CssClass="btn btn-full" OnClick="Button3_Click"/>
                        </div>    
                </div>

            </div>
        </div>
    </section>
   </div> <!--divOneTimePassword (TO HIDE AND SHOW THIS PART) -->
    </form> 

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
