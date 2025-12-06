using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using static System.Net.Mime.MediaTypeNames;

namespace Milestone
{
    public partial class stadium_manager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Stadium_info_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["milestone"].ToString();
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                String username = Session["username"].ToString();
                SqlDataAdapter sqlDa = new SqlDataAdapter("Select * from dbo.Stadium S Inner Join Stadium_manager SR on S.stadium_id=SR.stadium_id where SR.username=@username", conn);
                sqlDa.SelectCommand.Parameters.Add(new SqlParameter("@username", username));
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                stadium.DataSource = dtbl;
                stadium.DataBind();
            }
        }

        protected void listofrequests(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["milestone"].ToString();
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                String username = Session["username"].ToString();
                SqlDataAdapter sqlDa = new SqlDataAdapter("Select CR.rep_name, C1.club_name as Host_club, C2.club_name as Guest_club, M.start_time, M.end_time, R.status from dbo.requests R Inner Join Stadium_manager SR on R.stadium_manager_id=SR.manager_id inner join Club_rep CR on CR.rep_id=R.club_rep_id inner join Club C1 on C1.club_id=CR.club_id inner join Matches M on M.match_id=R.match_id inner join Club C2 on M.guest_club_ID=C2.club_id where SR.username=@username", conn);
                sqlDa.SelectCommand.Parameters.Add(new SqlParameter("@username", username));
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                requests.DataSource = dtbl;
                requests.DataBind();


            }
        }
        protected void requests_SelectedIndexChanged(object sender, GridViewCommandEventArgs e)
        {
            Response.Write(e.CommandName);
            if (e.CommandName == "acceptRequest")
            {
                int x = (int)Convert.ToUInt32(e.CommandArgument);
                GridViewRow row = requests.Rows[x];
                String hostClub = row.Cells[1].Text;
                String guestClub= row.Cells[2].Text;
                String startTime= row.Cells[3].Text;
                string connStr = WebConfigurationManager.ConnectionStrings["milestone"].ToString();
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();
                    String username = Session["username"].ToString();
                    SqlCommand loginproc = new SqlCommand("acceptRequest", conn);
                    loginproc.CommandType = System.Data.CommandType.StoredProcedure;
                    loginproc.Parameters.Add(new SqlParameter("@username", username));
                    loginproc.Parameters.Add(new SqlParameter("@host_club", hostClub));
                    loginproc.Parameters.Add(new SqlParameter("@guest_club", guestClub));
                    loginproc.Parameters.Add(new SqlParameter("@date_time", startTime));
                    loginproc.ExecuteNonQuery();
                    SqlDataAdapter sqlDa = new SqlDataAdapter("Select CR.rep_name, C1.club_name as Host_club, C2.club_name as Guest_club, M.start_time, M.end_time, R.status from dbo.requests R Inner Join Stadium_manager SR on R.stadium_manager_id=SR.manager_id inner join Club_rep CR on CR.rep_id=R.club_rep_id inner join Club C1 on C1.club_id=CR.club_id inner join Matches M on M.match_id=R.match_id inner join Club C2 on M.guest_club_ID=C2.club_id where SR.username=@username", conn);
                    sqlDa.SelectCommand.Parameters.Add(new SqlParameter("@username", username));
                    DataTable dtbl = new DataTable();
                    sqlDa.Fill(dtbl);
                    requests.DataSource = dtbl;
                    requests.DataBind();
                }
            }
            if (e.CommandName == "rejectRequest")
            {
                int x = (int)Convert.ToUInt32(e.CommandArgument);
                GridViewRow row = requests.Rows[x];
                String hostClub = row.Cells[1].Text;
                String guestClub = row.Cells[2].Text;
                String startTime = row.Cells[3].Text;
                string connStr = WebConfigurationManager.ConnectionStrings["milestone"].ToString();
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();
                    String username = Session["username"].ToString();
                    SqlCommand loginproc = new SqlCommand("rejectRequest", conn);
                    loginproc.CommandType = System.Data.CommandType.StoredProcedure;
                    loginproc.Parameters.Add(new SqlParameter("@username", username));
                    loginproc.Parameters.Add(new SqlParameter("@host_club", hostClub));
                    loginproc.Parameters.Add(new SqlParameter("@guest_club", guestClub));
                    loginproc.Parameters.Add(new SqlParameter("@date_time", startTime));
                    loginproc.ExecuteNonQuery();
                    SqlDataAdapter sqlDa = new SqlDataAdapter("Select CR.rep_name, C1.club_name as Host_club, C2.club_name as Guest_club, M.start_time, M.end_time, R.status from dbo.requests R Inner Join Stadium_manager SR on R.stadium_manager_id=SR.manager_id inner join Club_rep CR on CR.rep_id=R.club_rep_id inner join Club C1 on C1.club_id=CR.club_id inner join Matches M on M.match_id=R.match_id inner join Club C2 on M.guest_club_ID=C2.club_id where SR.username=@username", conn);
                    sqlDa.SelectCommand.Parameters.Add(new SqlParameter("@username", username));
                    DataTable dtbl = new DataTable();
                    sqlDa.Fill(dtbl);
                    requests.DataSource = dtbl;
                    requests.DataBind();
                }
            }
           
        }

    }
}