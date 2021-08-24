using System;
using System.Collections.Generic;
using System.Configuration; //For ConfigurationManager class
using System.Data; //For ConnectionState class
using System.Data.SqlClient; //For SqlConnection class
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentPortalSystemWebsite.StaffModule
{
    public partial class Default : System.Web.UI.Page
    {
        // Always defined the connection string in the public class
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Trim() == "")
            {
                Response.Write("<script>alert('Please enter your username');</script>");
            }
            else if (TextBox2.Text.Trim() == "")
            {
                Response.Write("<script>alert('Please enter your password');</script>");
            }
            else
            {
                checkCredentials();
            }
        }

        //Check entered Username and Password
        void checkCredentials()
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);

                //Checking the database connection is closed or open, if the connection is closed then it will get open
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                //Query will be executed from the "con" connection
                SqlCommand cmd = new SqlCommand("SELECT * from StaffDetails where username='" + TextBox1.Text.Trim() + "' AND password = '" + TextBox2.Text.Trim() + "';", con);
                //DataReader will read what the above query is returning after executing the query
                SqlDataReader dr = cmd.ExecuteReader();

                //HasRows is a inbuilt property of the dr object, this will return true or false
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('Login Successful!');</script>");
                        Session["username"] = dr.GetValue(7).ToString();
                        Session["name"] = dr.GetValue(1).ToString();
                        Session["role"] = "staff";
                    }

                    // After successful login student will be redirected to the student homepage
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