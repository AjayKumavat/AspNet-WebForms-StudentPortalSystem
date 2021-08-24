<%@ Page Title="" Language="C#" MasterPageFile="~/StudentModule/Student.Master" AutoEventWireup="true" CodeBehind="ViewAttendance.aspx.cs" Inherits="StudentPortalSystemWebsite.StudentModule.ViewAttendance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>View Attendance</title>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="section-student-view-attendance admin-js--section">

        <div class="admin-row">
            <h2>View Attendance</h2>
        </div>

        <div class="admin-row">

            <!-- SQL DATA SOURCE -->
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentPortalSystem_dbConnectionString %>" SelectCommand="SELECT * FROM [Attendance] WHERE ([student_id] = (SELECT [user_id] FROM [Registration] WHERE ([username] = @username)))">
                <SelectParameters>
                    <asp:SessionParameter Name="username" SessionField="username" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            <div class="grid-view-data-table">


                <!-- GRID VIEW -->
                <asp:GridView ID="GridView1" CssClass="enter-marks-data-table table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">

                    <Columns>
                        <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
                        <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                    </Columns>

                </asp:GridView>

            </div> <!-- grid view -->

        </div>

    </section>

</asp:Content>
