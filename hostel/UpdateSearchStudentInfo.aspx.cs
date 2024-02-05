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
    public partial class UpdateSearchStudentInfo : System.Web.UI.Page
    {
        String ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\sonuyadav07\source\repos\hostel\hostel\App_Data\Database1.mdf;Integrated Security=True;Connect Timeout=30";
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                con.Open();
                string q2 = "select * from hostelinfo";
                SqlCommand command = new SqlCommand(q2, con);
                SqlDataReader d2 = command.ExecuteReader();
                GridView1.DataSource = d2;
                GridView1.DataBind();
                con.Close();

            }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            lblErrorMessage.Text = "";
            lblSuccessMessage.Text = "";
            

            if (rollnotxt.Text == "" )
            {
                lblErrorMessage.Text = "Fill the Details properly";
                rollnotxt.Text = fnametxt.Text = agetxt.Text = lnametxt.Text = hostelnametxt.Text = roomnotxt.Text = messfacilitytxt.Text =roomtypetxt.Text= "";
            }
            else
            {
                

                using (SqlConnection con = new SqlConnection(ConnectionString))
                {
                    con.Open();
                    string q1 = "select * from hostelinfo where userid1='" + rollnotxt.Text + "'";
                    SqlCommand cmd = new SqlCommand(q1, con);
                    SqlDataReader sqr = cmd.ExecuteReader();
                    int count = 0;
                    while (sqr.Read())
                    {
                        count += 1;
                    }
                    sqr.Close();

                    if (count != 0)
                    {
                        String query = "Select * from hostelinfo where userid1='" + rollnotxt.Text + "'";
                        cmd = new SqlCommand(query, con);
                        SqlDataReader d1 = cmd.ExecuteReader();
                        while (d1.Read())
                        {

                            fnametxt.Text = d1["fname"].ToString();
                            lnametxt.Text = d1["lname"].ToString();
                            agetxt.Text = d1["age"].ToString();
                            hostelnametxt.Text = d1["hostelname"].ToString();
                            roomnotxt.Text = d1["roomno"].ToString();
                            hostelnametxt.Text = d1["hostelname"].ToString();
                            roomtypetxt.Text = d1["roomtype"].ToString().Trim(); ;
                            messfacilitytxt.Text= d1["mess"].ToString().Trim();
                            btnupdate.Visible = true;
                            btndelete.Visible = true;
                        }
                        

                    }
                    else
                    {

                        lblErrorMessage.Text = "Student not found";
                        rollnotxt.Text = fnametxt.Text = agetxt.Text = lnametxt.Text = hostelnametxt.Text = roomnotxt.Text = messfacilitytxt.Text = "";
                    }

                    con.Close();
                    
                }


                }
            }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            lblErrorMessage.Text = "";
            lblSuccessMessage.Text = "";
            if (roomnotxt.Text == "" || rollnotxt.Text == "" || roomtypetxt.Text == "")
            {
                lblErrorMessage.Text = "Fill the Details properly";
            }
            else
            {
                using (SqlConnection con = new SqlConnection(ConnectionString))
                {
                    con.Open();
                    string q1 = "update hostelinfo set roomtype='" + roomtypetxt.Text + "',hostelname='" + hostelnametxt.Text + "',fname='" + fnametxt.Text + "',lname='" + lnametxt.Text + "' ,age='" + agetxt.Text + "',mess='"+messfacilitytxt.Text+"' ,roomno='"+roomnotxt.Text+"' where userid1='" + rollnotxt.Text + "'";
                    SqlCommand cmd = new SqlCommand(q1, con);
                    SqlDataReader sqr = cmd.ExecuteReader();

                   lblSuccessMessage.Text = "Succesfull";
                    
                    LoadGrid();
                }
            }
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {

            lblErrorMessage.Text = "";
            lblSuccessMessage.Text = "";
            if (roomnotxt.Text == "" || rollnotxt.Text == "" || roomtypetxt.Text == "")
            {
                lblErrorMessage.Text = "Fill the Details properly";
            }
            else
            {
                using(SqlConnection con=new SqlConnection(ConnectionString))
                {
                    con.Open();
                    string query = " Delete from hostelinfo where userid1='"+rollnotxt.Text+"'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataReader d1 = cmd.ExecuteReader();
                    d1.Close();
                    query = " Delete from registration where userid='" + rollnotxt.Text + "'";
                    cmd = new SqlCommand(query, con);
                     d1 = cmd.ExecuteReader();
                    lblSuccessMessage.Text = "Successfull Deleted";
                    LoadGrid();
                }

            }

        }
        void LoadGrid()
        {
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                con.Open();

                DataSet ds = new DataSet();

                SqlDataAdapter da = new SqlDataAdapter("SELECT* From hostelinfo", con);
                da.Fill(ds);

                GridView1.DataSource = ds;
                GridView1.DataBind();

                con.Close();
            }
        }

       
    }
}