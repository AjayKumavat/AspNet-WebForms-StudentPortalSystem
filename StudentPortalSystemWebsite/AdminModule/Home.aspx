<%@ Page Title="" Language="C#" MasterPageFile="~/AdminModule/Admin.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="StudentPortalSystemWebsite.AdminModule.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        /* UNIVERSAL */
        *{
            box-sizing: border-box;
        }

        /* --------------------------------------------- */
        /* --------------------------------------------- */
        /* SECTION PROPERTIES (section height , background color) */
        /* --------------------------------------------- */
        /* --------------------------------------------- */
        .section-student-details {
            height: 580px;
        }
        
        .section-other-details {
            background-color: #f4f4f4;
            height: 580px;
        }

        .section-data-table-grid-view {
            height: 720px;
        }

        .section-data-table-grid-view div div h3 {
            text-align: center;
            font-weight: 700;
        }
        /* --------------------------------------------- */
        /* --------------------------------------------- */


        /* --------------------------------------------- */
        /* --------------------------------------------- */
        /* SMALL BOX */
        /* --------------------------------------------- */
        /* --------------------------------------------- */
        
        .small-box-container {
            padding: 10px;
            color: #fff;
            text-align: center;
            border-radius: 10px;
            transform: scale(0.9);
            transition: all 0.4s;
        }

        .small-box-container:hover {
            transform: scale(1.02);
            transition: all 0.4s;
        }

        .small-box-number {
            font-size: 50px;
        }

        .small-box-number:after {
            display: block;
            content: "";
            width: 75px;
            height: 2px;
            background-color: #fff;
            margin: 0 auto;
            margin-top: 5px;

        }

        .small-box-text {
            font-size: 90%;
            margin-top: 5px;
            padding: 7px 0;
        }

        /* space between the row1 small box and row2 small box */
        .small-box-division {
            margin-top: 30px;
        }

        .small-box-green {
            background-color: #7bd152;
        }

        .small-box-yellow {
            background-color: #edb220;
        }

        .small-box-approve {
            /*border: 1px solid #00a0dc;*/
            background-color: #00a0dc;
        }

        .small-box-red {
            background-color: #e24c4c;
        }
        /* --------------------------------------------- */
        /* --------------------------------------------- */

        /* --------------------------------------------- */
        /* --------------------------------------------- */
        /* ICON PROPERTIES */
        /* --------------------------------------------- */
        /* --------------------------------------------- */

        /* BIG ICON FOR BIG COLUMN*/
        .dashboard-big-icon {
            display: block;
            text-align: center;
            font-size: 120px;
            color: #fff;

        }

        /* BIG ICON UNDERLINE */
        .dashboard-big-icon:after {
            display: block;
            content: "";
            width: 100px;
            height: 2px;
            background-color: #fff;
            margin: 0 auto;
        }

        .small-box-icon {
            padding: 5px;
            font-size: 90px;
        }
        /* --------------------------------------------- */
        /* --------------------------------------------- */


        /* --------------------------------------------- */
        /* --------------------------------------------- */
        /* BIG BOX */
        /* --------------------------------------------- */
        /* --------------------------------------------- */
        .big-box-text {
            font-size: 300%;
        }
        
        /* BIG BOX */
        .dashboard-student-details-style {
            background-color: #e67e22;
            color: #fff;
            text-align: center;
            border-radius: 30px;
            transform: scale(0.98);
            transition: all 0.4s;
        }
        .dashboard-student-details-style:hover {
            transform: scale(1.05);
            transition: all 0.4s;
        }

        .dashboard-h3 {
            font-size: 110%;
        }
        /* --------------------------------------------- */
        /* --------------------------------------------- */

        /* --------------------------------------------- */
        /* --------------------------------------------- */
        /* GRID VIEW CONTENT PROPERTIES */
        /* --------------------------------------------- */
        /* --------------------------------------------- */

        /* GRID VIEW CONTENT */
        .grid-view-content {
            font-weight: 400;
            color: #4d4d4d;
            padding: 3px 0px 3px 0px;
        }

        /* Grid view icons properties*/
        .grid-view-content div:first-child {
            text-align: center;
        }
        /* NOTICE MESSAGE */
        .grid-view-content:last-child {
            font-weight: 700;
        }
        /* --------------------------------------------- */
        /* --------------------------------------------- */

        /* --------------------------------------------- */
        /* Add / Update / Delete Link Buttons - Below Grid view table */
        .notice-action-button {
            text-align: center;
        }

        .notice-action-button div {
            margin-top: 5px;
            margin-bottom: 5px;
        }
        /* --------------------------------------------- */

    </style>

    <title>Welcome Admin</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- NOTICE STICKY NAV -->
    <div class="sticky-notice-nav">
        <ul>

            <!-- STUDENT DETAILS SECTION -->
            <li>
                <div class="notice-heading">
                    <a class="btn btn-full admin-js--scroll-to-add-notice" href="#AddNotice"><i class="notice-icon ion-android-person"></i></a>
                </div>
            </li>

            <!-- OTHER DETAILS SECTION -->
            <li>
                <div class="notice-heading">
                    <a class="btn btn-full admin-js--scroll-to-update-notice" href="#UpdateNotice"><i class="notice-icon ion-pie-graph"></i></a>
                </div>
            </li>

            <!-- NOTICES & ACTIVITIES -->
            <li>
                <div class="notice-heading">
                    <a class="btn btn-full admin-js--scroll-to-delete-notice" href="#DeleteNotice"><i class="notice-icon ion-ios-paper"></i></a>
                </div>
            </li>

            <%--<!-- ALL NOTICE ENTRIES -->
            <li>
                <div class="notice-heading">
                    <a class="btn btn-ghost admin-js--scroll-to-notice-table" href="#NoticeEntries"><i class="notice-icon ion-android-attach"></i></a>
                </div>
            </li>--%>

        </ul>
    </div>


    <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
        <!-- SECTION 1 - STUDENT DETAILS -->
        <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
        <section class="section-student-details admin-js--section admin-js--add-notice"> <!-- class="admin-js--section" - animation  class -->
            
            <!-- SECTION HEADING -->
            <div class="admin-row">
                <h2>STUDENT ACCOUNT DETAILS</h2>
            </div>

            <!-- SECTION CONTENT -->
            <div class="admin-row">

                <!-- ------------------------ -->
                <!-- ------------------------ -->
                <!-- COLUMN 1 -->
                <div class="col span-2-of-6 box dashboard-student-details-style">

                    
                        <!-- HEADING -->
                        <h3 class="dashboard-h3">Total Registration</h3>

                        <!-- ICON -->
                        <i class="ion-android-people dashboard-big-icon"></i>

                        <!-- TOTAL COUNT -->
                        <asp:Label ID="Label100" runat="server" Text="Count" CssClass="big-box-text"></asp:Label>
                </div>

                <!-- ------------------------ -->
                <!-- ------------------------ -->
                <!-- COLUMN 2 -->
                <div class="col span-2-of-6">

                    <!-- ROW 1 -->
                    <div class="row small-box-container small-box-approve">
                        <!-- TEXT PART -->
                        <div class="col span-2-of-4">

                            <asp:Label ID="Label101" runat="server" Text="Count" CssClass="small-box-number"></asp:Label>
                            <p class="small-box-text">APPROVED</p>

                        </div>

                        <!-- ICON -->
                        <div class="col span-2-of-4">

                            <i class="ion-ios-body small-box-icon"></i>

                        </div>
                    </div> <!-- ROW 1 -->

                    <!-- ROW 2 -->
                    <div class="row small-box-container small-box-green small-box-division">
                        <!-- TEXT PART -->
                        <div class="col span-2-of-4">

                            <asp:Label ID="Label102" runat="server" Text="Count" CssClass="small-box-number"></asp:Label>
                            <p class="small-box-text">ACTIVE</p>

                        </div>

                        <!-- ICON -->
                        <div class="col span-2-of-4">

                            <i class="ion-checkmark-circled small-box-icon"></i>

                        </div>
                    </div> <!-- ROW 2 -->

                </div>

                <!-- ------------------------ -->
                <!-- ------------------------ -->
                <!-- COLUMN 3 -->
                <div class="col span-2-of-6">

                    <!-- ROW 1 -->
                    <div class="row small-box-container small-box-yellow">
                        <!-- TEXT PART -->
                        <div class="col span-2-of-4">

                            <asp:Label ID="Label103" runat="server" Text="Count" CssClass="small-box-number"></asp:Label>
                            <p class="small-box-text">PENDING</p>

                        </div>

                        <!-- ICON -->
                        <div class="col span-2-of-4">

                            <i class="ion-alert-circled small-box-icon"></i>

                        </div>
                    </div> <!-- ROW 1 -->

                    <!-- ROW 2 -->
                    <div class="row small-box-container small-box-red small-box-division">
                        <!-- TEXT PART -->
                        <div class="col span-2-of-4">

                            <asp:Label ID="Label104" runat="server" Text="Count" CssClass="small-box-number"></asp:Label>
                            <p class="small-box-text">DEACTIVE</p>

                        </div>

                        <!-- ICON -->
                        <div class="col span-2-of-4">

                            <i class="ion-close-circled small-box-icon"></i>

                        </div>
                    </div> <!-- ROW 2 -->

                </div>

                <!-- ------------------------ -->

            
                </div>
        </section>

    <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
        <!-- SECTION 2 - OTHER DETAILS -->
        <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
    <section class="section-other-details admin-js--update-notice">

        <!-- SECTION HEADING -->
            <div class="admin-row">
                <h2>OTHER DETAILS</h2>
            </div>

            <!-- SECTION CONTENT -->
            <div class="admin-row">

                <!-- ------------------------ -->
                <!-- ------------------------ -->
                <!-- COLUMN 1 -->
                <div class="col span-2-of-6 box dashboard-student-details-style">

                    
                        <!-- HEADING -->
                        <h3 class="dashboard-h3">Total Staff Added</h3>

                        <!-- ICON -->
                        <i class="ion-android-people dashboard-big-icon"></i>

                        <!-- TOTAL COUNT -->
                        <asp:Label ID="Label200" runat="server" Text="Count" CssClass="big-box-text"></asp:Label>
                </div>

                <!-- ------------------------ -->
                <!-- ------------------------ -->
                <!-- COLUMN 2 -->
                <div class="col span-2-of-6">

                    <!-- ROW 1 -->
                    <div class="row small-box-container small-box-red">
                        <!-- TEXT PART -->
                        <div class="col span-2-of-4">

                            <asp:Label ID="Label201" runat="server" Text="Count" CssClass="small-box-number"></asp:Label>
                            <p class="small-box-text">NOTICES</p>

                        </div>

                        <!-- ICON -->
                        <div class="col span-2-of-4">

                            <i class="ion-document-text small-box-icon"></i>

                        </div>
                    </div> <!-- ROW 1 -->

                    <!-- ROW 2 -->
                    <div class="row small-box-container small-box-division small-box-green">
                        <!-- TEXT PART -->
                        <div class="col span-2-of-4">

                            <asp:Label ID="Label202" runat="server" Text="Count" CssClass="small-box-number"></asp:Label>
                            <p class="small-box-text">ACTIVITIES</p>

                        </div>

                        <!-- ICON -->
                        <div class="col span-2-of-4">

                            <i class="ion-ios-paperplane small-box-icon"></i>

                        </div>
                    </div> <!-- ROW 2 -->

                </div>

                <!-- ------------------------ -->
                <!-- ------------------------ -->
                <!-- COLUMN 3 -->
                <div class="col span-2-of-6">

                    <!-- ROW 1 -->
                    <div class="row small-box-container" style="background-color: #4d78a2">
                        <!-- TEXT PART -->
                        <div class="col span-2-of-4">

                            <asp:Label ID="Label203" runat="server" Text="Count" CssClass="small-box-number"></asp:Label>
                            <p class="small-box-text">SUBJECTS</p>

                        </div>

                        <!-- ICON -->
                        <div class="col span-2-of-4">

                            <i class="ion-android-bookmark small-box-icon"></i>

                        </div>
                    </div> <!-- ROW 1 -->

                    <!-- ROW 2 -->
                    <div class="row small-box-container small-box-division" style="background-color: #fd6b23">
                        <!-- TEXT PART -->
                        <div class="col span-2-of-4">

                            <asp:Label ID="Label204" runat="server" Text="Count" CssClass="small-box-number"></asp:Label>
                            <p class="small-box-text">TOTAL TESTS</p>

                        </div>

                        <!-- ICON -->
                        <div class="col span-2-of-4">

                            <i class="ion-android-clipboard small-box-icon"></i>

                        </div>
                    </div> <!-- ROW 2 -->

                </div>

                <!-- ------------------------ -->

            
                </div>

    </section>

    <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
        <!-- SECTION 2 - OTHER DETAILS -->
        <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
    <section class="section-data-table-grid-view admin-js--delete-notice">

        <!-- HEADING -->
        <div class="admin-row">
            <h2> Notices & Activities</h2>
        </div>

        
        <div class="admin-row">

            <!-- NOTICES -->
            <div class="col span-2-of-4">

                <!-- NOTICE HEADING -->
                <h3>All notices</h3>

                

                <!-- SQL DATA SOURCE -->
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentPortalSystem_dbConnectionString %>" SelectCommand="SELECT * FROM [Notice] ORDER BY [notice_id] DESC"></asp:SqlDataSource>

                <div class="dashboard-grid-view-data-table">

                    <!-- GRID VIEW -->
                    <asp:GridView ID="GridView1" runat="server" CssClass="table-grid-view table table-striped table-bordered" AutoGenerateColumns="False" DataKeyNames="notice_id" DataSourceID="SqlDataSource1" ShowHeaderWhenEmpty="True">
                        <Columns>
                            <asp:BoundField DataField="notice_id" HeaderText="ID" ReadOnly="True" SortExpression="notice_id" />
                            

                            <asp:TemplateField HeaderText="Notice Details">

                                <ItemTemplate>

                                    <div> <!-- main div -->

                                        <!-- DATE -->
                                        <div class="row grid-view-content">

                                            <div class="col span-2-of-10">
                                                <i class="ion-calendar"></i>
                                            </div>
                                            
                                            <div class="col span-8-of-10">
                                                <asp:Label ID="Label301" runat="server" Text='<%# Eval("notice_date") %>'></asp:Label>
                                            </div>
                                        
                                        </div>
                                        
                                        <!-- NOTICE FROM -->
                                        <div class="row grid-view-content">

                                            <div class="col span-2-of-10">
                                                <i class="ion-android-person"></i>
                                            </div>
                                            
                                            <div class="col span-8-of-10">
                                                <asp:Label ID="Label300" runat="server" Text='<%# Eval("notice_by") %>'></asp:Label>
                                            </div>
                                        
                                        </div>

                                        <!-- NOTICE FOR -->
                                        <div class="row before-notice grid-view-content">

                                            <div class="col span-2-of-10">
                                                <i class="ion-android-send"></i>
                                            </div>
                                            
                                            <div class="col span-8-of-10">
                                                <asp:Label ID="Label302" runat="server" Text='<%# Eval("notice_for") %>'></asp:Label>
                                            </div>
                                        
                                        </div>

                                        <!-- MESSAGE -->
                                        <div class="row grid-view-content">

                                            <div class="col span-2-of-10">
                                                <i class="ion-chatbox-working"></i>
                                            </div>
                                            
                                            <div class="col span-8-of-10">
                                                <asp:Label ID="Label303" runat="server" Text='<%# Eval("notice") %>'></asp:Label>
                                            </div>
                                        
                                        </div>

                                    </div> <!-- main div -->

                                </ItemTemplate>

                            </asp:TemplateField>
                            


                        </Columns>
                    </asp:GridView>

                </div>

                <!-- ------------------------------------------------ -->
                    <!-- NOTICE NAV LINKS -->
                <!-- ------------------------------------------------ -->
                    <div class="notice-action-button">

                            <!-- ADD NOTICE -->

                        <!-- empty span/cell -->
                        <div class="col span-1-of-8"></div>

                            <div class="col span-2-of-8">
                                <div class="notice-heading">
                                    <a class="btn btn-full" href="Notice.aspx#AddNotice"><i class="notice-icon ion-android-add"></i></a>
                                </div>
                            </div>

                            <!-- UPDATE NOTICE -->
                            <div class="col span-2-of-8">
                                <div class="notice-heading">
                                    <a class="btn btn-ghost" href="Notice.aspx#UpdateNotice"><i class="notice-icon ion-android-sync"></i></a>
                                </div>
                            </div>

                            <!-- DELETE NOTICE -->
                            <div class="col span-2-of-8">
                                <div class="notice-heading">
                                    <a class="btn btn-ghost" href="Notice.aspx#DeleteNotice"><i class="notice-icon ion-android-delete"></i></a>
                                </div>
                            </div>

                            <!-- empty span/cell -->
                            <div class="col span-1-of-8"></div>

                    </div>
                <!-- ------------------------------------------------ -->
                <!-- ------------------------------------------------ -->

            </div> <!-- NOTICE span-2-of-4 -->


            <!-- ACTIVITY -->
            <div class="col span-2-of-4">

                <!-- ACTIVITIES HEADING -->
                <h3>All activities</h3>

                

                <!-- SQL DATA SOURCE -->
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StudentPortalSystem_dbConnectionString %>" SelectCommand="SELECT * FROM [Activity] ORDER BY [activity_id] DESC"></asp:SqlDataSource>

                <div class="dashboard-grid-view-data-table">

                    <!-- GRID VIEW -->
                    <asp:GridView ID="GridView2" runat="server" CssClass="activity-entries-data-table table table-striped table-bordered" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" ShowHeaderWhenEmpty="True">
                        <Columns>
                            <asp:BoundField DataField="activity_id" HeaderText="ID" SortExpression="activity_id" />

                            <asp:TemplateField HeaderText="Activity Details">

                                <ItemTemplate>

                                    <div> <!-- main div -->

                                        <!-- DATE -->
                                        <div class="row grid-view-content">

                                            <div class="col span-2-of-10">
                                                <i class="ion-calendar"></i>
                                            </div>
                                            
                                            <div class="col span-8-of-10">
                                                <asp:Label ID="Label301" runat="server" Text='<%# Eval("date") %>'></asp:Label>
                                            </div>
                                        
                                        </div>
                                        
                                        <!-- NOTICE FROM -->
                                        <div class="row grid-view-content">

                                            <div class="col span-2-of-10">
                                                <i class="ion-android-person"></i>
                                            </div>
                                            
                                            <div class="col span-8-of-10">
                                                <asp:Label ID="Label300" runat="server" Text='<%# Eval("activity_by") %>'></asp:Label>
                                            </div>
                                        
                                        </div>

                                        <!-- NOTICE FOR -->
                                        <div class="row before-notice grid-view-content">

                                            <div class="col span-2-of-10">
                                                <i class="ion-android-send"></i>
                                            </div>
                                            
                                            <div class="col span-8-of-10">
                                                <asp:Label ID="Label302" runat="server" Text='<%# Eval("activity_name") %>'></asp:Label>
                                            </div>
                                        
                                        </div>

                                        <!-- MESSAGE -->
                                        <div class="row grid-view-content">

                                            <div class="col span-2-of-10">
                                                <i class="ion-chatbox-working"></i>
                                            </div>
                                            
                                            <div class="col span-8-of-10">
                                                <asp:Label ID="Label303" runat="server" Text='<%# Eval("comment") %>'></asp:Label>
                                            </div>
                                        
                                        </div>

                                    </div> <!-- main div -->

                                </ItemTemplate>

                            </asp:TemplateField>
                            
                        </Columns>
                    </asp:GridView>

                </div>

                <!-- ------------------------------------------------ -->
                <!-- ACTIVITY NAV LINKS -->
                <!-- ------------------------------------------------ -->
                    <div class="notice-action-button">

                        <!-- empty span/cell -->
                        <div class="col span-1-of-8"></div>

                            <!-- ADD ACTIVITY -->
                            <div class="col span-2-of-8">
                                <div class="notice-heading">
                                    <a class="btn btn-full" href="Activity.aspx#AddActivity"><i class="notice-icon ion-android-add"></i></a>
                                </div>
                            </div>

                            <!-- UPDATE ACTIVITY -->
                            <div class="col span-2-of-8">
                                <div class="notice-heading">
                                    <a class="btn btn-ghost" href="Activity.aspx#UpdateActivity"><i class="notice-icon ion-android-sync"></i></a>
                                </div>
                            </div>

                            <!-- DELETE ACTIVITY -->
                            <div class="col span-2-of-8">
                                <div class="notice-heading">
                                    <a class="btn btn-ghost" href="Activity.aspx#DeleteActivity"><i class="notice-icon ion-android-delete"></i></a>
                                </div>
                            </div>

                        <!-- empty span/cell -->
                        <div class="col span-1-of-8"></div>

                    </div>
                <!-- ------------------------------------------------ -->
                <!-- ------------------------------------------------ -->

            </div>

        </div>

    </section>

</asp:Content>
