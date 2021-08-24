<%@ Page Title="" Language="C#" MasterPageFile="~/AdminModule/Admin.Master" AutoEventWireup="true" CodeBehind="ApproveStudent.aspx.cs" Inherits="StudentPortalSystemWebsite.AdminModule.ApproveStudent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        .section-approve-student {
            height: 1170px;
        }

        .section-modify-student {
            background-color: #f4f4f4;
            height: 1170px;
        }

        .section-delete-student {
            height: 1100px;
        }

        .section-student-table-grid-view {
            background-color: #f4f4f4;
            height: 770px;
        }

    </style>

    <title>Approve Student</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- MODIFY STUDENT STICKY NAV -->
    <div class="sticky-notice-nav">
        <ul>

            <!-- APPROVE STUDENT -->
            <li>
                <div class="notice-heading">
                    <a class="btn btn-full admin-js--scroll-to-approve-student" href="#ApproveStudent"><i class="notice-icon ion-ios-checkmark"></i></a>
                </div>
            </li>

            <!-- MODIFY STUDENT DETAILS -->
            <li>
                <div class="notice-heading">
                    <a class="btn btn-full admin-js--scroll-to-modify-student" href="#ModifyStudent"><i class="notice-icon ion-android-sync"></i></a>
                </div>
            </li>

            <!-- DELETE STUDENT -->
            <li>
                <div class="notice-heading">
                    <a class="btn btn-full admin-js--scroll-to-delete-student" href="#DeleteStudent"><i class="notice-icon ion-android-delete"></i></a>
                </div>
            </li>

            <!-- ALL NOTICE ENTRIES -->
            <li>
                <div class="notice-heading">
                    <a class="btn btn-ghost admin-js--scroll-to-student-table" href="#StudentEntries"><i class="notice-icon ion-android-attach"></i></a>
                </div>
            </li>

        </ul>
    </div>

    <!-- FORM -->
    
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            

    <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
    <!-- SECTION 1 (APPROVE STUDENT)-->
    <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
    <section class="section-approve-student admin-js--section admin-js--approve-student">
        <div class="admin-row">
            <h2>Approve Students</h2>
        </div>

        <div class="admin-row">

            <!-- STUDENT DETAILS -->
            
            <div class="form-width">
                
                <!-- USER ID - GET DETAILS BUTTON -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label1" runat="server" Text="User ID"></asp:Label>
                    </div>
                    <div class="col span-2-of-3">
                        <!-- DropDownList - STUDENT ID/USER ID -->
                        <div class="col span-1-of-2">
                                <asp:DropDownList ID="DropDownList1" runat="server" Width="100%" CssClass="add-staff-textbox">
                                </asp:DropDownList>
                        </div>
                        <!-- Get Student details - BUTTON -->
                        <div class="col span-1-of-2">
                            <!-- I am using inline css because changes made in css file are not making any changes over here -->
                            <asp:Button ID="Button2" runat="server" Text="Get user details" Style="font-size:95%; display: inline-block; background-color:#48b04f;border: 2px solid #48b04f; padding: 7px 20px; font-weight: 300; border-radius: 3px; text-decoration: none; transition: background-color 0.2s, border 0.2s, color 0.2s;" OnClick="Button2_Click"/>
                        </div>
                    </div>
                </div>
                

                <!-- USER ID -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label2" runat="server" Text="User ID"></asp:Label>
                    </div>

                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox1" runat="server" placeholder="User ID" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                    </div>
                </div>
                        
                <!-- FULL NAME -->
                <div class="admin-row">
                    <!-- LABEL -->  
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label3" runat="server" Text="Fullname"></asp:Label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox2" runat="server" placeholder="Fullname" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                    </div>
                </div>

                <!-- ADDRESS -->
                <div class="admin-row">
                    <!-- LABEL -->  
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label4" runat="server" Text="Address"></asp:Label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox3" runat="server" placeholder="Address" Height="90px" TextMode="MultiLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                    </div>
                </div>

                <!--  CONTACT NO -->
                <div class="admin-row">

                    <!-- LABEL -->
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label5" runat="server" Text="Contact No"></asp:Label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox4" runat="server" placeholder="Contact no." TextMode="Number" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                    </div>
                </div>

                <!--  EMAIL ID -->
                <div class="admin-row">
                    <!-- LABEL -->
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label6" runat="server" Text="Email ID"></asp:Label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox5" runat="server" placeholder="Email" TextMode="Email" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                    </div>
                </div>

                <!--  GENDER -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label7" runat="server" Text="Gender"></asp:Label>
                    </div>

                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox6" runat="server" placeholder="Gender" TextMode="Email" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                    </div>
                        
                </div>

                 <!-- STREAM -->
                <div class="admin-row">
                    <!-- LABEL -->
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label8" runat="server" Text="Stream"></asp:Label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox7" runat="server" placeholder="Stream" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                    </div>
                        
                </div>

                <!-- SUB-STREAM -->
                <div class="admin-row">
                    <!-- LABEL -->
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label9" runat="server" Text="Sub-stream"></asp:Label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox8" runat="server" placeholder="Sub-stream" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                    </div>
                        
                </div>

                <!-- SEMESTER -->
                <div class="admin-row">
                    <!-- LABEL -->
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label10" runat="server" Text="Semester"></asp:Label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox9" runat="server" placeholder="Semester" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                    </div>
                        
                </div>

                <!-- ENROLMENT NO -->
                <div class="admin-row">
                    <!-- LABEL -->
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label11" runat="server" Text="Enrollment No"></asp:Label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox10" runat="server" placeholder="Enrollment No" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                    </div>
                        
                </div>

                <!-- USERNAME -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label12" runat="server" Text="Username"></asp:Label>
                    </div>

                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox11" runat="server" placeholder="Username" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                        
                    </div>
                        
                </div>

                <!-- ACADEMIC YEAR -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label13" runat="server" Text="Academic Year"></asp:Label>
                    </div>

                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox12" runat="server" placeholder="Academic Year" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="False"></asp:TextBox>
                        
                    </div>
                        
                </div>


                <!-- CURRENT STATUS -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label41" runat="server" Text="Current status"></asp:Label>
                    </div>

                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox36" runat="server" placeholder="Current status" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                        
                    </div>
                        
                </div>

                <!--  STATUS -->
                <div class="admin-row">
                    <!-- LABEL -->
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label14" runat="server" Text="Status"></asp:Label>
                    </div>

                    <!-- DROP DOWN LIST -->
                    <div class="col span-2-of-3">
                        <asp:DropDownList ID="DropDownList2" runat="server" Width="100%" CssClass="add-staff-textbox">
                            <asp:ListItem>--Select--</asp:ListItem>
                            <asp:ListItem>ON</asp:ListItem>
                            <asp:ListItem>OFF</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                        
                </div>

                <!-- CHANGE STATUS - BUTTON -->
                <div class="admin-row">
                        <!-- Smaller column -->
                        <div class="col span-1-of-3">
                            <label>&nbsp;</label>    
                        </div>
                        
                        <!-- Bigger column -->
                        <div class="col span-2-of-3">
                            <asp:Button ID="Button1" runat="server" Text="Change Status" CssClass="btn btn-full module-form-btn" OnClick="Button1_Click"/>
                        </div>    
                    </div>

            </div>
            
        </div>

    </section>


    <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
    <!-- SECTION 2 (UPDATE STUDENT)-->
    <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
    <section class="section-modify-student admin-js--section admin-js--modify-student">

        <!-- SECTION HEADING - DELETE STAFF -->
        <div class="admin-row">
            <h2>Update Student Details</h2>
        </div>

        <!-- FORM -->
        <div class="admin-row">
            <div class="form-width">
                
                <!-- STAFF ID -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label15" runat="server" Text="Staff ID"></asp:Label>
                    </div>

                    <div class="col span-2-of-3">
                        <div class="col span-1-of-2">
                            <asp:DropDownList ID="DropDownList3" runat="server" Width="100%" CssClass="add-staff-textbox">
                            </asp:DropDownList>
                        </div>
                        <div class="col span-1-of-2">
                            <asp:Button ID="Button3" runat="server" Text="Get user details" Style="font-size:95%; display: inline-block; background-color:#48b04f;border: 2px solid #48b04f; padding: 7px 18px; font-weight: 300; border-radius: 3px; text-decoration: none; transition: background-color 0.2s, border 0.2s, color 0.2s;" OnClick="Button3_Click"/>
                        </div>
                    </div>
                </div>

                <!-- USER ID -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label16" runat="server" Text="User ID"></asp:Label>
                    </div>

                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox13" runat="server" placeholder="User ID" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                    </div>
                        
                <!-- FULLNAME -->
                <div class="admin-row">
                    <!-- LABEL -->  
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label17" runat="server" Text="Fullname"></asp:Label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox14" runat="server" placeholder="Fullname" CssClass="add-staff-textbox" ReadOnly="False"></asp:TextBox>
                    </div>
                </div>

                <!-- ADDRESS -->
                <div class="admin-row">
                    <!-- LABEL -->  
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label18" runat="server" Text="Address"></asp:Label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox15" runat="server" placeholder="Address" Height="90px" TextMode="MultiLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="False"></asp:TextBox>
                    </div>
                </div>

                 <!--  CONTACT NO -->
                <div class="admin-row">

                    <!-- LABEL -->
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label19" runat="server" Text="Contact No"></asp:Label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox16" runat="server" placeholder="Contact no." TextMode="Number" Width="100%" CssClass="add-staff-textbox" ReadOnly="False"></asp:TextBox>
                    </div>
                </div>

                <!--  EMAIL ID -->
                <div class="admin-row">
                    <!-- LABEL -->
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label20" runat="server" Text="Email ID"></asp:Label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox17" runat="server" placeholder="Email" TextMode="Email" Width="100%" CssClass="add-staff-textbox" ReadOnly="False"></asp:TextBox>
                    </div>
                </div>

                <!--  GENDER -->
                <div class="admin-row">
                    <!-- LABEL -->
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label21" runat="server" Text="Gender"></asp:Label>
                    </div>

                    <!-- DROP DOWN LIST -->
                    <div class="col span-2-of-3">
                        <asp:DropDownList ID="DropDownList6" runat="server" Width="100%" CssClass="add-staff-textbox">
                            <asp:ListItem>--Select--</asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                            <asp:ListItem>Other</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                        
                </div>

                 <!-- STREAM -->
                <div class="admin-row">
                    <!-- LABEL -->
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label22" runat="server" Text="Stream"></asp:Label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:DropDownList ID="DropDownList7" runat="server" Width="100%" CssClass="add-staff-textbox" AutoPostBack="True" OnSelectedIndexChanged="DropDownList7_SelectedIndexChanged">
                            <asp:ListItem>--Select--</asp:ListItem>
                                <asp:ListItem>Science</asp:ListItem>
                                <asp:ListItem>Commerce</asp:ListItem>
                                <asp:ListItem>Arts</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                        
                </div>


                <!-- CHANGE SUB-STREAM -->
                <div class="admin-row">
                    <!-- LABEL -->
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label23" runat="server" Text="Change Sub-stream"></asp:Label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:DropDownList ID="DropDownList8" runat="server" Width="100%" CssClass="add-staff-textbox" AutoPostBack="True" OnSelectedIndexChanged="DropDownList8_SelectedIndexChanged">
                            <asp:ListItem>--Select--</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                        
                </div>

                <!-- CURRENT SUB STREAM -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label43" runat="server" Text="Current Sub Stream"></asp:Label>
                    </div>

                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox18" runat="server" placeholder="Current Sub-stream" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                        
                    </div>
                        
                </div>

                <!-- SEMESTER -->
                <div class="admin-row">
                    <!-- LABEL -->
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label24" runat="server" Text="Semester"></asp:Label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:DropDownList ID="DropDownList9" runat="server" Width="100%" CssClass="add-staff-textbox">
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

                <!-- ENROLMENT NO -->
                <div class="admin-row">
                    <!-- LABEL -->
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label25" runat="server" Text="Enrollment No"></asp:Label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox22" runat="server" placeholder="Enrollment No" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="False"></asp:TextBox>
                    </div>
                        
                </div>

                <!-- USERNAME -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label26" runat="server" Text="Username"></asp:Label>
                    </div>

                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox23" runat="server" placeholder="Username" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="False"></asp:TextBox>
                        
                    </div>
                        
                </div>

                <!-- ACADEMIC YEAR -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label44" runat="server" Text="Academic Year"></asp:Label>
                    </div>

                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox19" runat="server" placeholder="Academic Year" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="False"></asp:TextBox>
                        
                    </div>
                        
                </div>

                    <!-- CURRENT STATUS -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label42" runat="server" Text="Current status"></asp:Label>
                    </div>

                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox37" runat="server" placeholder="Current status" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                        
                    </div>
                        
                </div>

                <!--  STATUS -->
                <div class="admin-row">
                    <!-- LABEL -->
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label40" runat="server" Text="Status"></asp:Label>
                    </div>

                    <!-- DROP DOWN LIST -->
                    <div class="col span-2-of-3">
                        <asp:DropDownList ID="DropDownList5" runat="server" Width="100%" CssClass="add-staff-textbox">
                            <asp:ListItem>--Select--</asp:ListItem>
                            <asp:ListItem>ON</asp:ListItem>
                            <asp:ListItem>OFF</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                        
                </div>

                <!-- UPDATE BUTTON -->
                <div class="admin-row">
                    <!-- NON BREAKING SPACE -->
                    <div class="col span-1-of-3">
                        <label>&nbsp</label>
                    </div>
                    <!-- BUTTON -->
                    <div class="col span-1-of-3">
                        <asp:Button ID="Button4" runat="server" Text="Update" CssClass="btn btn-full module-form-btn" OnClick="Button4_Click"/>
                    </div>
                </div>

            </div>
        </div>

    </section>


    <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
    <!-- SECTION 3 (DELETE STUDENT)-->
    <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
    <section class="section-delete-student admin-js--section admin-js--delete-student">

        <!-- SECTION HEADING - DELETE STAFF -->
        <div class="admin-row">
            <h2>Delete Student Details</h2>
        </div>

        <!-- FORM -->
        <div class="admin-row">
            <div class="form-width">
                
                <!-- USER ID -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label27" runat="server" Text="User ID"></asp:Label>
                    </div>

                    <div class="col span-2-of-3">
                        <div class="col span-1-of-2">
                            <asp:DropDownList ID="DropDownList4" runat="server" Width="100%" CssClass="add-staff-textbox">
                            </asp:DropDownList>
                        </div>
                        <div class="col span-1-of-2">
                            <asp:Button ID="Button5" runat="server" Text="Get user details" Style="font-size:95%; display: inline-block; background-color:#48b04f;border: 2px solid #48b04f; padding: 7px 18px; font-weight: 300; border-radius: 3px; text-decoration: none; transition: background-color 0.2s, border 0.2s, color 0.2s;" OnClick="Button5_Click"/>
                        </div>
                    </div>
                </div>

                <!-- USER ID -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label28" runat="server" Text="User ID"></asp:Label>
                    </div>

                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox24" runat="server" placeholder="User ID" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                    </div>
                        
                <!-- Fullname -->
                <div class="admin-row">
                    <!-- LABEL -->  
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label29" runat="server" Text="Fullname"></asp:Label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox25" runat="server" placeholder="Fullname" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                    </div>
                </div>

                <!-- ADDRESS -->
                <div class="admin-row">
                    <!-- LABEL -->  
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label30" runat="server" Text="Address"></asp:Label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox26" runat="server" placeholder="Address" Height="90px" TextMode="MultiLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                    </div>
                </div>

                 <!--  CONTACT NO -->
                <div class="admin-row">

                    <!-- LABEL -->
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label31" runat="server" Text="Contact No"></asp:Label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox27" runat="server" placeholder="Contact no." TextMode="Number" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                    </div>
                </div>

                <!--  EMAIL ID -->
                <div class="admin-row">
                    <!-- LABEL -->
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label32" runat="server" Text="Email ID"></asp:Label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox28" runat="server" placeholder="Email" TextMode="Email" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                    </div>
                </div>

                <!--  GENDER -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label33" runat="server" Text="Gender"></asp:Label>
                    </div>

                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox29" runat="server" placeholder="Gender" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                    </div>
                        
                </div>

                 <!-- STREAM -->
                <div class="admin-row">
                    <!-- LABEL -->
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label34" runat="server" Text="Stream"></asp:Label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox30" runat="server" placeholder="Stream" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                    </div>
                        
                </div>

                <!-- SUB-STREAM -->
                <div class="admin-row">
                    <!-- LABEL -->
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label35" runat="server" Text="Sub-stream"></asp:Label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox31" runat="server" placeholder="Sub-stream" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                    </div>
                        
                </div>

                <!-- SEMESTER -->
                <div class="admin-row">
                    <!-- LABEL -->
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label36" runat="server" Text="Semester"></asp:Label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox32" runat="server" placeholder="Semester" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                    </div>
                        
                </div>

                <!-- ENROLMENT NO -->
                <div class="admin-row">
                    <!-- LABEL -->
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label37" runat="server" Text="Enrollment No"></asp:Label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox33" runat="server" placeholder="Enrollment No" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                    </div>
                        
                </div>

                <!-- USERNAME -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label38" runat="server" Text="Username"></asp:Label>
                    </div>

                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox34" runat="server" placeholder="Username" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                        
                    </div>
                        
                </div>

                <!-- ACADEMIC YEAR -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label45" runat="server" Text="Academic Year"></asp:Label>
                    </div>

                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox20" runat="server" placeholder="Academic Year" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                        
                    </div>
                        
                </div>

                <!-- STATUS -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label39" runat="server" Text="Status"></asp:Label>
                    </div>

                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox35" runat="server" placeholder="Status" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                        
                    </div>
                        
                </div>

                <!-- DELETE BUTTON -->
                <div class="admin-row">
                    <!-- NON BREAKING SPACE -->
                    <div class="col span-1-of-3">
                        <label>&nbsp</label>
                    </div>
                    <!-- BUTTON -->
                    <div class="col span-1-of-3">
                        <asp:Button ID="Button6" runat="server" Text="Delete" CssClass="btn btn-full module-form-btn" OnClick="Button6_Click"/>
                    </div>
                </div>

            </div>
        </div>

    </section>
<!-- DELETE STUDENT -->

    
    <!-- --------------------------------------------- -->
        <!-- ALL STUDENT ENTRIES IN THE GRID VIEW -->
<!-- --------------------------------------------- -->
    <section id="StudentEntries" class="section-student-table-grid-view admin-js--student-table">
        <div class="admin-row">
            <h2>All Student Entries</h2>
        </div>

        <div class="admin-row">

            <!-- Sql Data Source -->
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentPortalSystem_dbConnectionString %>" SelectCommand="SELECT * FROM [Registration]"></asp:SqlDataSource>

            <div class="grid-view-data-table">
                
                <!-- TEST TYPE GRID VIEW -->
                <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="user_id" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="user_id" HeaderText="ID" ReadOnly="True" SortExpression="user_id" />
                        <asp:BoundField DataField="name" HeaderText="Full name" SortExpression="name" />
                        <asp:BoundField DataField="status" HeaderText="Account Status" SortExpression="status" />
                        <asp:BoundField DataField="otp" HeaderText="OTP" SortExpression="otp" />
                        <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
                        <asp:BoundField DataField="enrollment_no" HeaderText="Enrollment no" SortExpression="enrollment_no" />
                    </Columns>
                </asp:GridView>

            </div>
        </div>

    </section>

    </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
