using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text.RegularExpressions;

namespace hostel
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\sonuyadav07\source\repos\hostel\hostel\App_Data\Database1.mdf;Integrated Security=True;Connect Timeout=30";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Clear();
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            lblclear();
            string email = unametxt.Text;
            Regex regex = new Regex(@" ^ ([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
            Match match = regex.Match(email);
            if (match.Success)
            {
               
            }
            else
            {
                lbluname.Text = email + " is Invalid Email Address";
            }
        
            if (fnametxt.Text == "")
            {
                lblfname.Text = "Enter First name";
            }
            if (lnametxt.Text == "")
            {
                lbllname.Text = "Enter Last name";
            }
            if (ddlgender.SelectedValue == "")
            {
                lblddlgender.Text = "Select a gender ";
            }
            if (citytxt.Text == "")
            {
                lblcity.Text = "Enter city name";
            }
            if (pincodetxt.Text == "")
            {
                lblpincode.Text = "Enter pincode";
            }
            if (unametxt.Text == "")
            {
                lbluname.Text = "Enter Username";
            }
            if (pswdtxt.Text == "")
            {
                lblpswd.Text = "Enter password";
            }
            if (cpswdtxt.Text == "")
            {
                lblcpwsd.Text = "Enter Confirm password";
            }


            if (unametxt.Text == "" || pswdtxt.Text == "" || fnametxt.Text == "" || lnametxt.Text == "" || citytxt.Text == "" || pincodetxt.Text == "")
            {
                lblErrorMessage.Text = "Please fill Mandatory fields";
            }
            else if (pswdtxt.Text != cpswdtxt.Text)
            {

                lblErrorMessage.Text = "Password do not match";
            }

            else
            {
                using (SqlConnection sqlcon = new SqlConnection(connectionString))
                {
                    sqlcon.Open();
                    // code for opeing connect string
                    string q1 = "select username from registration where username='" + unametxt.Text + "'";
                    SqlCommand cmd = new SqlCommand(q1, sqlcon);
                    SqlDataReader sqr = cmd.ExecuteReader();
                    int count = 0;
                    while (sqr.Read())
                    {
                        count += 1;
                    }
                    sqr.Close();
                    if (count == 0)
                    {

                        SqlCommand sqlcmd = new SqlCommand("UserAddOrEdit", sqlcon);
                        sqlcmd.CommandType = CommandType.StoredProcedure;
                        sqlcmd.Parameters.AddWithValue("@userid", Convert.ToInt32(hfuserID.Value == "" ? "0" : hfuserID.Value));
                        sqlcmd.Parameters.AddWithValue("@fname", fnametxt.Text.Trim());
                        sqlcmd.Parameters.AddWithValue("@lname", lnametxt.Text.Trim());
                        sqlcmd.Parameters.AddWithValue("@gender", ddlgender.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@city", citytxt.Text.Trim());
                        sqlcmd.Parameters.AddWithValue("@pincode", pincodetxt.Text.Trim());
                        sqlcmd.Parameters.AddWithValue("@username", unametxt.Text.Trim());
                        sqlcmd.Parameters.AddWithValue("@password", pswdtxt.Text.Trim());
                        sqlcmd.ExecuteNonQuery();
                        Clear();
                        lblSuccessMessage.Text = "Submitted Successfully";
                    }
                    else
                    {
                        lblErrorMessage.Text = "Try Different Username";
                    }

                }
            }

        }
        void Clear()
        {
            fnametxt.Text = lnametxt.Text = citytxt.Text = unametxt.Text = pswdtxt.Text = cpswdtxt.Text = pincodetxt.Text = "";
            hfuserID.Value = "";
            lblErrorMessage.Text = lblSuccessMessage.Text = "";

        }
        void lblclear()
        {
            lblErrorMessage.Text = lblcpwsd.Text = lblpswd.Text = lblddlgender.Text = lbluname.Text = lblSuccessMessage.Text = lbllname.Text = lblfname.Text = lblcity.Text = lblerrorpswd.Text = lblerroruname.Text = lblpincode.Text = "";
        }
    }

}