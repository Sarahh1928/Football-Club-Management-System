using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Milestone
{
    public partial class SystemAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void add_club(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["milestone"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            String id = club_name.Text;
            String location = club_loc.Text;
            SqlCommand loginproc = new SqlCommand("addClub", conn);
            loginproc.CommandType = System.Data.CommandType.StoredProcedure;
            loginproc.Parameters.Add(new SqlParameter("@name", id));
            loginproc.Parameters.Add(new SqlParameter("@location", location));

            conn.Open();
            loginproc.ExecuteNonQuery();
            conn.Close();
        }

        protected void delete_club(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["milestone"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            String id = club_name2.Text;
            SqlCommand loginproc = new SqlCommand("deleteClub", conn);
            loginproc.CommandType = System.Data.CommandType.StoredProcedure;
            loginproc.Parameters.Add(new SqlParameter("@name", id));
            conn.Open();
            loginproc.ExecuteNonQuery();
            conn.Close();
        }

        protected void add_stadium(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["milestone"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            String id = stadium_name.Text;
            String loc = stadium_location.Text;
            int capacity = Int16.Parse(stadium_capacity.Text);
            SqlCommand loginproc = new SqlCommand("addStadium", conn);
            loginproc.CommandType = System.Data.CommandType.StoredProcedure;
            loginproc.Parameters.Add(new SqlParameter("@name", id));
            loginproc.Parameters.Add(new SqlParameter("@location", loc));
            loginproc.Parameters.Add(new SqlParameter("@capacity", capacity));
            conn.Open();
            loginproc.ExecuteNonQuery();
            conn.Close();
        }

        protected void delete_stadium(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["milestone"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            String id = stadium_name2.Text;
            SqlCommand loginproc = new SqlCommand("deleteStadium", conn);
            loginproc.CommandType = System.Data.CommandType.StoredProcedure;
            loginproc.Parameters.Add(new SqlParameter("@name", id));
            conn.Open();
            loginproc.ExecuteNonQuery();
            conn.Close();
        }

        protected void block_fan(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["milestone"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            String id = national_id.Text;
            SqlCommand loginproc = new SqlCommand("blockFan", conn);
            loginproc.CommandType = System.Data.CommandType.StoredProcedure;
            loginproc.Parameters.Add(new SqlParameter("@national_id", id));
            conn.Open();
            loginproc.ExecuteNonQuery();
            conn.Close();
        }
    }
}