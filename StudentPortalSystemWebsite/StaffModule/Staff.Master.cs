using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentPortalSystemWebsite.StaffModule
{
    public partial class Staff : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            checkStaffSession();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["name"] = "";
            Session["role"] = "";
            Response.Redirect("Default.aspx");
        }

        //USER DEFINED METHODS

        void checkStaffSession()
        {
            try
            {
                if (Session["role"].Equals("staff"))
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