<%@ Page Title="" Language="C#" MasterPageFile="~/StaffModule/Staff.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="StudentPortalSystemWebsite.StaffModule.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>


        .section-student-home-notice {
            height: 720px;
        }

        .dashboard-grid-view-data-table {
            overflow: auto;
            height: 400px;
            border: 2px solid #cccccc;
            border-radius: 7px;
            width: 100%;
        }

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


    </style>

    <title>Home</title>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="section-student-home-notice admin-js--section">

        <!-- HEADING -->
        <div class="admin-row">
            <!-- SECTION LATEST NOTICE HEADING -->
            <h2>Latest Notice & Activity</h2>
        </div>

        <!-- CONTENT -->
        <div class="admin-row">

            
            <div class="col span-2-of-4">

                <!-- heading -->
                <h3>Notices</h3>

            <!-- SQL DATA SOURCE -->
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentPortalSystem_dbConnectionString %>" SelectCommand="SELECT * FROM [Notice] WHERE ([notice_for] = @notice_for) ORDER BY [notice_id] DESC">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Staff" Name="notice_for" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>

            <div class="dashboard-grid-view-data-table">


                <!-- GRID VIEW -->
                <asp:GridView ID="GridView1" runat="server" CssClass="table-grid-view table table-striped table-bordered" AutoGenerateColumns="False" DataKeyNames="notice_id" DataSourceID="SqlDataSource1">
                    <Columns>

                        <asp:TemplateField HeaderText="Notice Details">

                            <ItemTemplate>

                                <div class="grid-view-row"> <!-- main div -->


                                    <!-- SERIAL NUMBER -->
                                        <div class="row grid-view-content">

                                            <div class="col span-2-of-10">
                                                <i class="ion-pound"></i>
                                            </div>
                                            
                                            <div class="col span-8-of-10">
                                                <%#Container.DataItemIndex+1 %>
                                            </div>
                                        
                                        </div>

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

            </div> <!-- grid view -->

           </div> <!-- col span-2-of-4 -->


            <!-- ACTIVITIES -->
            <div class="col span-2-of-4">

                <!-- heading -->
                <h3>Activities</h3>

            <!-- SQL DATA SOURCE -->
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StudentPortalSystem_dbConnectionString %>" SelectCommand="SELECT * FROM [Activity] ORDER BY [activity_id] DESC"></asp:SqlDataSource>

            <div class="dashboard-grid-view-data-table">


                <!-- GRID VIEW -->
                <asp:GridView ID="GridView2" runat="server" CssClass="table-grid-view table table-striped table-bordered" AutoGenerateColumns="False" DataKeyNames="activity_id" DataSourceID="SqlDataSource2">
                    <Columns>

                        <asp:TemplateField HeaderText="Activity Details">

                            <ItemTemplate>

                                <div class="grid-view-row"> <!-- main div -->


                                    <!-- SERIAL NUMBER -->
                                        <div class="row grid-view-content">

                                            <div class="col span-2-of-10">
                                                <i class="ion-pound"></i>
                                            </div>
                                            
                                            <div class="col span-8-of-10">
                                                <%#Container.DataItemIndex+1 %>
                                            </div>
                                        
                                        </div>

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

            </div> <!-- grid view -->

            </div>

        </div> <!-- admin-row -->

    </section>


</asp:Content>
