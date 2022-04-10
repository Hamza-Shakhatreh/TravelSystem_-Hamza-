using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace WebApplication5
{
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            
           

            if (string.IsNullOrEmpty(TextBoxCountry.Text) || string.IsNullOrEmpty(TextBoxCountry.Text)  || string.IsNullOrEmpty(TextBoxStreet.Text))
                args.IsValid = false;
            else
                args.IsValid = true;
            

          
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            String query = "INSERT INTO [user] ([CivilID], [fullName], [age], [email], [phoneNumber], [country], [city], [street], [password] ,[userType]) VALUES (@civil , @fullname , @age , @email , @phone , @country , @city , @street , @pass ,0)";
            string conn = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@civil", TextBoxCivilID.Text);
            cmd.Parameters.AddWithValue("@fullname", TextBoxFullName.Text);
            cmd.Parameters.AddWithValue("@age", TextBoxAge.Text);
            cmd.Parameters.AddWithValue("@email", TextBoxemail.Text);
            cmd.Parameters.AddWithValue("@phone", TextBoxPhone.Text);
            cmd.Parameters.AddWithValue("@country", TextBoxCountry.Text);
            cmd.Parameters.AddWithValue("@city", TextBoxCity.Text);
            cmd.Parameters.AddWithValue("@street", TextBoxStreet.Text);
            cmd.Parameters.AddWithValue("@pass", TextBoxPassword.Text);

            con.Open();
            cmd.ExecuteNonQuery();
            Response.Redirect("default.aspx");
          
        }
    }
}