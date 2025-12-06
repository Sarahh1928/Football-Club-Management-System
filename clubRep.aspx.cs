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
    public partial class clubRep : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void clubInfo(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["milestone"].ToString();
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                String username = Session["username"].ToString();
                SqlDataAdapter sqlDa = new SqlDataAdapter("Select * from dbo.Club C Inner Join Club_rep R on R.club_id=C.club_id where R.username=@username", conn);
                sqlDa.SelectCommand.Parameters.Add(new SqlParameter("@username", username));
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                club.DataSource = dtbl;
                club.DataBind();
            }
        }

        protected void viewMatches(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["milestone"].ToString();
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                String username = Session["username"].ToString();
                SqlDataAdapter sqlDa = new SqlDataAdapter("Select C1.club_name as Host_club, C2.club_name as Guest_club, M.start_time as Start_time, M.end_time as End_time, S.stadium_name as Stadium_name from dbo.Matches M Left Outer join Stadium S on M.host_stadium_id=S.stadium_id Inner Join Club C1 on C1.club_id=M.host_club_id Inner Join Club C2 on C2.club_id=M.guest_club_id Inner Join Club_rep R on R.club_id=C1.club_id or R.club_id=c2.Club_id where R.username=@username and M.start_time>CURRENT_TIMESTAMP", conn);
                sqlDa.SelectCommand.Parameters.Add(new SqlParameter("@username", username));
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                upcoming.DataSource = dtbl;
                upcoming.DataBind();
            }
        }

        protected void available_stadium(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["milestone"].ToString();
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                String date = sdate.Text;
                SqlDataAdapter sqlDa = new SqlDataAdapter("Select * from dbo.viewAvailableStadiumsOn(@day)", conn);
                sqlDa.SelectCommand.Parameters.Add(new SqlParameter("@day", date));
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                stadiums.DataSource = dtbl;
                stadiums.DataBind();
            }
        }

        protected void request(object sender, EventArgs e)
        {
                string connStr = WebConfigurationManager.ConnectionStrings["milestone"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                conn.Open();
                String date = sdate.Text;
                SqlCommand cmd = new SqlCommand("Select club_name from Club C Inner Join Club_rep R on C.club_id=R.club_id where R.username=@username", conn);
                cmd.Parameters.Add(new SqlParameter("@username", Session["username"].ToString()));
                String clubname = (String)cmd.ExecuteScalar();
                String stad= sname.Text;
                String start = stade2.Text;
                SqlCommand host_req = new SqlCommand("addHostRequest", conn);
                host_req.CommandType = System.Data.CommandType.StoredProcedure;
                host_req.Parameters.Add(new SqlParameter("@club_name", clubname));
                host_req.Parameters.Add(new SqlParameter("@stadium_name", stad));
                host_req.Parameters.Add(new SqlParameter("@date_time", start));
                host_req.ExecuteNonQuery();
                conn.Close();
            }
        }
    }
