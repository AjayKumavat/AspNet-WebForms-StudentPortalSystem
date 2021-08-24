using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentPortalSystemWebsite.StudentModule
{
    public partial class Student : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            checkStudentSession();
        }

        //STUDENT MODULE - LOGOUT BUTTON CLICK EVENT
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["name"] = "";
            Session["role"] = "";
            Session["status"] = "";
            Response.Redirect("Default.aspx");
        }

        //USER DEFINED METHODS
        void checkStudentSession()
        {
            try
            {
                if (Session["role"].Equals("student"))
                {
                    Label1.Text = Session["username"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('An error occurred!, Please login again...'); document.location.href = 'Default.aspx';</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}