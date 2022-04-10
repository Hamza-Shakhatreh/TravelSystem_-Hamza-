﻿using System;
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
                Panel1.Controls.Add(new Label { Text = sb.ToString() });
                con.Close();








            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}