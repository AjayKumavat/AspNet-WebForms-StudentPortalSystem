<%@ Page Title="" Language="C#" MasterPageFile="~/StaffModule/Staff.Master" AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="StudentPortalSystemWebsite.StaffModule.Attendance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        .section-add-student-details {
            height: 590px;
        }

        .section-mark-attendance-table-grid-view {
            height: 790px;
            background-color: #f4f4f4;
        }

        /* Student Details card*/
        .student-details-card {
            display: block;
            height: 260px;
            cursor: pointer;
            background-color: #96c0aa;
            border-radius: 15px;
            padding: 20px 20px;
            color: #224C36;
            transform: scale(0.9);
            transition: all 0.4s;
        }

        .student-details-card:hover {
            transform: scale(1);
            background-color: #224C36;
            color: #96c0aa;
            transition: all 0.4s;
        }

        .fullname-card i {
            font-size: 140%;
            padding-right: 10px;
        }
        .fullname-card{
            display: block;
            margin: 0 auto;
            margin-bottom: 10px;
            font-size: 100%;
        }
        .card-row {

        }
        
        /* xxxxxxxxx Student Details Card xxxxxxxxx */

        /* RADIO BUTTON  */
        .student-attendance-status {
            margin-top: 75px;
            text-align: center;
        }

        .radio-button-attendance {
            display: block;
            width: 120px;
            margin: 0 auto; /* CENTERED */
            padding: 8px 0;
            text-align: center;
            border-radius: 30px;
            color: #fff;

        }

        .radio-button-present {
            background-color: #27b376;
        }

        .radio-button-absent {
            margin-top: 20px;
            background-color: #bf212f;
        }
        /* xxxxxxxxxxxxx RADIO BUTTON xxxxxxxxxxxxx */

        /* ADD ATTENDANCE BUTTON - BELOW GRID VIEW 1*/
        .btn-center {
            display: block !important;
            margin-left: auto !important;
            margin-right: auto !important;
        }

    </style>

    <title>Add Attendance</title>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- NOTICE STICKY NAV -->
    <div class="sticky-notice-nav">
        <ul>

            <!-- ADD NOTICE -->
            <li>
                <div class="notice-heading">
                    <a class="btn btn-full admin-js--scroll-to-add-notice" href="#AddNotice"><i class="notice-icon ion-android-settings"></i></a>
                </div>
            </li>

            <!-- TEST TYPE DETAILS -->
            <%--<li>
                <div class="notice-heading">
                    <a class="btn btn-full admin-js--scroll-to-update-notice" href="#UpdateNotice"><i class="notice-icon ion-android-clipboard"></i></a>
                </div>
            </li>--%>

            <!-- DELETE NOTICE -->
            <li>
                <div class="notice-heading">
                    <a class="btn btn-ghost admin-js--scroll-to-delete-notice" href="#DeleteNotice"><i class="notice-icon ion-compose"></i></a>
                </div>
            </li>

            <!-- ALL NOTICE ENTRIES -->
            <%--<li>
                <div class="notice-heading">
                    <a class="btn btn-ghost admin-js--scroll-to-notice-table" href="#NoticeEntries"><i class="notice-icon ion-android-attach"></i></a>
                </div>
            </li>--%>

        </ul>
    </div>


    <!-- SCRIPT MANAGER -->
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
       <ContentTemplate>


<!-- --------------------------------------------- -->
        <!-- ADD ATTENDANCE DETAILS SECTION -->
<!-- --------------------------------------------- -->
    <section class="section-add-student-details admin-js--section admin-js--add-notice">


        <!-- HEADING -->
        <div class="admin-row">
            <h2>Filter Student Record</h2>
        </div>

        <div class="admin-row">

            

                    <!-- ADD STUDENT MARKS -->
                    <div class="form-width">

                        <!-- DATE -->
                        <div class="admin-row">
                            <!-- LABEL -->  
                            <div class="col span-1-of-3">
                                <asp:Label ID="Label1" runat="server" Text="Date"></asp:Label>
                            </div>

                            <!-- TEXTBOX -->
                            <div class="col span-2-of-3">
                                <asp:TextBox ID="TextBox1" runat="server" placeholder="Date" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>

                        
                        <!--  SELECT STREAM -->
                        <div class="admin-row">
                            <div class="col span-1-of-3">
                                <label for="stream">Stream</label>
                            </div>

                            <div class="col span-2-of-3">
                                <asp:DropDownList ID="DropDownList1" runat="server" Width="100%" CssClass="add-staff-textbox" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                    <asp:ListItem>--Select--</asp:ListItem>
                                    <asp:ListItem>Science</asp:ListItem>
                                    <asp:ListItem>Commerce</asp:ListItem>
                                    <asp:ListItem>Arts</asp:ListItem>
                                </asp:DropDownList>

                            </div>
                        
                        </div>


                        <!--  SELECT SUB STREAM -->
                        <div class="admin-row">
                            <div class="col span-1-of-3">
                                <label for="sub_stream">Sub Stream</label>
                            </div>

                            <div class="col span-2-of-3">
                                <asp:DropDownList ID="DropDownList2" runat="server" Width="100%" CssClass="add-staff-textbox" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                    <asp:ListItem>--Select--</asp:ListItem>
                                </asp:DropDownList>

                            </div>
                        
                        </div>

                        <!-- SELECT SEMESTER -->
                        <div class="admin-row">
                            <div class="col span-1-of-3">
                                <label for="semester">Semester</label>
                            </div>

                            <div class="col span-2-of-3">
                                <asp:DropDownList ID="DropDownList3" runat="server" Width="100%" CssClass="add-staff-textbox" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
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

                        <!-- YEAR -->
                        <div class="admin-row">
                            <div class="col span-1-of-3">
                                <label for="year">Year</label>
                            </div>

                            <div class="col span-2-of-3">
                                <asp:DropDownList ID="DropDownList4" runat="server" Width="100%" CssClass="add-staff-textbox">
                                    <asp:ListItem>--Select--</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        
                        </div>
                

                        <!-- SAVE MARKS - BUTTON -->
                        <div class="admin-row">
                                <!-- Smaller column -->
                                <div class="col span-1-of-3">
                                    <label>&nbsp;</label>    
                                </div>
                        
                                <!-- Bigger column -->
                                <div class="col span-2-of-3">

                                    <asp:Button ID="Button1" runat="server" Text="Get Student Details" CssClass="btn btn-full module-form-btn" OnClick="Button1_Click"/>

                                </div>    
                        </div>

                    </div> <!-- FORM END HERE -->


        </div>

    </section>

    

    <!-- --------------------------------------------- -->
        <!-- ALL STUDENT ENTRIES IN THE GRID VIEW -->
<!-- --------------------------------------------- -->
    <section id="sectionAddStudentMarks" class="section-mark-attendance-table-grid-view admin-js--delete-notice" runat="server">
        <div class="admin-row">

            <!-- SECTION HEADING -->
            <h2>Mark Attendance</h2>
        </div>

        <div class="admin-row">

            <!-- Sql Data Source -->
            

            <div class="grid-view-data-table">
                
                <!-- TEST TYPE GRID VIEW -->
                <asp:GridView ID="GridView1" CssClass="enter-marks-data-table table table-striped table-bordered" runat="server" AutoGenerateColumns="False" AllowPaging="False" OnRowDataBound="OnRowDataBound" OnPageIndexChanging="OnPageIndexChanging">


                    <Columns>

    <asp:BoundField DataField="user_id" HeaderText="ID">

                        </asp:BoundField>


                        <asp:TemplateField HeaderText="Student Details">
                            <ItemTemplate>

                                <div class="student-details-card">

                                    <div class="fullname-card">
                                        <i class="ion-android-person"></i>
                                        <asp:Label ID="Label3" runat="server" Text='<%#Eval("name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                    </div>



                                    <div class="other-details">

                                        <div class="card-row">

                                            <div class="col span-3-of-12">
                                                <asp:Label ID="Label15" runat="server" Text="Student ID" Font-Bold="True" Font-Size="Medium"></asp:Label>
                                            </div>

                                            <div class="col span-9-of-12">
                                                <asp:Label ID="Label17" runat="server" Text='<%#Eval("user_id") %>' Font-Bold="True" Font-Size="Medium"></asp:Label>
                                            </div>

                                        </div>

                                        <div class="card-row">
                                            <div class="col span-3-of-12">
                                                <asp:Label ID="Label10" runat="server" Text="Roll No" Font-Bold="True" Font-Size="Medium"></asp:Label>
                                            </div>

                                            <div class="col span-9-of-12">
                                                <asp:Label ID="Label2" runat="server" Text='<%#Eval("enrollment_no") %>' Font-Bold="True" Font-Size="Medium"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="card-row">
                                            <div class="col span-3-of-12">
                                                <asp:Label ID="Label18" runat="server" Text="Username" Font-Bold="True" Font-Size="Medium"></asp:Label>
                                            </div>

                                            <div class="col span-9-of-12">
                                                <asp:Label ID="Label19" runat="server" Text='<%#Eval("username") %>' Font-Bold="True" Font-Size="Medium"></asp:Label>
                                            </div>
                                        </div>


                                        <div class="card-row">

                                            <div class="col span-3-of-12">
                                                <asp:Label ID="Label11" runat="server" Text="Stream" Font-Bold="True" Font-Size="Medium"></asp:Label>
                                            </div>

                                            <div class="col span-9-of-12">
                                                <asp:Label ID="Label4" runat="server" Text='<%#Eval("stream") %>' Font-Bold="True" Font-Size="Medium"></asp:Label>
                                            </div>

                                        </div>

                                        <div class="card-row">

                                            <div class="col span-3-of-12">
                                                <asp:Label ID="Label12" runat="server" Text="Sub-stream" Font-Bold="True" Font-Size="Medium"></asp:Label>
                                            </div>

                                            <div class="col span-9-of-12">
                                                <asp:Label ID="Label5" runat="server" Text='<%#Eval("sub_stream") %>' Font-Bold="True" Font-Size="Medium"></asp:Label>
                                            </div>

                                        </div>

                                        <div class="card-row">

                                            <div class="col span-3-of-12">
                                                <asp:Label ID="Label13" runat="server" Text="Semester" Font-Bold="True" Font-Size="Medium"></asp:Label>
                                            </div>

                                            <div class="col span-9-of-12">
                                                <asp:Label ID="Label20" runat="server" Text='<%#Eval("semester") %>' Font-Bold="True" Font-Size="Medium"></asp:Label>
                                            </div>

                                        </div>

                                        


                                    </div>

                                </div>





                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Add Marks" HeaderStyle-Width="200px" ItemStyle-Width="200px">
                            <ItemTemplate>
                                <div class="student-attendance-status">
                                    <asp:RadioButton ID="RadioButton1" runat="server" Text="Present" GroupName="AttendanceStatus" CssClass="radio-button-attendance radio-button-present" />

                                    <asp:RadioButton ID="RadioButton2" runat="server" Checked="True" Text="Absent" GroupName="AttendanceStatus" CssClass="radio-button-attendance radio-button-absent" />
                                </div>
                            </ItemTemplate>
                            <HeaderStyle Width="200px" />
                            <ItemStyle Width="200px"/>
                        </asp:TemplateField>

</Columns>

                </asp:GridView>

            </div>

            <div class="form-width">
                <asp:Button ID="Button3" CssClass="btn btn-full module-form-btn btn-center" runat="server" Text="Mark Attendance" OnClientClick="return confirm('Are you sure you want to mark attendance of the above student!');" OnClick="Button3_Click"/>
            </div>

        </div>

    </section>


    </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>
