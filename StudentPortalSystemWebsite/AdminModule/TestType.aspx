<%@ Page Title="" Language="C#" MasterPageFile="~/AdminModule/Admin.Master" AutoEventWireup="true" CodeBehind="TestType.aspx.cs" Inherits="StudentPortalSystemWebsite.AdminModule.TestType" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        .section-add-test-type {
            height: 600px;
        }

        .section-update-test-type {
            background-color: #f4f4f4;
            height: 680px;
        }

        .section-delete-test-type {
            height: 680px;
        }

        .section-test-type-grid-view {
            background-color: #f4f4f4;
            height: 770px;
        }

    </style>

    <title> Test Type</title>

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
                    <a class="btn btn-ghost admin-js--scroll-to-notice-table" href="#NoticeEntries"><i class="notice-icon ion-android-attach"></i></a>
                </div>
            </li>

        </ul>
    </div>



    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>

<!-- --------------------------------------------- -->
        <!-- ADD TEST TYPE SECTION -->
<!-- --------------------------------------------- -->
        <section class="section-add-test-type admin-js--section admin-js--add-notice">
            <div class="admin-row">
                <h2>Add Test Type</h2>
            </div>

            <div class="admin-row">
             
                <!-- ADD NOTICE DETAILS -->               
                <div class="form-width">

                    
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>

                            <!-- TEST TYPE ID -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label1" runat="server" Text="Test Type ID"></asp:Label>
                                </div>
                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox1" runat="server" placeholder="Test Type ID" CssClass="add-staff-textbox" TextMode="Number" Width="100%" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>


                            <!-- TEST TYPE NAME -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label2" runat="server" Text="Test Name"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox2" runat="server" placeholder="Test Name" CssClass="add-staff-textbox"></asp:TextBox>         
                                </div>
                        
                            </div>


                            <!-- TEST TYPE DATE -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label13" runat="server" Text="Test Date"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox11" runat="server" placeholder="Test Date" CssClass="add-staff-textbox" TextMode="Date"></asp:TextBox>         
                                </div>
                        
                            </div>


                            <!-- TOTAL MARKS -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label3" runat="server" Text="Total Marks"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox3" runat="server" placeholder="Total Marks" CssClass="add-staff-textbox" TextMode="Number"></asp:TextBox>        
                                </div>
                        
                            </div>

                            <!-- PASSING MARKS -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label4" runat="server" Text="Passing Marks"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox4" runat="server" placeholder="Passing Marks" CssClass="add-staff-textbox" TextMode="Number"></asp:TextBox>      
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
        <!-- UPDATE TEST TYPE SECTION -->
<!-- --------------------------------------------- -->
        <section class="section-update-test-type section-update-notice admin-js--update-notice">
            <div class="admin-row">
                <h2>Update Test Type</h2>
            </div>

            <div class="admin-row">

                <!-- ADD NOTICE DETAILS -->
                <div class="form-width">

                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>

                            <!-- TEST TYPE ID -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label5" runat="server" Text="Test Type ID"></asp:Label>
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
                                    <asp:TextBox ID="TextBox5" runat="server" placeholder="Test Name" CssClass="add-staff-textbox"></asp:TextBox>         
                                </div>
                        
                            </div>
                            

                            <!-- TEST TYPE DATE -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label14" runat="server" Text="Test Date"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox12" runat="server" placeholder="Test Date" CssClass="add-staff-textbox" TextMode="Date"></asp:TextBox>         
                                </div>
                        
                            </div>

                            <!-- TOTAL MARKS -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label7" runat="server" Text="Total Marks"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox6" runat="server" placeholder="Total Marks" CssClass="add-staff-textbox" TextMode="Number"></asp:TextBox>        
                                </div>
                        
                            </div>

                            <!-- PASSING MARKS -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label8" runat="server" Text="Passing Marks"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox7" runat="server" placeholder="Passing Marks" CssClass="add-staff-textbox" TextMode="Number"></asp:TextBox>      
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
        <!-- DELETE TEST TYPE SECTION -->
<!-- --------------------------------------------- -->
        <section class="section-delete-test-type admin-js--delete-notice">
            <div class="admin-row">
                <h2>Delete Test Type</h2>
            </div>

            <div class="admin-row">

                <!-- ADD NOTICE DETAILS -->
                <div class="form-width">

                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>

                            <!-- TEST TYPE ID -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label9" runat="server" Text="Test Type ID"></asp:Label>
                                </div>
                                <div class="col span-2-of-3">

                                    <div class="col span-1-of-2">
                                        <asp:DropDownList ID="DropDownList1" runat="server" Width="100%" CssClass="add-staff-textbox">
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col span-1-of-2">
                                        <asp:Button ID="Button5" runat="server" Text="Get Notice Details" Style="font-size:95%; display: inline-block; background-color:#48b04f;border: 2px solid #48b04f; padding: 7px 10px; font-weight: 300; border-radius: 3px; text-decoration: none; transition: background-color 0.2s, border 0.2s, color 0.2s;" OnClick="Button5_Click"/>
                                    </div>

                                </div>
                            </div>

                            <!-- TEST TYPE ID -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label17" runat="server" Text="Test Type ID"></asp:Label>
                                </div>
                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox15" runat="server" placeholder="Test Type ID" CssClass="add-staff-textbox" TextMode="Number" Width="100%" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            
                            <!-- TEST TYPE NAME -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label10" runat="server" Text="Test Name"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox8" runat="server" placeholder="Test Name" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>         
                                </div>
                        
                            </div>
                            

                            <!-- TEST TYPE DATE -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label15" runat="server" Text="Test Date"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox13" runat="server" placeholder="Test Date" CssClass="add-staff-textbox" TextMode="Date" ReadOnly="True"></asp:TextBox>         
                                </div>
                        
                            </div>

                            <!-- TOTAL MARKS -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label11" runat="server" Text="Total Marks"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox9" runat="server" placeholder="Total Marks" CssClass="add-staff-textbox" TextMode="Number" ReadOnly="True"></asp:TextBox>        
                                </div>
                        
                            </div>

                            <!-- PASSING MARKS -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label12" runat="server" Text="Passing Marks"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox10" runat="server" placeholder="Passing Marks" CssClass="add-staff-textbox" TextMode="Number" ReadOnly="True"></asp:TextBox>      
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
                                    <asp:Button ID="Button6" runat="server" Text="Delete" CssClass="btn btn-full module-form-btn" OnClick="Button6_Click"/>

                                    <!-- CLEAR BUTTON -->
                                    <asp:Button ID="Button7" runat="server" Text="Clear" CssClass="btn btn-full module-form-btn" OnClick="Button7_Click"/>
                                </div>

                            </div>

                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div> <!-- form-width -->
            </div> <!-- admin-row -->

        </section>



    <!-- --------------------------------------------- -->
        <!-- ALL TEST TYPE ENTRIES IN THE GRID VIEW -->
<!-- --------------------------------------------- -->
    <section id="TestTypeEntries" class="section-test-type-grid-view admin-js--notice-table">
        <div class="admin-row">
            <h2>All Test Type Entries</h2>
        </div>

        <div class="admin-row">

            <!-- Sql Data Source -->
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentPortalSystem_dbConnectionString %>" SelectCommand="SELECT * FROM [TestTypeDetails]"></asp:SqlDataSource>

            <div class="grid-view-data-table">
                
                <!-- TEST TYPE GRID VIEW -->
                <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="test_type_id" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="test_type_id" HeaderText="ID" ReadOnly="True" SortExpression="test_type_id" />
                        <asp:BoundField DataField="test_name" HeaderText="Test Name" SortExpression="test_name" />
                        <asp:BoundField DataField="date" HeaderText="Date of examination" SortExpression="date" />
                        <asp:BoundField DataField="total_marks" HeaderText="Total Marks" SortExpression="total_marks" />
                        <asp:BoundField DataField="passing_marks" HeaderText="Passing Marks" SortExpression="passing_marks" />
                    </Columns>
                </asp:GridView>

            </div>
        </div>

    </section>


</asp:Content>
