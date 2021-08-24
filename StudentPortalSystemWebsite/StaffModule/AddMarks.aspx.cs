using System;
using System.Collections.Generic;
using System.Configuration; //For ConfigurationManager class
using System.Data; //For ConnectionState class
using System.Data.SqlClient; //For SqlConnection class
using System.Text.RegularExpressions;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentPortalSystemWebsite.StaffModule
{
    public partial class AddMarks : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            //if (!this.IsPostBack)
            //{
            //    this.BindGrid();
            //}
            //TODAY'S DATE 
            TextBox2.Text = DateTime.Now.ToShortDateString();

            //Add Marks Button - Grid view
            Button3.Visible = false;


            //Add student marks - grid view data table
            //sectionAddStudentMarks.Visible = false;


        }

        // -----------------------------------------------------------
        // -----------------------------------------------------------
        // -----------------------------------------------------------
        // -----------------------------------------------------------
        // -----------------------------------------------------------
        private void BindGrid()
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT * FROM Registration WHERE stream = '" + DropDownList1.SelectedItem.Value + "' AND sub_stream = '" + DropDownList2.SelectedItem.Value + "' AND semester = '" + DropDownList3.SelectedItem.Value + "' AND status = 'ON';";
                    cmd.Connection = con;


                    DataTable dt = new DataTable();
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(dt);

                        if (dt.Rows.Count >= 1)
                        {
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                            Button3.Visible = true;
                            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + dt.Rows.Count + " Record Found!');", true);
                        }
                        else
                        {
                            Button3.Visible = false;
                            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('No Record Found!');", true);
                        }
                    }
                }
            }
        }

        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].Text = Regex.Replace(e.Row.Cells[0].Text, DropDownList1.SelectedItem.Value, delegate (Match match)
                {
                    return string.Format("<span style = 'background-color:#D9EDF7'>{0}</span>", match.Value);
                }, RegexOptions.IgnoreCase);
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex == 0 || DropDownList2.SelectedIndex == 0 || DropDownList3.SelectedIndex == 0 || DropDownList5.SelectedIndex == 0 || DropDownList6.SelectedIndex == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please fill all the details!');", true);
            }
            else
            {
                //Getting test type details 
                getTestTypeDetails();

                //Changing Grid View Heading
                Label9.Text = " " + DropDownList6.SelectedItem.Value + " ";

                //Binding data into the grid view 1
                this.BindGrid();
            }
        }
        // -----------------------------------------------------------
        // -----------------------------------------------------------
        // -----------------------------------------------------------
        // -----------------------------------------------------------
        // -----------------------------------------------------------

        // -----------------------------------------------------------
        //STREAM 
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList2.ClearSelection();
            DropDownList3.ClearSelection();
            DropDownList4.ClearSelection();
            DropDownList5.ClearSelection();
            DropDownList6.ClearSelection();
            //Clearing all the selection if no value is selected
            if (DropDownList1.SelectedIndex == 0)
            {
                DropDownList2.ClearSelection();
                DropDownList3.ClearSelection();
                DropDownList4.ClearSelection();
                DropDownList5.ClearSelection();
                DropDownList6.ClearSelection();
            }
            else
            {
                autoFillSubStream();
            }

        }

        // -----------------------------------------------------------
        //Sub Stream DropDownList
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                //Clear Selection of Semester DDL
                DropDownList3.ClearSelection();
                DropDownList4.ClearSelection();
                DropDownList5.ClearSelection();
                DropDownList6.ClearSelection();
                //Clearing all the selection if no value is selected
                if (DropDownList2.SelectedIndex == 0)
                {
                    DropDownList3.ClearSelection();
                    DropDownList4.ClearSelection();
                    DropDownList5.ClearSelection();
                    DropDownList6.ClearSelection();
                }
                else
                {

                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        // -----------------------------------------------------------
        // SEMESTER DROPDOWNLIST
        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList3.SelectedIndex == 0)
            {
                DropDownList5.ClearSelection();
                DropDownList6.ClearSelection();
            }
            else
            {
                autoFillYear();
                autoFillSubjects();
            }
        }
        //SEMESTER DROPDOWNLIST


        //Auto filling year ddl
        void autoFillYear()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT Distinct(academic_year) FROM StudentAcademicYear;", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);

                DropDownList4.DataTextField = ds.Tables[0].Columns["academic_year"].ToString();
                DropDownList4.DataSource = ds.Tables[0];
                DropDownList4.DataBind();
                DropDownList4.Items.Insert(0, new ListItem("--Select--", "0"));

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        // On Add Marks Button Click event
        protected void Button3_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow oItem in GridView1.Rows)
            {
                string marks = ((TextBox)oItem.FindControl("TextBox1")).Text;
                string enrollmentNo = ((Label)oItem.FindControl("Label2")).Text;
                string studentId = ((Label)oItem.FindControl("Label17")).Text;
                insertStudentMarks(marks, studentId, enrollmentNo);
            }
        }

        //Inserting Values from grid view to database
        public void insertStudentMarks(string marks, string studentId, string enrollmentNo)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO StudentMarks (student_id, enrollment_no, stream, sub_stream, semester, year, test_type, subject, marks, visibility, date) VALUES (@student_id, @enrollment_no, @stream, @sub_stream, @semester, @year, @test_type, @subject, @marks, @visibility, @date)", con);

                cmd.Parameters.AddWithValue("@student_id", studentId);
                cmd.Parameters.AddWithValue("@enrollment_no", enrollmentNo);
                cmd.Parameters.AddWithValue("@stream", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@sub_stream", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@semester", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("year", DropDownList4.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@test_type", DropDownList6.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@subject", DropDownList5.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@marks", marks);
                cmd.Parameters.AddWithValue("@visibility", "hide");
                cmd.Parameters.AddWithValue("@date", TextBox2.Text.Trim());

                cmd.ExecuteNonQuery();

                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Marks Update Successfully!'); document.location.href = 'AddMarks.aspx';", true);

                con.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }



        //USER DEFINED FUNCTIONS

        //Auto filling sub stream DDL
        void autoFillSubStream()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM CourseDetails WHERE stream = '" + DropDownList1.SelectedItem.Value + "';", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);

                DropDownList2.DataTextField = ds.Tables[0].Columns["sub_stream"].ToString();
                DropDownList2.DataSource = ds.Tables[0];
                DropDownList2.DataBind();
                DropDownList2.Items.Insert(0, new ListItem("--Select--", "0"));

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        //Auto filling subjects DDL
        void autoFillSubjects()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM SubjectDetails WHERE sub_stream = '" + DropDownList2.SelectedItem.Value + "' AND semester = '" + DropDownList3.SelectedItem.Value + "';", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);

                DropDownList5.DataTextField = ds.Tables[0].Columns["subject_name"].ToString();
                DropDownList5.DataSource = ds.Tables[0];
                DropDownList5.DataBind();
                DropDownList5.Items.Insert(0, new ListItem("--Select--", "0"));

                con.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }


        //TEST TYPE DETAILS - Updating the test type details
        void getTestTypeDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM TestTypeDetails WHERE test_name = '" + DropDownList6.SelectedItem.Value + "';", con);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox14.Text = dr.GetValue(0).ToString();
                        TextBox5.Text = dr.GetValue(1).ToString();
                        TextBox12.Text = dr.GetValue(2).ToString();
                        TextBox6.Text = dr.GetValue(3).ToString();
                        TextBox7.Text = dr.GetValue(4).ToString();
                    }
                }

                con.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }


        //Auto fill Test Type Name
        void autoFillTestTypeNames()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM TestTypeDetails;", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);

                DropDownList6.DataTextField = ds.Tables[0].Columns["test_name"].ToString();
                DropDownList6.DataSource = ds.Tables[0];
                DropDownList6.DataBind();
                DropDownList6.Items.Insert(0, new ListItem("--Select--", "0"));

                con.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Auto Fill Test Type DDL 
            autoFillTestTypeNames();
        }


    }
}