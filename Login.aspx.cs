using Milestone;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Milestone3
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signin_click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["milestone"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            String id = username.Text;
            String pass = password.Text;
            SqlCommand loginproc = new SqlCommand("userLogin", conn);
            loginproc.CommandType = System.Data.CommandType.StoredProcedure;
            loginproc.Parameters.Add(new SqlParameter("@id", id));
            loginproc.Parameters.Add(new SqlParameter("@password", pass));
            SqlParameter success = loginproc.Parameters.Add("@success", System.Data.SqlDbType.Int);
            SqlParameter type = loginproc.Parameters.Add("@type", System.Data.SqlDbType.VarChar,20);
            type.Direction = System.Data.ParameterDirection.Output;
            success.Direction = System.Data.ParameterDirection.Output;
            Session["username"]=username.Text;
            conn.Open();
            loginproc.ExecuteNonQuery();
            conn.Close();

            if (success.Value.ToString() == "1")
            {
                Response.Write(type.Value);
                if (type.Value.ToString() == "StadiumManager")
                    Response.Redirect("stadium_manager.aspx");
                if (type.Value.ToString() == "Fans")
                    Response.Redirect("fans.aspx");
                if (type.Value.ToString() == "StadiumManager")
                    Response.Redirect("stadium_manager.aspx");
                if (type.Value.ToString() == "SystemAdmin")
                    Response.Redirect("SystemAdmin.aspx");
                if (type.Value.ToString() == "Representative")
                    Response.Redirect("clubRep.aspx");
                if (type.Value.ToString() == "AssocManager")
                    Response.Redirect("AssocManager.aspx");
           
            }
            else
            {
                Response.Write("Invalid Username/Password");
            }
        }

        protected void signup_click(object sender, EventArgs e)
        {
            Response.Redirect("Signup.aspx");
        }
    }
}