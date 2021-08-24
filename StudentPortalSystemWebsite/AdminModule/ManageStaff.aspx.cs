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
    public partial class ManageStaff : System.Web.UI.Page
    {
        //Connection String
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (TextBox1.Text == "" || DropDownList2.Items.Count == 0 || DropDownList4.Items.Count == 0)
            {
                //AUTO GENERATING THE STAFF ID
                generateStaffId();
                //Auto Filling Staff Id from the database
                autoFillStaffId();
            }
        }
        // ---------------------------------------------
        // ---------------------------------------------
        // ---------------------------------------------
        // ADD STAFF
        // ---------------------------------------------

        //ADD STAFF BUTTON
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Trim() == "" || TextBox2.Text.Trim() == "" || TextBox3.Text.Trim() == "" || TextBox4.Text.Trim() == "" || TextBox5.Text.Trim() == "" || TextBox6.Text.Trim() == "" || TextBox7.Text.Trim() == "" || TextBox8.Text.Trim() == "" || TextBox9.Text.Trim() == "" || DropDownList1.SelectedIndex == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Fill all the details!');", true);
            }
            else
            {
                if (checkAddStaffIdExist())
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Entered Staff ID \"" + TextBox1.Text + "\" is already occupied!');", true);

                    generateStaffId();
                }
                else if (checkAddStaffEmailExist())
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Email address \"" + TextBox5.Text + "\" is already taken!, Please try another one');", true);

                    TextBox5.Text = "";
                }
                else if (checkAddStaffUsernameExist())
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Username \"" + TextBox7.Text + "\" is already taken!');", true);

                    TextBox7.Text = "";
                }
                else
                {
                    //Sending mail and add staff details in the database
                    sendAccountActivationMail();
                    //Add staff
                    addStaff();

                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Staff added successfully, and mail has been sent to the staff!'); document.location.href = 'ManageStaff.aspx';", true);

                    generateStaffId();
                    clearAddStaffTextBox();
                }
            }
        }

        //CLEAR TEXT BOXES
        protected void Button6_Click(object sender, EventArgs e)
        {
            clearAddStaffTextBox();
        }

        // ---------------------------------------------
        // ---------------------------------------------
        // ---------------------------------------------
        // UPDATE STAFF
        // ---------------------------------------------

        //GET USER DETAILS BUTTON
        protected void Button2_Click(object sender, EventArgs e)
        {
            getUpdateStaffDetails();
        }

        //UPDATE BUTTON
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (TextBox10.Text.Trim() == "" || TextBox11.Text.Trim() == "" || TextBox12.Text.Trim() == "" || TextBox13.Text.Trim() == "" || TextBox14.Text.Trim() == "" || TextBox15.Text.Trim() == "" || TextBox16.Text.Trim() == "" || DropDownList2.SelectedIndex == 0 || DropDownList3.SelectedIndex == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Fill all the details!');", true);
            }
            else
            {
                if (checkUpdateStaffEmailExist())
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Email address \"" + TextBox14.Text + "\" is already taken!, Please try another one');", true);

                    TextBox14.Text = "";
                }
                else if (checkUpdateStaffUsernameExist())
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Username \"" + TextBox16.Text + "\" is already taken!');", true);

                    TextBox16.Text = "";
                }
                else
                {
                    sendAccountModificationMail();
                    updateStaff();

                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Staff updated successfully!, and the mail has been sent to the staff.'); document.location.href = 'ManageStaff.aspx';", true);

                    autoFillStaffId();
                    clearUpdateStaffTextBox();
                }
            }
        }

        //CLEAR TEXT BOXES
        protected void Button7_Click(object sender, EventArgs e)
        {
            clearUpdateStaffTextBox();
        }

        // ---------------------------------------------
        // ---------------------------------------------
        // ---------------------------------------------
        // DELETE STAFF
        // ---------------------------------------------

        //GET USER DETAILS
        protected void Button4_Click(object sender, EventArgs e)
        {
            getDeleteStaffDetails();
        }

        //DELETE DETAILS
        protected void Button5_Click(object sender, EventArgs e)
        {
            if (checkDeleteStaffIdExist())
            {
                sendAccountDeactivationMail();
                deleteStaff();

                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Staff deleted successfully!, and the mail has been sent to the staff.'); document.location.href = 'ManageStaff.aspx';", true);

                autoFillStaffId();
                clearDeleteStaffTextBox();
            }
            else
            {
                autoFillStaffId();
            }
        }

        //CLEAR TEXT BOXES
        protected void Button8_Click(object sender, EventArgs e)
        {
            clearDeleteStaffTextBox();
        }





        // ---------------------------------------------
        //USER DEFINED FUNCTION

        //Auto fill the DropDownList
        void autoFillStaffId()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM StaffDetails;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);

                //Update Staff
                DropDownList2.DataTextField = ds.Tables[0].Columns["staff_id"].ToString();
                DropDownList2.DataSource = ds.Tables[0];
                DropDownList2.DataBind();
                DropDownList2.Items.Insert(0, new ListItem("--Select--", "0"));
                //Delete Staff
                DropDownList4.DataTextField = ds.Tables[0].Columns["staff_id"].ToString();
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

        //Refresh Page
        void refreshPage()
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "document.location.href = 'ManageStaff.aspx';", true);
        }


        // ---------------------------------------------
        // ADD STAFF
        // ---------------------------------------------

        //Generate Staff Id in text box
        void generateStaffId()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT MAX(staff_id)+1 FROM StaffDetails", con);

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
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //Add Staff
        void addStaff()
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
                SqlCommand cmd = new SqlCommand("INSERT INTO StaffDetails(staff_id, staff_name, address, contact_no, gender, email, designation, username, password) values (@staff_id, @staff_name, @address, @contact_no, @gender, @email, @designation, @username, @password)", con);

                /* This is a predifined function in C# which takes two parameters 
                 * 1) where to store the value (placeholders)
                 * 2) From where to get the value (TextBox id name)
                 * Text method will tell that the value is in the text form
                 * Trim function will remove unneccesary spaces from the beginning and the end of the value
                 */
                cmd.Parameters.AddWithValue("@staff_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@staff_name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@address", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@gender", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@email", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@designation", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@username", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@password", TextBox8.Text.Trim());


                //This will triggered the query or we can say that it will execute the above code
                cmd.ExecuteNonQuery();

                //Closing the Database Connection
                con.Close();

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //Clear Text Boxes
        void clearAddStaffTextBox()
        {
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            DropDownList1.ClearSelection();
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = "";
        }

        //Check User Id Exist
        bool checkAddStaffIdExist()
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
                SqlCommand cmd = new SqlCommand("SELECT * from StaffDetails where staff_id= " + TextBox1.Text.Trim() + " ORDER BY staff_id;", con);
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

        //Check Username Exist
        bool checkAddStaffUsernameExist()
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
                SqlCommand cmd = new SqlCommand("SELECT * from StaffDetails where username='" + TextBox7.Text.Trim() + "';", con);
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

                //Closing the Database Connection

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
                return false;
            }
        }

        //Check email address already exist or not
        bool checkAddStaffEmailExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from StaffDetails where email ='" + TextBox5.Text.Trim() + "';", con);
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

                message.Subject = "Account Activation Mail";

                // this is the email content, eg comments, profession, country, etc
                message.Body = "Name: " + TextBox2.Text.Trim() + "\r\nEmail ID: " + TextBox5.Text.Trim() + "\r\nYour Account on Student Portal Website has been activated, Please contact admin for your username, password and other details.\r\n \r\nIf its not you then please ignore....";  // add more fields...


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

        // ---------------------------------------------
        // UPDATE STAFF
        // ---------------------------------------------

        //Get Staff Details
        void getUpdateStaffDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM StaffDetails WHERE staff_id = " + DropDownList2.SelectedItem.Value + ";", con);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    TextBox10.Text = dr.GetValue(0).ToString();
                    TextBox11.Text = dr.GetValue(1).ToString();
                    TextBox12.Text = dr.GetValue(2).ToString();
                    TextBox13.Text = dr.GetValue(3).ToString();
                    DropDownList3.SelectedValue = dr.GetValue(4).ToString();
                    TextBox14.Text = dr.GetValue(5).ToString();
                    TextBox15.Text = dr.GetValue(6).ToString();
                    TextBox16.Text = dr.GetValue(7).ToString();
                }


                con.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //Update Staff
        void updateStaff()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE StaffDetails SET staff_name = @staff_name, address = @address, contact_no = @contact_no, gender = @gender, email = @email, designation = @designation, username = @username WHERE staff_id = '" + TextBox10.Text.Trim() + "'", con);

                //cmd.Parameters.AddWithValue("@staff_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@staff_name", TextBox11.Text.Trim());
                cmd.Parameters.AddWithValue("@address", TextBox12.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", TextBox13.Text.Trim());
                cmd.Parameters.AddWithValue("@gender", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@email", TextBox14.Text.Trim());
                cmd.Parameters.AddWithValue("@designation", TextBox15.Text.Trim());
                cmd.Parameters.AddWithValue("@username", TextBox16.Text.Trim());

                cmd.ExecuteNonQuery();

                con.Close();

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //Clear Text Boxes
        void clearUpdateStaffTextBox()
        {
            DropDownList2.ClearSelection();
            TextBox10.Text = "";
            TextBox11.Text = "";
            TextBox12.Text = "";
            TextBox13.Text = "";
            DropDownList3.ClearSelection();
            TextBox14.Text = "";
            TextBox15.Text = "";
            TextBox16.Text = "";
        }

        //Check email address exist
        bool checkUpdateStaffEmailExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from StaffDetails where staff_id != " + TextBox10.Text.Trim() + " AND email ='" + TextBox14.Text.Trim() + "';", con);
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

        //Check Staff Username Exists
        bool checkUpdateStaffUsernameExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM StaffDetails WHERE staff_id != " + TextBox10.Text.Trim() + " AND username = '" + TextBox16.Text.Trim() + "';", con);

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

                message.To.Add(new MailAddress(TextBox14.Text.Trim()));

                message.Subject = "Account Modification Mail";

                // this is the email content, eg comments, profession, country, etc
                message.Body = "Name: " + TextBox11.Text.Trim() + "\r\nEmail ID: " + TextBox14.Text.Trim() + "\r\nYour Account on Student Portal Website has been modified, Please contact admin for more information.\r\n \r\nIf its not you then please ignore....";  // add more fields...


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

        // ---------------------------------------------
        // DELETE STAFF
        // ---------------------------------------------

        //Get Staff Details
        void getDeleteStaffDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM StaffDetails where staff_id = " + DropDownList4.SelectedItem.Value + ";", con);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    TextBox17.Text = dr.GetValue(0).ToString();
                    TextBox18.Text = dr.GetValue(1).ToString();
                    TextBox19.Text = dr.GetValue(2).ToString();
                    TextBox20.Text = dr.GetValue(3).ToString();
                    TextBox21.Text = dr.GetValue(4).ToString();
                    TextBox22.Text = dr.GetValue(5).ToString();
                    TextBox23.Text = dr.GetValue(6).ToString();
                    TextBox24.Text = dr.GetValue(7).ToString();
                }

                con.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //Delete Staff
        void deleteStaff()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE from StaffDetails where staff_id = " + TextBox17.Text.Trim() + ";", con);
                cmd.ExecuteNonQuery();
                con.Close();
                
            }
            catch (Exception ex)
            {
                //Response.Write("<script>alert('" + ex.Message + "');</script>");
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //Clear Text Boxes
        void clearDeleteStaffTextBox()
        {
            DropDownList4.ClearSelection();
            TextBox17.Text = "";
            TextBox18.Text = "";
            TextBox19.Text = "";
            TextBox20.Text = "";
            TextBox21.Text = "";
            TextBox22.Text = "";
            TextBox23.Text = "";
            TextBox24.Text = "";
        }

        //Check Staff ID exist 
        bool checkDeleteStaffIdExist()
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
                SqlCommand cmd = new SqlCommand("SELECT * from StaffDetails where staff_id= " + TextBox17.Text.Trim() + ";", con);
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

                message.To.Add(new MailAddress(TextBox22.Text.Trim()));

                message.Subject = "Account Deactivation Mail";

                // this is the email content, eg comments, profession, country, etc
                message.Body = "Name: " + TextBox18.Text.Trim() + "\r\nEmail ID: " + TextBox22.Text.Trim() + "\r\nYour Account on Student Portal Website has been deactivated!, You no longer have access to the student portal website.\r\n \r\nIf its not you then please ignore....";  // add more fields...


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
    }
}