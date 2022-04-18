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
using AjaxControlToolkit;

namespace WebApplication5
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
                Response.Redirect("default.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string mainconn = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
                SqlConnection con = new SqlConnection(mainconn);
                con.Open();
                string query = "SELECT DISTINCT trip.ID , trip.From_Country , trip.To_Country , trip.Price , trip.Currency_ISO , trip.Time_Stamp ,reservations.status , reservations.reason FROM trip INNER JOIN reservations ON trip.ID = reservations.trip_id INNER JOIN[dbo].[user] ON reservations.user_id = @uid ";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@uid", Session["userid"]);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt); 
                con.Close();

                TravelsGV.DataSource = dt;
                TravelsGV.DataBind();

                //StringBuilder sb = new StringBuilder();
                //sb.Append("<center>");
                //sb.Append("<table>");
                //sb.Append("<tr>");

                //sb.Append("<th class=" + "ColumnName" + ">");
                //sb.Append("Travel ID");
                //sb.Append("</th>");

                //sb.Append("<th class=" + "ColumnName" + ">");
                //sb.Append("From");
                //sb.Append("</th>");

                //sb.Append("<th class=" + "ColumnName" + ">");
                //sb.Append("To");
                //sb.Append("</th>");

                //sb.Append("<th class=" + "ColumnName" + ">");
                //sb.Append("Price");
                //sb.Append("</th>");

                //sb.Append("<th class=" + "ColumnName" + ">");
                //sb.Append("Currency");
                //sb.Append("</th>");

                //sb.Append("<th class=" + "ColumnName" + ">");
                //sb.Append("Timestamp");
                //sb.Append("</th>");

                //sb.Append("<th class=" + "ColumnName" + ">Action</th>");
                //sb.Append("</tr>");
                //foreach (DataRow dr in dt.Rows)
                //{
                //    sb.Append("<tr>");
                //    foreach (DataColumn dc in dt.Columns)
                //    {
                //        sb.Append("<th>");
                //        sb.Append(dr[dc.ColumnName].ToString());
                //        sb.Append("</th>");
                //    }
                //    sb.Append("<th>");
                //    //sb.Append("<a class=" + "deleteBtn" + " href=" + "cancelTrip.aspx?tripID=" + dr["ID"] + " >Cancel</a>");
                //    sb.Append("<asp:Button CssClass=\"deleteBtn\" ID=\"CancelBtn\" runat=\"server\" />");
                //    sb.Append("<ajax:ModalPopupExtender ID=\"CancelPopupMdl\" runat=\"server\" PopupControlID=\"CancelPopupPanel\" "+
                //    "TargetControlID=\"CancelBtn\" BackgroundCssClass=\"Background\" > </ ajax:ModalPopupExtender >");
                //    sb.Append("<asp:Panel ID=\"CancelPopupPanel\" runat=\"server\" CssClass=\"Popup\" align=\"center\" style = \"display: none\">" +
                //        "<iframe style=\" width: 350px; height: 300px; \" id=\"irm1\" src=\"canelTrip.aspx?tripID=" + dr["ID"] + "\" runat=\"server\"></iframe>" +
                //        "</asp:Panel>");

                //    sb.Append("</th>");

                //    sb.Append("</tr>");
                //}

                //sb.Append("</table>");

                //sb.Append("</center>");
                //Panel1.Controls.Add(new Label { Text = sb.ToString() });

                //foreach (DataRow dr in dt.Rows)
                //{
                //    TableRow _Row = new TableRow();

                //    foreach (DataColumn dc in dt.Columns)
                //    {
                //        TableCell _Cell = new TableCell() { Text = dr[dc.ColumnName].ToString() };
                //        _Row.Cells.Add(_Cell);
                //    }

                //    TableCell _CancelBtnCell = new TableCell();
                //    Button CancelBtn = new Button() 
                //    { 
                //        CssClass = "deleteBtn",
                //        ID= "CancelBtn",
                //    };

                //    ModalPopupExtender _CancelPopupMdl = new ModalPopupExtender()
                //    {
                //        ID = "CancelPopupMdl",
                //        PopupControlID = "CancelPopupPanel",
                //        TargetControlID = "CancelBtn",
                //        BackgroundCssClass= "Background"
                //    };

                //    Panel _CancelPopupPanel = new Panel()
                //    {
                //        ID= "CancelPopupPanel",
                //        CssClass = "Popup",
                //        HorizontalAlign = HorizontalAlign.Center
                //    };
                //    _CancelPopupPanel.Style.Clear();
                //    _CancelPopupPanel.Style.Add("display", "none");

                //    StringBuilder sb = new StringBuilder();
                //    sb.Append("<iframe style=\" width: 350px; height: 300px; \" id=\"irm1\" src=\"canelTrip.aspx?tripID=" + dr["ID"] + "\"" +
                //        " runat=\"server\"></iframe>");
                //}
            }
        }

        public void CancelBtn_Click(Object sender, EventArgs e)
        {
            try
            {
                LinkButton btn = (LinkButton)sender;
                
            }
            catch (Exception ex)
            {

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Book_Flight.aspx");
        }

        protected void CancelTripBtn_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string tripID = btn.CommandArgument.ToString();
            TextBox TextBoxReason = (TextBox)btn.Parent.FindControl("TextBoxReason");

            string mainconn = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
            SqlConnection con = new SqlConnection(mainconn);
            con.Open();
            string query = "UPDATE reservations SET status = 0 , reason=@txt WHERE trip_id = @tid and user_id =@uid ";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@tid", tripID);
            cmd.Parameters.AddWithValue("@txt", TextBoxReason.Text.ToString());
            cmd.Parameters.AddWithValue("@uid", Session["userid"]);
            cmd.ExecuteNonQuery();

            con.Close();

            Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void Unnamed2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Book_Flight.aspx");
        }
    }
}


