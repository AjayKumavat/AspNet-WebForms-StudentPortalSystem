using System;
using System.Collections.Generic;
using System.Configuration; //For ConfigurationManager class
using System.Data; //For ConnectionState class
using System.Data.SqlClient; //For SqlConnection class
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentPortalSystemWebsite.AdminModule
{
    public partial class Attendance : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!this.IsPostBack)
            //{
            //    this.BindGrid();
            //}

            //Today's date
            TextBox1.Text = DateTime.Now.ToShortDateString();

            //MARK ATTENDANCE - BUTTON
            Button3.Visible = false;
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


        // -----------------------------------------------------------
        //STREAM 
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList2.ClearSelection();
            DropDownList3.ClearSelection();
            DropDownList4.ClearSelection();
            //Clearing all the selection if no value is selected
            if (DropDownList1.SelectedIndex == 0)
            {
                DropDownList2.ClearSelection();
                DropDownList3.ClearSelection();
                DropDownList4.ClearSelection();
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
                //Clearing all the selection if no value is selected
                if (DropDownList2.SelectedIndex == 0)
                {
                    DropDownList3.ClearSelection();
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
            //Auto Fill Year
            autoFillYear();
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(DropDownList1.SelectedIndex == 0 || DropDownList2.SelectedIndex == 0 || DropDownList3.SelectedIndex == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please fill at the details!');", true);
            }
            else if (checkAttendanceExistOnTheSameDateForSameBatch())
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Attendance already marked for this batch!');", true);
            }
            else
            {
                this.BindGrid();
            }
        }
        //void check if the attendance for same batch exist on the same date
        bool checkAttendanceExistOnTheSameDateForSameBatch()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if(con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM Attendance WHERE date = '" + TextBox1.Text.Trim() + "' AND stream = '" + DropDownList1.SelectedItem.Value + "' AND sub_stream = '" + DropDownList2.SelectedItem.Value + "' AND semester = '" + DropDownList3.SelectedItem.Value + "' AND year = '" + DropDownList4.SelectedItem.Value + "';", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();

                da.Fill(dt);

                con.Close();

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch(Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('"+ex.Message+"');", true);
                return false;
            }
        }


        protected void Button3_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow oItem in GridView1.Rows)
            {
                RadioButton present = ((RadioButton)oItem.FindControl("RadioButton1"));
                RadioButton absent = ((RadioButton)oItem.FindControl("RadioButton2"));
                string enrollmentNo = ((Label)oItem.FindControl("Label2")).Text;
                string studentId = ((Label)oItem.FindControl("Label17")).Text;
                string status = "";

                if (present.Checked)
                {
                    status = "Present";
                }
                else
                {
                    status = "Absent";
                }
                markStudentAttendance(status, studentId, enrollmentNo);
            }
        }

        public void markStudentAttendance(string status, string studentId, string enrollmentNo)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO Attendance (date, student_id, enrollment_no, stream, sub_stream, semester, year, status, visibility) VALUES (@date, @student_id, @enrollment_no, @stream, @sub_stream, @semester, @year, @status, @visibility)", con);

                cmd.Parameters.AddWithValue("@date", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@student_id", studentId);
                cmd.Parameters.AddWithValue("@enrollment_no", enrollmentNo);
                cmd.Parameters.AddWithValue("@stream", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@sub_stream", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@semester", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@year", DropDownList4.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@status", status);
                cmd.Parameters.AddWithValue("@visibility", "hide");

                cmd.ExecuteNonQuery();

                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Attendance marked successfully!'); document.location.href = 'Attendance.aspx';", true);

                con.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

    }
}