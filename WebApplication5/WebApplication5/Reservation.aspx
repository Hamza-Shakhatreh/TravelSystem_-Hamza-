<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reservation.aspx.cs" Inherits="WebApplication5.Reservation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            text-align: center;
        }
        input[type=submit] {
            width:10%;
  background-color: #04AA6D;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  margin-right:10px;

}

        .title{
               text-align: center;
            padding:10px;
            font-size:20px;
        }

        .container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
        #Button1{
            background-color:#d9534f;
        }
        #Button1:hover{
            background-color:#c54e4a;
        }
              #Button2{
            background-color:#190940;
        }
        #Button2:hover{
            background-color:#0b041b;
        }

        .auto-style3 {
            font-weight: bold;
        }

        input[type=text], select, textarea {
          width: 65%;
          padding: 12px;
          border: 1px solid #ccc;
          border-radius: 4px;
          resize: vertical;
        }

        .auto-style4 {
            width:30%;
        }

        .auto-style5 {
            text-align: center;
            padding: 10px;
            font-size: 20px;
            color: whitesmoke;
        }

    </style>
</head>
<body>
    <div style="background-color:#190940;" class="auto-style5" >
            View Reservations</div>
    <form id="form1" runat="server">
        <div class="container auto-style2">

           
            <br />
              <center>
            <table class="auto-style4">
                <tr>
                    <td>

            <asp:Label ID="Label1" runat="server" Text="From "></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="To"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="At"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />

            <br />
          
                <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="15" GridLines="Horizontal">
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <HeaderStyle BackColor="#190940" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#487575" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#275353" />
                </asp:GridView>
            </center>
            <br />
            <br />

            <br />
            <strong>
                <asp:Button ID="Button2" runat="server" Text="Back" OnClick="Button2_Click" CssClass="auto-style3" />
            </strong>
            <br />
            <br />
        </div>
        >
    </form>
</body>
</html>