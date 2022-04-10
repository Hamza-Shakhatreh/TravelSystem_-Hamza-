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
    public partial class adminedit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Calendar1.Visible = false;
                string mainconn = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
                SqlConnection con = new SqlConnection(mainconn);

                con.Open();
                string query = "select * from [dbo].[trip] where ID=@id";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id", Request.QueryString["id"]);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                txtID.Text = dt.Rows[0]["ID"].ToString();
                txtFrom.Text = dt.Rows[0]["From_Country"].ToString();
                txtTo.Text = dt.Rows[0]["To_Country"].ToString();
                TextBoxCurrency.Text = dt.Rows[0]["Currency_ISO"].ToString();
                TextBoxPrice.Text = dt.Rows[0]["Price"].ToString();
                TextBoxPassengers_Count.Text = dt.Rows[0]["Passengers_Count"].ToString();
                txtTime.Text = dt.Rows[0]["Time_Stamp"].ToString();


                
              



                con.Close();
            }

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Calendar1.Visible = true;

        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {

            txtTime.Text = Calendar1.SelectedDate.ToString();
            Calendar1.Visible=false;    


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string query1 = "UPDATE  [dbo].[trip] SET From_Country= @from ,To_Country=@to , Currency_ISO=@currency , Time_Stamp=@time ,Price=@price , Passengers_Count=@passenger WHERE ID=@tid ";
                string mainconn = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
                SqlConnection con = new SqlConnection(mainconn);
                SqlCommand cmd1 = new SqlCommand(query1, con);
                cmd1.Parameters.AddWithValue("@tid", Request.QueryString["id"]);
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
        }

      

        
        protected void CustomValidator1_ServerValidate1(object source, ServerValidateEventArgs args)
        {

          if(Convert.ToInt32(TextBoxPassengers_Count.Text)<Convert.ToInt32(Request.QueryString["reserved"]))
            args.IsValid = false;
          else
                args.IsValid = true;
    
        }
    }
}