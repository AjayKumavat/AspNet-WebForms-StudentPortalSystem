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

namespace StudentPortalSystemWebsite.StudentModule
{
    public partial class Registration : System.Web.UI.Page
    {
        // CONNECTION STRINGS
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        string one_time_password;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Hidding the OTP section when page loads
            divOneTimePassword.Visible = false;

            if (TextBox1.Text == "")
            {
                //TextBox1 Below function will auto generate the User ID
                autoGenerateUserId();
            }
            else if (TextBox1.Text.Trim() != "" && checkUserIdExists())
            {
                autoGenerateUserId();
            }
            else if (TextBox1.Text.Trim() != "" && !checkUserIdExists())
            {

            }
            else
            {
                autoGenerateUserId();
            }
        }


        //STREAM DROPDOWNLIST
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            autoFillSubStream();
        }

        // ----------------------------------------------------------
        // ----------------------------------------------------------
        // REGISTRATION FORM
        // ----------------------------------------------------------
        // ----------------------------------------------------------
        //Sign up button click event
        protected void Button1_Click(object sender, EventArgs e)
        {
            //To delete unverified account
            //ADDING THIS FUNCTION TAKE CARE OF FOLLOWING CASES
            //CASE 1: if the user goes back from otp page then he had to provide a new email and username.
            //CASE 2: Values will be compare with only verified account and not with the unverified ones.
            deleteSameEmailUnverifiedAccount();

            deleteSameEnrollmentNoUnverifiedAccount();

            deleteSameUsernameUnverifiedAccount();


            //Server side required field validator
            if (TextBox2.Text.Trim() == "" || TextBox3.Text.Trim() == "" || TextBox4.Text.Trim() == "" || TextBox5.Text.Trim() == "" || TextBox6.Text.Trim() == "" || TextBox7.Text.Trim() == "" || TextBox8.Text.Trim() == "" || TextBox9.Text.Trim() == "" || DropDownList1.SelectedIndex == 0 || DropDownList2.SelectedIndex == 0 || DropDownList3.SelectedIndex == 0 || DropDownList4.SelectedIndex == 0)
            {
                Response.Write("<script>alert('Please Fill all the detail in Registration form');</script>");
            }
            else
            {
                //Check if User Id already exist
                if (checkUserIdExists())
                {
                    Response.Write("<script>alert('User ID \"" + TextBox1.Text + "\" is occupied!, Please try another User ID');</script>");
                    autoGenerateUserId();
                }
                else if (checkEmailAddressExists())
                {
                    Response.Write("<script>alert('Email Address: \"" + TextBox5.Text + "\" is already Registered!, Please try another one');</script>");
                }
                else if (checkEnrollmentNoExist())
                {
                    Response.Write("<script>alert('Enrollment No \"" + TextBox6.Text + "\" is occupied!, Please try another one!');</script>");
                    TextBox6.Text = "";
                }
                //Check if Username already exists
                else if (checkUsernameExists())
                {
                    Response.Write("<script>alert('Username \"" + TextBox7.Text + "\" is already taken!, Please try another username');</script>");

                    //clearing the textbox that contains username that already exists
                    TextBox7.Text = "";
                }
                else if (comparePasswordTextBoxes())
                {
                    Response.Write("<script>alert('Confirm Password: \"" + TextBox9.Text + "\" doesn't match with password: \"" + TextBox9.Text + "\", Please try again!');</script>");
                }
                else
                {
                    TextBox11.Text = TextBox5.Text.Trim();
                    sendOneTimePasswordMail();
                    sectionRegistration.Visible = false;
                    divOneTimePassword.Visible = true;
                }
            }

        }


        //REGISTRATION FORM - CLEAR BUTTON ON CLICK EVENT
        protected void Button4_Click(object sender, EventArgs e)
        {
            clearTextBox();
        }
        // ----------------------------------------------------------
        // ----------------------------------------------------------

        // ----------------------------------------------------------
        // ----------------------------------------------------------
        // OTP FORM
        // ----------------------------------------------------------
        // ----------------------------------------------------------

        //RESEND OTP BUTTON - ONE TIME PASSWORD
        protected void Button2_Click(object sender, EventArgs e)
        {
            divOneTimePassword.Visible = true;
            reSendOneTimePasswordMail();
            Response.Write("<script>alert('OTP resend request processed!, check your mailbox!');</script>");
        }


        //ONE TIME PASSWORD - SUBMIT BUTTON
        protected void Button3_Click(object sender, EventArgs e)
        {
            if(TextBox10.Text == "")
            {
                Response.Write("<script>alert('Please enter the One time password!');</script>");
                sectionRegistration.Visible = false;
                divOneTimePassword.Visible = true;
            }
            else
            {
                if (checkEmailEnrollmentUsernameExist())
                {
                    if (verifyOneTimePassword())
                    {
                        otpVerifiedAccount();
                        autoGenerateUserId();
                        clearTextBox();
                        clearTextBoxOTP();
                        sectionRegistration.Visible = true;
                        divOneTimePassword.Visible = false;
                    }
                    else
                    {
                        deleteUnverifiedAccount();
                        clearTextBoxOTP();
                        sectionRegistration.Visible = true;
                        divOneTimePassword.Visible = false;
                        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Incorrect OTP!, Please Register again..');", true);
                    }
                }
                else
                {
                    TextBox10.Text = "";
                    sectionRegistration.Visible = true;
                    divOneTimePassword.Visible = false;
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('An error occurred!, Please Register again..');", true);
                }


                //if (verifyOneTimePassword())
                //{
                //    if (checkEmailEnrollmentUsernameExist())
                //    {
                //        otpVerifiedAccount();
                //        autoGenerateUserId();
                //        clearTextBox();
                //        clearTextBoxOTP();
                //        sectionRegistration.Visible = true;
                //        divOneTimePassword.Visible = false;
                //    }
                //    else
                //    {
                //        sectionRegistration.Visible = true;
                //        divOneTimePassword.Visible = false;
                //        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('An error occurred!, Please Register again..');", true);
                //    }
                    
                //}
                //else
                //{
                //    deleteUnverifiedAccount();
                //    clearTextBoxOTP();
                //    sectionRegistration.Visible = true;
                //    divOneTimePassword.Visible = false;
                //    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Incorrect OTP!, Please Register again..');", true);
                //}
            }//if else
            
        }

        // ----------------------------------------------------------
        // ----------------------------------------------------------
        // ----------------------------------------------------------
        // USER DEFINED FUNCTION


        

        //Auto generate user_id method
        void autoGenerateUserId()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT MAX(user_id)+1 from Registration;", con);

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
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        //REGISTRATION PAGE - Incase User press back button from otp page
        void deleteSameEmailUnverifiedAccount()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM Registration WHERE otp != 'verified' AND email = '" + TextBox5.Text.Trim() + "';", con);

                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //REGISTRATION PAGE - If there's enrollment no already exist in the database and the account is unverified then that account will be deleted from the database
        void deleteSameEnrollmentNoUnverifiedAccount()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM Registration WHERE otp != 'verified' AND enrollment_no = '" + TextBox6.Text.Trim() + "';", con);

                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //REGISTRATION PAGE - SAME USERNAME DELETE
        void deleteSameUsernameUnverifiedAccount()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM Registration WHERE otp != 'verified' AND username = '" + TextBox7.Text.Trim() + "';", con);

                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        

        // ----------------------------------------------------------
        // REGISTRATION FORM - Server side scripting

        //Comparing password textbox and confirm password textbox
        bool comparePasswordTextBoxes()
        {
            if (TextBox9.Text != TextBox8.Text)
            {
                TextBox9.Text = "";
                TextBox8.Text = "";
                return true;
            }
            else
            {
                return false;
            }
        }

        bool checkEmailEnrollmentUsernameExist()
        {
            try
            {
                //Creating an object of class SqlConnection to connect with the database
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from Registration where email='" + TextBox5.Text.Trim() + "' AND enrollment_no = '" + TextBox6.Text.Trim() + "' AND username = '" + TextBox7.Text.Trim() + "';", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();

                //Filling the data inside the dt from da
                da.Fill(dt);

                //Closing the database connection
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
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
        //Checking if the username already exists or not
        bool checkEmailAddressExists()
        {
            try
            {
                //Creating an object of class SqlConnection to connect with the database
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from Registration where email='" + TextBox5.Text.Trim() + "';", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();

                //Filling the data inside the dt from da
                da.Fill(dt);

                //Closing the database connection
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
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        //Checking if the username already exists or not
        bool checkUsernameExists()
        {
            try
            {
                //Creating an object of class SqlConnection to connect with the database
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from Registration where username='" + TextBox7.Text.Trim() + "';", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();

                //Filling the data inside the dt from da
                da.Fill(dt);

                //Closing the database connection
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
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        //checking if the User Id already exists or not
        bool checkUserIdExists()
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
                SqlCommand cmd = new SqlCommand("SELECT * from Registration where user_id=" + TextBox1.Text.Trim() + " ORDER BY user_id;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);

                //we are creating a data table object to add the values selected from our query
                DataTable dt = new DataTable();

                //Here da will have the value that we've after the query is executed and that same value will be added to dt
                da.Fill(dt);

                //Closing the Database Connection
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
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        //Checking if enrollment Number already exists or not 
        bool checkEnrollmentNoExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM Registration WHERE enrollment_no = '" + TextBox6.Text.Trim() + "';", con);

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
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        //After selecting stream auto filling the sub stream
        void autoFillSubStream()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM CourseDetails WHERE stream = '" + DropDownList2.SelectedItem.Value + "';", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);

                DropDownList3.DataTextField = ds.Tables[0].Columns["sub_stream"].ToString();
                DropDownList3.DataSource = ds.Tables[0];
                DropDownList3.DataBind();
                DropDownList3.Items.Insert(0, new ListItem("--Select--", "0"));

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        // ----------------------------------------------------------
        // REGISTRATION FORM - Sign up -button operations

        //SEND ONE TIME PASSWORD TO USER'S EMAIL
        void sendOneTimePasswordMail()
        {
            try
            {

                //GENERATING RANDOM ONE TIME PASSWORD
                Random rnd = new Random();
                one_time_password = (rnd.Next(100000, 999999)).ToString();
                MailMessage message = new MailMessage();
                message.From = new MailAddress("akmvt0@gmail.com");

                // this should be replaced with your address 

                message.To.Add(new MailAddress(TextBox5.Text.Trim()));

                message.Subject = "Email Verification - One Time Password";

                // this is the email content, eg comments, profession, country, etc
                message.Body = "Name: " + TextBox2.Text.Trim() + "\r\nEmail ID: " + TextBox5.Text.Trim() + "\r\nOne Time Password : " + one_time_password;  // add more fields...


                // finaly send the email:
                SmtpClient client = new SmtpClient();
                client.Send(message);
                client.EnableSsl = true;

                //Inserting user details into the database
                signUpNewMember();

                Response.Write("<script>alert('OTP is sent to your email, please check and verify right away!');</script>");


            }
            catch (Exception ex)
            {
                deleteUnverifiedAccount();
                Response.Write("<script>alert('" + ex.Message + ", Please fill the registration form again!'); document.location.href = 'Registration.aspx';</script>");
            }
        }

        // Inserting New User Details into the database - Registration
        void signUpNewMember()
        {
            try
            {
                // Creating an object of SqlConnection class to connect with the database
                SqlConnection con = new SqlConnection(strcon);
                //if the connect is closed then we want it to be open to handle the backend part(database part)
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                // this will take two arguments "Sql query and SqlCommand object"
                SqlCommand cmd = new SqlCommand("INSERT INTO Registration(user_id, name, address, contact_no, email, gender, stream, sub_stream, semester, enrollment_no, username, password, status, otp) values (@user_id, @name, @address, @contact_no, @email, @gender, @stream, @sub_stream, @semester, @enrollment_no, @username, @password, @status, @otp)", con);

                /* This is a predifined function in C# which takes two parameters 
                 * 1) where to store the value (placeholders)
                 * 2) From where to get the value (TextBox id name)
                 * Text method will tell that the value is in the text form
                 * Trim function will remove unneccesary spaces from the beginning and the end of the value
                 */
                cmd.Parameters.AddWithValue("@user_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@address", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@email", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@gender", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@stream", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@sub_stream", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@semester", DropDownList4.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@enrollment_no", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@username", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@password", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@status", "pending");
                cmd.Parameters.AddWithValue("@otp", one_time_password);

                //This will triggered the query or we can say that it will execute the above code
                cmd.ExecuteNonQuery();

                //Closing the Database Connection
                con.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        // ----------------------------------------------------------
        //REGISTRATION FORM - Clear Textboxes
        void clearTextBox()
        {
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = "";
            DropDownList1.ClearSelection();
            DropDownList2.ClearSelection();
            DropDownList3.ClearSelection();
            DropDownList4.ClearSelection();
        }

        // ----------------------------------------------------------
        // ----------------------------------------------------------
        // ----------------------------------------------------------
        // ----------------------------------------------------------

        // ----------------------------------------------------------
        // RESEND OTP

        //RESEND OTP TO USER'S EMAIL
        void reSendOneTimePasswordMail()
        {
            try
            {

                //GENERATING RANDOM ONE TIME PASSWORD
                Random rnd = new Random();
                one_time_password = (rnd.Next(100000, 999999)).ToString();
                MailMessage message = new MailMessage();
                message.From = new MailAddress("akmvt0@gmail.com");

                // this should be replaced with your address 

                message.To.Add(new MailAddress(TextBox11.Text.Trim()));

                message.Subject = "Email Verification - One Time Password";

                // this is the email content, eg comments, profession, country, etc
                message.Body = "One Time Password : " + one_time_password;  // add more fields...


                // finaly send the email:
                SmtpClient client = new SmtpClient();
                client.Send(message);
                client.EnableSsl = true;

                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE Registration SET otp = @otp WHERE email = '" + TextBox11.Text + "';", con);
                    cmd.Parameters.AddWithValue("@otp", one_time_password);
                    cmd.ExecuteNonQuery();

                    con.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }


            }
            catch (Exception ex)
            {
                deleteUnverifiedAccount();
                Response.Write("<script>alert('" + ex.Message + ", Please fill the registratuion form again!'); document.location.href = 'Registration.aspx';</script>");
            }
        }

        // Emptying the textbox after successfully signing up
        // i am not applying directly on page load because it is clearing the text everytime i am getting an error, i want to clear the text only after successfully sign up

        // ----------------------------------------------------------
        // OTP - SUBMIT OTP
        //Clear TextBoxes inside the OTP section
        void clearTextBoxOTP()
        {
            TextBox10.Text = "";
            TextBox11.Text = "";
        }

        //Check if the entered OTP is correct or not
        bool verifyOneTimePassword()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM Registration WHERE email = '" + TextBox11.Text.Trim() + "' AND otp = " + TextBox10.Text.Trim() + ";", con);

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

        //After entering the correct OTP user account will get otp verified
        void otpVerifiedAccount()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE Registration SET otp = @otp WHERE email = '" + TextBox11.Text.Trim() + "';", con);

                cmd.Parameters.AddWithValue("@otp", "verified");
                cmd.ExecuteNonQuery();

                con.Close();

                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Account Verified!'); document.location.href = 'Registration.aspx';", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //Delete unverified account
        void deleteUnverifiedAccount()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM Registration WHERE otp != 'verified';", con);

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