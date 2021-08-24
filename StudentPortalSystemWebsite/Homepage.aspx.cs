using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail; //For SmtpClient class
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentPortalSystemWebsite
{
    public partial class Homepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null)
                {
                    LinkButton2.Visible = false; //HOME
                    LinkButton1.Visible = false; //LOGOUT
                    HyperLink1.Visible = true; //SIGN UP
                    signUpSection.Visible = true; //Sign Up section
                }
                else
                {
                    if (Session["role"].Equals(""))
                    {
                        LinkButton2.Visible = false; //HOME
                        LinkButton1.Visible = false; //LOGOUT
                        HyperLink1.Visible = true; //SIGN UP
                        signUpSection.Visible = true; //Sign Up section
                    }
                    if (Session["role"].Equals("admin"))
                    {
                        LinkButton2.Visible = true; //HOME
                        LinkButton1.Visible = true; //LOGOUT
                        HyperLink1.Visible = false; //SIGN UP 
                        signUpSection.Visible = false; //Sign Up section
                    }
                    else if (Session["role"].Equals("student"))
                    {
                        LinkButton2.Visible = true; //HOME
                        LinkButton1.Visible = true; //LOGOUT
                        HyperLink1.Visible = false; //SIGN UP
                        signUpSection.Visible = false; //Sign Up section
                    }
                    else if (Session["role"].Equals("staff"))
                    {
                        LinkButton2.Visible = true; //HOME
                        LinkButton1.Visible = true; //LOGOUT
                        HyperLink1.Visible = false; //SIGN UP
                        signUpSection.Visible = false; //Sign Up section
                    }
                    else
                    {
                        LinkButton2.Visible = false; //HOME
                        LinkButton1.Visible = false; //LOGOUT
                        HyperLink1.Visible = true; //SIGN UP
                        signUpSection.Visible = true; //Sign Up section
                    }
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //HOMEPAGE - LOGOUT BUTTON ON CLICK EVENT
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"].Equals("admin"))
                {
                    Session["username"] = "";
                    Session["role"] = "";
                    Response.Redirect("AdminModule/Default.aspx");
                }
                else if (Session["role"].Equals("student"))
                {
                    Session["username"] = "";
                    Session["name"] = "";
                    Session["role"] = "";
                    Session["status"] = "";
                    Response.Redirect("StudentModule/Default.aspx");
                }
                else if (Session["role"].Equals("staff"))
                {
                    Session["username"] = "";
                    Session["name"] = "";
                    Session["role"] = "";
                    Response.Redirect("StaffModule/Default.aspx");
                }
                else
                {
                    HyperLink1.Visible = true; //SIGN UP
                    signUpSection.Visible = true; //Sign Up section
                    Response.Redirect("Homepage.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //HOMEPAGE - HOME BUTTON ON CLICK EVENT
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if (Session["role"].Equals("admin"))
            {
                Response.Redirect("AdminModule/Home.aspx");
            }
            else if (Session["role"].Equals("student"))
            {
                Response.Redirect("StudentModule/Home.aspx");
            }
            else if (Session["role"].Equals("staff"))
            {
                Response.Redirect("StaffModule/Home.aspx");
            }
            else
            {
                HyperLink1.Visible = true; //SIGN UP
                signUpSection.Visible = true; //Sign Up section
                Response.Redirect("Homepage.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBoxName.Text == "" || TextBoxEmail.Text == "" || TextBoxMessage.Text == "")
            {
                //reloading the page if all details are not filled because without reloading the page nav links(animation scroll) are not working and don't know why
                Response.Write("<script>alert('Please fill all the details!'); document.location.href = 'Homepage.aspx';</script>");
            }
            else
            {
                sendFeedbackOnEmail();
            }
        }


        // -------------------------------------------
        // -------------------------------------------
        // USER DEFINED METHODS

        //TO GET FEEDBACK FROM USER TO ADMIN
        void sendFeedbackOnEmail()
        {
            try
            {
                MailMessage message = new MailMessage();
                message.From = new MailAddress(TextBoxEmail.Text.Trim());

                // this should be replaced with your address 

                message.To.Add(new MailAddress("akmvt0@gmail.com"));

                message.Subject = "feedback";

                // this is the email content, eg comments, profession, country, etc
                message.Body = "Name: " + TextBoxName.Text.Trim() + "\r\nEmail ID: " + TextBoxEmail.Text.Trim() + "\r\nMessage: " + TextBoxMessage.Text.Trim();  // add more fields...


                // finaly send the email:
                SmtpClient client = new SmtpClient();
                client.Send(message);
                client.EnableSsl = true;

                Response.Write("<script>alert('Thank you for your feedback!'); document.location.href = 'Homepage.aspx';</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}