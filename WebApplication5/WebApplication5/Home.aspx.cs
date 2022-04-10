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
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string mainconn = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
                SqlConnection con = new SqlConnection(mainconn);
                con.Open();
                string query = "SELECT DISTINCT trip.ID , trip.From_Country , trip.To_Country , trip.Price , trip.Currency_ISO , trip.Time_Stamp FROM trip INNER JOIN reservations ON trip.ID = reservations.trip_id INNER JOIN[dbo].[user] ON reservations.user_id = @uid where reservations.status =1";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@uid", Session["userid"]);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                StringBuilder sb = new StringBuilder();
                sb.Append("<center>");
                sb.Append("<table>");
                sb.Append("<tr>");

                sb.Append("<th class=" + "ColumnName" + ">");
                sb.Append("Travel ID");
                sb.Append("</th>");

                sb.Append("<th class=" + "ColumnName" + ">");
                sb.Append("From");
                sb.Append("</th>");


                sb.Append("<th class=" + "ColumnName" + ">");
                sb.Append("To");
                sb.Append("</th>");

                sb.Append("<th class=" + "ColumnName" + ">");
                sb.Append("Price");
                sb.Append("</th>");

                sb.Append("<th class=" + "ColumnName" + ">");
                sb.Append("Currency");
                sb.Append("</th>");

                sb.Append("<th class=" + "ColumnName" + ">");
                sb.Append("Timestamp");
                sb.Append("</th>");

               


                sb.Append("<th class=" + "ColumnName" + ">Action</th>");
                sb.Append("</tr>");
                foreach (DataRow dr in dt.Rows)
                {
                    sb.Append("<tr>");
                    foreach (DataColumn dc in dt.Columns)
                    {
                        sb.Append("<th>");
                        sb.Append(dr[dc.ColumnName].ToString());
                        sb.Append("</th>");
                    }
                    sb.Append("<th>");
                   sb.Append("<a class=" + "deleteBtn" + " href=" + "cancelTrip.aspx?tripID=" + dr["ID"] + " >Cancel</a>");

                    sb.Append("</th>");

                    sb.Append("</tr>");


                }

                sb.Append("</table>");

                sb.Append("</center>");
                Panel1.Controls.Add(new Label { Text = sb.ToString() });
                con.Close();








            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Book_Flight.aspx");
        }
    }
}


