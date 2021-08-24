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
    public partial class Home : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //NOTICE GRID VIEW DATA BINDING
            GridView1.DataBind();

            //ACTIVITY GRID VIEW DATA BINDING
            GridView2.DataBind();

            //SECTION 1

            //REGISTERED STUDENTS
            totalRegistrationCount();
            //APPROVED STUDENTS
            totalApproveStudentCount();
            //PENDING STUDENTS
            totalPendingStudentCount();
            //ACTIVE STUDENTS
            totalActiveStudentAccount();
            //DEACTIVE STUDENTS
            totalDeactiveStudentAccount();

            //SECTION 2

            //Total Staff Added 
            totalStaffAdded();
            //Total Notice Added
            totalNoticeAdded();
            //Total Activity Added
            totalActivityAdded();
            //Total Subject Added
            totalSubjectsAdded();
            //Total Test Type Added
            totalTestTypeAdded();
        }

        // -----------------------------------------------
        // -----------------------------------------------
        // -----------------------------------------------
        // USER DEFINED METHODS

        //TOTAL REGISTRATION COUNT 
        void totalRegistrationCount()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(" SELECT COUNT(*) FROM Registration;", con);

                Label100.Text = cmd.ExecuteScalar().ToString();

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //SECTION 1

        //DISPLAYING TOTAL REGISTRATION COUNT ON THE LABEL
        void totalApproveStudentCount()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(" SELECT COUNT(*) FROM Registration WHERE status = 'ON' OR status = 'OFF';", con);

                Label101.Text = cmd.ExecuteScalar().ToString();

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //STUDENT REQUEST PENDING COUNT 
        void totalPendingStudentCount()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(" SELECT COUNT(*) FROM Registration WHERE status = 'pending';", con);

                Label103.Text = cmd.ExecuteScalar().ToString();

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //TOTAL STUDENT WITH ACTIVE/ON ACCOUNT
        void totalActiveStudentAccount()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(" SELECT COUNT(*) FROM Registration WHERE status = 'ON';", con);

                Label102.Text = cmd.ExecuteScalar().ToString();

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //TOTAL STUDENT WITH DEACTIVE/OFF ACCOUNT
        void totalDeactiveStudentAccount()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(" SELECT COUNT(*) FROM Registration WHERE status = 'OFF';", con);

                Label104.Text = cmd.ExecuteScalar().ToString();

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        //SECTION 2

        //TOTAL STAFF ADDED 
        void totalStaffAdded()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(" SELECT COUNT(*) FROM StaffDetails;", con);

                Label200.Text = cmd.ExecuteScalar().ToString();

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //TOTAL NOTICES ADDED
        void totalNoticeAdded()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(" SELECT COUNT(*) FROM Notice;", con);

                Label201.Text = cmd.ExecuteScalar().ToString();

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //TOTAL ACTIVITIES ADDED
        void totalActivityAdded()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(" SELECT COUNT(*) FROM Activity;", con);

                Label202.Text = cmd.ExecuteScalar().ToString();

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //TOTAL SUBJECTS ADDED
        void totalSubjectsAdded()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(" SELECT COUNT(*) FROM SubjectDetails;", con);

                Label203.Text = cmd.ExecuteScalar().ToString();

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //TOTAL TEST TYPES ADDED 
        void totalTestTypeAdded()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(" SELECT COUNT(*) FROM TestTypeDetails;", con);

                Label204.Text = cmd.ExecuteScalar().ToString();

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}