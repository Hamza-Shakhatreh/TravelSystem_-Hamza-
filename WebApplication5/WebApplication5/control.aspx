<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="control.aspx.cs" Inherits="WebApplication5.control" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
            color: #000000;
        }
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

    </style>
</head>
<body>
    <div style="background-color:#190940;color:whitesmoke;" class="title" >
            <strong><span class="auto-style6">Add Trip</span></strong>


        </div>
    <form id="form1" runat="server">
        <div class="container auto-style2">
            <strong><span id="msg" class="auto-style1">
                <br />
                <asp:Label ID="Label1" runat="server" Text="Label">Are you sure you want to cancel this trip ?</asp:Label>
            <br />
            <br />
            </span></strong>
            <br />
            <strong>
            <asp:Button ID="Button2" runat="server" Text="Back" OnClick="Button2_Click" CssClass="auto-style3" />
            </strong>
            <br />
            <br />
        </div>
    </form>
</body>
</html>
