using System;
using System.Collections.Generic;
using System.Configuration; // For ConfigurationManager class
using System.Data; // For ConnectionState class
using System.Data.SqlClient; // For SqlConnection classs
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentPortalSystemWebsite.AdminModule
{
    public partial class TestType : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //TO SHOW ALL THE UPDATED DATA IN THE GRID VIEW WHENEVER THIS PAGE IS RELOADED
            GridView1.DataBind();

            //AUTO FILL NOTICE ID - ON PAGE LOAD

            autoGenerateTestTypeId();
            //-----------------------------------------

            //UPDATE NOTICE - ON PAGE LOAD
            if (DropDownList1.Items.Count == 0)
            {
                autoFillTestTypeId();
            }
            //-----------------------------------------

            //DELETE NOTICE - ON PAGE LOAD
            if (DropDownList2.Items.Count == 0)
            {
                autoFillTestTypeId();
            }
            //-----------------------------------------
        }

        // ---------------------------------------------
        // ---------------------------------------------
        // ADD TEST TYPE
        // ---------------------------------------------

        //ADD TEST TYPE
        protected void Button1_Click(object sender, EventArgs e)
        {
            if(TextBox1.Text.Trim() == "" || TextBox2.Text.Trim() == "" || TextBox11.Text.Trim() == "" || TextBox3.Text.Trim() == "" || TextBox4.Text.Trim() == "")
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please fill all the details!');", true);
            }
            else
            {
                addTestType();
            }
        }

        //CLEAR TEXT BOXES
        protected void Button2_Click(object sender, EventArgs e)
        {
            clearAddTestTypeTextBoxes();
        }

        // ---------------------------------------------
        // ---------------------------------------------
        // UPDATE TEST TYPE 
        // ---------------------------------------------

        //GET TEST TYPE DETAILS
        protected void Button8_Click(object sender, EventArgs e)
        {
            getUpdateTestTypeDetails();
        }

        //UPDATE TEST TYPE
        protected void Button3_Click(object sender, EventArgs e)
        {
            if(TextBox14.Text.Trim() == "" || TextBox5.Text.Trim() == "" || TextBox12.Text.Trim() == "" || TextBox6.Text.Trim() == "" || TextBox7.Text.Trim() == "")
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please fill all the details!');", true);
            }
            else
            {
                updateTestTypeDetails();
            }
        }

        //CLEAR TEXT BOXES
        protected void Button4_Click(object sender, EventArgs e)
        {
            clearUpdateTestTypeTextBoxes();
        }

        // ---------------------------------------------
        // ---------------------------------------------
        // DELETE TEST TYPE
        // ---------------------------------------------

        // GET TEST TYPE DETAILS
        protected void Button5_Click(object sender, EventArgs e)
        {
            getDeleteTestTypeDetails();
        }

        // DELETE TEST TYPE
        protected void Button6_Click(object sender, EventArgs e)
        {
            if(TextBox15.Text.Trim() == "" || TextBox8.Text.Trim() == "" || TextBox13.Text.Trim() == "" || TextBox9.Text.Trim() == "" || TextBox10.Text.Trim() == "" )
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please select a TestType ID!');", true);
            }
            else
            {
                deleteTestType();
            }
        }

        // CLEAR TEXT BOXES
        protected void Button7_Click(object sender, EventArgs e)
        {
            clearDeleteTestTypeTextBoxes();
        }


        // ---------------------------------------------
        // ---------------------------------------------
        // ---------------------------------------------
        // USER DEFINED METHODS


        // GET DETAILS BUTTON - (FILLING DROPDOWNLIST OF UPDATE & DELETE TEST TYPE)
        void autoFillTestTypeId()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM TestTypeDetails", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);

                DropDownList1.DataTextField = ds.Tables[0].Columns["test_type_id"].ToString();
                DropDownList1.DataSource = ds.Tables[0];
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("--Select--", "0"));

                DropDownList2.DataTextField = ds.Tables[0].Columns["test_type_id"].ToString();
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


        // ---------------------------------------------
        // ADD TEST TYPE
        // ---------------------------------------------
        // AUTO GENERATING TEST TYPE ID
        void autoGenerateTestTypeId()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT MAX(test_type_id)+1 FROM TestTypeDetails", con);

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

        // ADDING A NEW TEST TYPE
        void addTestType()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO TestTypeDetails (test_type_id, test_name, date, total_marks, passing_marks) VALUES (@test_type_id, @test_name, @date, @total_marks, @passing_marks);", con);

                cmd.Parameters.AddWithValue("@test_type_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@test_name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@date", TextBox11.Text.Trim());
                cmd.Parameters.AddWithValue("@total_marks", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@passing_marks", TextBox4.Text.Trim());

                cmd.ExecuteNonQuery();

                con.Close();

                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Test Type \"" + TextBox2.Text.Trim() + "\" Added Successfully!'); document.location.href = 'TestType.aspx';", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //CLEARING TEXT BOXES
        void clearAddTestTypeTextBoxes()
        {
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
        }




        // ---------------------------------------------
        // UPDATE TEST TYPE
        // ---------------------------------------------

        //GET TEST TYPE DETAILS - UPDATE TEST TYPE
        void getUpdateTestTypeDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM TestTypeDetails WHERE test_type_id = " + DropDownList2.SelectedItem.Value + ";", con);

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

        //UPDATE TEST TYPE ENTRIES
        void updateTestTypeDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE TestTypeDetails SET test_type_id = @test_type_id, test_name = @test_name, date = @date, total_marks = @total_marks, passing_marks = @passing_marks WHERE test_type_id = " + TextBox14.Text.Trim() + ";", con);

                cmd.Parameters.AddWithValue("@test_type_id", TextBox14.Text.Trim());
                cmd.Parameters.AddWithValue("@test_name", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@date", TextBox12.Text.Trim());
                cmd.Parameters.AddWithValue("@total_marks", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@passing_marks", TextBox7.Text.Trim());

                cmd.ExecuteNonQuery();

                con.Close();

                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Test Type \"" + TextBox5.Text.Trim() + "\" Updated Successfully!'); document.location.href = 'TestType.aspx';", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //CLEAR TEXT BOXES
        void clearUpdateTestTypeTextBoxes()
        {
            DropDownList2.ClearSelection();
            TextBox14.Text = "";
            TextBox5.Text = "";
            TextBox12.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
        }


        // ---------------------------------------------
        // DELETE TEST TYPE
        // ---------------------------------------------

        //GET TEST TYPE DETAILS
        void getDeleteTestTypeDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM TestTypeDetails WHERE test_type_id = " + DropDownList1.SelectedItem.Value + ";", con);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox15.Text = dr.GetValue(0).ToString();
                        TextBox8.Text = dr.GetValue(1).ToString();
                        TextBox13.Text = dr.GetValue(2).ToString();
                        TextBox9.Text = dr.GetValue(3).ToString();
                        TextBox10.Text = dr.GetValue(4).ToString();
                    }
                }

                con.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //DELETE TEST TYPE FROM DATABASE
        void deleteTestType()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM TestTypeDetails WHERE test_type_id = " + TextBox15.Text.Trim() + ";", con);

                cmd.ExecuteNonQuery();
                con.Close();

                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Test Type \"" + TextBox15.Text.Trim() + " - " + TextBox8.Text.Trim() + "\" was deleted successfully!'); document.location.href = 'TestType.aspx';", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //CLEAR TEXT BOXES
        void clearDeleteTestTypeTextBoxes()
        {
            TextBox15.Text = "";
            TextBox8.Text = "";
            TextBox13.Text = "";
            TextBox9.Text = "";
            TextBox10.Text = "";
        }
    }
}