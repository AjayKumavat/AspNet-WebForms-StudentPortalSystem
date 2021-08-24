using System;
using System.Collections.Generic;
using System.Configuration; //FOR ConfigurationManager class
using System.Data; //FOR ConnectionState class
using System.Data.SqlClient; //FOR SqlConnection class
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentPortalSystemWebsite.AdminModule
{
    public partial class SubjectDetails : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //AUTO GENERATE NOTICE ID - ON PAGE LOAD
            autoGenerateSubjectId();


            //UPDATE NOTICE - ON PAGE LOAD
            if (DropDownList5.Items.Count == 0)
            {
                autoFillSubjectId();
            }
            else if (DropDownList5.Items.Count != 0)
            {
                //Do nothing
            }
            else
            {
                Response.Redirect("SubjectDetails.aspx");
            }
            //-----------------------------------------

            //DELETE NOTICE - ON PAGE LOAD
            if (DropDownList7.Items.Count == 0)
            {
                autoFillSubjectId();
            }
            else if (DropDownList7.Items.Count != 0)
            {
                //Do nothing
            }
            else
            {
                Response.Redirect("SubjectDetails.aspx");
            }
            //-----------------------------------------
        }
        // ---------------------------------------------
        // ---------------------------------------------
        // ---------------------------------------------
        // ADD SUBJECT
        // ---------------------------------------------

        // ADD BUTTON - ON CLICK EVENT
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Trim() == "" ||DropDownList1.SelectedIndex == 0 || DropDownList2.SelectedIndex == 0 || DropDownList3.SelectedIndex == 0 || TextBox2.Text.Trim() == "" || TextBox3.Text.Trim() == "" || TextBox4.Text.Trim() == "")
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please fill all the subject details!');", true);
            }
            else
            {
                addSubject();
            }
        }
        // CLEAR BUTTON - ON CLICK EVENT
        protected void Button2_Click(object sender, EventArgs e)
        {
            clearAddSubjectTextBoxes();
        }


        // ---------------------------------------------
        // ---------------------------------------------
        // ---------------------------------------------
        // UPDATE SUBJECT
        // ---------------------------------------------

        //GET SUBJECT DETAILS - ON CLICK EVENT
        protected void Button3_Click(object sender, EventArgs e)
        {
            getUpdateSubjectDetails();
        }

        //UPDATE BUTTON - ON CLICK EVENT
        protected void Button7_Click(object sender, EventArgs e)
        {
            if( TextBox5.Text.Trim() == "" || DropDownList4.SelectedIndex == 0 || TextBox18.Text.Trim() == "" || DropDownList8.SelectedIndex == 0 || TextBox6.Text.Trim() == "" || TextBox10.Text.Trim() == "" || TextBox11.Text.Trim() == "" )
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please fill all the details!');", true);
            }
            else
            {
                updateSubjectDetails();
                clearUpdateSubjectTextBoxes();
            }
        }

        //CLEAR BUTTON - ON CLICK EVENT
        protected void Button9_Click(object sender, EventArgs e)
        {
            clearUpdateSubjectTextBoxes();
        }


        // ---------------------------------------------
        // ---------------------------------------------
        // ---------------------------------------------
        // DELETE SUBJECT
        // ---------------------------------------------

        //GET SUBJECT DETAILS - ON CLICK EVENT
        protected void Button4_Click(object sender, EventArgs e)
        {
            getDeleteSubjectDetails();
        }

        //DELETE BUTTON - ON CLICK EVENT
        protected void Button5_Click(object sender, EventArgs e)
        {
            if (TextBox7.Text.Trim() == "")
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please select a subject ID!');", true);
            }
            else
            {
                deleteNotice();
                clearDeleteSubjectTextBoxes();
            }
        }

        //CLEAR BUTTON - ON CLICK EVENT
        protected void Button6_Click(object sender, EventArgs e)
        {
            clearDeleteSubjectTextBoxes();
        }

        // ---------------------------------------------
        // ---------------------------------------------
        // ---------------------------------------------
        //USER DEFINED METHODS
        // ---------------------------------------------
        // ---------------------------------------------
        // ---------------------------------------------


        //(UPDATE AND DELETE) POPULATING DROP DOWN LIST WITH SUBJECT ID
        void autoFillSubjectId()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM SubjectDetails", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);
                DropDownList5.DataTextField = ds.Tables[0].Columns["subject_id"].ToString();
                DropDownList5.DataSource = ds.Tables[0];
                DropDownList5.DataBind();
                DropDownList5.Items.Insert(0, new ListItem("--Select--", "0"));

                DropDownList7.DataTextField = ds.Tables[0].Columns["subject_id"].ToString();
                DropDownList7.DataSource = ds.Tables[0];
                DropDownList7.DataBind();
                DropDownList7.Items.Insert(0, new ListItem("--Select--", "0"));

                con.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        // ---------------------------------------------
        // ---------------------------------------------
        // ---------------------------------------------
        // ADD SUBJECT

        //AUTO GENERATING NOTICE ID - ADD SUBJECT DETAILS
        void autoGenerateSubjectId()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT MAX(subject_id)+1 FROM SubjectDetails", con);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox1.Text = dr[0].ToString();
                        if (TextBox1.Text == "")
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
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //ADD SUBJECT 
        void addSubject()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO SubjectDetails(subject_id, stream, sub_stream, semester, subject_name, subject_code, subject_scheme) VALUES (@subject_id, @stream, @sub_stream, @semester, @subject_name, @subject_code, @subject_scheme)", con);

                cmd.Parameters.AddWithValue("@subject_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@stream", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@sub_stream", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@semester", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@subject_name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@subject_code", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@subject_scheme", TextBox4.Text.Trim());

                //Executes the above code
                cmd.ExecuteNonQuery();
                con.Close();

                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Subject Added Successfully!'); document.location.href = 'SubjectDetails.aspx'; ", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //CLEAR TEXT BOX 
        void clearAddSubjectTextBoxes()
        {
            DropDownList1.ClearSelection();
            DropDownList2.ClearSelection();
            DropDownList3.ClearSelection();
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
        }

        // ---------------------------------------------
        // ---------------------------------------------
        // ---------------------------------------------
        // UPDATE SUBJECT

        //CLEAR TEXT BOXES
        void clearUpdateSubjectTextBoxes()
        {
            DropDownList5.ClearSelection();
            TextBox5.Text = "";
            DropDownList4.ClearSelection();
            DropDownList6.ClearSelection();
            DropDownList7.ClearSelection();
            TextBox6.Text = "";
            TextBox10.Text = "";
            TextBox11.Text = "";
        }

        //GET SUBJECT DETAILS 
        void getUpdateSubjectDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM SubjectDetails WHERE subject_id = " + DropDownList5.SelectedItem.Value + ";", con);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox5.Text = dr.GetValue(0).ToString();
                        DropDownList4.SelectedValue = dr.GetValue(1).ToString();
                        TextBox18.Text = dr.GetValue(2).ToString();
                        DropDownList8.SelectedValue = dr.GetValue(3).ToString();
                        TextBox6.Text = dr.GetValue(4).ToString();
                        TextBox10.Text = dr.GetValue(5).ToString();
                        TextBox11.Text = dr.GetValue(6).ToString();
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('No Subject exists with the selected Subject ID!');", true);
                }
                con.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //UPDATE SUBJECT
        void updateSubjectDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE SubjectDetails SET stream = @stream, sub_stream = @sub_stream, semester = @semester, subject_name = @subject_name, subject_code = @subject_code, subject_scheme = @subject_scheme WHERE subject_id = " + TextBox5.Text.Trim() + ";", con);

                cmd.Parameters.AddWithValue("@stream", DropDownList4.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@sub_stream", DropDownList6.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@semester", DropDownList8.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@subject_name", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@subject_code", TextBox10.Text.Trim());
                cmd.Parameters.AddWithValue("@subject_scheme", TextBox11.Text.Trim());

                cmd.ExecuteNonQuery();

                con.Close();

                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Subject Updated Successfully!'); document.location.href = 'SubjectDetails.aspx';", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        // ---------------------------------------------
        // ---------------------------------------------
        // ---------------------------------------------
        // DELETE SUBJECT

        //GET SUBJECT DETAILS 
        void getDeleteSubjectDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM SubjectDetails WHERE subject_id = " + DropDownList7.SelectedItem.Value + ";", con);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox7.Text = dr.GetValue(0).ToString();
                        TextBox15.Text = dr.GetValue(1).ToString();
                        TextBox14.Text = dr.GetValue(2).ToString();
                        TextBox13.Text = dr.GetValue(3).ToString();
                        TextBox8.Text = dr.GetValue(4).ToString();
                        TextBox9.Text = dr.GetValue(5).ToString();
                        TextBox12.Text = dr.GetValue(6).ToString();
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('No Subject exists with the selected Subject ID!');", true);
                }
                con.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //DELETE SUBJECT
        void deleteNotice()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM SubjectDetails where subject_id = " + TextBox7.Text.Trim() + ";", con);
                cmd.ExecuteNonQuery();
                con.Close();

                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Subject deleted successfully!'); document.location.href = 'SubjectDetails.aspx';", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //CLEAR TEXT BOXES
        void clearDeleteSubjectTextBoxes()
        {
            DropDownList7.ClearSelection();
            TextBox7.Text = "";
            TextBox15.Text = "";
            TextBox14.Text = "";
            TextBox13.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = "";
            TextBox12.Text = "";
        }


        //STREAM DROPDOWNLIST
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            autoFillSubStream();
        }
        //Add Subject - auto Fill sub stream
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
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }


        //UPDATE SUBJECT - Stream DDL Selected Index Changed
        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            autoFillSubStreamInUpdateSubject();
        }
        //update subject - auto fill substream
        void autoFillSubStreamInUpdateSubject()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM CourseDetails WHERE stream = '" + DropDownList4.SelectedItem.Value + "';", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);

                DropDownList6.DataTextField = ds.Tables[0].Columns["sub_stream"].ToString();
                DropDownList6.DataSource = ds.Tables[0];
                DropDownList6.DataBind();
                DropDownList6.Items.Insert(0, new ListItem("--Select--", "0"));

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        //Currently selected sub stream
        protected void DropDownList6_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox18.Text = DropDownList6.SelectedItem.Value;
        }
    }
}