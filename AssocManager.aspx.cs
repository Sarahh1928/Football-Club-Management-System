using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace Milestone
{
    public partial class AssocManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void upcoming_matches(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["milestone"].ToString();
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlDataAdapter sqlDa= new SqlDataAdapter("Select C1.club_name as Host_club, C2.club_name as Guest_club, M.start_time as Start_time, M.end_time as End_time from Matches M Inner Join Club c1 on C1.club_id=M.host_club_id Inner Join Club c2 on C2.club_id=M.guest_club_id where start_time>CURRENT_TIMESTAMP ", conn);
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                UpMatches.DataSource = dtbl;
                UpMatches.DataBind();
            }
        }

        protected void add_match(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["milestone"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            String host = host_name.Text;
            String guest = guest_name.Text;
            String start = start_time.Text;
            String end = end_time.Text;
            SqlCommand addMatch = new SqlCommand("addNewMatch", conn);
            addMatch.CommandType = System.Data.CommandType.StoredProcedure;
            addMatch.Parameters.Add(new SqlParameter("@host_club", host));
            addMatch.Parameters.Add(new SqlParameter("@guest_club", guest));
            addMatch.Parameters.Add(new SqlParameter("@start_time", start));
            addMatch.Parameters.Add(new SqlParameter("@end_time", end));

            conn.Open();
            addMatch.ExecuteNonQuery();
            conn.Close();
        }

        protected void delete_match(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["milestone"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            String host = host_name2.Text;
            String guest = guest_name2.Text;
            SqlCommand deleteMatch = new SqlCommand("deleteMatch", conn);
            deleteMatch.CommandType = System.Data.CommandType.StoredProcedure;
            deleteMatch.Parameters.Add(new SqlParameter("@host_club", host));
            deleteMatch.Parameters.Add(new SqlParameter("@guest_club", guest));

            conn.Open();
            deleteMatch.ExecuteNonQuery();
            conn.Close();
        }

        protected void already_played(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["milestone"].ToString();
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("Select C1.club_name as Host_club, C2.club_name as Guest_club, M.start_time as Start_time, M.end_time as End_time from Matches M Inner Join Club c1 on C1.club_id=M.host_club_id Inner Join Club c2 on C2.club_id=M.guest_club_id where end_time<CURRENT_TIMESTAMP ", conn);
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                alreadyPlayed.DataSource = dtbl;
                alreadyPlayed.DataBind();
            }
        }

        protected void never_matched(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["milestone"].ToString();
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("Select * from dbo.clubsNeverMatched", conn);
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                neverMatched.DataSource = dtbl;
                neverMatched.DataBind();
            }
        }
    }
}


/*
 * 
 * <asp:GridView ID="UpMatches" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true">
                <Columns>
                    <asp:BoundField DataField="Given_club" HeaderText="Given_club" />
                    <asp:BoundField DataField="Competing_club" HeaderText="Competing_club" />
                    <asp:BoundField DataField="start_time" HeaderText="start_time" />
                    <asp:BoundField DataField="stadium_name" HeaderText="Stadium_name" />
                </Columns>
            </asp:GridView>
 * 
 * 
 * string connStr = WebConfigurationManager.ConnectionStrings["milestone"].ToString();
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                String id = host_name3.Text;
                SqlDataAdapter sqlDa= new SqlDataAdapter("Select * from dbo.UpcomingMatchesofClub(@club_name)", conn);
                sqlDa.SelectCommand.Parameters.Add(new SqlParameter("@club_name", id));
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                UpMatches.DataSource = dtbl;
                UpMatches.DataBind();
            }*/