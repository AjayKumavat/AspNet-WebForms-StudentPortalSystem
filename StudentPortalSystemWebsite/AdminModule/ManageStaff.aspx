<%@ Page Title="" Language="C#" MasterPageFile="~/AdminModule/Admin.Master" AutoEventWireup="true" CodeBehind="ManageStaff.aspx.cs" Inherits="StudentPortalSystemWebsite.AdminModule.ManageStaff" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        .section-add-staff {
            height: 910px;
        }

        .section-update-staff{
            background-color: #f4f4f4;
            height: 910px;
        }

        .section-delete-staff {
            height: 910px;
        }

        .section-staff-table-grid-view{
            background-color: #f4f4f4;
            height: 780px;
        }

    </style>

    <title>Manage Staff</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- MODIFY STAFF STICKY NAV -->
    <div class="sticky-notice-nav">
        <ul>

            <!-- ADD STAFF -->
            <li>
                <div class="notice-heading">
                    <a class="btn btn-full admin-js--scroll-to-add-notice" href="#ApproveStudent"><i class="notice-icon ion-android-add"></i></a>
                </div>
            </li>

            <!-- MODIFY/UPDATE STAFF -->
            <li>
                <div class="notice-heading">
                    <a class="btn btn-full admin-js--scroll-to-update-notice" href="#ModifyStudent"><i class="notice-icon ion-android-sync"></i></a>
                </div>
            </li>

            <!-- DELETE STAFF -->
            <li>
                <div class="notice-heading">
                    <a class="btn btn-full admin-js--scroll-to-delete-notice" href="#DeleteStudent"><i class="notice-icon ion-android-delete"></i></a>
                </div>
            </li>

            <!-- ALL STAFF ENTRIES -->
            <li>
                <div class="notice-heading">
                    <a class="btn btn-ghost admin-js--scroll-to-notice-table" href="#StudentEntries"><i class="notice-icon ion-android-attach"></i></a>
                </div>
            </li>

        </ul>
    </div>
    <!-- ^^^^^^^^^^^^^^^^^^^^^^^ -->
    <!-- MODIFY STAFF STICKY NAV -->

    <!-- FORM -->
    
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
    <!-- SECTION 1 (ADD STAFF)-->
    <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
    <section class="section-add-staff admin-js--section admin-js--add-notice">
        <div class="admin-row">
            <h2>Add Staff</h2>
        </div>

        <div class="admin-row">

            <!-- STUDENT DETAILS -->
            
                
                
            <div class="form-width">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
            
                        <!-- STAFF ID -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <label for="staff_id">Staff ID</label>
                    </div>
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox1" runat="server" placeholder="Staff ID" CssClass="add-staff-textbox" TextMode="Number" Width="100%" ReadOnly="True"></asp:TextBox>
                    </div>
                </div>

                <!-- STAFF FULL NAME -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <label for="name">Fullname</label>
                    </div>
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox2" runat="server" placeholder="Fullname" CssClass="add-staff-textbox"></asp:TextBox>
                        
                    </div>
                </div>

                <!-- ADDRESS -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <label for="address">Address</label>
                    </div>

                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox3" runat="server" placeholder="Enter Address" Height="90px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                        
                    </div>

                </div>

                <!--  CONTACT NO -->
                <div class="admin-row">

                    <!-- LABEL -->
                    <div class="col span-1-of-3">
                        <label for="contact_no">Contact No.</label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox4" runat="server" placeholder="Contact no." TextMode="Number" Width="100%" CssClass="add-staff-textbox"></asp:TextBox>
                    </div>
                        
                </div>

                <!--  GENDER -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <label for="gender">Gender</label>
                    </div>

                    <div class="col span-2-of-3">
                        <asp:DropDownList ID="DropDownList1" runat="server" Width="100%" CssClass="add-staff-textbox">
                            <asp:ListItem>--Select--</asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                            <asp:ListItem>Other</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                        
                </div>

                <!--  EMAIL ID -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <label for="email">Email</label>
                    </div>

                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox5" runat="server" placeholder="Email" TextMode="Email" Width="100%" CssClass="add-staff-textbox"></asp:TextBox>
                        
                    </div>
                        
                </div>

                <!-- DESIGNATION -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <label for="designation">Designation</label>
                    </div>

                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox6" runat="server" placeholder="Designation" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox"></asp:TextBox>
                        
                    </div>
                        
                </div>

                <!-- USERNAME -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <label for="username">Username</label>
                    </div>

                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox7" runat="server" placeholder="Username" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox"></asp:TextBox>
                        
                    </div>
                        
                </div>

                <!-- PASSWORD -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <label for="password">Password</label>
                    </div>

                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox8" runat="server" placeholder="Password" TextMode="Password" Width="100%" CssClass="add-staff-textbox"></asp:TextBox>
                        
                    </div>
                        
                </div>

                <!-- RETYPE PASSWORD -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <label for="confirm-password">Confirm Password</label>
                    </div>

                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox9" runat="server" placeholder="Confirm Password" TextMode="Password" Width="100%" CssClass="add-staff-textbox"></asp:TextBox>
                        
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
                        <asp:Button ID="Button6" runat="server" Text="Clear" CssClass="btn btn-full module-form-btn" OnClick="Button6_Click"/>
                    </div>

                </div>

                    </ContentTemplate>
                 </asp:UpdatePanel>

            </div>
            
        </div>

    </section>


    <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
    <!-- SECTION 2 (UPDATE STAFF)-->
    <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
    <section class="section-update-staff admin-js--section admin-js--update-notice">

        <!-- SECTION HEADING - DELETE STAFF -->
        <div class="admin-row">
            <h2>Update Staff Details</h2>
        </div>

        <!-- FORM -->
        <div class="admin-row">
            <div class="form-width">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>

                        <!-- STAFF ID -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label1" runat="server" Text="Staff ID"></asp:Label>
                    </div>

                    <div class="col span-2-of-3">
                        <div class="col span-1-of-2">
                            <asp:DropDownList ID="DropDownList2" runat="server" Width="100%" CssClass="add-staff-textbox">
                            </asp:DropDownList>
                        </div>
                        <div class="col span-1-of-2">
                            <asp:Button ID="Button2" runat="server" Text="Get Staff Details" Style="font-size:95%; display: inline-block; background-color:#48b04f;border: 2px solid #48b04f; padding: 7px 18px; font-weight: 300; border-radius: 3px; text-decoration: none; transition: background-color 0.2s, border 0.2s, color 0.2s;" OnClick="Button2_Click"/>
                        </div>
                    </div>
                </div>

                <!-- USER ID -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label2" runat="server" Text="User ID"></asp:Label>
                    </div>

                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox10" runat="server" placeholder="User ID" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                    </div>
                        
                <!-- USERNAME -->
                <div class="admin-row">
                    <!-- LABEL -->  
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label3" runat="server" Text="Fullname"></asp:Label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox11" runat="server" placeholder="Fullname" CssClass="add-staff-textbox" ReadOnly="False"></asp:TextBox>
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
                        <asp:TextBox ID="TextBox12" runat="server" placeholder="Address" Height="90px" TextMode="MultiLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="False"></asp:TextBox>
                    </div>
                </div>

                <!--  CONTACT NO -->
                <div class="admin-row">

                    <!-- LABEL -->
                    <div class="col span-1-of-3">
                        <label for="contact_no">Contact No.</label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox13" runat="server" placeholder="Contact no." TextMode="Number" Width="100%" CssClass="add-staff-textbox" ReadOnly="False"></asp:TextBox>
                    </div>
                </div>

                <!--  GENDER -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <label for="gender">Gender</label>
                    </div>

                    <div class="col span-2-of-3">
                        <asp:DropDownList ID="DropDownList3" runat="server" Width="100%" CssClass="add-staff-textbox">
                            <asp:ListItem>--Select--</asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                            <asp:ListItem>Other</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                        
                </div>

                <!--  EMAIL ID -->
                <div class="admin-row">
                    <!-- LABEL -->
                    <div class="col span-1-of-3">
                        <label for="email">Email</label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox14" runat="server" placeholder="Email" TextMode="Email" Width="100%" CssClass="add-staff-textbox" ReadOnly="False"></asp:TextBox>
                    </div>
                </div>

                 <!-- DESIGNATION -->
                <div class="admin-row">
                    <!-- LABEL -->
                    <div class="col span-1-of-3">
                        <label for="designation">Designation</label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox15" runat="server" placeholder="Designation" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="False"></asp:TextBox>
                    </div>
                        
                </div>

                <!-- USERNAME -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <label for="username">Username</label>
                    </div>

                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox16" runat="server" placeholder="Username" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="False"></asp:TextBox>
                        
                    </div>
                        
                </div>

                <!-- UPDATE BUTTON -->
                <div class="admin-row">
                                
                    <!-- NON BREAKING SPACE -->
                    <div class="col span-1-of-3">
                        <label>&nbsp</label>
                    </div>

                    <!-- BUTTON -->
                    <div class="col span-2-of-3">
                        <!-- ADD BUTTON -->
                        <asp:Button ID="Button3" runat="server" Text="Update" CssClass="btn btn-full module-form-btn" OnClick="Button3_Click"/>

                        <!-- CLEAR BUTTON -->
                        <asp:Button ID="Button7" runat="server" Text="Clear" CssClass="btn btn-full module-form-btn" OnClick="Button7_Click"/>
                    </div>

                </div>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>

    </section>


    <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
    <!-- SECTION 3 (DELETE STAFF)-->
    <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
    <section class="section-delete-staff admin-js--section admin-js--delete-notice">

        <!-- SECTION HEADING - DELETE STAFF -->
        <div class="admin-row">
            <h2>Delete Staff Details</h2>
        </div>

        <!-- FORM -->
        <div class="admin-row">
            <div class="form-width">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>

                        <!-- STAFF ID -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label5" runat="server" Text="Staff ID"></asp:Label>
                    </div>

                    <div class="col span-2-of-3">
                        <div class="col span-1-of-2">
                            <asp:DropDownList ID="DropDownList4" runat="server" Width="100%" CssClass="add-staff-textbox">
                            </asp:DropDownList>
                        </div>
                        <div class="col span-1-of-2">
                            <asp:Button ID="Button4" runat="server" Text="Get Staff Details" Style="font-size:95%; display: inline-block; background-color:#48b04f;border: 2px solid #48b04f; padding: 7px 18px; font-weight: 300; border-radius: 3px; text-decoration: none; transition: background-color 0.2s, border 0.2s, color 0.2s;" OnClick="Button4_Click"/>
                        </div>
                    </div>
                </div>

                <!-- USER ID -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label6" runat="server" Text="User ID"></asp:Label>
                    </div>

                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox17" runat="server" placeholder="User ID" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                    </div>
                        
                <!-- USERNAME -->
                <div class="admin-row">
                    <!-- LABEL -->  
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label7" runat="server" Text="Fullname"></asp:Label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox18" runat="server" placeholder="Fullname" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                    </div>
                </div>

                <!-- ADDRESS -->
                <div class="admin-row">
                    <!-- LABEL -->  
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label8" runat="server" Text="Address"></asp:Label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox19" runat="server" placeholder="Address" Height="90px" TextMode="MultiLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                    </div>
                </div>

                <!--  CONTACT NO -->
                <div class="admin-row">

                    <!-- LABEL -->
                    <div class="col span-1-of-3">
                        <label for="contact_no">Contact No.</label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox20" runat="server" placeholder="Contact no." TextMode="Number" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                    </div>
                </div>

                <!--  GENDER -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <label for="gender">Gender</label>
                    </div>

                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox21" runat="server" placeholder="Gender" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                    </div>
                        
                </div>

                <!--  EMAIL ID -->
                <div class="admin-row">
                    <!-- LABEL -->
                    <div class="col span-1-of-3">
                        <label for="email">Email</label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox22" runat="server" placeholder="Email" TextMode="Email" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                    </div>
                </div>

                 <!-- DESIGNATION -->
                <div class="admin-row">
                    <!-- LABEL -->
                    <div class="col span-1-of-3">
                        <label for="designation">Designation</label>
                    </div>

                    <!-- TEXTBOX -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox23" runat="server" placeholder="Designation" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                    </div>
                        
                </div>

                <!-- USERNAME -->
                <div class="admin-row">
                    <div class="col span-1-of-3">
                        <label for="username">Username</label>
                    </div>

                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox24" runat="server" placeholder="Username" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                        
                    </div>
                        
                </div>

                <!-- DELETE BUTTON -->
                <div class="admin-row">
                                
                    <!-- NON BREAKING SPACE -->
                    <div class="col span-1-of-3">
                        <label>&nbsp</label>
                    </div>

                    <!-- BUTTON -->
                    <div class="col span-2-of-3">
                        <!-- ADD BUTTON -->
                        <asp:Button ID="Button5" runat="server" Text="Delete" CssClass="btn btn-full module-form-btn" OnClick="Button5_Click"/>

                        <!-- CLEAR BUTTON -->
                        <asp:Button ID="Button8" runat="server" Text="Clear" CssClass="btn btn-full module-form-btn"/>
                    </div>

                </div>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>

    </section>
<!-- DELETE STUDENT -->

    
    <!-- --------------------------------------------- -->
        <!-- ALL STUDENT ENTRIES IN THE GRID VIEW -->
<!-- --------------------------------------------- -->
    <section id="staffEntries" class="section-staff-table-grid-view admin-js--notice-table">
        <div class="admin-row">
            <h2>All Staff Entries</h2>
        </div>

        <div class="admin-row">

            <!-- Sql Data Source -->
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentPortalSystem_dbConnectionString %>" SelectCommand="SELECT * FROM [StaffDetails]"></asp:SqlDataSource>

            <div class="grid-view-data-table">
                
                <!-- TEST TYPE GRID VIEW -->
                <asp:GridView ID="GridView1" runat="server" CssClass="staff-entries-data-table table table-striped table-bordered" AutoGenerateColumns="False" DataKeyNames="staff_id" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="staff_id" HeaderText="ID" ReadOnly="True" SortExpression="staff_id" />
                        <asp:BoundField DataField="staff_name" HeaderText="Fullname" SortExpression="staff_name" />
                        <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                        <asp:BoundField DataField="contact_no" HeaderText="Mobile no" SortExpression="contact_no" />
                        <asp:BoundField DataField="designation" HeaderText="Designation" SortExpression="designation" />
                        <asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="gender" />
                    </Columns>
                </asp:GridView>

            </div>
        </div>

    </section>

</asp:Content>
