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
    public partial class Book_Flight : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string mainconn = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
                SqlConnection con = new SqlConnection(mainconn);
                con.Open();
                string query = "SELECT ID, From_Country , To_Country , Time_Stamp , Price , Currency_ISO , Passengers_Count  from [dbo].[trip];";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                StringBuilder sb = new StringBuilder();
                sb.Append("<center>");
                sb.Append("<table>");
                sb.Append("<tr>");

                

                sb.Append("<th class=" + "ColumnName" + ">");
                sb.Append("From");
                sb.Append("</th>");


                sb.Append("<th class=" + "ColumnName" + ">");
                sb.Append("To");
                sb.Append("</th>");


                sb.Append("<th class=" + "ColumnName" + ">");
                sb.Append("Timestamp");
                sb.Append("</th>");

             

                sb.Append("<th class=" + "ColumnName" + ">");
                sb.Append("Price");
                sb.Append("</th>");


                sb.Append("<th class=" + "ColumnName" + ">");
                sb.Append("Currency");
                sb.Append("</th>");


                sb.Append("<th class=" + "ColumnName" + ">");
                sb.Append("Remaining seats");
                sb.Append("</th>");



                sb.Append("<th class=" + "ColumnName" + ">Action</th>");
                sb.Append("</tr>");
                foreach (DataRow dr in dt.Rows)
                {
                    int remain=0;
                    sb.Append("<tr>");
                    foreach (DataColumn dc in dt.Columns)
                    {
                       
                        if (dc.ColumnName == "Passengers_Count")
                        {
                            string query1 = "Select  Count (trip_id) From [dbo].[reservations] where trip_id= @tid and status=1 ";

                            SqlCommand cmd1 = new SqlCommand(query1, con);
                            cmd1.Parameters.AddWithValue("@tid", dr["ID"]);
                            int r = (int)cmd1.ExecuteScalar();
                             remain=Convert.ToInt32(dr["Passengers_Count"])-r;
                            sb.Append("<th>");
                            sb.Append(remain);
                            sb.Append("</th>");

                        }
                        else
                        {
                            if (dc.ColumnName != "ID")
                            {
                                sb.Append("<th>");
                                sb.Append(dr[dc.ColumnName].ToString());
                                sb.Append("</th>");
                            }
                        }
                    }

                    sb.Append("<th>");
                    sb.Append("<a class=" + "deleteBtn" + " href=" + "control.aspx?tid=" + dr["ID"] +"&remain="+remain +" >Book</a>");
                    sb.Append("</th>");

                    sb.Append("</tr>");


                }

                sb.Append("</table>");

                sb.Append("</center>");
              //  Panel1.Controls.Add(new Label { Text = sb.ToString() });
                con.Close();








            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
          

            string query1 = "Select  Count (trip_id) From [dbo].[reservations] where trip_id= @tid and user_id=@uid and status =1 ";
            string mainconn = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
            SqlConnection con = new SqlConnection(mainconn);
            SqlCommand cmd1 = new SqlCommand(query1, con);
            cmd1.Parameters.AddWithValue("@tid", GridView1.SelectedRow.Cells[0].Text);
            cmd1.Parameters.AddWithValue("@uid", Session["userid"]);
            con.Open();
            int r = (int)cmd1.ExecuteScalar();
            if (r == 1)
            {
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "You are already book this trip";

            }
            else
            {
                string Checkquery = "Select  Count (trip_id) From [dbo].[reservations] where trip_id= @tid and user_id= @uid and status =0 ";

                SqlCommand cmd2 = new SqlCommand(Checkquery, con);
                cmd2.Parameters.AddWithValue("@tid", GridView1.SelectedRow.Cells[0].Text);
                cmd2.Parameters.AddWithValue("@uid", Session["userid"]);
                int temp = (int)cmd2.ExecuteScalar();
                if (temp == 1)
                {
                    string editequery = "UPDATE reservations SET status = 1 , reason=NULL WHERE trip_id = @tid and user_id = @uid";
                    SqlCommand cmd3 = new SqlCommand(editequery, con);
                    cmd3.Parameters.AddWithValue("@tid", GridView1.SelectedRow.Cells[0].Text);
                    cmd3.Parameters.AddWithValue("@uid", Session["userid"]);

                    cmd3.ExecuteNonQuery();
                }
                else
                {

                    string inseartQueary = "INSERT INTO reservations (user_id, trip_id, status) VALUES(@uid, @tid, 1)";
                    SqlCommand cmd = new SqlCommand(inseartQueary, con);
                    cmd.Parameters.AddWithValue("@tid", GridView1.SelectedRow.Cells[0].Text);
                    cmd.Parameters.AddWithValue("@uid", Session["userid"]);
                    cmd.ExecuteNonQuery();
                }


                Label1.ForeColor = System.Drawing.Color.Green;
                Label1.Text = "Successfully added";
            }
















            ModalPopupExtender1.Show();
        }
    }
}