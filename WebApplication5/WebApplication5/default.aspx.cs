using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;


namespace WebApplication5
{
    public partial class _default : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
                Session.Clear();
                string conn = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
                SqlConnection con = new SqlConnection(conn);
                string query = "Select  Count (email) From [dbo].[user] where password= @pass and email = @email";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@pass", TextBoxPass.Text);
                cmd.Parameters.AddWithValue("@email", TextBoxUser.Text);
                con.Open();
                int r = (int) cmd.ExecuteScalar();
               
            if (r == 1)
            {
                string info = "Select  CivilID , userType From [dbo].[user] where password= @pass and email = @email";
                SqlCommand cmd1 = new SqlCommand(info, con);
                cmd1.Parameters.AddWithValue("@pass", TextBoxPass.Text);
                cmd1.Parameters.AddWithValue("@email", TextBoxUser.Text);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd1);
                DataTable dt1 = new DataTable();
                adapter.Fill(dt1);
                bool isAdmin = (bool)dt1.Rows[0]["userType"];
                if (isAdmin)
                    Response.Redirect("admin.aspx");
                else
                {
                    Session.Timeout = 1;
                    Session["userid"]= dt1.Rows[0]["CivilID"];
                    Response.Redirect("Home.aspx");
                }
            }
        }
    }
}