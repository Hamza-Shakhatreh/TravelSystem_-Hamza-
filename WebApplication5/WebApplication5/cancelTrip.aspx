<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cancelTrip.aspx.cs" Inherits="WebApplication5.cancelTrip" %>

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

    </style>
</head>
<body>
    <div style="background-color:#190940;color:whitesmoke;" class="title" >
            <strong><span class="auto-style6">Cancel Trip</span></strong>


        </div>
    <form id="form1" runat="server">
        <div class="container auto-style2">
          
                <br />
           <asp:TextBox ID="TextBoxReason" placeholder="Reason .. ?" runat="server" ></asp:TextBox>
                <br />
                <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="TextBoxReason" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
            <br />
          
            <br />
            <strong>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Confirm" CssClass="auto-style3" />
            <asp:Button ID="Button2" runat="server" Text="Back" OnClick="Button2_Click" CssClass="auto-style3" />
            </strong>
            <br />
            <br />
        </div>>
    </form>
</body>
</html>
