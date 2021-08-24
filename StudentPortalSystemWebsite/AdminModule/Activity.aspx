<%@ Page Title="" Language="C#" MasterPageFile="~/AdminModule/Admin.Master" AutoEventWireup="true" CodeBehind="Activity.aspx.cs" Inherits="StudentPortalSystemWebsite.AdminModule.Activity" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .section-add-activity {
            height: 620px;
        }
        
        .section-update-activity {
            background-color: #f4f4f4;
            height: 620px;
        }

        .section-delete-activity {
            height: 620px;
        }

        .section-activity-grid-view {
            background-color: #f4f4f4;
            height: 780px;
        }
    </style>

    <title>Activity</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- NOTICE STICKY NAV -->
    <div class="sticky-notice-nav">
        <ul>

            <!-- ADD NOTICE -->
            <li>
                <div class="notice-heading">
                    <a class="btn btn-full admin-js--scroll-to-add-notice" href="#AddNotice"><i class="notice-icon ion-android-add"></i></a>
                </div>
            </li>

            <!-- UPDATE NOTICE -->
            <li>
                <div class="notice-heading">
                    <a class="btn btn-full admin-js--scroll-to-update-notice" href="#UpdateNotice"><i class="notice-icon ion-android-sync"></i></a>
                </div>
            </li>

            <!-- DELETE NOTICE -->
            <li>
                <div class="notice-heading">
                    <a class="btn btn-full admin-js--scroll-to-delete-notice" href="#DeleteNotice"><i class="notice-icon ion-android-delete"></i></a>
                </div>
            </li>

            <!-- ALL NOTICE ENTRIES -->
            <li>
                <div class="notice-heading">
                    <a class="btn btn-ghost admin-js--scroll-to-notice-table" href="#ActivityEntries"><i class="notice-icon ion-android-attach"></i></a>
                </div>
            </li>

        </ul>
    </div>


    
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

<!-- --------------------------------------------- -->
        <!-- ADD NOTICE SECTION -->
<!-- --------------------------------------------- -->
            <!-- AUTO SCROLL TO FIRST SECTION CLASS =  admin-js--section -->
        <section id="AddActivity" class="section-add-activity admin-js--add-notice">
            <div class="admin-row">
                <h2>Add New Activity</h2>
            </div>

            <div class="admin-row">
             
                <!-- ADD ACTIVITY DETAILS -->               
                <div class="form-width">

                            <!-- ACTIVITY ID -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label1" runat="server" Text="Activity ID"></asp:Label>
                                </div>
                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox1" runat="server" placeholder="Activity ID" CssClass="add-staff-textbox" TextMode="Number" Width="100%" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>


                            <!-- SELECT ACTIVITY -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <label for="activity">Activity</label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:DropDownList ID="DropDownList1" runat="server" Width="100%" CssClass="add-staff-textbox">
                                        <asp:ListItem>--Select--</asp:ListItem>
                                        <asp:ListItem>Social</asp:ListItem>
                                        <asp:ListItem>Cultural</asp:ListItem>
                                        <asp:ListItem>Technical</asp:ListItem>
                                        <asp:ListItem>Sports</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                            </div>

                            <!-- EVENT DATE -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label2" runat="server" Text="Event Date"></asp:Label>
                                </div>
                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox7" runat="server" placeholder="Event Date" CssClass="add-staff-textbox" TextMode="Date" Width="100%"></asp:TextBox>
                                </div>
                            </div>

                            <!-- MESSAGE -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label3" runat="server" Text="Message"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox2" runat="server" placeholder="Message..." Height="90px" TextMode="MultiLine" Width="100%"></asp:TextBox>        
                                </div>
                        
                            </div>

                            <!-- CHANGE STATUS - BUTTON -->
                            <div class="admin-row">
                                
                                <!-- NON BREAKING SPACE -->
                                <div class="col span-1-of-3">
                                    <label>&nbsp</label>
                                </div>

                                <!-- BUTTON -->
                                <div class="col span-2-of-3">
                                    <!-- ADD BUTTON -->
                                    <asp:Button ID="Button1" runat="server" Text="Add" CssClass="btn btn-full module-form-btn" OnClick="Button1_Click"/>

                                    <!-- CLEAR BUTTON -->
                                    <asp:Button ID="Button2" runat="server" Text="Clear" CssClass="btn btn-full module-form-btn" OnClick="Button2_Click"/>
                                </div>

                            </div>

                        
                </div>
            </div>

        </section>

<!-- --------------------------------------------- -->
        <!-- UPDATE NOTICE SECTION -->
<!-- --------------------------------------------- -->
        <section id="UpdateActivity" class="section-update-activity section-update-notice admin-js--update-notice">
            <div class="admin-row">
                <h2>Update Activity</h2>
            </div>

            <div class="admin-row">

                <!-- ADD NOTICE DETAILS -->
                <div class="form-width">


                            <!-- ACTIVITY ID -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label4" runat="server" Text="Activity ID"></asp:Label>
                                </div>
                                <div class="col span-2-of-3">

                                    <div class="col span-1-of-2">
                                        <asp:DropDownList ID="DropDownList2" runat="server" Width="100%" CssClass="add-staff-textbox">
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col span-1-of-2">
                                        <asp:Button ID="Button8" runat="server" Text="Get Activity Details" Style="font-size:95%; display: inline-block; background-color:#48b04f;border: 2px solid #48b04f; padding: 7px 10px; font-weight: 300; border-radius: 3px; text-decoration: none; transition: background-color 0.2s, border 0.2s, color 0.2s;" OnClick="Button8_Click"/>
                                    </div>

                                </div>
                            </div>


                            <!-- ACTIVITY ID -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label5" runat="server" Text="Activity ID"></asp:Label>
                                </div>
                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox4" runat="server" placeholder="Activity ID" CssClass="add-staff-textbox" TextMode="Number" Width="100%" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>


                            <!-- SELECT ACTIVITY -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <label for="activity">Activity</label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:DropDownList ID="DropDownList4" runat="server" Width="100%" CssClass="add-staff-textbox">
                                        <asp:ListItem>--Select--</asp:ListItem>
                                        <asp:ListItem>Social</asp:ListItem>
                                        <asp:ListItem>Cultural</asp:ListItem>
                                        <asp:ListItem>Technical</asp:ListItem>
                                        <asp:ListItem>Sports</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                            </div>

                            <!-- EVENT DATE -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label6" runat="server" Text="Event Date"></asp:Label>
                                </div>
                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox8" runat="server" placeholder="Event Date" CssClass="add-staff-textbox" TextMode="Date" Width="100%"></asp:TextBox>
                                </div>
                            </div>

                            <!-- MESSAGE -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label11" runat="server" Text="Message"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox9" runat="server" placeholder="Message..." Height="90px" TextMode="MultiLine" Width="100%"></asp:TextBox>        
                                </div>
                        
                            </div>

                            <!-- CHANGE STATUS - BUTTON -->
                            <div class="admin-row">
                                
                                <!-- NON BREAKING SPACE -->
                                <div class="col span-1-of-3">
                                    <label>&nbsp</label>
                                </div>

                                <!-- BUTTON -->
                                <div class="col span-2-of-3">
                                    <!-- UPDATE BUTTON -->
                                    <asp:Button ID="Button3" runat="server" Text="Update" CssClass="btn btn-full module-form-btn" OnClick="Button3_Click"/>

                                    <!-- CLEAR BUTTON -->
                                    <asp:Button ID="Button4" runat="server" Text="Clear" CssClass="btn btn-full module-form-btn" OnClick="Button4_Click"/>
                                </div>

                            </div>

                </div>
            </div>

        </section>

<!-- --------------------------------------------- -->
        <!-- DELETE NOTICE SECTION -->
<!-- --------------------------------------------- -->
        <section id="DeleteActivity" class="section-delete-activity admin-js--delete-notice">
            <div class="admin-row">
                <h2>Delete Activity</h2>
            </div>

            <div class="admin-row">

                <!-- ADD NOTICE DETAILS -->
                <div class="form-width">


                            <!-- ACTIVITY ID -->
                            <div class="admin-row">

                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label7" runat="server" Text="Activity ID"></asp:Label>
                                </div>
                                
                                <div class="col span-2-of-3">

                                    <div class="col span-1-of-2">
                                        <asp:DropDownList ID="DropDownList3" runat="server" Width="100%" CssClass="add-staff-textbox">
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col span-1-of-2">
                                        <asp:Button ID="Button7" runat="server" Text="Get Activity Details" Style="font-size:95%; display: inline-block; background-color:#48b04f;border: 2px solid #48b04f; padding: 7px 10px; font-weight: 300; border-radius: 3px; text-decoration: none; transition: background-color 0.2s, border 0.2s, color 0.2s;" OnClick="Button7_Click"/>
                                    </div>

                                </div>

                            </div>

                            <!-- ACTIVITY ID -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label8" runat="server" Text="Activity ID"></asp:Label>
                                </div>
                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox3" runat="server" placeholder="Activity ID" CssClass="add-staff-textbox" TextMode="Number" Width="100%" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>


                            <!-- SELECT ACTIVITY -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <label for="activity">Activity</label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:DropDownList ID="DropDownList5" runat="server" Width="100%" CssClass="add-staff-textbox">
                                        <asp:ListItem>Social</asp:ListItem>
                                        <asp:ListItem>Cultural</asp:ListItem>
                                        <asp:ListItem>Technical</asp:ListItem>
                                        <asp:ListItem>Sports</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                            </div>

                            <!-- EVENT DATE -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label9" runat="server" Text="Event Date"></asp:Label>
                                </div>
                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox5" runat="server" placeholder="Event Date" CssClass="add-staff-textbox" TextMode="Date" Width="100%" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <!-- MESSAGE -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label10" runat="server" Text="Message"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox6" runat="server" placeholder="Message..." Height="90px" TextMode="MultiLine" Width="100%" ReadOnly="True"></asp:TextBox>        
                                </div>
                        
                            </div>

                            <!-- CHANGE STATUS - BUTTON -->
                            <div class="admin-row">
                                
                                <!-- NON BREAKING SPACE -->
                                <div class="col span-1-of-3">
                                    <label>&nbsp</label>
                                </div>

                                <!-- BUTTON -->
                                <div class="col span-2-of-3">
                                    <!-- DELETE BUTTON -->
                                    <asp:Button ID="Button5" runat="server" Text="Delete" CssClass="btn btn-full module-form-btn" OnClick="Button5_Click"/>

                                    <!-- CLEAR BUTTON -->
                                    <asp:Button ID="Button6" runat="server" Text="Clear" CssClass="btn btn-full module-form-btn" OnClick="Button6_Click"/>
                                </div>

                            </div>


                </div>
            </div>

        </section>

<!-- --------------------------------------------- -->
        <!-- ALL NOTICE ENTRIES SECTION -->
<!-- --------------------------------------------- -->
    <section id="ActivityEntries" class="section-activity-grid-view admin-js--notice-table">
        <div class="admin-row">
            <h2>All Activity Entries</h2>
        </div>

        <div class="admin-row">

            <!-- SQL DATA SOURCE -->
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentPortalSystem_dbConnectionString %>" SelectCommand="SELECT * FROM [Activity] ORDER BY [activity_id] DESC"></asp:SqlDataSource>

            <div class="grid-view-data-table">
                
                <!-- GRID VIEW -->
                <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="activity_id" HeaderText="activity_id" SortExpression="activity_id" />
                        <asp:BoundField DataField="activity_name" HeaderText="activity_name" SortExpression="activity_name" />
                        <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                        <asp:BoundField DataField="comment" HeaderText="comment" SortExpression="comment" />
                        <asp:BoundField DataField="activity_by" HeaderText="activity_by" SortExpression="activity_by" />
                    </Columns>
                </asp:GridView>

            </div>
        </div>

    </section>

    </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
