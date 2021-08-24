using System;
using System.Collections.Generic;
using System.Configuration; //For ConfigurationManager class
using System.Data; //For ConnectionState class
using System.Data.SqlClient; //For SqlConnection class
using System.Net.Mail; //For SmtpClient class
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentPortalSystemWebsite.AdminModule
{
    public partial class ApproveStudent : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (DropDownList1.Items.Count == 0 || DropDownList3.Items.Count == 0 || DropDownList4.Items.Count == 0)
            {
                autoFillUserIdApproveStudent();
                autoFillUserIdUpdateStudent();
                autoFillUserIdDeleteStudent();
            }
        }

        // ------------------------------------------------
        // ------------------------------------------------
        // APPROVE STUDENTS
        // ------------------------------------------------
        //GET USER DETAILS - ON CLICK EVENT
        protected void Button2_Click(object sender, EventArgs e)
        {
            getUserDetails();
        }

        //APPROVE STUDENT - ON CLICK EVENT
        protected void Button1_Click(object sender, EventArgs e)
        {
            if(TextBox12.Text.Trim() == "")
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Enter Academic Year!');", true);
            }
            else if(DropDownList2.SelectedIndex == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Select account status!');", true);
            }
            else
            {
                //Send Account Activation mail
                sendAccountActivationMail();
                //Activating Students account
                studentAccountStatus();
                //Inserting academic year 
                addStudentAcademicYear();

                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Student account activated successfully!, and mail has been sent to the student.'); document.location.href = 'ApproveStudent.aspx';", true);
            }
        }
        // ------------------------------------------------
        // ------------------------------------------------
        // UPDATE STUDENTS
        // ------------------------------------------------

        //UPDATE STUDENT - STREAM DROPDOWNLIST
        protected void DropDownList7_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM CourseDetails WHERE stream = '" + DropDownList7.SelectedItem.Value + "';", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);

                DropDownList8.DataTextField = ds.Tables[0].Columns["sub_stream"].ToString();
                DropDownList8.DataSource = ds.Tables[0];
                DropDownList8.DataBind();
                DropDownList8.Items.Insert(0, new ListItem("--Select--", "0"));

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //GET USER DETAILS - ON CLICK EVENT
        protected void Button3_Click(object sender, EventArgs e)
        {
            getUserDetailsModifyStudent();
            getAcademicYearModifyStudent();
        }

        //UPDATE STUDENT - UPDATE BUTTON ON CLICK EVENT
        protected void Button4_Click(object sender, EventArgs e)
        {
            if(TextBox13.Text.Trim() == "" || TextBox14.Text.Trim() == "" || TextBox15.Text.Trim() == "" || TextBox16.Text.Trim() == "" || TextBox17.Text.Trim() == "" || DropDownList6.SelectedIndex == 0 ||TextBox18.Text.Trim() == "" || DropDownList7.SelectedIndex == 0 || DropDownList9.SelectedIndex == 0 || TextBox22.Text.Trim() == "" || TextBox23.Text.Trim() == "" || DropDownList5.SelectedIndex == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please fill all the details!');", true);
            }
            else
            {
                if (checkUpdateStudentEmailExist())
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Email address \"" + TextBox17.Text + "\" is already taken!, Please try another one');", true);

                    TextBox17.Text = "";
                }
                else if (checkUpdateStudentUsernameExist())
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Username \"" + TextBox23.Text + "\" is already taken!');", true);

                    TextBox23.Text = "";
                }
                else
                {
                    sendAccountModificationMail();
                    updateStudentDetails();
                    updateAcademicYear();
                    
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Student account updated successfully!, and the mail has been sent to the respective student.'); document.location.href = 'ApproveStudent.aspx';", true);

                }
            }
        }
        // ------------------------------------------------
        // ------------------------------------------------
        // DELETE STUDENTS
        // ------------------------------------------------
        //DELETE STUDENT - GET STUDENT DETAILS ON CLICK EVENT
        protected void Button5_Click(object sender, EventArgs e)
        {
            getUserDetailsDeleteStudent();
            getAcademicYearDeleteStudent();
        }

        //DELETE STUDENT DETAILS - ON CLICK EVENT
        protected void Button6_Click(object sender, EventArgs e)
        {
            sendAccountDeactivationMail();

            deleteStudentDetails();
            deleteAcademicYear();

            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Student account deleted successfully!, and the mail has been sent to the respective student.'); document.location.href = 'ApproveStudent.aspx';", true);
        }






        // ------------------------------------------------
        // -----------------------------------
        //USER DEFINED METHODS 
        // -----------------------------------

        //APPROVE STUDENT - Autofill the dropdown item with user_id available on the database
        void autoFillUserIdApproveStudent()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM Registration where status='pending' AND otp = 'verified';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);


                //USER ID
                DropDownList1.DataTextField = ds.Tables[0].Columns["user_id"].ToString(); // text field name of table dispalyed in dropdown     
                DropDownList1.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist  
                DropDownList1.DataBind();  //binding dropdownlist 
                DropDownList1.Items.Insert(0, new ListItem("--Select--", "0"));

                con.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //UPDATE STUDENT - AUTO - FILL USER ID IN DROP DOWN LIST
        void autoFillUserIdUpdateStudent()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM Registration WHERE status != 'pending';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);

                //USER ID
                DropDownList3.DataTextField = ds.Tables[0].Columns["user_id"].ToString(); // text field name of table dispalyed in dropdown     
                DropDownList3.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist  
                DropDownList3.DataBind();  //binding dropdownlist 
                DropDownList3.Items.Insert(0, new ListItem("--Select--", "0"));

                con.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }


        //DELETE STUDENT - AUTO-FILL USER ID IN DROPDOWNLIST
        //admin can delete any user id, user account status doesn't matter
        void autoFillUserIdDeleteStudent()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM Registration", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);

                DropDownList4.DataTextField = ds.Tables[0].Columns["user_id"].ToString();
                DropDownList4.DataSource = ds.Tables[0];
                DropDownList4.DataBind();
                DropDownList4.Items.Insert(0, new ListItem("--Select--", "0"));

                con.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }



        // -----------------------------------
        // -----------------------------------
        //APPROVE STUDENT
        // -----------------------------------
        //AUTO-GENERATE USER DETAILS
        void getUserDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM Registration WHERE user_id = " + DropDownList1.SelectedItem.Value + ";", con);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    TextBox1.Text = dr.GetValue(0).ToString();
                    TextBox2.Text = dr.GetValue(1).ToString();
                    TextBox3.Text = dr.GetValue(2).ToString();
                    TextBox4.Text = dr.GetValue(3).ToString();
                    TextBox5.Text = dr.GetValue(4).ToString();
                    TextBox6.Text = dr.GetValue(5).ToString();
                    TextBox7.Text = dr.GetValue(6).ToString();
                    TextBox8.Text = dr.GetValue(7).ToString();
                    TextBox9.Text = dr.GetValue(8).ToString();
                    TextBox10.Text = dr.GetValue(9).ToString();
                    TextBox11.Text = dr.GetValue(10).ToString();
                    TextBox36.Text = dr.GetValue(12).ToString();
                }


                con.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //APPROVE STUDENT - ACTIVE ACCOUNT
        void studentAccountStatus()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE Registration SET status = @status WHERE user_id = " + TextBox1.Text + ";", con);

                cmd.Parameters.AddWithValue("@status", DropDownList2.SelectedItem.Value);

                cmd.ExecuteNonQuery();
                con.Close();

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //APPROVE STUDENT - INSERT YEAR
        void addStudentAcademicYear()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO StudentAcademicYear (student_id, academic_year, status) VALUES (@student_id, @academic_year, @status);", con);

                cmd.Parameters.AddWithValue("@student_id", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@academic_year", TextBox12.Text.Trim());
                cmd.Parameters.AddWithValue("@status", DropDownList2.SelectedItem.Value);

                cmd.ExecuteNonQuery();
                con.Close();

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //CLEARING TEXTBOX
        void clearApproveStudentTextBox()
        {
            DropDownList1.ClearSelection();
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = "";
            TextBox10.Text = "";
            TextBox11.Text = "";
            TextBox12.Text = "";
            TextBox36.Text = "";
            DropDownList2.ClearSelection();
        }

        //CHECK IF USER ID EXISTS IN THE DATABASE
        bool checkUserIdExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM Registration WHERE user_id = " + TextBox1.Text.Trim() + ";", con);
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

        //Send Account Activation Email
        void sendAccountActivationMail()
        {
            try
            {
                MailMessage message = new MailMessage();
                message.From = new MailAddress("akmvt0@gmail.com");

                // this should be replaced with your address 

                message.To.Add(new MailAddress(TextBox5.Text.Trim()));

                message.Subject = "Student Account Activation Mail";

                // this is the email content, eg comments, profession, country, etc
                message.Body = "Name: " + TextBox2.Text.Trim() + "\r\nEmail ID: " + TextBox5.Text.Trim() + "\r\nAccount Status: " + DropDownList2.SelectedItem.Value + "\r\n \r\nDear Student,\r\nYour account has been approved & activated by the admin, Now you have gained access to our student portal website.\r\nYou can now login using your username and password.\r\n \r\nIf its not you then please ignore....";  // add more fields...


                // finaly send the email:
                SmtpClient client = new SmtpClient();
                client.Send(message);
                client.EnableSsl = true;

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        // -----------------------------------
        // -----------------------------------
        //UPDATE STUDENT
        // -----------------------------------

        //UPDATE STUDENT - GET USER DETAILS ON CLICK EVENT
        void getUserDetailsModifyStudent()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM Registration WHERE user_id = " + DropDownList3.SelectedItem.Value + ";", con);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    TextBox13.Text = dr.GetValue(0).ToString();
                    TextBox14.Text = dr.GetValue(1).ToString();
                    TextBox15.Text = dr.GetValue(2).ToString();
                    TextBox16.Text = dr.GetValue(3).ToString();
                    TextBox17.Text = dr.GetValue(4).ToString();
                    DropDownList6.SelectedValue = dr.GetValue(5).ToString();
                    DropDownList7.SelectedValue = dr.GetValue(6).ToString();
                    TextBox18.Text = dr.GetValue(7).ToString();
                    //DropDownList8.SelectedValue = dr.GetValue(7).ToString();
                    DropDownList9.SelectedValue = dr.GetValue(8).ToString();
                    TextBox22.Text = dr.GetValue(9).ToString();
                    TextBox23.Text = dr.GetValue(10).ToString();
                    TextBox37.Text = dr.GetValue(12).ToString();
                    DropDownList5.SelectedValue = dr.GetValue(12).ToString();
                }


                con.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }


        //UDPATE STUDENT - Get User Academic Yera
        void getAcademicYearModifyStudent()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM StudentAcademicYear WHERE student_id = " + DropDownList3.SelectedItem.Value + ";", con);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    TextBox19.Text = dr.GetValue(1).ToString();
                }


                con.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }


        //UPDATE STUDENT - UPDATE STUDENT DETAILS
        void updateStudentDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE Registration SET user_id = @user_id, name = @name, address = @address, contact_no = @contact_no, email = @email, gender = @gender, stream = @stream, sub_stream = @sub_stream, semester = @semester, enrollment_no = @enrollment_no, username = @username, status = @status WHERE user_id = '" + TextBox13.Text.Trim() + "'", con);

                cmd.Parameters.AddWithValue("@user_id", TextBox13.Text.Trim());
                cmd.Parameters.AddWithValue("@name", TextBox14.Text.Trim());
                cmd.Parameters.AddWithValue("@address", TextBox15.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", TextBox16.Text.Trim());
                cmd.Parameters.AddWithValue("@email", TextBox17.Text.Trim());
                cmd.Parameters.AddWithValue("@gender", DropDownList6.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@stream", DropDownList7.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@sub_stream", TextBox18.Text.Trim());
                cmd.Parameters.AddWithValue("@semester", DropDownList9.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@enrollment_no", TextBox22.Text.Trim());
                cmd.Parameters.AddWithValue("@username", TextBox23.Text.Trim());
                cmd.Parameters.AddWithValue("@status", DropDownList5.SelectedItem.Value);

                cmd.ExecuteNonQuery();

                con.Close();

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //update student update academic year
        void updateAcademicYear()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE StudentAcademicYear SET student_id = @student_id, academic_year = @academic_year, status = @status WHERE student_id = " + TextBox13.Text.Trim() + ";", con);

                cmd.Parameters.AddWithValue("@student_id", TextBox13.Text.Trim());
                cmd.Parameters.AddWithValue("@academic_year", TextBox19.Text.Trim());
                cmd.Parameters.AddWithValue("@status", DropDownList5.SelectedItem.Value);
                
                cmd.ExecuteNonQuery();

                con.Close();

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //Check email address exist
        bool checkUpdateStudentEmailExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from Registration where User_id != " + TextBox13.Text.Trim() + " AND email ='" + TextBox17.Text.Trim() + "';", con);

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

        //Check Username Exists
        bool checkUpdateStudentUsernameExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM Registration WHERE user_id != " + TextBox13.Text.Trim() + " AND username = '" + TextBox23.Text.Trim() + "';", con);

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

        //Staff account modification mail
        void sendAccountModificationMail()
        {
            try
            {
                MailMessage message = new MailMessage();
                message.From = new MailAddress("akmvt0@gmail.com");

                // this should be replaced with your address 

                message.To.Add(new MailAddress(TextBox17.Text.Trim()));

                message.Subject = "Account Modification Mail";

                // this is the email content, eg comments, profession, country, etc
                message.Body = "Name: " + TextBox14.Text.Trim() + "\r\nEmail ID: " + TextBox17.Text.Trim() + "\r\nAccount Status: " + DropDownList5.SelectedItem.Value + "\r\n \r\nDear Student, \r\nYour account details has been updated by the admin.\r\nCheck your account status mentioned above if it's OFF then you will no longer be able to login into the student portal website.\r\n \r\nIf its not you then please ignore....";  // add more fields...


                // finaly send the email:
                SmtpClient client = new SmtpClient();
                client.Send(message);
                client.EnableSsl = true;

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }




        // -----------------------------------
        // -----------------------------------
        //DELETE STUDENT
        // -----------------------------------

        //DELETE STUDENT - GET STUDENT DETAILS ON CLICK EVENT
        void getUserDetailsDeleteStudent()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM Registration WHERE user_id = " + DropDownList4.SelectedItem.Value + ";", con);

                SqlDataReader dr = cmd.ExecuteReader();


                if (dr.Read())
                {
                    TextBox24.Text = dr.GetValue(0).ToString();
                    TextBox25.Text = dr.GetValue(1).ToString();
                    TextBox26.Text = dr.GetValue(2).ToString();
                    TextBox27.Text = dr.GetValue(3).ToString();
                    TextBox28.Text = dr.GetValue(4).ToString();
                    TextBox29.Text = dr.GetValue(5).ToString();
                    TextBox30.Text = dr.GetValue(6).ToString();
                    TextBox31.Text = dr.GetValue(7).ToString();
                    TextBox32.Text = dr.GetValue(8).ToString();
                    TextBox33.Text = dr.GetValue(9).ToString();
                    TextBox34.Text = dr.GetValue(10).ToString();
                    TextBox35.Text = dr.GetValue(12).ToString();
                }

                con.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //DELETE STUDENT - GET ACADEMIC YEAR DETAILS
        void getAcademicYearDeleteStudent()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM StudentAcademicYear WHERE student_id = " + DropDownList4.SelectedItem.Value + ";", con);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    TextBox20.Text = dr.GetValue(1).ToString();
                }


                con.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //DELETE STUDENT - DELETE BUTTON ON CLICK EVENT
        void deleteStudentDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM Registration WHERE user_id = " + TextBox24.Text.Trim() + ";", con);
                cmd.ExecuteNonQuery();

                con.Close();

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        void deleteAcademicYear()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM StudentAcademicYear WHERE student_id = " + TextBox24.Text.Trim() + ";", con);
                cmd.ExecuteNonQuery();

                con.Close();

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //Check Staff ID exist 
        bool checkDeleteStudentIdExist()
        {
            try
            {
                // Creating an object of SqlConnection class
                SqlConnection con = new SqlConnection(strcon);

                //if the connect is closed then we want it to be open to handle the backend part(database part)
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                // this will take two arguments "Sql query and SqlCommand object"
                SqlCommand cmd = new SqlCommand("SELECT * from Registration where user_id= " + TextBox24.Text.Trim() + ";", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);

                //we are creating a data table object to add the values selected from our query
                DataTable dt = new DataTable();

                //Here da will have the value that we've after the query is executed and that same value will be added to dt
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

        //Sending Account Dactivation mail
        void sendAccountDeactivationMail()
        {
            try
            {
                MailMessage message = new MailMessage();
                message.From = new MailAddress("akmvt0@gmail.com");

                // this should be replaced with your address 

                message.To.Add(new MailAddress(TextBox28.Text.Trim()));

                message.Subject = "Account Deactivation Mail";

                // this is the email content, eg comments, profession, country, etc
                message.Body = "Name: " + TextBox25.Text.Trim() + "\r\nEmail ID: " + TextBox28.Text.Trim() + "\r\n \r\nDear Student,\r\nYour Account has been deactivated from Student Portal System, You no longer have access to the student portal website.\r\n \r\nIf its not you then please ignore....";  // add more fields...


                // finaly send the email:
                SmtpClient client = new SmtpClient();
                client.Send(message);
                client.EnableSsl = true;

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        protected void DropDownList8_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox18.Text = DropDownList8.SelectedItem.Value;
        }
    }
}