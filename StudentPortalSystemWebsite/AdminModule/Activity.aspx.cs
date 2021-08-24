using System;
using System.Collections.Generic;
using System.Configuration; //For ConfigurationManager class
using System.Data;//For ConnectionState class
using System.Data.SqlClient;//For SqlConnection class
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentPortalSystemWebsite.AdminModule
{
    public partial class Activity : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //DATA BINDING
            GridView1.DataBind();

            //AUTO FILL NOTICE ID - ON PAGE LOAD

            autoGenerateActivityId();
            //-----------------------------------------

            //UPDATE NOTICE - ON PAGE LOAD
            if (DropDownList2.Items.Count == 0)
            {
                autoFillActivityId();
            }
            //-----------------------------------------

            //DELETE NOTICE - ON PAGE LOAD
            if (DropDownList3.Items.Count == 0)
            {
                autoFillActivityId();
            }
            //-----------------------------------------
        }
        // ---------------------------------------------
        // ---------------------------------------------
        // ---------------------------------------------
        // ADD ACTIVITY
        // ---------------------------------------------

        //ADD ACTIVITY BUTTON
        protected void Button1_Click(object sender, EventArgs e)
        {
            addActivity();
        }

        //CLEAR TEXT BOXES
        protected void Button2_Click(object sender, EventArgs e)
        {
            clearAddActivityTextBoxes();
        }
        // ---------------------------------------------
        // ---------------------------------------------
        // ---------------------------------------------
        // UPDATE ACTIVITY
        // ---------------------------------------------

        // GET ACTIVITY DETAILS
        protected void Button8_Click(object sender, EventArgs e)
        {

        }

        //UPDATE ACTIVITY
        protected void Button3_Click(object sender, EventArgs e)
        {

        }

        //CLEAR TEXT BOXES
        protected void Button4_Click(object sender, EventArgs e)
        {
            clearUpdateActivityTextBoxes();
        }
        // ---------------------------------------------
        // ---------------------------------------------
        // ---------------------------------------------
        // DELETE ACTIVITY
        // ---------------------------------------------

        //GET ACTIVITY DETAILS
        protected void Button7_Click(object sender, EventArgs e)
        {

        }

        //DELETE BUTTON
        protected void Button5_Click(object sender, EventArgs e)
        {

        }

        //CLEAR TEXT BOXES
        protected void Button6_Click(object sender, EventArgs e)
        {
            clearDeleteActivityTextBoxes();
        }




        // ---------------------------------------------
        // ---------------------------------------------
        // ---------------------------------------------
        // USER DEFINED FUNCTION
        // ---------------------------------------------

        //Auto Filling DropDownList of Update & Delete Activity
        void autoFillActivityId()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM Activity", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);
                DropDownList2.DataTextField = ds.Tables[0].Columns["activity_id"].ToString();
                DropDownList2.DataSource = ds.Tables[0];
                DropDownList2.DataBind();
                DropDownList2.Items.Insert(0, new ListItem("--Select--", "0"));

                DropDownList3.DataTextField = ds.Tables[0].Columns["activity_id"].ToString();
                DropDownList3.DataSource = ds.Tables[0];
                DropDownList3.DataBind();
                DropDownList3.Items.Insert(0, new ListItem("--Select--", "0"));

                con.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        // ---------------------------------------------
        // ADD ACTIVITY - USER DEFINED FUNCTION
        // ---------------------------------------------
        //Auto Generate Activity ID
        void autoGenerateActivityId()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT MAX(activity_id)+1 FROM Activity", con);

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

        //Add Activity
        void addActivity()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO Activity (activity_id, activity_name, date, comment, activity_by) VALUES (@activity_id, @activity_name, @date, @comment, @activity_by);", con);

                cmd.Parameters.AddWithValue("@activity_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@activity_name", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@date", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@comment", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@activity_by", Session["role"].ToString() + " - " + Session["username"].ToString());

                cmd.ExecuteNonQuery();

                con.Close();

                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Activity Added Successfully!'); document.location.href = 'Activity.aspx';", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //Clear Text Boxes
        void clearAddActivityTextBoxes()
        {
            DropDownList1.ClearSelection();
            TextBox7.Text = "";
            TextBox2.Text = "";
        }

        // ---------------------------------------------
        // UPDATE ACTIVITY - USER DEFINED FUNCTION
        // ---------------------------------------------

        //Get Activity Details


        //Update Activity


        //Clear Text Boxes
        void clearUpdateActivityTextBoxes()
        {
            DropDownList2.ClearSelection();
            TextBox4.Text = "";
            DropDownList4.ClearSelection();
            TextBox8.Text = "";
            TextBox9.Text = "";
        }

        // ---------------------------------------------
        // DELETE ACTIVITY - USER DEFINED FUNCTION
        // ---------------------------------------------

        //Get Activity Details


        //Delete Activity


        //Clear Text Boxes
        void clearDeleteActivityTextBoxes()
        {
            DropDownList3.ClearSelection();
            TextBox3.Text = "";
            DropDownList5.ClearSelection();
            TextBox5.Text = "";
            TextBox6.Text = "";
        }

    }
}