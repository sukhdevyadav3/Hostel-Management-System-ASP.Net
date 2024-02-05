using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace hostel
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        string ConnectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=C:\USERS\SONUYADAV07\SOURCE\REPOS\HOSTEL\HOSTEL\APP_DATA\DATABASE1.MDF;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

        protected void Page_Load(object sender, EventArgs e)
        {
            
            
            lblusername.Text = (string)Session["username"];
            if (rdcard.Checked == true)
            {
                lblcard.Visible = true;
                cardnotxt.Visible = true;
                lblcvv.Visible = true;
                cvvtxt.Visible = true;
            }


            int total = 0, t1 = 0;
            if (rbthreeroom.Checked == true)
            {
                total = 3000;

            }
            else if (rbtworoom.Checked == true)
            {
                total = 5000;

            }
            if (messcheckbox.Checked == true)
            {
                t1 = 1000;

            }
            total += t1;
            monthlybilltxt.Text = total.ToString();
            total *= 12;

            totalbilltxt.Text = total.ToString();
            btnsubmit.Visible = true;

            if (!this.IsPostBack)
            {
                using (SqlConnection con = new SqlConnection(ConnectionString))
                {
                    con.Open();
                    string query = "SELECT fname,lname,userid,city from registration where username='" + lblusername.Text + "'";

                    SqlCommand cmd = new SqlCommand(query, con);

                    SqlDataReader sdr = cmd.ExecuteReader();

                    while (sdr.Read())
                    {
                        fnametxt.Text = sdr["fname"].ToString();
                        lnametxt.Text = sdr["lname"].ToString();
                        rollnotxt.Text = sdr["userid"].ToString();
                        citytxt.Text = sdr["city"].ToString();
                    }

                    con.Close();
                }
            }
        }

        protected void ddlhostelname_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            clear();
           

            if (roomnotxt.Text == "")
            {
                lblroomno.Text = "Enter Room No.";
            }
            if (agetxt.Text == "")
            {
                lblage.Text = "Enter age";
                lblErrorMessage.Text = "Fill Mandatory Fields";
            }
            if(rdcard.Checked)
            {
                if(cardnotxt.Text=="")
                {
                    lblcardnoError.Text = "Enter Card No.";
                }
                if(cvvtxt.Text=="")
                {
                    lblErrorCardDetails.Text = "Enter Card Details Properly";
                }
                if (cardnotxt.Text.Length != 16)
                {
                    lblcardnoError.Text = "Enter 16 Digits card Number Only";
                }
                if (cvvtxt.Text.Length != 3)
                {
                    lblErrorCardDetails.Text = "Enter 3 Digits cvv No.";
                }
            }
            if(datestart.Text=="")
            {
                lbldateError.Text = "Select Date";
            }
            if (rdcard.Checked == false && rbcash.Checked == false)
            {
                lblpaymentmethod.Text = "Select a Payment method";
            }


            else if (fnametxt.Text != "" && lnametxt.Text != "" && rollnotxt.Text != "" && citytxt.Text != "" && totalbilltxt.Text != "" && agetxt.Text != "" && roomnotxt.Text != "" && totalbilltxt.Text != "" && datestart.Text!="")
            {
                if (rdcard.Checked)
                {
                    if (cardnotxt.Text != "" && cvvtxt.Text != ""||lblcardnoError.Text!="" && lblErrorCardDetails.Text!="")
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
                                string q1 = "select userid1 from hostelinfo where userid1='" + rollnotxt.Text + "'";
                                SqlCommand cmd = new SqlCommand(q1, con);
                                SqlDataReader sqr = cmd.ExecuteReader();
                                int count = 0;
                                while (sqr.Read())
                                {
                                    count += 1;
                                }
                                sqr.Close();
                                if (count == 0)
                                {
                                    if (rbtworoom.Checked == true && messcheckbox.Checked == false)
                                    {
                                        string query = "insert into hostelinfo (userid1,fname,lname,city,totalfee,hostelname,username,roomno,age,roomtype,mess,monthlyfee,dateofstart) values ('" + rollnotxt.Text + "','" + fnametxt.Text + "','" + lnametxt.Text + "','" + citytxt.Text + "','" + totalbilltxt.Text + "','" + ddlhostelname.SelectedItem.Value + "','" + lblusername.Text + "','" + roomnotxt.Text + "','" + agetxt.Text + "','2 room','NO','" + monthlybilltxt.Text + "','" + datestart.Text + "')";
                                        cmd = new SqlCommand(query, con);
                                        SqlDataReader d1 = cmd.ExecuteReader();
                                        lblSuccessMessage.Text = "Succesfull";
                                        con.Close();
                                        btnsubmit.Visible = false;
                                    }
                                    else if (rbtworoom.Checked == true && messcheckbox.Checked == true)
                                    {
                                        string query = "insert into hostelinfo (userid1,fname,lname,city,totalfee,hostelname,username,roomno,age,roomtype,mess,monthlyfee,dateofstart) values ('" + rollnotxt.Text + "','" + fnametxt.Text + "','" + lnametxt.Text + "','" + citytxt.Text + "','" + totalbilltxt.Text + "','" + ddlhostelname.SelectedItem.Value + "','" + lblusername.Text + "','" + roomnotxt.Text + "','" + agetxt.Text + "','2 room','YES','" + monthlybilltxt.Text + "','" + datestart.Text + "')";
                                        cmd = new SqlCommand(query, con);
                                        SqlDataReader d1 = cmd.ExecuteReader();
                                        lblSuccessMessage.Text = "Succesfull";
                                        con.Close();
                                        btnsubmit.Visible = false;
                                    }
                                    else if (rbthreeroom.Checked == true && messcheckbox.Checked == false)
                                    {
                                        string query = "insert into hostelinfo (userid1,fname,lname,city,totalfee,hostelname,username,roomno,age,roomtype,mess,monthlyfee,dateofstart) values ('" + rollnotxt.Text + "','" + fnametxt.Text + "','" + lnametxt.Text + "','" + citytxt.Text + "','" + totalbilltxt.Text + "','" + ddlhostelname.SelectedItem.Value + "','" + lblusername.Text + "','" + roomnotxt.Text + "','" + agetxt.Text + "','3 room','NO','" + monthlybilltxt.Text + "','" + datestart.Text + "')";
                                        cmd = new SqlCommand(query, con);
                                        SqlDataReader d1 = cmd.ExecuteReader();
                                        lblSuccessMessage.Text = "Succesfull";
                                        con.Close();
                                        btnsubmit.Visible = false;
                                    }
                                    else if (rbthreeroom.Checked == true && messcheckbox.Checked == true)
                                    {
                                        string query = "insert into hostelinfo (userid1,fname,lname,city,totalfee,hostelname,username,roomno,age,roomtype,mess,monthlyfee,dateofstart) values ('" + rollnotxt.Text + "','" + fnametxt.Text + "','" + lnametxt.Text + "','" + citytxt.Text + "','" + totalbilltxt.Text + "','" + ddlhostelname.SelectedItem.Value + "','" + lblusername.Text + "','" + roomnotxt.Text + "','" + agetxt.Text + "','3 room','YES','" + monthlybilltxt.Text + "','" + datestart.Text + "')";
                                        cmd = new SqlCommand(query, con);
                                        SqlDataReader d1 = cmd.ExecuteReader();
                                        lblSuccessMessage.Text = "Succesfull";
                                        con.Close();
                                        btnsubmit.Visible = false;
                                    }

                                }
                                else
                                {
                                    lblSuccessMessage.Text = "you are already registered";
                                }
                            }
                        }
                    }
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
                    if (count == 0)
                    {
                        if (rbtworoom.Checked == true && messcheckbox.Checked == false)
                        {
                            string query = "insert into hostelinfo (userid1,fname,lname,city,totalfee,hostelname,username,roomno,age,roomtype,mess,monthlyfee,dateofstart) values ('" + rollnotxt.Text + "','" + fnametxt.Text + "','" + lnametxt.Text + "','" + citytxt.Text + "','" + totalbilltxt.Text + "','" + ddlhostelname.SelectedItem.Value + "','" + lblusername.Text + "','" + roomnotxt.Text + "','" + agetxt.Text + "','2 room','NO','" + monthlybilltxt.Text + "','" + datestart.Text + "')";
                            cmd = new SqlCommand(query, con);
                            SqlDataReader d1 = cmd.ExecuteReader();
                            lblSuccessMessage.Text = "Succesfull";
                            con.Close();
                            btnsubmit.Visible = false;
                        }
                        else if (rbtworoom.Checked == true && messcheckbox.Checked == true)
                        {
                            string query = "insert into hostelinfo (userid1,fname,lname,city,totalfee,hostelname,username,roomno,age,roomtype,mess,monthlyfee,dateofstart) values ('" + rollnotxt.Text + "','" + fnametxt.Text + "','" + lnametxt.Text + "','" + citytxt.Text + "','" + totalbilltxt.Text + "','" + ddlhostelname.SelectedItem.Value + "','" + lblusername.Text + "','" + roomnotxt.Text + "','" + agetxt.Text + "','2 room','YES','" + monthlybilltxt.Text + "','" + datestart.Text + "')";
                            cmd = new SqlCommand(query, con);
                            SqlDataReader d1 = cmd.ExecuteReader();
                            lblSuccessMessage.Text = "Succesfull";
                            con.Close();
                            btnsubmit.Visible = false;
                        }
                        else if (rbthreeroom.Checked == true && messcheckbox.Checked == false)
                        {
                            string query = "insert into hostelinfo (userid1,fname,lname,city,totalfee,hostelname,username,roomno,age,roomtype,mess,monthlyfee,dateofstart) values ('" + rollnotxt.Text + "','" + fnametxt.Text + "','" + lnametxt.Text + "','" + citytxt.Text + "','" + totalbilltxt.Text + "','" + ddlhostelname.SelectedItem.Value + "','" + lblusername.Text + "','" + roomnotxt.Text + "','" + agetxt.Text + "','3 room','NO','" + monthlybilltxt.Text + "','" + datestart.Text + "')";
                            cmd = new SqlCommand(query, con);
                            SqlDataReader d1 = cmd.ExecuteReader();
                            lblSuccessMessage.Text = "Succesfull";
                            con.Close();
                            btnsubmit.Visible = false;
                        }
                        else if (rbthreeroom.Checked == true && messcheckbox.Checked == true)
                        {
                            string query = "insert into hostelinfo (userid1,fname,lname,city,totalfee,hostelname,username,roomno,age,roomtype,mess,monthlyfee,dateofstart) values ('" + rollnotxt.Text + "','" + fnametxt.Text + "','" + lnametxt.Text + "','" + citytxt.Text + "','" + totalbilltxt.Text + "','" + ddlhostelname.SelectedItem.Value + "','" + lblusername.Text + "','" + roomnotxt.Text + "','" + agetxt.Text + "','3 room','YES','" + monthlybilltxt.Text + "','" + datestart.Text + "')";
                            cmd = new SqlCommand(query, con);
                            SqlDataReader d1 = cmd.ExecuteReader();
                            lblSuccessMessage.Text = "Succesfull";
                            con.Close();
                            btnsubmit.Visible = false;
                        }

                    }
                    else
                    {
                        lblSuccessMessage.Text = "you are already registered";
                    }

                }
            }

            }
        }



        protected void totalbilltxt_TextChanged(object sender, EventArgs e)
        {

        }

        protected void messcheckbox_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void btnTotal_Click(object sender, EventArgs e)
        {
            if (rdcard.Checked == true)
            {
                lblcard.Visible = true;
                cardnotxt.Visible = true;
                lblcvv.Visible = true;
                cvvtxt.Visible = true;
            }


            int total = 0, t1 = 0;
            if (rbthreeroom.Checked == true)
            {
                total = 3000;
               
            }
            else if (rbtworoom.Checked == true)
            {
                total = 5000;
                
            }
            if (messcheckbox.Checked == true)
            {
                t1 = 1000;
                
            }
            total += t1;
            monthlybilltxt.Text = total.ToString();
            total *= 12;

            totalbilltxt.Text = total.ToString();
            btnsubmit.Visible = true;

            if (rbcash.Checked == true)
            {
                lblcard.Visible = false;
                cardnotxt.Visible = false;
                lblcvv.Visible = false;
                cvvtxt.Visible = false;
                lblErrorCardDetails.Text = "";
            }
            if(rdcard.Checked)
            {
                lblcard.Visible = true;
                cardnotxt.Visible = true;
                lblcvv.Visible = true;
                cvvtxt.Visible = true;
            }

        }

        protected void rbtworoom_CheckedChanged(object sender, EventArgs e)
        {


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
            lblErrorCardDetails.Text = lblErrorMessage.Text = lblRadioButtonError.Text = lblSuccessMessage.Text = lblTotalBillError.Text = lblroomno.Text =lblpaymentmethod.Text=lblErrorCardDetails.Text=lblcardnoError.Text =lblage.Text=lblErrorCardDetails.Text=lblcardnoError.Text= lbldateError.Text="" ;
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

       
        
    }
}

 
