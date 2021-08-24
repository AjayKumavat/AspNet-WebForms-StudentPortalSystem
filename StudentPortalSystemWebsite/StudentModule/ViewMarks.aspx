<%@ Page Title="" Language="C#" MasterPageFile="~/StudentModule/Student.Master" AutoEventWireup="true" CodeBehind="ViewMarks.aspx.cs" Inherits="StudentPortalSystemWebsite.StudentModule.ViewMarks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>View Marks</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="section-student-view-attendance admin-js--section">

        <div class="admin-row">
            <h2>View Marks</h2>
        </div>

        <div class="admin-row">

            <!-- SQL DATA SOURCE -->
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentPortalSystem_dbConnectionString %>" SelectCommand="SELECT * FROM [StudentMarks] WHERE ([student_id] = (SELECT [user_id] FROM [Registration] WHERE ([username] = @username)))">
                <SelectParameters>
                    <asp:SessionParameter Name="username" SessionField="username" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            <div class="grid-view-data-table">


                <!-- GRID VIEW -->
                <asp:GridView ID="GridView1" CssClass="enter-marks-data-table table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="student_id" HeaderText="student_id" SortExpression="student_id" />
                        <asp:BoundField DataField="test_type" HeaderText="test_type" SortExpression="test_type" />
                        <asp:BoundField DataField="subject" HeaderText="subject" SortExpression="subject" />
                        <asp:BoundField DataField="marks" HeaderText="marks" SortExpression="marks" />
                        <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                    </Columns>

                </asp:GridView>
                

            </div> <!-- grid view -->

        </div>

    </section>

</asp:Content>
