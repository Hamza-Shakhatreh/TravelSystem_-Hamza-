using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Data;


namespace WebApplication5
{
    public partial class _default : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
                string conn = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
                SqlConnection con = new SqlConnection(conn);
                string query = "Select  Count (email) From [dbo].[user] where password="+Convert.ToInt32(TextBoxPass.Text)+ "and CivilID = " + Convert.ToInt32(TextBoxUser.Text);
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                int r = (int) cmd.ExecuteScalar();
                Response.Write(r);
            if (r == 1)
            {
                string info = "Select  userType From [dbo].[user] where password="+ Convert.ToInt32(TextBoxPass.Text) + "and CivilID = " + Convert.ToInt32(TextBoxUser.Text);
                SqlCommand cmd1 = new SqlCommand(info, con);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd1);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                bool isAdmin = (bool)dt.Rows[0]["userType"];
                Response.Write(isAdmin);
            }
        }
    }
}