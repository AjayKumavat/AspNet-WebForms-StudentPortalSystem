using System;
using System.Collections.Generic;
using System.Configuration; //For ConfigurationManager class
using System.Data; //For ConnectionState class
using System.Data.SqlClient; //For SqlConnection class
using System.Net.Mail; //For SmtpClient class
using System.Text.RegularExpressions;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentPortalSystemWebsite.StudentModule
{
    public partial class ViewAttendance : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }


    }
}