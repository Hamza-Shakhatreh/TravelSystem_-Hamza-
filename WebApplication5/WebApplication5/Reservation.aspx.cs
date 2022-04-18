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
    public partial class Reservation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
            SqlConnection con = new SqlConnection(mainconn);
            con.Open();
            string query = "SELECT DISTINCT [dbo].[user].CivilID ,[dbo].[user].fullName ,[dbo].[user].age , [dbo].[user].email ,[dbo].[user].phoneNumber ,[dbo].[user].country , [dbo].[user].city ,  [dbo].[user].street ,[dbo].[reservations].status ,[dbo].[reservations].reason FROM [dbo].[user]  INNER JOIN reservations ON [dbo].[user].CivilID = reservations.user_id INNER JOIN[dbo].[trip] ON reservations.trip_id= @tid";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@tid", Request.QueryString["id"]);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            

            GridView1.DataSource = dt;
            GridView1.DataBind();

            string query1 = "select [dbo].[trip].From_Country,[dbo].[trip].To_Country , [dbo].[trip].Time_Stamp from [dbo].[trip] where [dbo].[trip].ID=@tid";
            SqlCommand cmd1 = new SqlCommand(query1, con);
            cmd1.Parameters.AddWithValue("@tid", Request.QueryString["id"]);
            SqlDataAdapter adapter1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            adapter1.Fill(dt1);
            Label2.Text=  dt1.Rows[0]["From_Country"].ToString();
            Label4.Text = dt1.Rows[0]["To_Country"].ToString();
            Label6.Text = dt1.Rows[0]["Time_Stamp"].ToString();


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin.aspx");
        }
    }
}