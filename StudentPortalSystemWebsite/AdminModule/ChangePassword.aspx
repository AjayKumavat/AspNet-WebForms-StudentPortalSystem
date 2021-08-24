<%@ Page Title="" Language="C#" MasterPageFile="~/AdminModule/Admin.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="StudentPortalSystemWebsite.AdminModule.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        .section-change-password{
            height: 500px;
        }

        .required-field-validator{
            color: red;
        }

    </style>

    <title>Change Password</title>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

    <!-- SECTION CHANGE PASSWORD -->
    <section class="section-change-password admin-js--section">

        <div class="admin-row">
            <h2>Change Password</h2>
        </div>

        <div class="admin-row">

            <!-- FORM -->
            <div class="form-width">

                
                <!-- OLD PASSWORD -->
                <div class="admin-row">

                    <!-- LABEL - OLD PASSWORD -->
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label1" runat="server" Text="Old Password"></asp:Label>
                    </div>

                    <!-- TEXTBOX - OLD PASSWORD -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox1" runat="server" placeholder="Old Password" CssClass="add-staff-textbox" ReadOnly="False" TextMode="Password"></asp:TextBox>
                    </div>

                </div>
                
                <!-- NEW PASSWORD -->
                <div class="admin-row">

                    <!-- LABEL - NEW PASSWORD -->
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label2" runat="server" Text="New Password"></asp:Label>
                    </div>

                    <!-- TEXTBOX - OLD PASSWORD -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox2" runat="server" placeholder="New Password" CssClass="add-staff-textbox" ReadOnly="False" TextMode="Password"></asp:TextBox>
                    </div>

                </div>

                <!-- CONFIRM PASSWORD -->
                <div class="admin-row">

                    <!-- LABEL - OLD PASSWORD -->
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label3" runat="server" Text="Confirm Password"></asp:Label>
                    </div>

                    <!-- TEXTBOX - OLD PASSWORD -->
                    <div class="col span-2-of-3">
                        <asp:TextBox ID="TextBox3" runat="server" placeholder="Confirm Password" CssClass="add-staff-textbox" ReadOnly="False" TextMode="Password"></asp:TextBox>

                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="*Confirm password doesn't match*" ControlToCompare="TextBox2" ControlToValidate="TextBox3" CssClass="required-field-validator"></asp:CompareValidator>
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

                        <asp:Button ID="Button1" runat="server" Text="Update"  CssClass="btn btn-full module-form-btn" OnClick="Button1_Click"/>

                    </div>    
                </div>

            </div>
            <!-- FORM -->
        </div>

    </section>

    </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
