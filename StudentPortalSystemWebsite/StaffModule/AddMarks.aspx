<%@ Page Title="" Language="C#" MasterPageFile="~/StaffModule/Staff.Master" AutoEventWireup="true" CodeBehind="AddMarks.aspx.cs" Inherits="StudentPortalSystemWebsite.StaffModule.AddMarks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        .section-add-marks {
            height: 700px;
        }

        .section-test-type-details {
            height: 520px;
            background-color: #f4f4f4;
        }

        .section-add-marks-table-grid-view {
            height: 850px;
        }

        .add-marks-textbox-grid-view {
            margin-right: 10px !important;
            width: 150px !important;
            border-radius: 3px !important;
            padding: 7px !important;
            height: 40px !important;
            border: 1px solid #ccc !important;
        }

        /* ADD MARKS BUTTON - BELOW GRID VIEW 1*/
        .btn-center {
            display: block !important;
            margin-left: auto !important;
            margin-right: auto !important;
        }

        .grid-view-student-marks div {
            display: block;
            max-width: 700px;
            background-color: #292929;
            color: #fff;
            border-radius: 30px;
            margin-left: 10%;
            margin-right: 10%;

        }

        .grid-view-label-student-marks {
            display: inline-block;
            padding: 8px 16px;
            text-align: center;
        }

        .grid-view-label-student-marks:first-child {
            float: left;
            background-color: #a4a4a4;
            color: #3d3d3d;
            border-radius: 30px;
        }

        .grid-view-label-student-marks:last-child {
            float: right;
            background-color: #5b5b5b;
            border-radius: 30px;
        }

        /* Grid view Add marks*/
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
    </style>


    <title>Add Marks</title>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- NOTICE STICKY NAV -->
    <div class="sticky-notice-nav">
        <ul>

            <!-- FILTER STUDENT RECORD -->
            <li>
                <div class="notice-heading">
                    <a class="btn btn-full admin-js--scroll-to-add-notice" href="#AddNotice"><i class="notice-icon ion-android-settings"></i></a>
                </div>
            </li>

            <!-- TEST TYPE DETAILS -->
            <li>
                <div class="notice-heading">
                    <a class="btn btn-full admin-js--scroll-to-update-notice" href="#UpdateNotice"><i class="notice-icon ion-android-clipboard"></i></a>
                </div>
            </li>

            <!-- ADD MARKS -->
            <li>
                <div class="notice-heading">
                    <a class="btn btn-ghost admin-js--scroll-to-delete-notice" href="#DeleteNotice"><i class="notice-icon ion-compose"></i></a>
                </div>
            </li>

            <!-- ALL MARKS ENTRIES -->
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
        <!-- TEST TYPE DETAILS SECTION -->
<!-- --------------------------------------------- -->
    <section class="section-add-marks admin-js--section admin-js--add-notice">


        <!-- HEADING -->
        <div class="admin-row">
            <h2>Add Marks</h2>
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
                                <asp:TextBox ID="TextBox2" runat="server" placeholder="Date" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
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
                
                        <!-- SUBJECT NAME -->
                        <div class="admin-row">
                            <div class="col span-1-of-3">
                                <label for="subject_name">Subject Name</label>
                            </div>

                            <div class="col span-2-of-3">
                                <asp:DropDownList ID="DropDownList5" runat="server" Width="100%" CssClass="add-staff-textbox" AutoPostBack="True" OnSelectedIndexChanged="DropDownList5_SelectedIndexChanged">
                                    <asp:ListItem>--Select--</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        
                        </div>

                        <!-- TEST TYPE -->
                        <div class="admin-row">
                            <div class="col span-1-of-3">
                                <label for="test_type">Test Type</label>
                            </div>

                            <div class="col span-2-of-3">
                                <asp:DropDownList ID="DropDownList6" runat="server" Width="100%" CssClass="add-staff-textbox">
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

                                    <asp:Button ID="Button1" runat="server" Text="Get Student Details" OnClick="Button1_Click" CssClass="btn btn-full module-form-btn"/>

                                </div>    
                        </div>

                    </div> <!-- FORM END HERE -->

<%--                </ContentTemplate>
            </asp:UpdatePanel>--%>

        </div>

    </section>


    <!-- --------------------------------------------- -->
        <!-- TEST TYPE DETAILS SECTION -->
<!-- --------------------------------------------- -->
    <section class="section-test-type-details admin-js--update-notice">

        <div class="admin-row">
            <h2>Test Type Details</h2>
        </div>

        <div class="admin-row">

            <!-- ADD NOTICE DETAILS -->
                <div class="form-width">

                    <%--<asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>--%>
                            
                            <!-- TEST TYPE ID -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label16" runat="server" Text="Test Type ID"></asp:Label>
                                </div>
                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox14" runat="server" placeholder="Test Type ID" CssClass="add-staff-textbox" TextMode="Number" Width="100%" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>


                            <!-- TEST TYPE NAME -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label6" runat="server" Text="Test Name"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox5" runat="server" placeholder="Test Name" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>         
                                </div>
                        
                            </div>
                            

                            <!-- TEST TYPE DATE -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label14" runat="server" Text="Test Date"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox12" runat="server" placeholder="Test Date" CssClass="add-staff-textbox" TextMode="Date" ReadOnly="True"></asp:TextBox>         
                                </div>
                        
                            </div>

                            <!-- TOTAL MARKS -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label7" runat="server" Text="Total Marks"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox6" runat="server" placeholder="Total Marks" CssClass="add-staff-textbox" TextMode="Number" ReadOnly="True"></asp:TextBox>        
                                </div>
                        
                            </div>

                            <!-- PASSING MARKS -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label8" runat="server" Text="Passing Marks"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox7" runat="server" placeholder="Passing Marks" CssClass="add-staff-textbox" TextMode="Number" ReadOnly="True"></asp:TextBox>      
                                </div>
                        
                            </div>


                        <%--</ContentTemplate>
                    </asp:UpdatePanel>--%>

                </div>

        </div>

    </section>
    
    <!-- --------------------------------------------- -->
        <!-- ALL STUDENT ENTRIES IN THE GRID VIEW -->
<!-- --------------------------------------------- -->
    <section id="sectionAddStudentMarks" class="section-add-marks-table-grid-view admin-js--delete-notice" runat="server">
        <div class="admin-row">

            <!-- SECTION HEADING -->
            <h2>Add<asp:Label ID="Label9" runat="server" Text=" "></asp:Label>Marks</h2>
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

                                <asp:TextBox ID="TextBox1" runat="server" placeholder="Add Marks" CssClass="add-marks-textbox-grid-view" TextMode="Number" Width="100%" ReadOnly="False"></asp:TextBox>

                            </ItemTemplate>
                            <HeaderStyle Width="200px" />
                            <ItemStyle Width="200px"/>
                        </asp:TemplateField>

</Columns>

                </asp:GridView>

            </div>

            <div class="form-width">
                <asp:Button ID="Button3" CssClass="btn btn-full module-form-btn btn-center" runat="server" Text="Add Marks" OnClick="Button3_Click" OnClientClick="return confirm('Are you sure you want to add marks of the above student!');"/>
            </div>

        </div>

    </section>
           
    

    <!-- SECTION ALL ADDED MARKS DETAILS -->
    </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>
