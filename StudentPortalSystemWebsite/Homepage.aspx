<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="StudentPortalSystemWebsite.Homepage" %>


<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    
        <!-- character encoding NOTE: we must include this in every website -->
        <meta charset="utf-8"/>
        
        <!-- ESSENTIAL PART WHEN BUILDING A RESPONSIVE WEBSITE -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
       
        <!-- Description of the website will be displayed below the link after it occur in the search result -->
        <meta name="description" content="Student Portal System is a online portal for students where data of student as well as of staff is managed, this increases the efficiency of the staff members by managing the all the data online"/>
        
        <!-- THIS FILE DOWNLOAD FROM GOOGLE "normalize.css"-->
        <!-- normalize.css render all element more consistently, It precisely targets only the styles that need normalizing. -->
        <!-- Its like a reset CSS, Which will make CSS look same in all browser -->
        <link rel="stylesheet" type="text/css" href="~/vendors/css/normalize.css" runat="server"/>
        
        <!-- grid css -->
        <link rel="stylesheet" type="text/css" href="~/vendors/css/grid.css" runat="server"/>
        
        <!-- ionicons css -->
        <link rel="stylesheet" type="text/css" href="~/vendors/css/ionicons.min.css" runat="server"/>
        
        <!-- animate.css-->
        <link rel="stylesheet" type="text/css" href="~/vendors/css/animate.css" runat="server"/>
        
        <!-- Linking CSS file(My created CSS file) -->
        <link rel="stylesheet" type="text/css" href="~/resources/css/style.css" runat="server"/>
        
        <!-- queries.css file (for better viewing experience in different device sizes) -->
        <link rel="stylesheet" type="text/css" href="~/resources/css/queries.css" runat="server"/>
        
        <!-- Font : LATO
            STYLE : Thin 100
                    Light 300 
                    Light 300 italic
                    Regular 400
                    Regular 400 italic
                    Bold 700-->
        <!-- NOTE : DON'T DOWNLOAD THE WHOLE FONT FAMILY BECAUSE THIS WILL DIRECTLY AFFECT THE PAGE LOAD SPEED -->
        <link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;1,300;1,400&display=swap" rel="stylesheet"/>

        <!-- Title will be displayed on the window tab of the browser-->
        <title>Student Portal System</title>

</head>


<body>
    <form id="form1" runat="server">
        <!-- ------------------------------ -->
        <!-- PRE - LOADER -->
        <!-- ------------------------------ -->
        


    <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
        <!-- MAIN HEADING (LOGO , NAVIGATION BAR, CALL TO ACTION BUTTON -->
        <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
        <header id="homePageHeader" class="home-page-header">
           
            <nav>
              
               
                <div class="row">
                   
                    <!-- OMNIFOOD LOGO -->
                    <!-- White logo -->
                    <img src="resources/img/1LogoWhite.png" alt="College logo" class="logo"/>
                    <!-- Black logo (For sticky navigation) -->
                    <a href="#homePageHeader">
                        <img src="resources/img/1LogoBlack.png" alt="College logo" class="logo-black"/>
                    </a>

                    <!-- MAIN NAVIGATION BAR -->
                    <ul class="main-nav js--main-nav">
                        <!-- we will create some anchors inside href attributes (id = #idname)-->
                       <li>
                            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Home</asp:LinkButton>
                        </li>
                        <li>
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Logout</asp:LinkButton>
                        </li>
                        <li> <a href="#features">Features</a></li>
                        <li> <a href="#works">How it works</a></li>
                        <li> <a href="#cities">Notice</a></li>
                        <li>
                            <asp:HyperLink ID="HyperLink1" href="#plans" runat="server">Sign up</asp:HyperLink>
                        </li>
                    </ul>
                    
                    <a class="mobile-nav-icon js--nav-icon"><i class="ion-navicon-round"></i></a>
                    
                </div>
                
                
            </nav>
            
            <!-- HEADING -->
            <div class="hero-text-box">
                <!-- HEADING -->
                <h1>The expert in anything<br/>was once a beginner.</h1>
                <!-- CALL TO ACTION BUTTONS -->
                <a class="btn btn-full js--scroll-to-plans" href="#">Sign Up</a>
                <a class="btn btn-ghost js--scroll-to-start" href="#">Show me more</a>
            </div>
        </header>


    <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
    <!-- CONTENT PLACE HOLDER -->
    <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
    
    <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
        <!-- SECTION 1 (FEATURES)-->
        <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
        <section class="section-features js--section-features" id="features">
            <div class="row">
                <!-- Every website should have only one h1 heading element. So, that is why we are using h2 element here -->
                <!-- In html we have special characters and special entities so for a dash we'll use the same i.e &mdash; -->
                <h2>Aim for success &mdash; not perfection</h2>
                <p class="long-copy">
                    Hello, this website is built to save time of our student, here they can view their attendance, marks and get updated about the upcoming events and many more!
                </p>
            </div>
            
            <div class="row js--wp-1"> <!-- js--wp-1 class is for animate all four column inside this section -->
                <!-- now here come the part of grid.css 
                this "span-1-of-4" class that we are using is to divide the spacefor 4 sections and there are many other classes as well -->
                
                <!-- COLUMN 1 -->
                <div class="col span-1-of-4 box">
                    <!-- ICON -->
                    <i class="ion-ios-infinite-outline icon-big"></i>
                    
                    <h3>24/7 Access</h3>
                    
                    <p>With the help of internet connection and
                    any installed browser in your system, you can have access this website
                    24/7.
                    </p>
                    
                </div>
                
                <!-- COLUMN 2 -->
                <div class="col span-1-of-4 box">
                    <!-- ICON -->
                    <i class="ion-ios-paper-outline icon-big"></i>
                    
                    <h3>Notice</h3>
                    
                    <p>Each and every notice will be updated on the website, if incase you think you have miss something, then you can check it here.
                    </p>
                    
                </div>
                
                <!-- COLUMN 3 -->
                <div class="col span-1-of-4 box">
                    <!-- ICON -->
                    <i class="ion-ios-compose-outline icon-big"></i>
                    
                    <h3>Easy to use</h3>
                    
                    <p>This website is built in such a way that any user can operate it with ease. simple UI make it easier to navigate from one page to another.
                    </p>
                    
                </div>
                
                <!-- COLUMN 4 -->
                <div class="col span-1-of-4 box">
                    <!-- ICON -->
                    <i class="ion-ios-time-outline icon-big"></i>
                    
                    <h3>Save time</h3>
                    
                    <p>Every notice and upcoming event details will be shared here. if you have any enquiry then you can contact our college staff's from the website.
                    </p>
                    
                </div>
                
            </div>
            
        </section>
        
        
        
        <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
        <!-- SECTION 2 (IMAGES WITH EFFECT)-->
        <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
        <section class="section-meals">
            <!-- Now, as we want this section to occupy full width so we'll not use row class here-->
            <!-- We'll use unordered list for each line/row -->
            
            <!-- ROW 1 (PICTURES) -->
            <ul class="meals-showcase clearfix">
               <!-- 1st PICTURE -->
                <li>
                    <!-- FIGURE IS ALSO A TYPE OF CONTAINER FOR ILLUSTRATOR, PHOTOS, ETC IN HTML -->
                    <figure class="meal-photo">
                        <img src="resources/img/1GirlStudying.jpg" alt="Girl Reading Book"/>
                    </figure>
                </li>
                
                <!-- 2nd PICTURE -->
                <li>
                    <figure class="meal-photo">
                        <img src="resources/img/2Writing.jpg" alt="Writing"/>
                    </figure>
                </li>
                
                <!-- 3rd PICTURE -->
                <li>
                    <figure class="meal-photo">
                        <img src="resources/img/3GraduatedGirl.jpg" alt="Happy Graduated Girl"/>
                    </figure>
                </li>
                
                <!-- 4th PICTURE -->
                <li>
                    <figure class="meal-photo">
                        <img src="resources/img/4Teaching.jpg" alt="Teaching"/>
                    </figure>
                </li>
                
            </ul>
            
            <!-- ROW 2 (PICTURES) -->
            <ul class="meals-showcase clearfix">
               <!-- 5th PICTURE -->
                <li>
                    <figure class="meal-photo">
                        <img src="resources/img/5Typing.jpg" alt="Typing on a laptop"/>
                    </figure>
                </li>
                
                <!-- 6th PICTURE -->
                <li>
                    <figure class="meal-photo">
                        <img src="resources/img/6Searchingbook.jpg" alt="Searching Book in library"/>
                    </figure>
                </li>
                
                <!-- 7th PICTURE -->
                <li>
                    <figure class="meal-photo">
                        <img src="resources/img/7GirlReadingBook.jpg" alt="Girl Reading Book"/>
                    </figure>
                </li>
                
                <!-- 8th PICTURE -->
                <li>
                    <figure class="meal-photo">
                        <img src="resources/img/8BoyStudying.jpg" alt="Boy Studying"/>
                    </figure>
                </li>
                
            </ul>
            
        </section>
   
                  
                  
        <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
        <!-- SECTION 3 (HOW IT WORKS)-->
        <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
        <section class="section-steps" id="works">
            
            <!-- TITLE -->
            <div class="row">
                <h2>Mobile app &mdash; Coming soon</h2>
            </div>
            
            <div class="row">
                <!-- COLUMN 1 (iPhone image) -->
                <div class="col span-1-of-2 steps-box">
                    <img src="resources/img/iphoneapp.png" alt="Omnifood app on iPhone" class="app-screen js--wp-2"/> <!-- We just want this image to be animated so, we will put this class (js--wp-2) here -->
                </div>
                
                <!-- COLUMN 2 (Steps) -->
                <div class="col span-1-of-2 steps-box">
                    <!-- STEP 1 -->
                    <div class="works-step">
                        <div>1</div>
                        <p>
                            Enroll in our college for the course that best fits you and sign up on our website.
                        </p>
                    </div>
                    
                    <!-- STEP 2 -->
                    <div class="works-step">
                        <div>2</div>
                        <p>
                            After signing up wait for your account to get activated!
                        </p>
                    </div>
                    
                    <!-- STEP 3 -->
                    <div class="works-step">
                        <div>3</div>
                        <p>
                            Enjoy the benefits. See you next time!
                        </p>
                    </div>
                    
                    <!-- App Store button --> 
                    <!--
                    <a href="#" class="btn-app">
                        <img src="resources/img/download-app-android.png" alt="App store button">
                    </a>
                    -->
                    
                    <!-- Play Store button -->
                    <a href="#" class="btn-app">
                        <img src="resources/img/download-app-android.png" alt="Play store button"/>
                    </a>
                    
                </div>
            </div>
            
        </section>
        
        
        
        <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
        <!-- SECTION 4 (NOTICE SECTION)-->
        <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
        <section class="section-cities" id="cities">
            
            <!-- TITLE -->
            <div class="row">
                <h2>Notice</h2>
            </div>
            
            <div class="row js--wp-3"> <!-- I want to add animation to all cities column so js--wp-3 will come here in the parent class of all four col -->
                
                
                <!-- NOTICE 1 -->
                <div class="col span-1-of-4 box notice-style">
                   
                    <img src="resources/img/lisbon-3.jpg" alt="Lisbon"/>
                    <h3>Notice 1</h3>
                    
                    <div>
                        <p class="notice-text">Text here.</p>
                    </div>
                    
                    <div>
                        <a href="#" class="btn btn-ghost">Read more</a>
                    </div>
                    
                </div>    
                
                
                <!-- NOTICE 2 -->
                <div class="col span-1-of-4 box notice-style">
                   
                    <img src="resources/img/san-francisco.jpg" alt="San Francisco"/>
                    <h3>Notice 2</h3>
                    
                    <div>
                        <p class="notice-text">Text here.</p>
                    </div>
                    
                    <div>
                        <a href="#" class="btn btn-ghost">Read more</a>
                    </div>
                    
                </div>    
                
                
                <!-- NOTICE 3 -->
                <div class="col span-1-of-4 box notice-style">
                   
                    <img src="resources/img/berlin.jpg" alt="Berlin"/>
                    <h3>Notice 3</h3>
                    
                    <div>
                        <p class="notice-text">Text here.</p>
                    </div>
                    
                    <div>
                        <a href="#" class="btn btn-ghost">Read more</a>
                    </div>
                    
                </div>    
                
                
                <!-- NOTICE 4 -->
                <div class="col span-1-of-4 box notice-style">
                   
                    <img src="resources/img/london.jpg" alt="London"/>
                    <h3>Notice 4</h3>
                    
                    <div>
                        <p class="notice-text">Text here.</p>
                    </div>
                    
                    <div>
                        <a href="#" class="btn btn-ghost">Read more</a>
                    </div>
                    
                </div>    
                
            </div>
            
            
            
        </section>
        
        
        
        <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
        <!-- SECTION 5 (CUSTOMER TESTIMONIALS)-->
        <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
        <section class="section-testimonials">
            
            <!-- TITLE -->
            <div class="row">
                <h2>Our students review</h2>
            </div>
            
            <div class="row">
                
                
                <!-- STUDENT 1 -->
                <div class="col span-1-of-3">
                    <!-- we will use blockquote to represent our customers review and inside block quote we'll use cite element where we will mention the name of that customer -->
                    <blockquote>
                        College has one of the best infrastructure and other needed facilities for its students and staff members. The course curriculum is up to date, and you also get practical exposure to get industry-ready.
                        <cite><img src="resources/img/customer-1.jpg" alt="Customer 1 photo"/>Bhuvan Bam</cite>
                    </blockquote>
                </div>
                
                <!-- STUDENT 2 -->
                <div class="col span-1-of-3">
                    <!-- we will use blockquote to represent our customers review and inside block quote we'll use cite element where we will mention the name of that customer -->
                    <blockquote>
                        College infrastructure is very beautiful and clean. My course is very well formulated keeping in mind the needs and the capability of student and my curriculum is so well designed that help me to avoid lots of pressure.
                        <cite><img src="resources/img/customer-2.jpg" alt="Customer 2 photo"/>Suhani shah</cite>
                    </blockquote>
                </div>
                
                <!-- STUDENT 3 -->
                <div class="col span-1-of-3">
                    <!-- we will use blockquote to represent our customers review and inside block quote we'll use cite element where we will mention the name of that customer -->
                    <blockquote>
                        I am studying Bachelor's in Information Technology. The quality of teaching is really appreciable and also the teachers are well qualified. There is a big library having thousands of books over there.
                        <cite><img src="resources/img/customer-3.jpg" alt="Customer 3 photo"/>Ashish Chanchlani</cite>
                    </blockquote>
                </div>
                
            </div>
            
        </section>
        
        
        
        <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
        <!-- SECTION 6 (SIGN IN AND SIGN UP)-->
        <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->

     <!-- ADD DIV TAG TO HIDE WHEN USER IS LOGGED IN -->
    <div runat="server" id="signUpSection">

        <section class="section-plans js--section-plans" id="plans">

            <!-- TITLE -->
            <div class="row">
                <h2>Sign up and get started today</h2>
            </div>
            
            <div class="row">
               
                <!-- ------------------------------------------------------------ -->
                <!-- ------------------------------------------------------------ -->
                <!-- ------------------------------------------------------------ -->
                <!-- ADMIN LOGIN - 1 -->
                <div class="col span-1-of-3">
                    
                    <div class="plan-box">
                        
                        <!-- ------------------------------------------------------------ -->
                        <!-- HEADING -->
                        <div class="sign-up-height"> <!-- i've used this class to make the height of the img div of three images look same  -->
                            
                            <h3>Admin login</h3>
                            <figure class="news-photo">
                                <img src="resources/img/admin.svg" alt="Admin login page illustration"/>
                            </figure>
                            
                        </div>
                        
                        <!-- ------------------------------------------------------------ -->
                        <!-- DETAILS -->
                        <div>
                            
                            <p>Only Admin credential will work here.</p>
                            
                        </div>
                        
                        <!-- ------------------------------------------------------------ -->
                        <!-- SIGN UP BUTTON -->
                        <div>
                            
                            <a href="AdminModule/Default.aspx" class="btn btn-ghost">Sign in</a>
                            
                        </div>
                        
                    </div>
                    
                </div>
                <!-- ------------------------------------------------------------ -->
                <!-- ------------------------------------------------------------ -->
                <!-- ------------------------------------------------------------ -->
                <!-- STUDENT LOGIN - 2 -->
                <div class="col span-1-of-3 js--wp-4">
                    
                    <div class="plan-box">
                        
                        <!-- ------------------------------------------------------------ -->
                        <!-- HEADING -->
                        <div class="sign-up-height"> <!-- i've used this class to make the height of the img div look same  -->
                            
                            <h3>Student login</h3>
                            <figure class="news-photo">
                                <img src="StudentModule/resources/img/Student_Standing_on_book.svg" alt="Student login page illustration"/>
                            </figure>
                            
                        </div>
                        
                        <!-- ------------------------------------------------------------ -->
                        <!-- DETAILS -->
                        <div>
                            
                            <p>Only Student credential will work here.</p>
                            
                        </div>
                        
                        <!-- ------------------------------------------------------------ -->
                        <!-- SIGN UP BUTTON -->
                        <div>
                            
                            <a href="StudentModule/Default.aspx" class="btn btn-full">Sign in</a>
                            
                        </div>
                        
                    </div>
                    
                </div>
                
                <!-- ------------------------------------------------------------ -->
                <!-- ------------------------------------------------------------ -->
                <!-- ------------------------------------------------------------ -->
                <!-- STAFF LOGIN -->
                <div class="col span-1-of-3">
                    
                    <div class="plan-box">
                        
                        <!-- ------------------------------------------------------------ -->
                        <!-- HEADING -->
                        <div class="sign-up-height"> <!-- i've used this class to make the height of the img div look same  -->
                            
                            <h3>Staff login</h3>
                            <figure class="news-photo">
                                <img src="StaffModule/resources/img/Staff_ideas_flow.svg" alt="Staff login page illustration"/>
                            </figure>
                            
                        </div>
                        
                        <!-- ------------------------------------------------------------ -->
                        <!-- DETAILS -->
                        <div>
                            
                            <p>Only Staff credential will work here.</p>
                            
                        </div>
                        
                        <!-- ------------------------------------------------------------ -->
                        <!-- SIGN UP BUTTON -->
                        <div>
                            
                            <a href="StaffModule/Default.aspx" class="btn btn-ghost">Sign in</a>
                            
                        </div>
                        
                    </div>
                    
                </div>
                
                
                
            </div>
            
        </section>
    
    </div>
        
        
        <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
        <!-- SECTION 7 (FORM)-->
        <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
        <section class="section-form">
            
            <!-- TITLE -->
            <div class="row">
                <h2>We're happy to hear from you</h2>    
            </div>
            
            <div class="row">
                
                <!-- FORM STARTS FROM HERE -->
                <div class="contact-form">
                   
                    <!-- NOTE: YOU WILL NOTICE THAT WE HAVE GIVEN EVERY INPUT ELEMENT A ID BECAUSE OF WHICH WE HAVE USED FOR ATTRIBUTE IN THE LABEL ELEMENT
                    SO, WHEN WE WILL CLICK ON LABEL NAME THEN THE TEXT AREA WILL BE HIGHLIGHTED -->
                    
                    <!-- ################################################# -->
                    <!-- NAME -->
                    <div class="row">
                        <!-- Smaller column -->
                        <div class="col span-1-of-3">
                            <label for="name">Name</label>    
                        </div>
                        
                        <!-- Bigger column -->
                        <div class="col span-2-of-3">
                            <asp:TextBox ID="TextBoxName" runat="server" placeholder="Your name" TextMode="SingleLine" Width="100%"></asp:TextBox>
                            <!--
                            <input type="text" name="name" id="name" placeholder="Your name" required>  
                            -->
                        </div>    
                    </div>
                    
                    <!-- ################################################# -->
                    <!-- EMAIL -->
                    <div class="row">
                        <!-- Smaller column -->
                        <div class="col span-1-of-3">
                            <label for="email">Email</label>    
                        </div>
                        
                        <!-- Bigger column -->
                        <div class="col span-2-of-3">
                            <asp:TextBox ID="TextBoxEmail" runat="server" placeholder="Your email" TextMode="SingleLine" Width="100%"></asp:TextBox>
                            <!--
                            <input id="email" runat="server" type="email" name="email"  placeholder="Your email" required>  
                            -->
                        </div>    
                    </div>
                    
                    <!-- ################################################# -->
                    <!-- HOW DID YOU FIND US? -->
                    <div class="row">
                        <!-- Smaller column -->
                        <div class="col span-1-of-3">
                            <label for="find-us">How did you find us?</label>    
                        </div>
                        
                        <!-- Bigger column -->
                        <div class="col span-2-of-3">
                            <select name="find-us" id="find-us">
                                <option value="friends" selected>Friends</option>
                                <option value="search">Search engine</option>
                                <option value="ad">Advertisement</option>
                                <option value="other">Other</option>
                            </select>      
                        </div>    
                    </div>
                    
                    
                    <!-- ################################################# -->
                    <!-- NEWSLETTER -->
                    <div class="row">
                        <!-- Smaller column -->
                        <div class="col span-1-of-3">
                            <label>Newsletter?</label>    
                        </div>
                        
                        <!-- Bigger column -->
                        <div class="col span-2-of-3">

                            <input type="checkbox" name="news" id="news" checked/>Yes, please       
                        </div>    
                    </div>
                    
                    
                    <!-- ################################################# -->
                    <!-- DROP US A LINE -->
                    <div class="row">
                        <!-- Smaller column -->
                        <div class="col span-1-of-3">
                            <label>Drop us a line</label>    
                        </div>
                        
                        <!-- Bigger column -->
                        <div class="col span-2-of-3">
                            <asp:TextBox ID="TextBoxMessage" runat="server" placeholder="Your message" Height="90px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                            <!--
                            <textarea name="message" placeholder="Your message"></textarea>
                            -->
                        </div>    
                    </div>
                    
                    
                    <!-- ################################################# -->
                    <!-- SUBMIT BUTTON -->
                    <div class="row">
                        <!-- Smaller column -->
                        <div class="col span-1-of-3">
                            <label>&nbsp;</label>    
                        </div>
                        
                        <!-- Bigger column -->
                        <div class="col span-2-of-3">
                            <asp:Button ID="Button1" runat="server" Text="Send it!" CssClass="btn btn-full" OnClick="Button1_Click"/>
                            <!--
                            <input type="submit" value="Send it!">
                            -->
                        </div>    
                    </div>
                    
                </div> <!-- FORM ENDS HERE -->
                
            </div> <!-- class = admin-row -->
            
        </section>
    
        
        <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
        <!-- SECTION 8 (FOOTER)-->
        <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
        <footer>
            
            <div class="row">
                
                <!-- LEFT NAVIGATION -->
                <div class="col span-1-of-2">
                    
                    <ul class="footer-nav">
                        <li><a href="#">About us</a></li>
                        <li><a href="#">Blog</a></li>
                        <li><a href="#">News</a></li>
                        <li><a href="#">iOS App</a></li>
                        <li><a href="#">Android App</a></li>
                    </ul>
                    
                </div>
                
                <!-- RIGHT NAVIGATION -->
                <div class="col span-1-of-2">
                    
                    <ul class="social-links">
                        <li><a href="#"><i class="ion-social-facebook"></i></a></li>
                        <li><a href="#"><i class="ion-social-twitter" id="footer-icon-twitter"></i></a></li>
                        <li><a href="#"><i class="ion-social-googleplus"></i></a></li>
                        <li><a href="#"><i class="ion-social-instagram"></i></a></li>
                    </ul>
                    
                </div>
                
            </div>
            
            <!-- COPYRIGHT LINE -->
            <div class="row">
                
                <p>
                    Copyright &copy; 2020 by Student Portal System. All right reserved.
                </p>
                
            </div>
            
        </footer>
        
    </form> <!-- FORM ENDS HERE -->
        
        <!-- ******************************************************************************** -->
        <!-- TO MAKE OUR WEBSITE LOOK THE SAME IN OLDER BROWSER OR THE OLDER VERSIONS WE'LL USE THE JAVASCRIPT FILES WHICH ARE DOWNLOADED FROM jsdelivr.com -->
        <!-- ******************************************************************************** -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>


    <script src="vendors/js/respond.min.js"></script>
    <script src="vendors/js/html5shiv.min.js"></script>
    <script src="vendors/js/selectivizr.min.js"></script>
    <script src="vendors/js/jquery.waypoints.min.js"></script>
    <script src="resources/js/script.js"></script>

</body>
</html>
