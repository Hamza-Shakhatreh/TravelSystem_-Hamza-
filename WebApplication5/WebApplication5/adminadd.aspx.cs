using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication5
{
    public partial class adminadd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtTime.Text = DateTime.Now.ToString();
            Calendar1.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string query1 = "INSERT INTO  [dbo].[trip] (From_Country,To_Country ,Currency_ISO , Time_Stamp ,Price , Passengers_Count ) VALUES (@from , @to , @currency , @time ,@price,@passenger ) ";
            string mainconn = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
            SqlConnection con = new SqlConnection(mainconn);
            SqlCommand cmd1 = new SqlCommand(query1, con);
            cmd1.Parameters.AddWithValue("@from", txtFrom.Text);
            cmd1.Parameters.AddWithValue("@to", txtTo.Text);
            cmd1.Parameters.AddWithValue("@currency", TextBoxCurrency.Text);
            cmd1.Parameters.AddWithValue("@time", txtTime.Text);
            cmd1.Parameters.AddWithValue("@price", TextBoxPrice.Text);
            cmd1.Parameters.AddWithValue("@passenger", TextBoxPassengers_Count.Text);

            con.Open();
            cmd1.ExecuteNonQuery();
            Response.Redirect("admin.aspx");

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {


            Calendar1.Visible = true;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {

            txtTime.Text = Calendar1.SelectedDate.ToString();
            Calendar1.Visible = false;
        }
    }
}