using System;
using System.Collections.Generic;
using System.Configuration; //For ConfigurationManager class
using System.Data; //For ConnectionState class
using System.Data.SqlClient; //For SqlConnection class
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentPortalSystemWebsite.StudentModule
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Trim() == "" || TextBox2.Text.Trim() == "" || TextBox3.Text.Trim() == "")
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please enter all the details!');", true);
            }
            //If entered password is incorrect 
            else if (!checkOldPassword())
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Incorrect old password!, Please try again..');", true);
            }
            else
            {
                updateNewPassword();
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Password updated successfully!');", true);
            }
        }


        //USER DEFINED FUNCTIONS
        bool checkOldPassword()
        {
            try
            {
                string username = Session["username"].ToString();
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM Registration WHERE username = '" + username + "' AND password = '" + TextBox1.Text.Trim() + "';", con);

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

        void updateNewPassword()
        {
            try
            {
                string username = Session["username"].ToString();
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE Registration SET password = @password WHERE username = @username;", con);

                cmd.Parameters.AddWithValue("@password", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@username", username);

                cmd.ExecuteNonQuery();

                con.Close();

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }
    }
}