using System;
using System.Collections.Generic;
using System.Configuration; // For ConfigurationManager class
using System.Data; // For ConnectionState class
using System.Data.SqlClient; // For SqlConnection class
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentPortalSystemWebsite.AdminModule
{
    public partial class Notice : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //TO SHOW ALL THE UPDATED DATA IN THE GRID VIEW WHENEVER THIS PAGE IS RELOADED
            GridView1.DataBind();

            //AUTO FILL NOTICE ID - ON PAGE LOAD

            autoGenerateNoticeId();
            //-----------------------------------------

            //UPDATE NOTICE - ON PAGE LOAD
            if (DropDownList2.Items.Count == 0)
            {
                autoFillNoticeId();
            }
            //-----------------------------------------

            //DELETE NOTICE - ON PAGE LOAD
            if (DropDownList3.Items.Count == 0)
            {
                autoFillNoticeId();
            }
            //-----------------------------------------
        }


        // ---------------------------------------------
        // ADD NOTICE
        // ---------------------------------------------

        //ADD BUTTON
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex == 0 || TextBox2.Text == "")
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please fill all the details!');", true);
            }
            else
            {
                if (!checkAddNoticeIdExists())
                {
                    addNotice();
                    autoGenerateNoticeId();
                    clearAddTextBox();
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Entered Notice ID \"" + TextBox1.Text + "\" is already occupied'); document.location.href = 'Notice.aspx';", true);
                    autoGenerateNoticeId();
                }
            }
        }

        //CLEAR BUTTON
        protected void Button2_Click(object sender, EventArgs e)
        {
            clearAddTextBox();
        }
        // ---------------------------------------------
        // ---------------------------------------------
        // ---------------------------------------------
        // UPDATE NOTICE
        // ---------------------------------------------

        //GET NOTICE DETAILS
        protected void Button8_Click(object sender, EventArgs e)
        {
            getUpdateNoticeDetails();
        }
        //UPDATE BUTTON
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (DropDownList2.SelectedIndex == 0 || DropDownList4.SelectedIndex == 0 || TextBox4.Text == "")
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please fill all the details!');", true);
            }
            else
            {
                if (checkUpdateNoticeIdExists())
                {
                    updateNoticeDetails();
                    clearUpdateTextBox();
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Notice ID doesn't Exist!, Please refresh this page and try again!'); document.location.href = 'Notice.aspx';", true);
                }
            }
        }

        //CLEAR BUTTON
        protected void Button4_Click(object sender, EventArgs e)
        {
            clearUpdateTextBox();
        }
        // ---------------------------------------------
        // ---------------------------------------------
        // ---------------------------------------------
        // DELETE NOTICE
        // ---------------------------------------------

        //DELETE NOTICE - GET NOTICE DETAIL BUTTON ON CLICK EVENT
        protected void Button7_Click(object sender, EventArgs e)
        {
            getNoticeDetails();
        }

        //DELETE BUTTON
        protected void Button5_Click(object sender, EventArgs e)
        {
            if(DropDownList3.SelectedIndex == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please select Notice ID!');", true);
            }
            else
            {
                if (checkDeleteNoticeIdExists())
                {
                    deleteNotice();
                    clearDeleteTextBox();
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Notice ID doesn't Exist!, Please refresh this page and try again!'); document.location.href = 'Notice.aspx';", true);
                }
            }
        }

        //CLEAR BUTTON
        protected void Button6_Click(object sender, EventArgs e)
        {
            clearDeleteTextBox();
        }
        // ---------------------------------------------
        // ---------------------------------------------









        //USER DEFINED METHODS

        //(UPDATE AND DELETE) POPULATING DROP DOWN LIST WITH NOTICE ID
        void autoFillNoticeId()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM Notice", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);
                DropDownList2.DataTextField = ds.Tables[0].Columns["notice_id"].ToString();
                DropDownList2.DataSource = ds.Tables[0];
                DropDownList2.DataBind();
                DropDownList2.Items.Insert(0, new ListItem("--Select--", "0"));

                DropDownList3.DataTextField = ds.Tables[0].Columns["notice_id"].ToString();
                DropDownList3.DataSource = ds.Tables[0];
                DropDownList3.DataBind();
                DropDownList3.Items.Insert(0, new ListItem("--Select--", "0"));

                con.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }



        // ---------------------------------------------
        // ADD NOTICE
        // ---------------------------------------------

        //CLEAR TEXT BOX - ADD NOTICE
        void clearAddTextBox()
        {
            TextBox2.Text = ""; //Notice - content
            DropDownList1.ClearSelection(); //Notice for
        }

        //AUTO GENERATING NOTICE ID - ADD NOTICE
        void autoGenerateNoticeId()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT MAX(notice_id)+1 FROM Notice", con);

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

        //ADDING NOTICE INTO THE DATABASE
        void addNotice()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO Notice(notice_id, notice_date, notice_for, notice, notice_by) values (@notice_id, @notice_date, @notice_for, @notice, @notice_by)", con);

                cmd.Parameters.AddWithValue("@notice_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@notice_date", DateTime.Now.ToShortDateString());
                cmd.Parameters.AddWithValue("@notice_for", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@notice", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@notice_by", Session["role"].ToString() + " - " + Session["username"].ToString());

                cmd.ExecuteNonQuery();

                con.Close();

                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Notice Added Successfully!'); document.location.href = 'Notice.aspx';", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //Check NoticeId Exists, to avoid data duplication
        bool checkAddNoticeIdExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM Notice where notice_id='" + TextBox1.Text.Trim() + "' ORDER BY notice_id;", con);
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


        // ---------------------------------------------
        // UPDATE NOTICE
        // ---------------------------------------------

        //UPDATE - FETCHING NOTICE FROM THE DATABASE
        void getUpdateNoticeDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM Notice WHERE notice_id = " + DropDownList2.SelectedItem.Value + ";", con);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        DropDownList4.SelectedValue = dr.GetValue(2).ToString();
                        TextBox4.Text = dr.GetValue(3).ToString();
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('No Notice exists with the selected Notice ID, Please refresh the page.');", true);
                }

                con.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //UPDATE CLEAR TEXTBOX BUTTON
        void clearUpdateTextBox()
        {
            DropDownList2.ClearSelection(); //Notice ID
            DropDownList4.ClearSelection(); //Notice for
            TextBox4.Text = ""; //Notice...
        }

        //UPDATE NOTICE
        void updateNoticeDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE Notice SET notice_date = @notice_date, notice_for = @notice_for, notice = @notice, notice_by = @notice_by WHERE notice_id = " + DropDownList2.SelectedItem.Value + ";", con);

                cmd.Parameters.AddWithValue("@notice_date", DateTime.Now.ToShortDateString());
                cmd.Parameters.AddWithValue("@notice_for", DropDownList4.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@notice", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@notice_by", Session["role"].ToString() + " - " + Session["username"].ToString());

                cmd.ExecuteNonQuery();

                con.Close();

                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Notice Updated Successfully!'); document.location.href = 'Notice.aspx';", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //Check NoticeId Exists, to avoid data duplication
        bool checkUpdateNoticeIdExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM Notice where notice_id='" + DropDownList2.SelectedItem.Value + "' ORDER BY notice_id;", con);
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



        // ---------------------------------------------
        // DELETE NOTICE
        // ---------------------------------------------
        // CLEAR TEXT BOX BUTTON - DELETE NOTICE
        void clearDeleteTextBox()
        {
            DropDownList3.ClearSelection(); //Auto-generated Notice ID
            TextBox3.Text = ""; //Notice ID
            TextBox5.Text = ""; //Notice for
            TextBox6.Text = ""; //Notice
        }

        //FETCHING NOTICE FROM THE DATABASE
        void getNoticeDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM Notice where notice_id = " + DropDownList3.SelectedItem.Value + ";", con);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox3.Text = dr.GetValue(0).ToString();
                        TextBox5.Text = dr.GetValue(2).ToString();
                        TextBox6.Text = dr.GetValue(3).ToString();
                    }
                }

                con.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //DELETE NOTICE FROM THE DATABASE
        void deleteNotice()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM Notice where notice_id = " + TextBox3.Text + ";", con);
                cmd.ExecuteNonQuery();
                con.Close();

                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Notice deleted successfully!'); document.location.href='Notice.aspx';", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        //Check NoticeId Exists, to avoid data duplication
        bool checkDeleteNoticeIdExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM Notice where notice_id='" + TextBox3.Text.Trim() + "' ORDER BY notice_id;", con);
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

    }
}