using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Reflection.Emit;

namespace Milestone
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                association.Visible = false;
                Club_Respresentative.Visible = false;
                stadiumManager.Visible = false;
                fans.Visible = false;
                LoadDropList();
            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

            String opt = DropDownList2.SelectedItem.Value;
            if (opt == "Association Manager")
                association.Visible = true;
            if (opt == "Club Representative")
                Club_Respresentative.Visible = true;
            if (opt == "Stadium Manager")
                stadiumManager.Visible = true;
            if (opt == "Fan")
                fans.Visible = true;

        }
        void LoadDropList()
        {
            string connStr = WebConfigurationManager.ConnectionStrings["milestone"].ToString();
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("Select C.club_name from Club C Left Outer Join Club_rep CR on C.club_id=CR.club_id where CR.rep_id is null", conn);
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                Clubs.DataSource = dtbl;
                Clubs.DataValueField = "club_name";
                Clubs.DataTextField = "club_name";
                Clubs.DataBind();

                SqlDataAdapter sqlDa2 = new SqlDataAdapter("Select S.stadium_name from Stadium S Left Outer Join Stadium_Manager SM on SM.stadium_id=S.stadium_id where SM.manager_id is null", conn);
                DataTable dtbl2 = new DataTable();
                sqlDa2.Fill(dtbl2);
                stadium_list.DataSource = dtbl2;
                stadium_list.DataValueField = "stadium_name";
                stadium_list.DataTextField = "stadium_name";
                stadium_list.DataBind();
            }
        }

        protected void Register(object sender, EventArgs e)
        {
            String opt = DropDownList2.SelectedItem.Value;
            if (opt == "Association Manager")
            {
                String name = assoc_name.Text;
                String username = assoc_username.Text;
                String pass = assoc_password.Text;

                string connStr = WebConfigurationManager.ConnectionStrings["milestone"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand addMatch = new SqlCommand("addAssociationManager", conn);
                addMatch.CommandType = System.Data.CommandType.StoredProcedure;
                addMatch.Parameters.Add(new SqlParameter("@name", name));
                addMatch.Parameters.Add(new SqlParameter("@username", username));
                addMatch.Parameters.Add(new SqlParameter("@password", pass));

                conn.Open();
                addMatch.ExecuteNonQuery();
                conn.Close();

                Response.Redirect("Login.aspx");
            }
               
            if (opt == "Club Representative")
            {
                String name = rep_name.Text;
                String username = rep_username.Text;
                String pass = rep_password.Text;
                String chosen = Clubs.SelectedValue;
                string connStr = WebConfigurationManager.ConnectionStrings["milestone"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand addMatch = new SqlCommand("addRepresentative", conn);
                addMatch.CommandType = System.Data.CommandType.StoredProcedure;
                addMatch.Parameters.Add(new SqlParameter("@club_name", chosen));
                addMatch.Parameters.Add(new SqlParameter("@name", name));
                addMatch.Parameters.Add(new SqlParameter("@username", username));
                addMatch.Parameters.Add(new SqlParameter("@password", pass));

                conn.Open();
                addMatch.ExecuteNonQuery();
                conn.Close();

                Response.Redirect("Login.aspx");
            }
            if (opt == "Stadium Manager")
            {
                String name = manager_name.Text;
                String username = manager_username.Text;
                String pass = manager_password.Text;
                String chosen = stadium_list.SelectedValue;
                string connStr = WebConfigurationManager.ConnectionStrings["milestone"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand addMatch = new SqlCommand("addStadiumManager", conn);
                addMatch.CommandType = System.Data.CommandType.StoredProcedure;
                addMatch.Parameters.Add(new SqlParameter("@stadium_name", chosen));
                addMatch.Parameters.Add(new SqlParameter("@name", name));
                addMatch.Parameters.Add(new SqlParameter("@username", username));
                addMatch.Parameters.Add(new SqlParameter("@password", pass));

                conn.Open();
                addMatch.ExecuteNonQuery();
                conn.Close();

                Response.Redirect("Login.aspx");

            }
            if (opt == "Fan")
            {
                
                if (fan_name.Text.Length > 3 && fan_name.Text.Length < 21)
                {
                    String name = fan_name.Text;
                    String username = fan_username.Text;
                    String pass = fan_password.Text;
                    String natID = fan_national.Text;
                    String num = fan_phone.Text;
                    DateTime dt = DateTime.Parse(fan_birth.Text);
                    String ad = fan_address.Text;
                    string connStr = WebConfigurationManager.ConnectionStrings["milestone"].ToString();
                    SqlConnection conn = new SqlConnection(connStr);
                    SqlCommand addMatch = new SqlCommand("addFan", conn);
                    addMatch.CommandType = System.Data.CommandType.StoredProcedure;
                    addMatch.Parameters.Add(new SqlParameter("@name", name));
                    addMatch.Parameters.Add(new SqlParameter("@username", username));
                    addMatch.Parameters.Add(new SqlParameter("@password", pass));
                    addMatch.Parameters.Add(new SqlParameter("@national_id", natID));
                    addMatch.Parameters.Add(new SqlParameter("@birth_date", dt));
                    addMatch.Parameters.Add(new SqlParameter("@address", ad));
                    addMatch.Parameters.Add(new SqlParameter("@phonenumber", num));
                    conn.Open();
                    addMatch.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    error.Text = "Please enter a name between 3 and 20 characters";
                   
                }
                
            }
                
                
            
        }
    }
}