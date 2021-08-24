using System;
using System.Collections.Generic;
using System.Configuration; // For ConfigurationManager class
using System.Data; // For ConnectionState class
using System.Data.SqlClient; // For SqlConnection class
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentPortalSystemWebsite.AdminModule
{
    public partial class CourseDetails : System.Web.UI.Page
    {
        //Connection String
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            //TO SHOW ALL THE UPDATED DATA IN THE GRID VIEW WHENEVER THIS PAGE IS RELOADED
            GridView1.DataBind();

            //AUTO FILL NOTICE ID - ON PAGE LOAD

            autoGenerateCourseId();
            //-----------------------------------------

            //UPDATE NOTICE - ON PAGE LOAD
            if (DropDownList6.Items.Count == 0)
            {
                autoFillCourseId();
            }
            //-----------------------------------------

            //DELETE NOTICE - ON PAGE LOAD
            if (DropDownList5.Items.Count == 0)
            {
                autoFillCourseId();
            }
            //-----------------------------------------
        }

        // ---------------------------------------------
        // ADD COURSE
        // ---------------------------------------------

        // DROP DOWN LIST 3 - SEMESTER 
        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            addCourseDurationCalculator();
        }

        //ADD BUTTON 
        protected void Button1_Click(object sender, EventArgs e)
        {
            if(TextBox1.Text.Trim() == "" || DropDownList1.SelectedIndex == 0 || TextBox2.Text.Trim() == "" || TextBox3.Text.Trim() == "" || DropDownList3.SelectedIndex == 0 || TextBox4.Text.Trim() == "" || TextBox5.Text.Trim() == "")
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please fill at the details!');", true);
            }
            else
            {
                if (checkAddCourseSubStreamExist())
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Sub stream \"" + TextBox2.Text.Trim() + "\" already exist!');", true);
                }
                else if (checkAddCourseAbbreviationExist())
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Abbreviation \"" + TextBox3.Text.Trim() + "\" already exist!');", true);
                }
                else if (checkAddCourseCodeExist())
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Course code \"" + TextBox5.Text.Trim() + "\" already exist!');", true);
                }
                else
                {
                    addCourse();
                }
            }
        }

        //CLEAR BUTTON
        protected void Button2_Click(object sender, EventArgs e)
        {
            clearAddCourseTextBoxes();
        }



        // ---------------------------------------------
        // UPDATE COURSE
        // ---------------------------------------------

        // DROP DOWN LIST 3 - SEMESTER 
        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            updateCourseDurationCalculator();
        }

        //GET DETAILS BUTTON
        protected void Button6_Click(object sender, EventArgs e)
        {
            getUpdateCourseDetails();
        }

        //UPDATE BUTTON
        protected void Button4_Click(object sender, EventArgs e)
        {
            if(TextBox6.Text.Trim() == "" || TextBox7.Text.Trim() == "" || TextBox8.Text.Trim() == "" || TextBox9.Text.Trim() == "" || TextBox10.Text.Trim() == "" || DropDownList2.SelectedIndex == 0 || DropDownList4.SelectedIndex == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please fill at the details!');", true);
            }
            else
            {
                if (checkUpdateCourseSubStreamExist())
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Sub stream \"" + TextBox7.Text.Trim() + "\" already exist!');", true);
                }
                else if (checkUpdateCourseAbbreviationExist())
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Abbreviation \"" + TextBox8.Text.Trim() + "\" already exist!');", true);
                }
                else if (checkUpdateCourseCodeExist())
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Course code \"" + TextBox10.Text.Trim() + "\" already exist!');", true);
                }
                else
                {
                    updateCourse();
                }
            }
        }

        //CLEAR BUTTON
        protected void Button5_Click(object sender, EventArgs e)
        {
            clearUpdateCourseTextBoxes();
        }



        // ---------------------------------------------
        // DELETE COURSE
        // ---------------------------------------------

        //GET DETAILS BUTTON
        protected void Button3_Click(object sender, EventArgs e)
        {
            getDeleteCourseDetails();
        }

        //DELETE BUTTON
        protected void Button7_Click(object sender, EventArgs e)
        {
            if(TextBox11.Text == "")
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please select a Course ID!');", true);
            }
            else
            {
                deleteCourse();
            }
        }

        //CLEAR BUTTON
        protected void Button8_Click(object sender, EventArgs e)
        {
            clearDeleteCourseTextBoxes();
        }



        //(UPDATE & DELETE) Auto Fill Course ID
        void autoFillCourseId()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM CourseDetails;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);
                DropDownList6.DataTextField = ds.Tables[0].Columns["course_id"].ToString();
                DropDownList6.DataSource = ds.Tables[0];
                DropDownList6.DataBind();
                DropDownList6.Items.Insert(0, new ListItem("--Select--", "0"));

                DropDownList5.DataTextField = ds.Tables[0].Columns["course_id"].ToString();
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

        // ---------------------------------------------
        // ADD COURSE
        // ---------------------------------------------

        //Auto generate Course ID
        void autoGenerateCourseId()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if(con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT MAX(course_id)+1 FROM CourseDetails", con);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox1.Text = dr[0].ToString();
                        if(TextBox1.Text == "")
                        {
                            TextBox1.Text = "1";
                        }
                    }
                }
                else
                {
                    TextBox1.Text = "1";
                    return;
                }

                con.Close();
            }
            catch(Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //Semester DDL - duration calculator
        void addCourseDurationCalculator()
        {
            try
            {
                if (DropDownList3.SelectedIndex == 0)
                {
                    TextBox4.Text = "";
                }
                else if (DropDownList3.SelectedIndex == 1)
                {
                    TextBox4.Text = "6 Months";
                }
                else if (DropDownList3.SelectedIndex == 2)
                {
                    TextBox4.Text = "1 Year";
                }
                else if (DropDownList3.SelectedIndex == 3)
                {
                    TextBox4.Text = "1.5 Years";
                }
                else if (DropDownList3.SelectedIndex == 4)
                {
                    TextBox4.Text = "2 Years";
                }
                else if (DropDownList3.SelectedIndex == 5)
                {
                    TextBox4.Text = "2.5 Years";
                }
                else
                {
                    TextBox4.Text = "3 Years";
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //Add Course
        void addCourse()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO CourseDetails (course_id, stream, sub_stream, abbreviation, semester, duration, course_code) VALUES (@course_id, @stream, @sub_stream, @abbreviation, @semester, @duration, @course_code)", con);

                cmd.Parameters.AddWithValue("@course_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@stream", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@sub_stream", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@abbreviation", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@semester", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@duration", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@course_code", TextBox5.Text.Trim());

                cmd.ExecuteNonQuery();

                con.Close();

                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Course Added Successfully!'); document.location.href = 'CourseDetails.aspx';", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //Clear TextBoxes
        void clearAddCourseTextBoxes()
        {
            try
            {
                DropDownList1.ClearSelection();
                TextBox2.Text = "";
                TextBox3.Text = "";
                DropDownList3.ClearSelection();
                TextBox4.Text = "";
                TextBox5.Text = "";
            }
            catch(Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //Check Sub-stream exist
        bool checkAddCourseSubStreamExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if(con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM CourseDetails WHERE sub_stream = '" + TextBox2.Text.Trim() + "';", con);

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
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
                return false;
            }
        }

        //Check Abbreviation Exist
        bool checkAddCourseAbbreviationExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM CourseDetails WHERE abbreviation = '" + TextBox3.Text.Trim() + "';", con);

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
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
                return false;
            }
        }

        //Check Course Code exist
        bool checkAddCourseCodeExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM CourseDetails WHERE course_code = '" + TextBox5.Text.Trim() + "';", con);

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
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
                return false;
            }
        }

        // ---------------------------------------------
        // UPDATE COURSE
        // ---------------------------------------------

       //Get Course Details
       void getUpdateCourseDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM CourseDetails WHERE course_id = " + DropDownList6.SelectedItem.Value + ";", con);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox6.Text = dr.GetValue(0).ToString();
                        DropDownList2.SelectedValue = dr.GetValue(1).ToString();
                        TextBox7.Text = dr.GetValue(2).ToString();
                        TextBox8.Text = dr.GetValue(3).ToString();
                        DropDownList4.SelectedValue = dr.GetValue(4).ToString();
                        TextBox9.Text = dr.GetValue(5).ToString();
                        TextBox10.Text = dr.GetValue(6).ToString();
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('No Course exists with the selected Course ID!'); document.location.href = 'CourseDetails.aspx';", true);
                }

                con.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //Semester DDL - duration calculator
        void updateCourseDurationCalculator()
        {
            try
            {
                if (DropDownList4.SelectedIndex == 0)
                {
                    TextBox9.Text = "";
                }
                else if (DropDownList4.SelectedIndex == 1)
                {
                    TextBox9.Text = "6 Months";
                }
                else if (DropDownList4.SelectedIndex == 2)
                {
                    TextBox9.Text = "1 Year";
                }
                else if (DropDownList4.SelectedIndex == 3)
                {
                    TextBox9.Text = "1.5 Years";
                }
                else if (DropDownList4.SelectedIndex == 4)
                {
                    TextBox9.Text = "2 Years";
                }
                else if (DropDownList4.SelectedIndex == 5)
                {
                    TextBox9.Text = "2.5 Years";
                }
                else
                {
                    TextBox9.Text = "3 Years";
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //Update course
        void updateCourse()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE CourseDetails SET stream = @stream, sub_stream = @sub_stream, abbreviation = @abbreviation, semester = @semester, duration = @duration, course_code = @course_code WHERE course_id = " + TextBox6.Text.Trim() + ";", con);

                cmd.Parameters.AddWithValue("@stream", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@sub_stream", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@abbreviation", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@semester", DropDownList4.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@duration", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@course_code", TextBox10.Text.Trim());

                cmd.ExecuteNonQuery();

                con.Close();

                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Course Updated Successfully!'); document.location.href = 'CourseDetails.aspx';", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //Clear Text boxes
        void clearUpdateCourseTextBoxes()
        {
            try
            {
                DropDownList6.ClearSelection();
                TextBox6.Text = "";
                DropDownList2.ClearSelection();
                TextBox7.Text = "";
                TextBox8.Text = "";
                DropDownList4.ClearSelection();
                TextBox9.Text = "";
                TextBox10.Text = "";
            }
            catch(Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //Check Sub-stream exist
        bool checkUpdateCourseSubStreamExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM CourseDetails WHERE course_id != " + TextBox6.Text.Trim() + " AND sub_stream = '" + TextBox7.Text.Trim() + "';", con);

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
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
                return false;
            }
        }

        //Check Abbreviation Exist
        bool checkUpdateCourseAbbreviationExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM CourseDetails WHERE course_id != " + TextBox6.Text.Trim() + " AND abbreviation = '" + TextBox8.Text.Trim() + "';", con);

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
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
                return false;
            }
        }

        //Check Course Code exist
        bool checkUpdateCourseCodeExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM CourseDetails WHERE course_id != " + TextBox6.Text.Trim() + " AND course_code = '" + TextBox10.Text.Trim() + "';", con);

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
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
                return false;
            }
        }

        // ---------------------------------------------
        // DELETE COURSE
        // ---------------------------------------------

        //Get Course Details
        void getDeleteCourseDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM CourseDetails WHERE course_id = " + DropDownList5.SelectedItem.Value + ";", con);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox11.Text = dr.GetValue(0).ToString();
                        TextBox16.Text = dr.GetValue(1).ToString();
                        TextBox12.Text = dr.GetValue(2).ToString();
                        TextBox13.Text = dr.GetValue(3).ToString();
                        TextBox17.Text = dr.GetValue(4).ToString();
                        TextBox14.Text = dr.GetValue(5).ToString();
                        TextBox15.Text = dr.GetValue(6).ToString();
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('No Course exists with the selected Course ID!'); document.location.href = 'CourseDetails.aspx';", true);
                }

                con.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //Delete course
        void deleteCourse()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM CourseDetails where course_id = " + TextBox11.Text.Trim() + ";", con);
                cmd.ExecuteNonQuery();
                con.Close();

                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Course deleted successfully!'); document.location.href='CourseDetails.aspx';", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //Clear Text Boxes
        void clearDeleteCourseTextBoxes()
        {
            try
            {
                DropDownList5.ClearSelection();
                TextBox12.Text = "";
                TextBox16.Text = "";
                TextBox13.Text = "";
                TextBox17.Text = "";
                TextBox14.Text = "";
                TextBox15.Text = "";
            }
            catch(Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }


    }
}