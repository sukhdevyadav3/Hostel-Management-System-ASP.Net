using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace hostel
{
    public partial class ReportPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string query = Session["ClosedBugsResult1"].ToString();

            if (!IsPostBack)
                
            ReportViewer1.ServerReport.ReportServerUrl = new Uri("http://localhost/reportserver");
            ReportViewer1.ServerReport.ReportPath = @"D:\Users\XXX\Documents\Visual Studio 2008\Projects\BugtrackerSample1\BugTrackerSample\BugTrackerSample\Report1.rdl";

            //ReportParameter[] param = new ReportParameter[1]; 
            //param[0] = new ReportParameter("CustomerID", txtparam.Text);
            //ReportViewer1.ServerReport.SetParameters(param);
            System.Web.UI.ScriptManager scriptManager = new ScriptManager();
            Page page = new Page();
            
          
            page.DataBind();  //exception here 
            ReportViewer1.ServerReport.Refresh();

        }
    }
}