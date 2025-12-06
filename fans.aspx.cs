using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Milestone
{
    public partial class fans : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void listofmatches(object sender, EventArgs e)
        {
            String inputDate = startDate.Text;
            string connStr = WebConfigurationManager.ConnectionStrings["milestone"].ToString();
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                String username = Session["username"].ToString();
                SqlDataAdapter sqlDa = new SqlDataAdapter("Select Host, Guest, S.stadium_name, start_time, S.location from availableMatchesToAttend(@date) A inner join Stadium S on S.stadium_name=A.stadium_name", conn);
                sqlDa.SelectCommand.Parameters.Add(new SqlParameter("@date", inputDate));
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                matches.DataSource = dtbl;
                matches.DataBind();


            }
        }
        protected void matchesRows(object sender, GridViewCommandEventArgs e)
        { 
            int x = (int)Convert.ToUInt32(e.CommandArgument);
            GridViewRow row = matches.Rows[x];
            String hostClub = row.Cells[0].Text;
            String guestClub = row.Cells[1].Text;
            String startTime = row.Cells[3].Text;
            string connStr = WebConfigurationManager.ConnectionStrings["milestone"].ToString();
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                String username = Session["username"].ToString();
                SqlCommand loginproc = new SqlCommand("DECLARE @id varchar(20) SELECT @id=national_id from Fans F where username=@username execute purchaseTicket @id, @host,@guest, @start ", conn);
                loginproc.Parameters.Add(new SqlParameter("@username", username));
                loginproc.Parameters.Add(new SqlParameter("@host", hostClub));
                loginproc.Parameters.Add(new SqlParameter("@guest", guestClub));
                loginproc.Parameters.Add(new SqlParameter("@start", startTime));
                loginproc.ExecuteNonQuery();
                SqlDataAdapter sqlDa = new SqlDataAdapter("Select Host, Guest, S.stadium_name, start_time, S.location from availableMatchesToAttend(@date) A inner join Stadium S on S.stadium_name=A.stadium_name", conn);
                String inputDate = startDate.Text;
                sqlDa.SelectCommand.Parameters.Add(new SqlParameter("@date", inputDate));
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                matches.DataSource = dtbl;
                matches.DataBind();
            }
        }
    }
}