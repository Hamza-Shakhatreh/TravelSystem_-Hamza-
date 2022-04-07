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
            
            String query = "INSERT INTO [user] ([CivilID], [fullName], [age], [email], [phoneNumber], [country], [city], [street], [password]) VALUES ("+TextBoxCivilID.Text+","+TextBoxFullName.Text.ToString()+","+TextBoxAge.Text+","+TextBoxemail.Text.ToString()+","+TextBoxPhone.Text+","+TextBoxCountry.Text.ToString()+","+TextBoxCity.Text.ToString()+","+TextBoxStreet.Text.ToString()+","+TextBoxPassword.Text.ToString()+")";
            string conn = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);

            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            cmd.ExecuteNonQuery();
          
        }
    }
}