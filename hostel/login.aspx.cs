using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace hostel
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        string ConnectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=C:\USERS\SONUYADAV07\SOURCE\REPOS\HOSTEL\HOSTEL\APP_DATA\DATABASE1.MDF;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        void clear()
        {
            unametxt.Text = pswdtxt.Text = "";
            lblErrorMessage.Text = lblSuccessMessage.Text = "";
            admincheck.Checked = false;
           
        }
        void lblclear()
        {
            lblErrorMessage.Text = lblSuccessMessage.Text = "";
        }

        protected void btnlogin_Click1(object sender, EventArgs e)
        {
            lblclear();


            if (unametxt.Text == "")
            {
                lblErrorMessage.Text = "Fill Details Properly";

            }

            else
            {


                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    conn.Open();
                    if (admincheck.Checked == true)
                    {
                        string q1 = "select * from admin where username='" + unametxt.Text + "' and password='" + pswdtxt.Text + "'";
                        SqlCommand command = new SqlCommand(q1, conn);
                        SqlDataReader d1 = command.ExecuteReader();
                        
                        
                        if(d1.Read())
                        {
                            lblSuccessMessage.Text = "Succesfull";
                            string username = unametxt.Text;
                            Session["username"] = username;
                            Response.Redirect("UpdateSearchStudentInfo.aspx");
                            clear();
                        }
                        else
                        {
                            lblErrorMessage.Text = "Inccorect Credentials";
                        }

                    }
                    else
                    {
                        

                        string query = "Select * from registration where username='" + unametxt.Text + "' and password='" + pswdtxt.Text + "'";
                        SqlCommand cmd = new SqlCommand(query, conn);
                        SqlDataReader sqlread = cmd.ExecuteReader();

                        if (sqlread.Read())
                        {
                            sqlread.Close();
                            string q1 = "select * from hostelinfo where username='" + unametxt.Text + "'";
                                cmd = new SqlCommand(q1, conn);
                            SqlDataReader d1 = cmd.ExecuteReader();
                           
                            if (d1.Read())
                            {
                                lblSuccessMessage.Text = "Succesfull";
                                string username1 = unametxt.Text;
                                Session["username"] = username1;
                                Response.Redirect("Student.aspx");
                                d1.Close();
                            }
                            else
                            {


                                lblSuccessMessage.Text = "Succesfull";
                                string username = unametxt.Text;
                                Session["username"] = username;
                                Response.Redirect("Hostelinfo.aspx");
                                clear();
                            }

                        }
                        else
                        {
                            clear();
                            lblErrorMessage.Text = "Incorrect Credentials";
                        }

                        conn.Close();

                    }
                }
            }

        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            clear();
        }
    }
}