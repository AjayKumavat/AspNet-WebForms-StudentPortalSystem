using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentPortalSystemWebsite.AdminModule
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            checkAdminSession();
        }

        //ADMIN MODULE - LOGOUT BUTTON CLICK EVENT
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["role"] = "";
            Response.Redirect("Default.aspx");
        }

        //SESSION CHECK 
        void checkAdminSession()
        {

            try
            {
                if (Session["role"].Equals("admin"))
                {
                    Label1.Text = Session["username"].ToString();
                }
                else
                {
                    //Response.Write("<script>alert('An error occurred!, Please login again...'); document.location.href = 'Default.aspx';</script>");
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('An error occured!, Please login again...'); document.location.href = 'Default.aspx';", true);
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
    }
}