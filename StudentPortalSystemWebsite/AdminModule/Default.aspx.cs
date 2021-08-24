using System;
using System.Collections.Generic;
using System.Configuration; //For ConfigurationManager class
using System.Data; //For ConnectionState class
using System.Data.SqlClient; //For SqlConnection class
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentPortalSystemWebsite.AdminModule
{
    public partial class Default : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //CHECKING SESSION FOR PRIVACY (PREVENTING LOGING IN OF USER BY PRESSING BACK AND FORWARD BUTTON ON THE BROWSER
            if (Session["role"] == null)
            {

            }
            else
            {
                Session["username"] = "";
                Session["role"] = "";
            }

        }


        //Admin login click event
        protected void Button1_Click(object sender, EventArgs e)
        {
            if(TextBox1.Text.Trim() == "")
            {
                Response.Write("<script>alert('Please enter your username');</script>");
            }
            else if(TextBox2.Text.Trim() == "")
            {
                Response.Write("<script>alert('Please enter your password');</script>");
            }
            else
            {
                checkCredentials();
            }
        }


        void checkCredentials()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from AdminLogin where username='" + TextBox1.Text.Trim() + "' AND password='" + TextBox2.Text.Trim() + "';", con);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('Welcome " + dr.GetValue(0).ToString() + "');</script>");
                        Session["username"] = dr.GetValue(0).ToString();
                        Session["role"] = "admin";
                    }
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    Response.Write("<script>alert('Invalid Credentials');</script>");
                }
            }
            catch (Exception ex)
            {
                //This will give the error message of what actually the error is
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

    }
}