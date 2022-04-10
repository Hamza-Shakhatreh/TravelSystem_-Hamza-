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
    public partial class cancelTrip : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        bool button1WasClicked = false;
        protected void Button1_Click(object sender, EventArgs e)
        {
            button1WasClicked = true;
            string mainconn = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
            SqlConnection con = new SqlConnection(mainconn);
            con.Open();
            string query = "UPDATE reservations SET status = 0 , reason=@txt WHERE trip_id = @tid and user_id =@uid ";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@tid", Request.QueryString["tripID"]);
            cmd.Parameters.AddWithValue("@txt", TextBoxReason.Text.ToString());
            cmd.Parameters.AddWithValue("@uid", Session["userid"]);


            cmd.ExecuteNonQuery();
           

            Response.Redirect("Home.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("Home.aspx");

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if(String.IsNullOrEmpty(TextBoxReason.Text) && button1WasClicked)
                args.IsValid = false;
            else
                args.IsValid = true;

        }
    }
}