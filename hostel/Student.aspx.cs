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
    public partial class Student : System.Web.UI.Page
    {
        string ConnectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=C:\USERS\SONUYADAV07\SOURCE\REPOS\HOSTEL\HOSTEL\APP_DATA\DATABASE1.MDF;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

        protected void Page_Load(object sender, EventArgs e)
        {
             lblname.Text = (string)Session["username"];
            using (SqlConnection con=new SqlConnection(ConnectionString))
            {
                con.Open();
                string q2 = "select * from hostelinfo";
                SqlCommand command = new SqlCommand(q2, con);
                SqlDataReader d2 = command.ExecuteReader();
                GridView1.DataSource = d2;
                GridView1.DataBind();
                con.Close();

            }
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                con.Open();
                string query = "SELECT * from hostelinfo where username='" + lblname.Text + "'";

                SqlCommand cmd = new SqlCommand(query, con);

                SqlDataReader sdr = cmd.ExecuteReader();

                while (sdr.Read())
                {
                    nametxt.Text = sdr["fname"].ToString();
                    agetxt.Text = sdr["age"].ToString();
                    rollnotxt.Text = sdr["userid1"].ToString();
                    hostelnametxt.Text = sdr["hostelname"].ToString();
                   paymentamounttxt.Text = sdr["monthlyfee"].ToString();
                   totalfeetxt.Text = sdr["totalfee"].ToString();
                    roomnotxt.Text = sdr["roomno"].ToString();
                }

                con.Close();
            }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            
            if (rollnotxt.Text == "" )
            {
                lblErrorMessage.Text = "Fill the Details properly";
            }
            else
            {
                using (SqlConnection con = new SqlConnection(ConnectionString))
                {
                    con.Open();
                    string q1 = "select userid1 from hostelinfo where userid1='" + rollnotxt.Text + "'";
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

                            nametxt.Text = d1["fname"].ToString();
                            agetxt.Text = d1["age"].ToString();
                            hostelnametxt.Text = d1["hostelname"].ToString();
                            roomnotxt.Text = d1["roomno"].ToString();
                            paymentamounttxt.Text = d1["monthlyfee"].ToString();
                            totalfeetxt.Text = d1["totalfee"].ToString();

                        }
                    }
                    else
                    {

                        lblErrorMessage.Text = "Student not found";
                    }

                    con.Close();


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
    

    protected void btnpayment_Click(object sender, EventArgs e)
        {
            clear();
            String monthlyfee="", totalfee = "";
            int mf = 0, tf = 0;
            
            
            if (rdcard.Checked == false && rbcash.Checked == false)
            {
                lblpaymentmethod.Text = "Select a Payment method";
            }
            if (rdcard.Checked)
            {
                if (cardnotxt.Text == "")
                {
                    lblcardnoError.Text = "Enter Valid card no.";
                }
                if (cvvtxt.Text == "")
                {
                    lblErrorCardDetails.Text = "Enter Valid Card Details";
                }
                if (cardnotxt.Text.Length != 16)
                {
                    lblcardnoError.Text = "Enter 16 Digits card Number Only";
                }
                if(cvvtxt.Text.Length!=3)
                {
                    lblErrorCardDetails.Text = "Enter 3 Digits cvv No.";
                }
            }
            if (rollnotxt.Text == "" || nametxt.Text == "" || roomnotxt.Text == "" | paymentamounttxt.Text == "" || totalfeetxt.Text == "")
            {
                lblErrorMessage.Text = "Fill the Details properly";
            }
            else if (rdcard.Checked)
            {
                if (cardnotxt.Text != "" && cvvtxt.Text != "" || lblcardnoError.Text != "" && lblErrorCardDetails.Text != "")
                {
                    if (cardnotxt.Text.Length != 16)
                    {
                        lblcardnoError.Text = "Enter 16 Digits card Number Only";
                    }
                    if (cvvtxt.Text.Length != 3)
                    {
                        lblErrorCardDetails.Text = "Enter 3 Digits cvv No.";
                    }
                    else
                    { 
                        using (SqlConnection con = new SqlConnection(ConnectionString))
                    {
                        con.Open();
                        string query = "select * from hostelinfo where userid1='" + rollnotxt.Text + "'";
                        SqlCommand cmd = new SqlCommand(query, con);
                        SqlDataReader d1 = cmd.ExecuteReader();
                        int count = 0;
                        while (d1.Read())
                        {
                            count += 1;
                        }
                        d1.Close();
                            if (count != 0)
                            {
                                query = "select * from hostelinfo where userid1='" + rollnotxt.Text + "'";
                                cmd = new SqlCommand(query, con);
                                d1 = cmd.ExecuteReader();
                                while (d1.Read())
                                {
                                    monthlyfee = d1["monthlyfee"].ToString();
                                    totalfee = d1["totalfee"].ToString();

                                }
                                d1.Close();
                                mf = Convert.ToInt32(monthlyfee);
                                tf = Convert.ToInt32(totalfee);
                                tf -= mf;
                                totalfeetxt.Text = tf.ToString();
                                string q1 = "UPDATE hostelinfo SET totalfee='" + totalfeetxt.Text + "' WHERE userid1='" + rollnotxt.Text + "'";
                                cmd = new SqlCommand(q1, con);
                                d1 = cmd.ExecuteReader();
                                d1.Close();


                                query = "select * from hostelinfo where userid1='" + rollnotxt.Text + "' ";
                                cmd = new SqlCommand(query, con);
                                d1 = cmd.ExecuteReader();
                                while (d1.Read())
                                {
                                    rollnotxt.Text = d1["userid1"].ToString();
                                    totalfeetxt.Text = d1["totalfee"].ToString();

                                }
                                LoadGrid();
                                lblErrorMessage.Text = "Successfull";
                            }

                        }
                    }
                }
            }
            else { 
                    using (SqlConnection con = new SqlConnection(ConnectionString))
                    {
                        con.Open();
                        string query = "select * from hostelinfo where userid1='" + rollnotxt.Text + "'";
                        SqlCommand cmd = new SqlCommand(query, con);
                        SqlDataReader d1 = cmd.ExecuteReader();
                        int count = 0;
                        while (d1.Read())
                        {
                            count += 1;
                        }
                        d1.Close();
                        if (count != 0)
                        {
                            query = "select * from hostelinfo where userid1='" + rollnotxt.Text + "'";
                            cmd = new SqlCommand(query, con);
                            d1 = cmd.ExecuteReader();
                            while (d1.Read())
                            {
                                monthlyfee = d1["monthlyfee"].ToString();
                                totalfee = d1["totalfee"].ToString();

                            }
                            d1.Close();
                            mf = Convert.ToInt32(monthlyfee);
                            tf = Convert.ToInt32(totalfee);
                            tf -= mf;
                            totalfeetxt.Text = tf.ToString();
                            string q1 = "UPDATE hostelinfo SET totalfee='" + totalfeetxt.Text + "' WHERE userid1='" + rollnotxt.Text + "'";
                            cmd = new SqlCommand(q1, con);
                            d1 = cmd.ExecuteReader();
                            d1.Close();


                            query = "select * from hostelinfo where userid1='" + rollnotxt.Text + "' ";
                            cmd = new SqlCommand(query, con);
                            d1 = cmd.ExecuteReader();
                            while (d1.Read())
                            {
                                rollnotxt.Text = d1["userid1"].ToString();
                                totalfeetxt.Text = d1["totalfee"].ToString();

                            }
                            LoadGrid();
                            lblErrorMessage.Text = "Successfull";


                        }
                    }
                
            }
             }

        protected void rdcard_CheckedChanged(object sender, EventArgs e)
        {
            if (rdcard.Checked)
            {
                lblcard.Visible = true;
                cardnotxt.Visible = true;
                cvvtxt.Visible = true;
                lblcvv.Visible = true;

            }
        }

        protected void rbcash_CheckedChanged(object sender, EventArgs e)
        {
            if (rbcash.Checked)
            {
                lblcard.Visible = false;
                cardnotxt.Visible = false;
                cvvtxt.Visible = false;
                lblcvv.Visible = false;

            }
        }
        void clear()
        {
            lblcardnoError.Text = lblErrorCardDetails.Text = lblErrorMessage.Text = lblpaymentmethod.Text = "";
        }
    }
}



