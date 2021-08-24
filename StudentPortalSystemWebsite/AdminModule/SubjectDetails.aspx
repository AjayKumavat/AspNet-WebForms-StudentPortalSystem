<%@ Page Title="" Language="C#" MasterPageFile="~/AdminModule/Admin.Master" AutoEventWireup="true" CodeBehind="SubjectDetails.aspx.cs" Inherits="StudentPortalSystemWebsite.AdminModule.SubjectDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        /* ------------------------------------------ */
        /* NOTICE (Notice.aspx) */
        /* ------------------------------------------ */

        /* SECTION HEIGHT */
        .section-add-subject {
            height: 700px;
        }

        .section-update-subject {
            background-color: #f4f4f4;
            height: 780px;
        }

        .section-delete-subject {
            display: block;
            height: 780px;
        }

       
    </style>

    <title>Subject Details</title>

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

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>

<!-- --------------------------------------------- -->
        <!-- ADD SUBJECT DETAILS -->
<!-- --------------------------------------------- -->
        <section class="section-add-subject admin-js--section admin-js--add-notice">
            <div class="admin-row">
                <h2>Add New Subject</h2>
            </div>

            <div class="admin-row">
             
                <!-- ADD SUBJECT DETAILS -->               
                <div class="form-width">

                    
                    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>--%>

                            <!-- SUBJECT ID -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label1" runat="server" Text="Subject ID"></asp:Label>
                                </div>
                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox1" runat="server" placeholder="Subject ID" CssClass="add-staff-textbox" TextMode="Number" Width="100%" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <!--  SELECT STREAM -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label2" runat="server" Text="Stream"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:DropDownList ID="DropDownList1" runat="server" Width="100%" CssClass="add-staff-textbox" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
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
                                    <asp:Label ID="Label3" runat="server" Text="Sub Stream"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:DropDownList ID="DropDownList2" runat="server" Width="100%" CssClass="add-staff-textbox">

                                        <asp:ListItem>--Select--</asp:ListItem>
                                        
                                    </asp:DropDownList>

                                </div>
                        
                            </div>

                            <!-- SELECT SEMESTER -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label4" runat="server" Text="Semester"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:DropDownList ID="DropDownList3" runat="server" Width="100%" CssClass="add-staff-textbox">
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


                            <!-- SUBJECT NAME -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label5" runat="server" Text="Subject name"></asp:Label>
                                </div>
                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox2" runat="server" placeholder="Subject name" CssClass="add-staff-textbox"></asp:TextBox>
                                </div>
                            </div>


                            <!--  SUBJECT CODE -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label6" runat="server" Text="Subject code"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox3" runat="server" placeholder="Subject code" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox"></asp:TextBox>
                                </div>
                        
                            </div>

                            <!-- SCHEME -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label7" runat="server" Text="Scheme"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox4" runat="server" placeholder="Scheme" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox"></asp:TextBox>
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
                                    <asp:Button ID="Button1" runat="server" Text="Add" CssClass="btn btn-full module-form-btn" OnClick="Button1_Click"/>

                                    <!-- CLEAR BUTTON -->
                                    <asp:Button ID="Button2" runat="server" Text="Clear" CssClass="btn btn-full module-form-btn" OnClick="Button2_Click"/>
                                </div>

                            </div>


                        <%--</ContentTemplate>
                    </asp:UpdatePanel>--%>

                </div> <!-- form-width -->
            </div> <!-- admin-row -->

        </section>

<!-- --------------------------------------------- -->
        <!-- UPDATE SUBJECT DETAILS -->
<!-- --------------------------------------------- -->
        <section class="section-update-subject section-update-notice admin-js--update-notice">
            <div class="admin-row">
                <h2>Update Subject</h2>
            </div>

            <div class="admin-row">

                <!-- UPDATE SUBJECT DETAILS -->
                <div class="form-width">

                    <%--<asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>--%>

                            <!-- SUBJECT ID -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label18" runat="server" Text="Subject ID"></asp:Label>
                                </div>
                                <div class="col span-2-of-3">

                                    <div class="col span-1-of-2">
                                        <asp:DropDownList ID="DropDownList5" runat="server" Width="100%" CssClass="add-staff-textbox">
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col span-1-of-2">
                                        <asp:Button ID="Button3" runat="server" Text="Get Notice Details" Style="font-size:95%; display: inline-block; background-color:#48b04f;border: 2px solid #48b04f; padding: 7px 10px; font-weight: 300; border-radius: 3px; text-decoration: none; transition: background-color 0.2s, border 0.2s, color 0.2s;" OnClick="Button3_Click"/>
                                    </div>

                                </div>
                            </div>

                            <!-- SUBJECT ID -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label11" runat="server" Text="Subject ID"></asp:Label>
                                </div>
                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox5" runat="server" placeholder="Subject ID" CssClass="add-staff-textbox" TextMode="Number" Width="100%"></asp:TextBox>
                                </div>
                            </div>

                            <!--  SELECT STREAM -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label12" runat="server" Text="Stream"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:DropDownList ID="DropDownList4" runat="server" Width="100%" CssClass="add-staff-textbox" AutoPostBack="True" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged">
                                        <asp:ListItem>--Select--</asp:ListItem>
                                        <asp:ListItem>Science</asp:ListItem>
                                        <asp:ListItem>Commerce</asp:ListItem>
                                        <asp:ListItem>Arts</asp:ListItem>
                                    </asp:DropDownList>

                                </div>
                        
                            </div>

                            <!--  CHANGE SUB STREAM -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label13" runat="server" Text="Change Sub-stream"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:DropDownList ID="DropDownList6" runat="server" Width="100%" CssClass="add-staff-textbox" OnSelectedIndexChanged="DropDownList6_SelectedIndexChanged" AutoPostBack="True">
                                        <asp:ListItem>--Select--</asp:ListItem>
                                    </asp:DropDownList>

                                </div>
                        
                            </div>

                            <!-- CURRENT SUB STREAM -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label43" runat="server" Text="Current Sub-stream"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox18" runat="server" placeholder="Current Sub-stream" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                        
                                </div>
                        
                            </div>

                            <!-- SELECT SEMESTER -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label14" runat="server" Text="Semester"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:DropDownList ID="DropDownList8" runat="server" Width="100%" CssClass="add-staff-textbox">
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


                            <!-- SUBJECT NAME -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label15" runat="server" Text="Subject name"></asp:Label>
                                </div>
                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox6" runat="server" placeholder="Subject name" CssClass="add-staff-textbox"></asp:TextBox>
                                </div>
                            </div>


                            <!--  SUBJECT CODE -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label16" runat="server" Text="Subject code"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox10" runat="server" placeholder="Subject code" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox"></asp:TextBox>
                                </div>
                        
                            </div>

                            <!-- SCHEME -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label17" runat="server" Text="Scheme"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox11" runat="server" placeholder="Scheme" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox"></asp:TextBox>
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
                                    <asp:Button ID="Button7" runat="server" Text="Update" CssClass="btn btn-full module-form-btn" OnClick="Button7_Click"/>

                                    <!-- CLEAR BUTTON -->
                                    <asp:Button ID="Button9" runat="server" Text="Clear" CssClass="btn btn-full module-form-btn" OnClick="Button9_Click"/>
                                </div>

                            </div>

                        <%--</ContentTemplate>
                    </asp:UpdatePanel>--%>

                </div>
            </div>

        </section>

<!-- --------------------------------------------- -->
        <!-- DELETE SUBJECT DETAILS -->
<!-- --------------------------------------------- -->
        <section class="section-delete-subject admin-js--delete-notice">
            <div class="admin-row">
                <h2>Delete Subject</h2>
            </div>

            <div class="admin-row">

                <!-- ADD NOTICE DETAILS -->
                <div class="form-width">

                    <%--<asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>--%>

                            <!-- SUBJECT ID -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label8" runat="server" Text="Subject ID"></asp:Label>
                                </div>
                                <div class="col span-2-of-3">

                                    <div class="col span-1-of-2">
                                        <asp:DropDownList ID="DropDownList7" runat="server" Width="100%" CssClass="add-staff-textbox">
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col span-1-of-2">
                                        <asp:Button ID="Button4" runat="server" Text="Get Notice Details" Style="font-size:95%; display: inline-block; background-color:#48b04f;border: 2px solid #48b04f; padding: 7px 10px; font-weight: 300; border-radius: 3px; text-decoration: none; transition: background-color 0.2s, border 0.2s, color 0.2s;" OnClick="Button4_Click"/>
                                    </div>

                                </div>
                            </div>

                            <!-- SUBJECT ID -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label9" runat="server" Text="Subject ID"></asp:Label>
                                </div>
                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox7" runat="server" placeholder="Subject ID" CssClass="add-staff-textbox" TextMode="Number" Width="100%" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <!--  SELECT STREAM -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label10" runat="server" Text="Stream"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox15" runat="server" placeholder="Stream" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>

                                </div>
                        
                            </div>

                            <!--  SELECT SUB STREAM -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label19" runat="server" Text="Sub Stream"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox14" runat="server" placeholder="Sub Stream" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                                </div>
                        
                            </div>

                            <!-- SELECT SEMESTER -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label20" runat="server" Text="Semester"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox13" runat="server" placeholder="Semester" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                                </div>
                        
                            </div>


                            <!-- SUBJECT NAME -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label21" runat="server" Text="Subject name"></asp:Label>
                                </div>
                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox8" runat="server" placeholder="Subject name" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>


                            <!--  SUBJECT CODE -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label22" runat="server" Text="Subject code"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox9" runat="server" placeholder="Subject code" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
                                </div>
                        
                            </div>

                            <!-- SCHEME -->
                            <div class="admin-row">
                                <div class="col span-1-of-3">
                                    <asp:Label ID="Label23" runat="server" Text="Scheme"></asp:Label>
                                </div>

                                <div class="col span-2-of-3">
                                    <asp:TextBox ID="TextBox12" runat="server" placeholder="Scheme" TextMode="SingleLine" Width="100%" CssClass="add-staff-textbox" ReadOnly="True"></asp:TextBox>
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

                        <%--</ContentTemplate>
                    </asp:UpdatePanel>--%>

                </div>
            </div>

        </section>

<!-- --------------------------------------------- -->
        <!-- ALL SUBJECT DETAILS -->
<!-- --------------------------------------------- -->
    <section id="NoticeEntries" class="section-notice-grid-view admin-js--notice-table">
        <div class="admin-row">
            <h2>All Subject Entries</h2>
        </div>

        <div class="admin-row">

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentPortalSystem_dbConnectionString %>" SelectCommand="SELECT * FROM [SubjectDetails]"></asp:SqlDataSource>

            <div class="grid-view-data-table">
                
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" DataKeyNames="subject_id" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="subject_id" HeaderText="ID" ReadOnly="True" SortExpression="subject_id" />
                        <asp:BoundField DataField="stream" HeaderText="Stream" SortExpression="stream" />
                        <asp:BoundField DataField="sub_stream" HeaderText="Sub Stream" SortExpression="sub_stream" />
                        <asp:BoundField DataField="semester" HeaderText="Semester" SortExpression="semester" />
                        <asp:BoundField DataField="subject_name" HeaderText="Subject Name" SortExpression="subject_name" />
                        <asp:BoundField DataField="subject_code" HeaderText="Code" SortExpression="subject_code" />
                    </Columns>
                </asp:GridView>

            </div>
        </div>

    </section>

    </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
