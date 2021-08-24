<%@ Page Title="" Language="C#" MasterPageFile="~/StaffModule/Staff.Master" AutoEventWireup="true" CodeBehind="Notice.aspx.cs" Inherits="StudentPortalSystemWebsite.StaffModule.Notice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        /* ------------------------------------------ */
        /* NOTICE (Notice.aspx) */
        /* ------------------------------------------ */


        /* SECTION HEIGHT */
        .section-notice {
            height: 580px;
        }


        .section-update-notice {
            background-color: #f4f4f4;
        }

        .section-notice-grid-view {
            background-color: #f4f4f4;
            height: 770px;
        }

       
    </style>


    <title>Notice</title>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- NOTICE STICKY NAV -->
    <div class="sticky-notice-nav">
        <ul>

            <!-- ADD NOTICE -->
            <li>
                <div class="notice-heading">
                    <a class="btn btn-full admin-js--scroll-to-add-notice" href="#Nothing"><i class="notice-icon ion-android-add"></i></a>
                </div>
            </li>

            <!-- UPDATE NOTICE -->
            <li>
                <div class="notice-heading">
                    <a class="btn btn-full admin-js--scroll-to-update-notice" href="#Nothing"><i class="notice-icon ion-android-sync"></i></a>
                </div>
            </li>

            <!-- DELETE NOTICE -->
            <li>
                <div class="notice-heading">
                    <a class="btn btn-full admin-js--scroll-to-delete-notice" href="#Nothing"><i class="notice-icon ion-android-delete"></i></a>
                </div>
            </li>

            <!-- ALL NOTICE ENTRIES -->
            <li>
                <div class="notice-heading">
                    <a class="btn btn-ghost admin-js--scroll-to-notice-table" href="#Nothing"><i class="notice-icon ion-android-attach"></i></a>
                </div>
            </li>

        </ul>
    </div>


    
        <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>

<!-- --------------------------------------------- -->
        <!-- ADD NOTICE SECTION -->
<!-- --------------------------------------------- -->
    <!-- AUTO SCROLL TO FIRST SECTION CLASS =  admin-js--section -->
        <section id="AddNotice" class="section-notice admin-js--add-notice">
            <div class="admin-row">
                <h2>Add New Notice</h2>
            </div>

            <div class="admin-row">
             
                <!-- ADD NOTICE DETAILS -->               
                <div class="form-width">

                    
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>

                            <!-- NOTICE ID -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label1" runat="server" Text="Notice ID"></asp:Label>
                                </div>
                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox1" runat="server" placeholder="Notice ID" CssClass="add-staff-textbox" TextMode="Number" Width="100%" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>


                            <!-- NOTICE FOR -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label2" runat="server" Text="Notice For"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:DropDownList ID="DropDownList1" runat="server" Width="100%" CssClass="add-staff-textbox">
                                        <asp:ListItem>--Select--</asp:ListItem>
                                        <asp:ListItem>Student</asp:ListItem>
                                        <asp:ListItem>Staff</asp:ListItem>
                                        <asp:ListItem>All</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                            </div>

                            <!-- NOTICE -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label3" runat="server" Text="Notice"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox2" runat="server" placeholder="Notice..." Height="90px" TextMode="MultiLine" Width="100%"></asp:TextBox>        
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

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>

        </section>

<!-- --------------------------------------------- -->
        <!-- UPDATE NOTICE SECTION -->
<!-- --------------------------------------------- -->
        <section id="UpdateNotice" class="section-notice section-update-notice admin-js--update-notice">
            <div class="admin-row">
                <h2>Update Notice</h2>
            </div>

            <div class="admin-row">

                <!-- ADD NOTICE DETAILS -->
                <div class="form-width">

                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>

                            <!-- NOTICE ID -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label4" runat="server" Text="Notice ID"></asp:Label>
                                </div>
                                <div class="col span-2-of-3">

                                    <div class="col span-1-of-2">
                                        <asp:DropDownList ID="DropDownList2" runat="server" Width="100%" CssClass="add-staff-textbox">
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col span-1-of-2">
                                        <asp:Button ID="Button8" runat="server" Text="Get Notice Details" Style="font-size:95%; display: inline-block; background-color:#48b04f;border: 2px solid #48b04f; padding: 7px 10px; font-weight: 300; border-radius: 3px; text-decoration: none; transition: background-color 0.2s, border 0.2s, color 0.2s;" OnClick="Button8_Click"/>
                                    </div>

                                </div>
                            </div>


                            <!-- NOTICE FOR -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label5" runat="server" Text="Notice For"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:DropDownList ID="DropDownList4" runat="server" Width="100%" CssClass="add-staff-textbox">
                                        <asp:ListItem>--Select--</asp:ListItem>
                                        <asp:ListItem>Student</asp:ListItem>
                                        <asp:ListItem>Staff</asp:ListItem>
                                        <asp:ListItem>All</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                            </div>


                            <!-- NOTICE -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label6" runat="server" Text="Notice"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox4" runat="server" placeholder="Notice..." Height="90px" TextMode="MultiLine" Width="100%"></asp:TextBox>        
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

                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
            </div>

        </section>

<!-- --------------------------------------------- -->
        <!-- DELETE NOTICE SECTION -->
<!-- --------------------------------------------- -->
        <section id="DeleteNotice" class="section-notice admin-js--delete-notice">
            <div class="admin-row">
                <h2>Delete Notice</h2>
            </div>

            <div class="admin-row">

                <!-- ADD NOTICE DETAILS -->
                <div class="form-width">

                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>

                            <!-- NOTICE ID -->
                            <div class="admin-row">

                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label7" runat="server" Text="Notice ID"></asp:Label>
                                </div>
                                
                                <div class="col span-2-of-3">

                                    <div class="col span-1-of-2">
                                        <asp:DropDownList ID="DropDownList3" runat="server" Width="100%" CssClass="add-staff-textbox">
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col span-1-of-2">
                                        <asp:Button ID="Button7" runat="server" Text="Get Notice Details" Style="font-size:95%; display: inline-block; background-color:#48b04f;border: 2px solid #48b04f; padding: 7px 10px; font-weight: 300; border-radius: 3px; text-decoration: none; transition: background-color 0.2s, border 0.2s, color 0.2s;" OnClick="Button7_Click"/>
                                    </div>

                                </div>

                            </div>

                            <!-- NOTICE ID -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label10" runat="server" Text="Notice ID"></asp:Label>
                                </div>
                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox3" runat="server" placeholder="Notice ID" CssClass="add-staff-textbox" TextMode="Number" Width="100%" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>


                            <!-- NOTICE FOR -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label8" runat="server" Text="Notice For"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox5" runat="server" placeholder="Notice For" CssClass="add-staff-textbox" TextMode="SingleLine" Width="100%" ReadOnly="True"></asp:TextBox>
                                </div>

                            </div>


                            <!-- NOTICE -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label9" runat="server" Text="Notice"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox6" runat="server" placeholder="Notice..." Height="90px" TextMode="MultiLine" Width="100%" ReadOnly="True"></asp:TextBox>        
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

                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
            </div>

        </section>

<!-- --------------------------------------------- -->
        <!-- ALL NOTICE ENTRIES SECTION -->
<!-- --------------------------------------------- -->
    <section id="NoticeEntries" class="section-notice-grid-view admin-js--notice-table">
        <div class="admin-row">
            <h2>All Notice Entries</h2>
        </div>

        <div class="admin-row">

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentPortalSystem_dbConnectionString %>" SelectCommand="SELECT * FROM [Notice]"></asp:SqlDataSource>

            <div class="grid-view-data-table">
                <asp:GridView ID="GridView1" runat="server" CssClass="notice-entries-data-table table table-striped table-bordered" AutoGenerateColumns="False" DataKeyNames="notice_id" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="notice_id" HeaderText="ID" ReadOnly="True" SortExpression="notice_id" />
                        <asp:BoundField DataField="notice_by" HeaderText="Notice by" SortExpression="notice_by" />
                        <asp:BoundField DataField="notice_for" HeaderText="Notice For" SortExpression="notice_for" />
                        <asp:BoundField DataField="notice_date" HeaderText="Date &amp; Time" SortExpression="notice_date" />
                        <asp:BoundField DataField="notice" HeaderText="Message" SortExpression="notice" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>

    </section>



</asp:Content>
