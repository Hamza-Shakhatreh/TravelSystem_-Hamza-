using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;

namespace WebApplication5
{
    public partial class control : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Request.QueryString["remain"]) <= 0)
            {
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Sorry no remainng seats" ;
            }
            else
            {
                string query1 = "Select  Count (trip_id) From [dbo].[reservations] where trip_id= @tid and user_id=@uid and status =1 ";
                string mainconn = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
                SqlConnection con = new SqlConnection(mainconn);
                SqlCommand cmd1 = new SqlCommand(query1, con);
                cmd1.Parameters.AddWithValue("@tid", Request.QueryString["tid"]);
                cmd1.Parameters.AddWithValue("@uid", Session["userid"]);
                con.Open();
                int r = (int)cmd1.ExecuteScalar();
                if(r == 1)
                {
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "You are already book this trip";

                }
                else
                {

                    string Checkquery = "Select  Count (trip_id) From [dbo].[reservations] where trip_id= @tid and user_id= @uid and status =0 ";
                   
                    SqlCommand cmd2= new SqlCommand(Checkquery, con);
                    cmd2.Parameters.AddWithValue("@tid", Request.QueryString["tid"]);
                    cmd2.Parameters.AddWithValue("@uid", Session["userid"]);
                    int temp = (int)cmd2.ExecuteScalar();
                    if (temp == 1)
                    {
                        string editequery = "UPDATE reservations SET status = 1 , reason=NULL WHERE trip_id = @tid and user_id = @uid";
                        SqlCommand cmd3 = new SqlCommand(editequery, con);
                        cmd3.Parameters.AddWithValue("@tid", Request.QueryString["tid"]);
                        cmd3.Parameters.AddWithValue("@uid", Session["userid"]);

                        cmd3.ExecuteNonQuery();
                    }
                    else
                    {

                        string inseartQueary = "INSERT INTO reservations (user_id, trip_id, status) VALUES(@uid, @tid, 1)";
                        SqlCommand cmd = new SqlCommand(inseartQueary, con);
                        cmd.Parameters.AddWithValue("@tid", Request.QueryString["tid"]);
                        cmd.Parameters.AddWithValue("@uid", Session["userid"]);
                        cmd.ExecuteNonQuery();
                    }


                    Label1.ForeColor = System.Drawing.Color.Green;
                    Label1.Text = "Successfully added";


                }
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Book_Flight.aspx");
        }
    }
}